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
		declare @ImportDate smalldatetime
		if not exists (select * from HWGR_WGR)
			select top 1 @ImportDate = BusinessValuesBegin from dbo.dbProperties
		else
			set @ImportDate = convert(datetime,convert(varchar(12),getdate(), 112),112)
		select  @ID =  [Value] from dbo.PKGen with(tablockx) where DomainName = 'Entities'
		insert into dbo.HWGR_WGR (HWGR_WGR_ID, StoreID, HWGR_ID, WGR_ID, BeginTime, EndTime, Import)
		select 
			@ID+ROW_NUMBER() over (order by wh.World_HWGR_ID) as HWGR_WGR_ID
			, StoreID
			, HWGR_ID
			, WGR_ID 
			, @ImportDate
			, '20790606'
			, 1
		from vwWorld_HWGR wh
		inner join #wgr4insert i
		on
			wh.HWGR_SystemID = i.HWGR_SystemID
		inner join WGR
		on
		  WGR_SystemID = SystemID
		where not exists (select * from HWGR_WGR where HWGR_WGR.WGR_ID = WGR.WGR_ID and wh.HWGR_ID = HWGR_WGR.HWGR_ID and wh.StoreID = HWGR_WGR.StoreID and HWGR_WGR.Import = 1 and HWGR_WGR.EndTime > @ImportDate)
		
		set @ID = @ID + @@rowcount
		  
		update PKGen 
		set
		  [Value] = @ID
		where DomainName = 'Entities'
		and [Value] <> @ID

	-- add data to default store structure dbo.DS_HWGR_WGR 
		insert into DS_HWGR_WGR (HWGR_ID, WGR_ID)
		select 	h.HWGR_ID, w.WGR_ID
		from #wgr4insert i
		inner join WGR w
		on
			i.WGR_SystemID = w.SystemID  
		inner join HWGR h
		on
			i.HWGR_SystemID = h.SystemID
		where 
			not exists (select * from DS_HWGR_WGR ds where ds.WGR_ID = w.WGR_ID and ds.HWGR_ID = h.HWGR_ID)

		select ds.HWGR_ID, ds.WGR_ID into #delFromDS	
		from DS_HWGR_WGR ds 
		inner join WGR w
		on
			ds.WGR_ID = w.WGR_ID  
		inner join HWGR h
		on
			ds.HWGR_ID = h.HWGR_ID
		where not exists (select * from #wgr4insert i where i.WGR_SystemID = w.SystemID  and i.HWGR_SystemID = h.SystemID)

		delete from DS_HWGR_WGR
		where exists (select * from #delFromDS d where DS_HWGR_WGR.HWGR_ID = d.HWGR_ID and DS_HWGR_WGR.WGR_ID = d.WGR_ID) 
		
--		set @ImportDate = DATEADD(second, 1, @ImportDate)
		set @ImportDate = DATEADD(day, -1, @ImportDate)

		update HWGR_WGR 
		set
			EndTime= @ImportDate
		from HWGR_WGR h
		inner join 	#delFromDS d
		on
			h.WGR_ID = d.WGR_ID
		inner join World_HWGR w
		on
			d.HWGR_ID = w.HWGR_ID


		commit

		select * from #wgr4insert i where not exists 
			(select * from HWGR_WGR hw
				inner join HWGR h
				on
					hw.HWGR_ID = h.HWGR_ID
				inner join WGR w
				on
					hw.WGR_ID = w.WGR_ID
				where 
				  i.HWGR_SystemID = h.SystemID
				  and i.WGR_SystemID = w.SystemID
			)
	--	select * into #wgr4insert from #wgr4insert
		drop table #wgr4insert
		drop table #delFromDS
	end try
	begin catch
		if XACT_STATE() <> 0
		begin
			rollback tran;
		end
		set @result = -1;
	end catch
END
