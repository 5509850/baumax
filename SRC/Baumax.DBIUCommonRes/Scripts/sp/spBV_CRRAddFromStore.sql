print '%Creating procedure% spBV_CRRAddFromStore'

-- Drop stored procedure if it already exists
IF EXISTS (
  SELECT * 
    FROM INFORMATION_SCHEMA.ROUTINES 
   WHERE SPECIFIC_SCHEMA = N'dbo'
     AND SPECIFIC_NAME = N'spBV_CRRAddFromStore' 
)
   DROP PROCEDURE spBV_CRRAddFromStore
GO

CREATE PROCEDURE spBV_CRRAddFromStore
  @YearBegin smallint
  ,@YearEnd smallint
  ,@StoreID bigint
  ,@NewStoreID bigint
WITH ENCRYPTION
AS
BEGIN
	set nocount on;
	declare 
		@DateBegin smalldatetime
		,@DateEnd smalldatetime

		select @DateBegin = min(BeginDate), @DateEnd = max(EndDate) from dbo.bauMaxYear
		where [Year] between @YearBegin and @YearEnd

		if exists (select * from CashRegisterReceipt where Date between @DateBegin and @DateEnd and StoreID = @NewStoreID)
		begin
			return -1
		end 
		else
		begin
			insert into dbo.CashRegisterReceipt (Date, StoreID, Year, Week, WeekDay, Month, Hour, Number, Converted)
			select Date, @NewStoreID, Year, Week, WeekDay, Month, Hour, Number, Converted
			from dbo.CashRegisterReceipt where Date between @DateBegin and @DateEnd and StoreID = @StoreID 

			if @@ROWCOUNT = 0
				return -2
			else
				return 0 
		end

END
GO
