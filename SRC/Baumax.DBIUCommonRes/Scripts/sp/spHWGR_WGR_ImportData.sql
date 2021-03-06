print '%Creating procedure% spHWGR_WGR_ImportData'

-- Drop stored procedure if it already exists
IF EXISTS (
  SELECT * 
    FROM INFORMATION_SCHEMA.ROUTINES 
   WHERE SPECIFIC_SCHEMA = N'dbo'
     AND SPECIFIC_NAME = N'spHWGR_WGR_ImportData' 
)
   DROP PROCEDURE spHWGR_WGR_ImportData
GO


CREATE PROCEDURE [dbo].[spHWGR_WGR_ImportData]
	@result int output
WITH ENCRYPTION
AS
BEGIN
	set nocount on
	begin try
		begin tran
		set @result = 1;
		declare @ID bigint
		select  @ID =  [Value] from dbo.PKGen with(tablockx) where DomainName = 'Entities'
		insert into dbo.HWGR_WGR (HWGR_WGR_ID, World_HWGR_ID, WGR_ID, BeginTime, EndTime)
		select 
			@ID+ROW_NUMBER() over (order by wh.World_HWGR_ID) as HWGR_WGR_ID
			, wh.World_HWGR_ID
			, WGR_ID 
			, convert(datetime,convert(varchar(12),getdate(), 112),112)
			, '20790606'
		from vwWorld_HWGR wh
		inner join #wgr4insert i
		on
			wh.HWGR_SystemID = i.HWGR_SystemID
			and wh.World_SystemID = i.World_SystemID
		inner join WGR
		on
		  WGR_SystemID = SystemID
		where not exists (select * from HWGR_WGR where HWGR_WGR.World_HWGR_ID = wh.World_HWGR_ID and HWGR_WGR.WGR_ID = WGR.WGR_ID)

		--select @@rowcount + @ID

		  
		update PKGen 
		set
		  [Value] = @@rowcount + @ID
		where DomainName = 'Entities'
		commit

		select * from #wgr4insert i where not exists 
			(select * from vwHWGR_WGR h 
				where 
				  i.HWGR_SystemID = h.HWGR_SystemID
				  and i.World_SystemID = h.World_SystemID
				  and i.WGR_SystemID = h.WGR_SystemID
			)
		drop table #wgr4insert
	end try
	begin catch
		if XACT_STATE() <> 0
		begin
			rollback tran;
		end
		set @result = -1;
	end catch
END




