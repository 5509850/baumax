print '%Creating database% %dbName%'
go
create database %dbName%
go

alter database %dbName% set recovery simple
go

use %dbName%
go

set nocount on
go

print '%Creating types%:'
print '%Creating type% [utName]'
go
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'utName' AND ss.name = N'dbo')
CREATE TYPE [dbo].[utName] FROM [nvarchar](50) NULL
go
print '%Creating type% [utsMinutes]'
go
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'utsMinutes' AND ss.name = N'dbo')
CREATE TYPE [dbo].[utsMinutes] FROM [smallint] NULL
go
print '%Creating type% [utiMinutes]'
go
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'utiMinutes' AND ss.name = N'dbo')
CREATE TYPE [dbo].[utiMinutes] FROM [int] NULL
go
SET ANSI_NULLS ON
go
SET QUOTED_IDENTIFIER ON
go
print '%Creating tables%:'
go
SET ANSI_NULLS ON
go
SET QUOTED_IDENTIFIER ON
go

print '%Creating table% [DatabaseLog]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DatabaseLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DatabaseLog](
	[DatabaseLogID] [int] primary key identity(1,1) NOT NULL,
	[PostTime] [datetime] NOT NULL,
	[DatabaseUser] [sysname]  NOT NULL,
	[Event] [sysname]  NOT NULL,
	[Schema] [sysname]  NULL,
	[Object] [sysname]  NULL,
	[TSQL] [nvarchar](max)  NOT NULL,
	[XmlEvent] [xml] NOT NULL
) ON [PRIMARY]
END
go

print '%Creating table% [EmployeeAllIn]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmployeeAllIn]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EmployeeAllIn](
	[EmployeeAllInID] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [bigint] NOT NULL,
	[BeginTime] [smalldatetime] NOT NULL,
	[EndTime] [smalldatetime] NOT NULL,
	[AllIn] [bit] NOT NULL CONSTRAINT [DF_EmployeeAllIn_AllIn]  DEFAULT ((0)),
 CONSTRAINT [PK_EmployeeAllIn] PRIMARY KEY CLUSTERED 
(
	[EmployeeAllInID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [CashRegisterReceiptConvertError]'
go
CREATE TABLE [dbo].[CashRegisterReceiptConvertError](
	[CashRegisterReceiptConvertErrorID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [smalldatetime] NOT NULL,
	[StoreID] [bigint] NOT NULL,
	[Year] [smallint] NULL,
	[Week] [tinyint] NULL,
	[WeekDay] [tinyint] NULL,
	[Month] [tinyint] NULL,
	[Hour] [tinyint] NOT NULL DEFAULT ((0)),
	[Number] [int] NOT NULL DEFAULT ((0)),
	[Converted] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_CashRegisterReceiptConvertError] PRIMARY KEY NONCLUSTERED 
(
	[CashRegisterReceiptConvertErrorID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
go

print '%Creating table% [EstUnavoidAddFaktorPerYear]'
go
CREATE TABLE [dbo].[EstUnavoidAddFaktorPerYear](
	[Year] [smallint] NOT NULL,
	[StoreID] [bigint] NULL,
	[WorldID] [bigint] NULL,
	[BCunavoidAddFaktorPerYear] [decimal](14,4) NULL,
	[CCunavoidAddFaktorPerYear] [decimal](14,4) NULL
) ON [PRIMARY]
go

print '%Creating table% [BufferHourAvailable]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BufferHourAvailable]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BufferHourAvailable](
	[BufferHourAvailableID] [bigint] IDENTITY(1,1) NOT NULL,
	[Store_WorldID] [bigint] NOT NULL,
	[Year] [smallint] NOT NULL,
	[WeekBegin] [smalldatetime] NOT NULL,
	[WeekEnd] [smalldatetime] NOT NULL,
	[WeekNumber] [tinyint] NOT NULL,
	[AvailableBufferHour] [float] NOT NULL,
	[SumFromPlanning] [float] NULL,
	[SumFromRecording] [float] NULL,
	[SumActualBVEstimated] [float] NULL,
 constraint [constraint_BufferHourAvailable__Store_WorldIDWeekBegin] unique nonclustered 
 (
	Store_WorldID, WeekBegin
 )  on [PRIMARY], 		
 CONSTRAINT [PK_BufferHourAvailable] PRIMARY KEY CLUSTERED 
(
	[BufferHourAvailableID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go


print '%Creating table% [EmployeeHolidaysInfo]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmployeeHolidaysInfo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EmployeeHolidaysInfo](
	[EmployeeHolidaysInfoID] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [bigint] NOT NULL,
	[Year] [smallint] NOT NULL,
	[SpareHolidays] [decimal](10, 2) NOT NULL,
	[NewHolidays] [decimal](10, 2) NOT NULL,
	[UsedHolidays] [decimal](10, 2) NOT NULL,
	[TakenHolidays] [decimal](6, 2) NOT NULL CONSTRAINT [DF_EmployeeHolidaysInfo_TakenHolidays]  DEFAULT ((0)),
	[PlannedHolidays] [decimal](6, 2) NOT NULL CONSTRAINT [DF_EmployeeHolidaysInfo_PlannedHolidays]  DEFAULT ((0)),
	[SpareHolidaysExc] [decimal](6, 2) NOT NULL CONSTRAINT [DF_EmployeeHolidaysInfo_SpareHolidaysExc]  DEFAULT ((0)),
	[SpareHolidaysInc] [decimal](6, 2) NOT NULL CONSTRAINT [DF_EmployeeHolidaysInfo_SpareHolidaysInc]  DEFAULT ((0)),
 CONSTRAINT [PK_EmployeeHolidaysInfo] PRIMARY KEY CLUSTERED 
(
	[EmployeeHolidaysInfoID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [EstWorldYearValues]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EstWorldYearValues]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EstWorldYearValues](
	[Year] [smallint] NULL,
	[StoreID] [bigint] NULL,
	[WorldID] [bigint] NULL,
	[CVolumeBC] [money] NULL,
	[CVolumeCC] [money] NULL,
	[TargNetPerformanceBCBuffH] [decimal](14, 4) NULL,
	[TargNetPerformanceCCBuffH] [decimal](14, 4) NULL,
	[TargNetPerformanceBCNoBuffH] [decimal](14, 4) NULL,
	[TargNetPerformanceCCNoBuffH] [decimal](14, 4) NULL,
	[OpenHoursBCVarMin] [money] NULL,
	[OpenHoursCCVarMin] [money] NULL,
	[OpenHoursBCVarMax] [money] NULL,
	[OpenHoursCCVarMax] [money] NULL,
	[BCAWH2] [decimal](11, 4) NULL,
	[CCAWH2] [decimal](11, 4) NULL,
	[BCNP2] [decimal](12, 4) NULL,
	[CCNP2] [decimal](12, 4) NULL,
	[BCAWH3] [decimal](11, 4) NULL,
	[CCAWH3] [decimal](11, 4) NULL,
	[BCNP3] [decimal](12, 4) NULL,
	[CCNP3] [decimal](12, 4) NULL
) ON [PRIMARY]
END
go

print '%Creating table% [EstWorldDifferentData]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EstWorldDifferentData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EstWorldDifferentData](
	[Year] [smallint] NULL,
	[StoreID] [bigint] NULL,
	[WorldID] [bigint] NULL,
	[ContractWorkingHours] [decimal](9, 2) NULL,
	[AvgPersPeopleInYear] [smallmoney] NULL,
	[ContractWorkingHoursBuffH] [decimal](9, 2) NULL,
	[ContractWorkingHoursNoBuffH] [decimal](9, 2) NULL,
	[AvgRestingTime] [smallint] NULL,
	[AvgContractTime] [smallint] NULL,
	[AvgWorkingTime] [decimal](4, 2) NULL,
	[PersonMin] [smallint] NULL,
	[PersonMax] [smallint] NULL
) ON [PRIMARY]
END
go

print '%Creating table% [EstWorldWorkingHours]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EstWorldWorkingHours]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EstWorldWorkingHours](
	[Date] [smalldatetime] NULL,
	[StoreID] [bigint] NOT NULL,
	[WorldID] [bigint] NOT NULL,
	[Month] [tinyint] NULL,
	[Week] [tinyint] NULL,
	[WeekDay] [tinyint] NULL,
	[VolumeBC] [money] NULL,
	[VolumeCC] [money] NULL,
	[CVolumeBC] [money] NULL,
	[CVolumeCC] [money] NULL,
	[TargHoursBCBuffHph] [money] NULL,
	[TargHoursCCBuffHph] [money] NULL,
	[TargHoursBCNoBuffHph] [money] NULL,
	[TargHoursCCNoBuffHph] [money] NULL,
	[OpenHoursBCVarMin] [money] NULL,
	[OpenHoursCCVarMin] [money] NULL,
	[OpenHoursBCVarMax] [money] NULL,
	[OpenHoursCCVarMax] [money] NULL,
	[BCTH2] [money] NULL,
	[CCTH2] [money] NULL,
	[BCTH3] [money] NULL,
	[CCTH3] [money] NULL,
	[HoursMin] [smallmoney] NULL,
	[HoursMax] [smallmoney] NULL
) ON [PRIMARY]
END
go

print '%Creating table% [CountryReportingIdentifier]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CountryReportingIdentifier]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CountryReportingIdentifier](
	[CountryID] [bigint] NOT NULL,
	[ReportID] [bigint] NOT NULL,
	[ReportName] [nvarchar](30) NOT NULL
) ON [PRIMARY]
END
go
CREATE UNIQUE NONCLUSTERED INDEX [constraint_CountryReportingIdentifier_ReportID] ON [dbo].[CountryReportingIdentifier] 
(
	[ReportID] ASC
)
go
CREATE UNIQUE NONCLUSTERED INDEX [constraint_CountryReportingIdentifier_ReportName] ON [dbo].[CountryReportingIdentifier] 
(
	[ReportName] ASC
)
go

print '%Creating table% [StoreAdditionalHours]'
go
CREATE TABLE [dbo].[CountryPersShowMode](
	[CountryID] [bigint] NOT NULL,
	[PersShowMode] [tinyint] NOT NULL DEFAULT ((3)),
 CONSTRAINT [PK_CountryPersShowMode] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
go

print '%Creating table% [StoreAdditionalHours]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StoreAdditionalHours]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StoreAdditionalHours](
	[StoreAdditionalHoursID] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreID] [bigint] NOT NULL,
	[BeginDate] [smalldatetime] NOT NULL,
	[EndDate] [smalldatetime] NOT NULL,
	[WeekDay] [tinyint] NOT NULL,
	[AdditionalHours] [decimal](5, 2) NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_StoreAdditionalHours] PRIMARY KEY CLUSTERED 
(
	[StoreAdditionalHoursID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [BusinessVolumeTargetConvetError]'
go
CREATE TABLE [dbo].[BusinessVolumeTargetConvetError](
	[BusinessVolumeTargetConvetErrorID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [int] NOT NULL,
	[StoreID] [bigint] NOT NULL,
	[WGR_ID] [bigint] NOT NULL,
	[Month] [tinyint] NULL,
	[VolumeBC] [money] NOT NULL DEFAULT ((0)),
	[VolumeCC] [money] NOT NULL DEFAULT ((0)),
	[Converted] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_BusinessVolumeTargetConvetError] PRIMARY KEY NONCLUSTERED 
(
	[BusinessVolumeTargetConvetErrorID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
go
print '%Creating table% [BusinessVolumeActualConvertError]'
go
CREATE TABLE [dbo].[BusinessVolumeActualConvertError](
	[BusinessVolumeActualConvertErrorID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [smalldatetime] NOT NULL,
	[StoreID] [bigint] NOT NULL,
	[WGR_ID] [bigint] NOT NULL,
	[Year] [smallint] NULL,
	[Week] [tinyint] NULL,
	[WeekDay] [tinyint] NULL,
	[Month] [tinyint] NULL,
	[VolumeBC] [smallmoney] NOT NULL DEFAULT ((0)),
	[VolumeCC] [money] NOT NULL DEFAULT ((0)),
	[Converted] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_BusinessVolumeActualConvertError] PRIMARY KEY NONCLUSTERED 
(
	[BusinessVolumeActualConvertErrorID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

print '%Creating table% [EmployeeRecordingWorkingModel]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmployeeRecordingWorkingModel]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EmployeeRecordingWorkingModel](
	[EmployeeRecordingWorkingModel] [bigint] IDENTITY (1,1) NOT NULL,
	[EmployeeID] [bigint] NOT NULL,
	[WorkingModelID] [bigint] NOT NULL,
	[Hours] [int] NOT NULL,
	[AdditionalCharge] [bit] NOT NULL,
	[Date] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_EmployeeRecordingWorkingModel] PRIMARY KEY CLUSTERED 
(
	[EmployeeRecordingWorkingModel] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [CountryAdditionalHours]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CountryAdditionalHours]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CountryAdditionalHours](
	[CountryAdditionalHoursID] [bigint] IDENTITY(1,1) NOT NULL,
	[CountryID] [bigint] NOT NULL,
	[Year] [smallint] NOT NULL,
	[WeekDay] [tinyint] NOT NULL,
	[BeginTime] [dbo].[utsMinutes] NOT NULL DEFAULT ((0)),
	[EndTime] [dbo].[utsMinutes] NOT NULL DEFAULT ((0)),
	[FactorEarly] [decimal](3, 2) NOT NULL DEFAULT ((0)),
	[FactorLate] [decimal](3, 2) NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_CountryAdditionalHours] PRIMARY KEY CLUSTERED 
(
	[CountryAdditionalHoursID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_CountryAdditionalHours_FactorEarly]') AND parent_object_id = OBJECT_ID(N'[dbo].[CountryAdditionalHours]'))
ALTER TABLE [dbo].[CountryAdditionalHours]  WITH CHECK ADD  CONSTRAINT [CK_CountryAdditionalHours_FactorEarly] CHECK  (([FactorEarly]>=(-5) AND [FactorEarly]<=(5)))
go

IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_CountryAdditionalHours_FactorLate]') AND parent_object_id = OBJECT_ID(N'[dbo].[CountryAdditionalHours]'))
ALTER TABLE [dbo].[CountryAdditionalHours]  WITH CHECK ADD  CONSTRAINT [CK_CountryAdditionalHours_FactorLate] CHECK  (([FactorLate]>=(-5) AND [FactorLate]<=(5)))
go

print '%Creating table% [EmployeePlanningWorkingModel]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmployeePlanningWorkingModel]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EmployeePlanningWorkingModel](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [bigint] NOT NULL,
	[WorkingModelID] [bigint] NOT NULL,
	[Hours] [int] NOT NULL,
	[AdditionalCharge] [bit] NOT NULL,
	[Date] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_EmployeePlanningWorkingModel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [EmployeeWeekTimePlanning]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmployeeWeekTimePlanning]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EmployeeWeekTimePlanning](
	[EmployeeWeekTimePlanningID] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [bigint] NOT NULL,
	[WeekNumber] [tinyint] NOT NULL,
	[WeekBegin] [smalldatetime] NOT NULL,
	[WeekEnd] [smalldatetime] NOT NULL,
	[PlusMinusHours] [dbo].[utiMinutes] NOT NULL CONSTRAINT [DF_EmployeeWeekTimePlanning_PlusMinusHours]  DEFAULT ((0)),
	[Saldo] [dbo].[utiMinutes] NOT NULL DEFAULT ((0)),
	[PlannedHours] [dbo].[utiMinutes] NOT NULL DEFAULT ((0)),
	[WorkingHours] [dbo].[utiMinutes] NOT NULL DEFAULT ((0)),
	[ContractHours] [dbo].[utiMinutes] NOT NULL  DEFAULT ((0)),
	[AdditionalCharge] [dbo].[utiMinutes] NOT NULL DEFAULT ((0)),
	[CustomEdit] [bit] NOT NULL DEFAULT ((0)),
	[AllIn] [bit] NOT NULL CONSTRAINT [DF_EmployeeWeekTimePlanning_AllIn]  DEFAULT ((0)),
 CONSTRAINT [PK_EmployeeWeekTimePlanning] PRIMARY KEY CLUSTERED 
(
	[EmployeeWeekTimePlanningID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [EmployeeWeekTimeRecording]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmployeeWeekTimeRecording]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EmployeeWeekTimeRecording](
	[EmployeeWeekTimeRecordingID] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [bigint] NOT NULL,
	[WeekNumber] [tinyint] NOT NULL,
	[WeekBegin] [smalldatetime] NOT NULL,
	[WeekEnd] [smalldatetime] NOT NULL,
	[PlusMinusHours] [dbo].[utiMinutes] NOT NULL CONSTRAINT [DF_EmployeeWeekTimeRecording_PlusMinusHours]  DEFAULT ((0)),
	[Saldo] [dbo].[utiMinutes] NOT NULL CONSTRAINT [DF_EmployeeWeekTimeRecording_Saldo]  DEFAULT ((0)),
	[PlannedHours] [dbo].[utiMinutes] NOT NULL CONSTRAINT [DF_EmployeeWeekTimeRecording_PlannedHours]  DEFAULT ((0)),
	[WorkingHours] [dbo].[utiMinutes] NOT NULL DEFAULT ((0)),
	[ContractHours] [dbo].[utiMinutes] NOT NULL CONSTRAINT [DF_EmployeeWeekTimeRecording_ContractHours]  DEFAULT ((0)),
	[AdditionalCharge] [dbo].[utiMinutes] NOT NULL CONSTRAINT [DF_EmployeeWeekTimeRecording_AdditionalCharge]  DEFAULT ((0)),
	[CustomEdit] [bit] NOT NULL DEFAULT ((0)),
	[AllIn] [bit] NOT NULL CONSTRAINT [DF_EmployeeWeekTimeRecording_AllIn]  DEFAULT ((0)),
 CONSTRAINT [PK_EmployeeWeekTimeRecording] PRIMARY KEY CLUSTERED 
(
	[EmployeeWeekTimeRecordingID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go


print '%Creating table% [EmployeeDayStatePlanning]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmployeeDayStatePlanning]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EmployeeDayStatePlanning](
	[EmployeeDayStatePlanningID] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [bigint] NOT NULL,
	[Store_WorldID] [bigint] NOT NULL,
	[Date] [smalldatetime] NOT NULL,
	[AllreadyPlannedHours] [dbo].[utiMinutes] NOT NULL DEFAULT ((0)),
	[WorkingHours] [dbo].[utiMinutes] NOT NULL DEFAULT ((0)),
	[SumOfAddHours] [dbo].[utiMinutes] NOT NULL DEFAULT ((0)),
	[PlusMinusHours] [dbo].[utiMinutes] NOT NULL DEFAULT ((0)),
	[EmplBalanceHours] [dbo].[utiMinutes] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_EmployeeDayStatePlanning] PRIMARY KEY CLUSTERED 
(
	[EmployeeDayStatePlanningID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [EmployeeDayStateRecording]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmployeeDayStateRecording]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EmployeeDayStateRecording](
	[EmployeeDayStateRecordingID] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [bigint] NOT NULL,
	[Store_WorldID] [bigint] NOT NULL,
	[Date] [smalldatetime] NOT NULL,
	[AllreadyPlannedHours] [dbo].[utiMinutes] NOT NULL DEFAULT ((0)),
	[WorkingHours] [dbo].[utiMinutes] NOT NULL DEFAULT ((0)),
	[SumOfAddHours] [dbo].[utiMinutes] NOT NULL DEFAULT ((0)),
	[PlusMinusHours] [dbo].[utiMinutes] NOT NULL DEFAULT ((0)),
	[EmplBalanceHours] [dbo].[utiMinutes] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_EmployeeDayStateRecording] PRIMARY KEY CLUSTERED 
(
	[EmployeeDayStateRecordingID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [bauMaxYear]'
go
CREATE TABLE [dbo].[bauMaxYear](
	[Year] [int] NOT NULL,
	[BeginDate] [smalldatetime] NOT NULL,
	[EndDate] [smalldatetime] NOT NULL,
	[WeeksMinus] [tinyint] NOT NULL,
	[LastWeekNumber] [tinyint] NOT NULL,
 CONSTRAINT [PK_bauMaxYear] PRIMARY KEY CLUSTERED 
(
	[Year] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

print '%Creating table% [CashDeskPeoplePerHourEstimate]'
go
CREATE TABLE [dbo].[CashDeskPeoplePerHourEstimate](
	[CashDeskPeoplePerHourEstimateID] [bigint] IDENTITY(1,1) NOT NULL,
	[EstimateYear] [int] NOT NULL,
	[Date] [smalldatetime] NOT NULL,
	[StoreID] [bigint] NOT NULL,
	[Year] [smallint] NULL,
	[Week] [tinyint] NULL,
	[WeekDay] [tinyint] NULL,
	[Month] [tinyint] NULL,
	[Hour] [tinyint] NOT NULL DEFAULT ((0)),
	[PeoplePerHour] [smallint] NOT NULL,
	[TargReceiptsPerHour] [smallmoney] NOT NULL DEFAULT ((0)),

 CONSTRAINT [PK_CashDeskPeoplePerHourEstimate] PRIMARY KEY NONCLUSTERED
(
	[CashDeskPeoplePerHourEstimateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
go

print '%Creating table% [CashRegisterReceipt]'
go
CREATE TABLE [dbo].[CashRegisterReceipt](
	[CashRegisterReceiptID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [smalldatetime] NOT NULL,
	[StoreID] [bigint] NOT NULL,
	[Year] [smallint] NULL,
	[Week] [tinyint] NULL,
	[WeekDay] [tinyint] NULL,
	[Month] [tinyint] NULL,
	[Hour] [tinyint] NOT NULL DEFAULT ((0)),
	[Number] [int] NOT NULL DEFAULT ((0)),
	[Converted] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_CashRegisterReceipt] PRIMARY KEY NONCLUSTERED
(
	[CashRegisterReceiptID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
go
CREATE CLUSTERED INDEX [Index_CRR_Date] ON [dbo].[CashRegisterReceipt] 
(
	[Date] ASC
)
go

print '%Creating table% [BusinessVolumeTarget]'
go
CREATE TABLE [dbo].[BusinessVolumeTarget](
	[BusinessVolumeTargetID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [int] NOT NULL,
	[StoreID] [bigint] NOT NULL,
	[WGR_ID] [bigint] NOT NULL,
	[Month] [tinyint] NULL,
	[VolumeBC] [money] NOT NULL DEFAULT ((0)),
	[VolumeCC] [money] NOT NULL DEFAULT ((0)),
	[Converted] [bit] NOT NULL DEFAULT ((0)),
	[WorldID] [bigint] NULL,
 CONSTRAINT [PK_BusinessVolumeTarget] PRIMARY KEY NONCLUSTERED
(
	[BusinessVolumeTargetID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
go
CREATE CLUSTERED INDEX [Index_BVT_Date] ON [dbo].[BusinessVolumeTarget] 
(
	[Date] ASC
)
go

print '%Creating table% [BusinessVolumeActual]'
go
CREATE TABLE [dbo].[BusinessVolumeActual](
	[BusinessVolumeActualID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [smalldatetime] NOT NULL,
	[StoreID] [bigint] NOT NULL,
	[WGR_ID] [bigint] NOT NULL,
	[Year] [smallint] NULL,
	[Week] [tinyint] NULL,
	[WeekDay] [tinyint] NULL,
	[Month] [tinyint] NULL,
	[VolumeBC] [smallmoney] NOT NULL DEFAULT ((0)),
	[VolumeCC] [money] NOT NULL DEFAULT ((0)),
	[Converted] [bit] NOT NULL DEFAULT ((0)),
	[WorldID] [bigint] NULL,
 CONSTRAINT [PK_BusinessVolumeActual] PRIMARY KEY NONCLUSTERED
(
	[BusinessVolumeActualID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
go
CREATE CLUSTERED INDEX [Index_BVA_Date] ON [dbo].[BusinessVolumeActual] 
(
	[Date] ASC
)
go
print '%Creating table% [CalculatedYear]'
go
CREATE TABLE [dbo].[CalculatedYear](
	[Year] [smallint] NOT NULL,
 CONSTRAINT [PK_CalculatedYear] PRIMARY KEY CLUSTERED 
(
	[Year] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

print '%Creating table% [AvgWorkingDaysInWeek]'
go
CREATE TABLE [dbo].[AvgWorkingDaysInWeek](
	[AvgWorkingDaysInWeekID] [bigint] IDENTITY(1,1) NOT NULL,
	[CountryID] [bigint] NOT NULL,
	[Year] [smallint] NOT NULL,
	[DaysCount] [decimal](3, 2) NOT NULL CONSTRAINT [DF_AvgWorkingDaysInWeek_DaysCount]  DEFAULT ((0)),
 CONSTRAINT [PK_AvgWorkingDaysInWeek] PRIMARY KEY CLUSTERED 
(
	[AvgWorkingDaysInWeekID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
go

print '%Creating table% [LongTimeAbsence]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LongTimeAbsence]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LongTimeAbsence](
	[LongTimeAbsenceID] [bigint] IDENTITY(1,1) NOT NULL,
	[CountryID] [bigint] NULL,
	[Code] [smallint] NULL,
	[CodeName] [nvarchar](30) NULL,
	[CharID] [nvarchar](6) NOT NULL DEFAULT (('')),
	[Import] [bit] NULL,
	[Color] [int] NOT NULL CONSTRAINT [DF_LongTimeAbsence_Color]  DEFAULT ((0)),	
CONSTRAINT [constraint_LongTimeAbsence__CountryIDCodeName] UNIQUE  NONCLUSTERED 
(
	CountryID,CodeName
)  ON [PRIMARY] ,
CONSTRAINT [constraint_LongTimeAbsence__CountryIDCharID] UNIQUE  NONCLUSTERED 
(
	CountryID,CharID
)  ON [PRIMARY] ,
 CONSTRAINT [PK_LongTimeAbsence] PRIMARY KEY CLUSTERED 
(
	[LongTimeAbsenceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [Employee_LongTimeAbsence]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee_LongTimeAbsence]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employee_LongTimeAbsence](
	[EmployeeLongTimeAbsenceID] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [bigint] NULL,
	[LongTimeAbsenceID] [bigint] NULL,
	[BeginTime] [smalldatetime] NULL,
	[EndTime] [smalldatetime] NULL,
 CONSTRAINT [PK_Employee_LongTimeAbsence] PRIMARY KEY CLUSTERED 
(
	[EmployeeLongTimeAbsenceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [EmployeeContract]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmployeeContract]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EmployeeContract](
	[EmployeeContractID] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [bigint] NOT NULL,
	[ContractBegin] [smalldatetime] NOT NULL,
	[ContractEnd] [smalldatetime] NOT NULL,
	[ContractWorkingHours] [decimal](5, 2) NOT NULL CONSTRAINT [DF_EmployeeContract_ContractWorkingHours]  DEFAULT ((0)),
 CONSTRAINT [PK_EmployeeContract] PRIMARY KEY CLUSTERED 
(
	[EmployeeContractID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END

print '%Creating table% [Employee_Relations]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee_Relations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employee_Relations](
	[Employee_RelationsID] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreID] [bigint] NULL,
	[WorldID] [bigint] NULL,
	[HWGR_ID] [bigint] NULL,
	[EmployeeID] [bigint] NULL,
	[BeginTime] [smalldatetime] NULL,
	[EndTime] [smalldatetime] NULL,
 CONSTRAINT [PK_Employee_Relations] PRIMARY KEY CLUSTERED 
(
	[Employee_RelationsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [Store_World]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Store_World]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Store_World](
	[Store_WorldID] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreID] [bigint] NOT NULL,
	[WorldID] [bigint] NOT NULL,
	CONSTRAINT [index_Store_World__StoreIDWorldID] UNIQUE  NONCLUSTERED 
	(
		StoreID,WorldID
	),	
 CONSTRAINT [PK_Store_World] PRIMARY KEY CLUSTERED 
(
	[Store_WorldID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [DS_World_HWGR]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DS_World_HWGR]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DS_World_HWGR](
	[WorldID] [bigint] NOT NULL,
	[HWGR_ID] [bigint] NOT NULL,
 CONSTRAINT [PK_DS_World_HWGR] PRIMARY KEY CLUSTERED 
(
	[WorldID] ASC,
	[HWGR_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [DS_HWGR_WGR]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DS_HWGR_WGR]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DS_HWGR_WGR](
	[HWGR_ID] [bigint] NOT NULL,
	[WGR_ID] [bigint] NOT NULL,
 CONSTRAINT [PK_DS_HWGR_WGR] PRIMARY KEY CLUSTERED 
(
	[HWGR_ID] ASC,
	[WGR_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END

print '%Creating table% [HWGR_WGR]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HWGR_WGR]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HWGR_WGR](
	[HWGR_WGR_ID] [bigint] NOT NULL,
	[StoreID] [bigint] NOT NULL,
	[HWGR_ID] [bigint] NOT NULL,
	[WGR_ID] [bigint] NOT NULL,
	[BeginTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[Import] [bit] NOT NULL CONSTRAINT [DF_HWGR_WGR_Import]  DEFAULT ((0)),
 CONSTRAINT [PK_HWGR_WGR] PRIMARY KEY CLUSTERED 
(
	[HWGR_WGR_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [World_HWGR]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[World_HWGR]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[World_HWGR](
	[World_HWGR_ID] [bigint] NOT NULL,
	[StoreID] [bigint] NOT NULL,
	[WorldID] [bigint] NOT NULL,
	[HWGR_ID] [bigint] NOT NULL,
	[BeginTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[Import] [bit] NOT NULL CONSTRAINT [DF_World_HWGR_Import]  DEFAULT ((0)),
 CONSTRAINT [PK_World_HWGR] PRIMARY KEY CLUSTERED 
(
	[World_HWGR_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
go


print '%Creating table% [UserRole_ServiceList]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRole_ServiceList]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserRole_ServiceList](
	[UserRoleID] [bigint] NOT NULL,
	[ServiceListID] [bigint] NOT NULL,
	[Operation] [int] NULL,
 CONSTRAINT [PK_UserRole_UserOperations] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC,
	[ServiceListID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [ServiceList]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceList]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ServiceList](
	[ServiceListID] [bigint] NOT NULL,
	[ServiceID] [uniqueidentifier] NOT NULL,
	[SeviceName] [dbo].[utName] NULL,
 CONSTRAINT [PK_UserOperations] PRIMARY KEY CLUSTERED 
(
	[ServiceListID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [YearlyWorkingDays]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[YearlyWorkingDays]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[YearlyWorkingDays](
	[YearlyWorkingDaysID] [bigint] NOT NULL,
	[CountryID] [bigint] NULL,
	[WorkingDay] [datetime] NULL,
 CONSTRAINT [PK_YearlyWorkingDays] PRIMARY KEY CLUSTERED 
(
	[YearlyWorkingDaysID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [AvgAmounts]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AvgAmounts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AvgAmounts](
	[AvgAmountsID] [bigint] NOT NULL,
	[CountryID] [bigint] NOT NULL,
	[Year] [smallint] NOT NULL,
	[AvgWeeks] [tinyint] NULL,
	[AvgContractTime] [smallint] NULL,
	[CashDeskAmount] [smallint] NULL,
	[AvgRestingTime] [smallint] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_AvgAmounts] PRIMARY KEY CLUSTERED 
(
	[AvgAmountsID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go
ALTER TABLE [dbo].[AvgAmounts]  WITH CHECK ADD  CONSTRAINT [CK_AvgAmounts_AvgRestingTime] CHECK  (([AvgRestingTime]>=(0) AND [AvgRestingTime]<=(1440)))
go
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AvgAmounts]') AND name = N'UniqueRec')
CREATE UNIQUE NONCLUSTERED INDEX [UniqueRec] ON [dbo].[AvgAmounts] 
(
	[CountryID] ASC,
	[Year] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
go

print '%Creating table% [UIResources]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UIResources]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UIResources](
	[UIResourceID] [bigint] NOT NULL IDENTITY (1,1),
	[ResourceID] [int] NULL,
	[LanguageID] [bigint] NULL,
	[Resource] [nvarchar](500)  NULL,
CONSTRAINT [constraint_UIResources__ResourceIDLanguageID] UNIQUE  NONCLUSTERED 
(
	ResourceID,LanguageID
)  ON [PRIMARY] ,
 CONSTRAINT [PK_UIResources_1] PRIMARY KEY CLUSTERED 
(
	[UIResourceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [PKGen]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PKGen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PKGen]
(
	[DomainName] [nvarchar](20) NOT NULL,
	[Value] [bigint] NOT NULL,
 CONSTRAINT [PK_PKGen] PRIMARY KEY CLUSTERED 
(
	[DomainName] ASC
)
) ON [PRIMARY]
END
go

print '%Creating table% [UserRole]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRole]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserRole](
	[UserRoleID] [bigint] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [Colouring]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Colouring]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Colouring](
	[ColouringID] [bigint] NOT NULL,
	[CountryID] [bigint] NULL,
	[ColourType] [tinyint] NULL,
	[LCColour] [int] NULL,
	[L] [int] NULL,
	[LColour] [int] NULL,
	[Y] [int] NULL,
	[NColour] [int] NULL,
	[X] [int] NULL,
	[HColour] [int] NULL,
	[H] [int] NULL,
	[HCColour] [int] NULL,
 CONSTRAINT [PK_Colouring] PRIMARY KEY CLUSTERED 
(
	[ColouringID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [User]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User](
	[Id] [bigint] NOT NULL,
	[EmployeeID] [bigint] NULL,
	[LoginName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](255) NULL,
	[UserRoleID] [bigint] NULL,
	[LanguageID] [bigint] NULL,
	[Active] [bit] NOT NULL,
	[Salt] [int] NOT NULL CONSTRAINT [DF_User_Salt]  DEFAULT ((0)),
	[Imported] [bit] NOT NULL CONSTRAINT [DF_User_Imported]  DEFAULT ((0)),
	[ShouldChangePassword] [bit] NOT NULL CONSTRAINT [DF_User_ShouldChangePassword]  DEFAULT ((1))
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [UserRoleName]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRoleName]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserRoleName](
	[Id] [bigint] NOT NULL,
	[UserRoleID] [bigint] NOT NULL,
	[LanguageID] [bigint] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserRoleName] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserRoleName]') AND name = N'UniqueRec')
CREATE UNIQUE NONCLUSTERED INDEX [UniqueRec] ON [dbo].[UserRoleName] 
(
	[UserRoleID] ASC,
	[LanguageID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
go

print '%Creating table% [User_Region]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_Region]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User_Region](
	[Id] [bigint] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[RegionID] [bigint] NOT NULL,
 CONSTRAINT [PK_User_Region] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [User_Store]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_Store]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User_Store](
	[Id] [bigint] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[StoreID] [bigint] NOT NULL,
 CONSTRAINT [PK_User_Store] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [User_Country]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_Country]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User_Country](
	[Id] [bigint] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[CountryID] [bigint] NOT NULL,
 CONSTRAINT [PK_User_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [Country]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Country]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Country](
	[CountryID] [bigint] NOT NULL,
	[SystemID1] [tinyint] NULL,
	[SystemID2] [nvarchar](2),
	[LanguageID] [bigint] NULL,
	[Import] [bit] NULL CONSTRAINT [DF_Country_Import]  DEFAULT ((0)),
	[WarningDays] [tinyint] NOT NULL CONSTRAINT [DF_Country_WarningDays]  DEFAULT ((0)),
	[MaxDays] [tinyint] NOT NULL CONSTRAINT [DF_Country_MaxDays]  DEFAULT ((0)),
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

END
go

print '%Creating table% [Absence]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Absence]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Absence](
	[AbsenceID] [bigint] NOT NULL,
	[SystemID] [int] NULL,
	[CountryID] [bigint] NOT NULL,
	[AbsenceTypeID] [tinyint] NOT NULL DEFAULT ((1)),
	[Color] [int] NULL DEFAULT ((0)),
	[CharID] [nvarchar](6) NOT NULL DEFAULT (('')),
	[UseInCalck] [bit] NOT NULL DEFAULT ((0)),
	[IsFixed] [bit] NOT NULL DEFAULT ((0)),
	[Value] [float] NOT NULL DEFAULT ((0)),
	[WithoutFixedTime] [bit] NOT NULL CONSTRAINT [DF_Absence_WithoutFixedTime]  DEFAULT ((1)),
	[Import] [bit] NOT NULL CONSTRAINT [DF_Absence_Import]  DEFAULT ((0)),
	[IsShow] [tinyint] NOT NULL DEFAULT ((1)),
	[CountAsOneDay] [bit] NOT NULL CONSTRAINT [DF_Absence_CountAsOneDay]  DEFAULT ((0)),
CONSTRAINT [CT_Absence_AbsenceTypeRange] CHECK  (([AbsenceTypeID]>=(1) AND [AbsenceTypeID]<=(3))),	
CONSTRAINT [CT_Absence_IsShowRange] CHECK  (([IsShow]>=(1) AND [IsShow]<=(4))),	
 CONSTRAINT [PK_Absence] PRIMARY KEY CLUSTERED 
(
	[AbsenceID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [World]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[World]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[World](
	[WorldID] [bigint] NOT NULL,
	[ExSystemID] [int] NULL,
	[WorldTypeID] [tinyint] NULL,
	[Import] [bit] NULL CONSTRAINT [DF_World_Import]  DEFAULT ((0)),
 CONSTRAINT [PK_World] PRIMARY KEY CLUSTERED 
(
	[WorldID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [AbsenceName]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AbsenceName]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AbsenceName](
	[Id] [bigint] NOT NULL,
	[AbsenceID] [bigint] NOT NULL,
	[LanguageID] [bigint] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_AbsenceName] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AbsenceName]') AND name = N'UniqueRec')
CREATE UNIQUE NONCLUSTERED INDEX [UniqueRec] ON [dbo].[AbsenceName] 
(
	[AbsenceID] ASC,
	[LanguageID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
go

print '%Creating table% [Store]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Store]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Store](
	[StoreID] [bigint] NOT NULL,
	[RegionID] [bigint] NULL,
	[SystemID] [int] NULL,
	[Number] [nvarchar](30) NULL,
	[City] [nvarchar](30) NULL,
	[Address] [nvarchar](30) NULL,
	[Area] [int] NULL,
	[Import] [bit] NULL CONSTRAINT [DF_Store_Import]  DEFAULT ((0)),
	[LastEmployeeWTR] [smalldatetime] NULL,	
	[LastEmployeeWTP] [smalldatetime] NULL,	
 CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [Employee]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [bigint] NOT NULL,
	[PersID] [nvarchar](25)  NULL,
	[PersNumber] [int] NULL,
	[LastName] [nvarchar](50)  NULL,
	[FirstName] [nvarchar](50)  NULL,
	[Import] [bit] NOT NULL CONSTRAINT [DF_Employee_Import]  DEFAULT ((0)),
	[MainStoreID] [bigint] NULL,
	[OldHolidays] [decimal](7, 2) NOT NULL DEFAULT ((0)),
	[NewHolidays] [decimal](7, 2) NOT NULL DEFAULT ((0)),
	[BalanceHours] [decimal](8, 2) NOT NULL DEFAULT ((0)),
	[CreateDate] [smalldatetime] NULL,
	[AvailableHolidays] [decimal](7, 2) NOT NULL DEFAULT ((0)),
	[ContractLastBegin] [smalldatetime] NULL,
	[ContractLastEnd] [smalldatetime] NULL,
	[ContractLastWorkingHours] [decimal](5, 2) NULL,
	[Department] [nvarchar](50) NULL,
	[AllIn] [bit] NOT NULL DEFAULT ((0)),
	[OrderHwgrID] [bigint] NULL,
	[WeekState] [tinyint] NOT NULL CONSTRAINT [DF_Employee_WeekState]  DEFAULT ((0)),
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [Region]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Region]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Region](
	[RegionID] [bigint] NOT NULL,
	[RegionSysID] [nvarchar](40) NULL,
	[CountryID] [bigint] NOT NULL,
	[Import] [bit] NOT NULL CONSTRAINT [DF_Region_Import]  DEFAULT ((0)),
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[RegionID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [WorkingModel]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkingModel]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WorkingModel](
	[WorkingModelID] [bigint] NOT NULL,
	[CountryID] [bigint] NULL,
	[Data] [nvarchar](200)  NULL,
	[ConditionType] [int] NULL,
	[MultiplyValue] [float] NULL,
	[AddValue] [float] NULL,
	[BeginTime] [smalldatetime] NULL,
	[EndTime] [smalldatetime] NULL,
	[AddCharges] [bit] NOT NULL DEFAULT ((0)),
	[UseInRecording] [bit] NOT NULL DEFAULT ((0)),
	[WorkingModelType] [tinyint] NOT NULL CONSTRAINT [DF_WorkingModel_WorkingModelType]  DEFAULT ((0)),
 CONSTRAINT [PK_WorkingModel] PRIMARY KEY CLUSTERED 
(
	[WorkingModelID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
go

ALTER TABLE dbo.WorkingModel ADD CONSTRAINT
	CK_WorkingModel_WMTValue CHECK (WorkingModelType between 0 and 1)
go	

print '%Creating table% [WorkingModelMessage]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkingModelMessage]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WorkingModelMessage](
	[WorkingModelID] [bigint] NOT NULL,
	[LanguageID] [bigint] NOT NULL,
	[Message] [nvarchar](100) NULL,
 CONSTRAINT [PK_ReactionName] PRIMARY KEY CLUSTERED 
(
	[WorkingModelID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [Feasts]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Feasts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Feasts](
	[FeastsID] [bigint] NOT NULL,
	[CountryID] [bigint] NOT NULL,
	[FeastDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Feasts] PRIMARY KEY CLUSTERED 
(
	[FeastsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
go

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Feasts]') AND name = N'UniqueRec')
CREATE UNIQUE NONCLUSTERED INDEX [UniqueRec] ON [dbo].[Feasts] 
(
	[CountryID] ASC,
	[FeastDate] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
go

print '%Creating table% [Feasts]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonMinMax]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PersonMinMax](
	[PersonMinMaxID] [bigint] NOT NULL,
	[Store_WorldID] [bigint] NOT NULL,
	[Year] [smallint] NOT NULL,
	[Min] [smallint] NULL,
	[Max] [smallint] NULL,
 CONSTRAINT [PK_PersonMinMax] PRIMARY KEY CLUSTERED 
(
	[PersonMinMaxID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PersonMinMax]') AND name = N'UniqueRec')
CREATE UNIQUE NONCLUSTERED INDEX [UniqueRec] ON [dbo].[PersonMinMax] 
(
	[Store_WorldID] ASC,
	[Year] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
go

print '%Creating table% [Benchmark]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Benchmark]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Benchmark](
	[BenchmarkID] [bigint] NOT NULL,
	[Store_WorldID] [bigint] NOT NULL,
	[Year] [smallint] NOT NULL,
	[Value] [float] NULL,
 CONSTRAINT [PK_Benchmark] PRIMARY KEY CLUSTERED 
(
	[BenchmarkID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
go

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Benchmark]') AND name = N'UniqueRec')
CREATE UNIQUE NONCLUSTERED INDEX [UniqueRec] ON [dbo].[Benchmark] 
(
	[Store_WorldID] ASC,
	[Year] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
go

print '%Creating table% [TrendCorrection]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TrendCorrection]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TrendCorrection](
	[TrendCorrectionID] [bigint] NOT NULL,
	[Store_WorldID] [bigint] NOT NULL,
	[Name] [nvarchar](256) NOT NULL DEFAULT (('')),
	[BeginTime] [smalldatetime] NOT NULL,
	[EndTime] [smalldatetime] NOT NULL,
	[Value] [float] NULL,
 CONSTRAINT [PK_TrendCorrection] PRIMARY KEY CLUSTERED 
(
	[TrendCorrectionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
go

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[TrendCorrection]') AND name = N'UniqueRec')
CREATE UNIQUE NONCLUSTERED INDEX [UniqueRec] ON [dbo].[TrendCorrection] 
(
	[Store_WorldID] ASC,
	[BeginTime] ASC,
	[EndTime] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
go

print '%Creating table% [BufferHours]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BufferHours]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BufferHours](
	[BufferHoursID] [bigint] NOT NULL,
	[Store_WorldID] [bigint] NOT NULL,
	[Year] [smallint] NOT NULL,
	[Value] [float] NULL,
	[ValueWeek] [float] NOT NULL CONSTRAINT [DF_BufferHours_ValueWeek]  DEFAULT ((0)),
 CONSTRAINT [PK_BufferHours] PRIMARY KEY CLUSTERED 
(
	[BufferHoursID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
go

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[BufferHours]') AND name = N'UniqueRec')
CREATE UNIQUE NONCLUSTERED INDEX [UniqueRec] ON [dbo].[BufferHours] 
(
	[Store_WorldID] ASC,
	[Year] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
go

print '%Creating table% [HWGR]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HWGR]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HWGR](
	[HWGR_ID] [bigint] NOT NULL,
	[SystemID] [int] NULL,
	[Import] [bit] NULL CONSTRAINT [DF_HWGR_Import]  DEFAULT ((0)),
 CONSTRAINT [PK_HWGR] PRIMARY KEY CLUSTERED 
(
	[HWGR_ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [WGR]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WGR]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WGR](
	[WGR_ID] [bigint] NOT NULL,
	[SystemID] [int] NULL,
	[Import] [bit] NULL CONSTRAINT [DF_WGR_Import]  DEFAULT ((0)),
 CONSTRAINT [PK_WGR] PRIMARY KEY CLUSTERED 
(
	[WGR_ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [HWGR_Name]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HWGR_Name]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HWGR_Name](
	[Id] [bigint] NOT NULL,
	[HWGR_ID] [bigint] NOT NULL,
	[LanguageID] [bigint] NOT NULL,
	[Name] [dbo].[utName] NULL,
 CONSTRAINT [PK_HWGR_Name] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[HWGR_Name]') AND name = N'UniqueRec')
CREATE UNIQUE NONCLUSTERED INDEX [UniqueRec] ON [dbo].[HWGR_Name] 
(
	[HWGR_ID] ASC,
	[LanguageID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
go

print '%Creating table% [CountryName]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CountryName]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CountryName](
	[Id] [bigint] NOT NULL,
	[CountryID] [bigint] NOT NULL,
	[LanguageID] [bigint] NOT NULL,
	[Name] [dbo].[utName] NULL,
 CONSTRAINT [PK_CountryName] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CountryName]') AND name = N'UniqueRec')
CREATE UNIQUE NONCLUSTERED INDEX [UniqueRec] ON [dbo].[CountryName] 
(
	[CountryID] ASC,
	[LanguageID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
go

print '%Creating table% [StoreName]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StoreName]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StoreName](
	[Id] [bigint] NOT NULL,
	[StoreID] [bigint] NOT NULL,
	[LanguageID] [bigint] NOT NULL,
	[Name] [dbo].[utName] NULL,
 CONSTRAINT [PK_StoreName] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StoreName]') AND name = N'UniqueRec')
CREATE UNIQUE NONCLUSTERED INDEX [UniqueRec] ON [dbo].[StoreName] 
(
	[StoreID] ASC,
	[LanguageID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
go

print '%Creating table% [WorldName]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorldName]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WorldName](
	[Id] [bigint] NOT NULL,
	[WorldID] [bigint] NOT NULL,
	[LanguageID] [bigint] NOT NULL,
	[Name] [dbo].[utName] NULL,
 CONSTRAINT [PK_WorldName] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[WorldName]') AND name = N'UniqueRec')
CREATE UNIQUE NONCLUSTERED INDEX [UniqueRec] ON [dbo].[WorldName] 
(
	[WorldID] ASC,
	[LanguageID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
go

print '%Creating table% [WorkingModelName]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkingModelName]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WorkingModelName](
	[Id] [bigint] NOT NULL,
	[WorkingModelID] [bigint] NOT NULL,
	[LanguageID] [bigint] NOT NULL,
	[Name] [dbo].[utName] NULL,
 CONSTRAINT [PK_WorkingModelName] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[WorkingModelName]') AND name = N'UniqueRec')
CREATE UNIQUE NONCLUSTERED INDEX [UniqueRec] ON [dbo].[WorkingModelName] 
(
	[WorkingModelID] ASC,
	[LanguageID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
go

print '%Creating table% [WGR_Name]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WGR_Name]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WGR_Name](
	[Id] [bigint] NOT NULL,
	[WRG_ID] [bigint] NOT NULL,
	[LanguageID] [bigint] NOT NULL,
	[Name] [dbo].[utName] NULL,
 CONSTRAINT [PK_WGR_Name] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[WGR_Name]') AND name = N'UniqueRec')
CREATE NONCLUSTERED INDEX [UniqueRec] ON [dbo].[WGR_Name] 
(
	[WRG_ID] ASC,
	[LanguageID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
go

print '%Creating table% [RegionName]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RegionName]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RegionName](
	[Id] [bigint] NOT NULL,
	[RegionID] [bigint] NOT NULL,
	[LanguageID] [bigint] NOT NULL,
	[Name] [dbo].[utName] NULL,
 CONSTRAINT [PK_RegionName] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[RegionName]') AND name = N'UniqueRec')
CREATE UNIQUE NONCLUSTERED INDEX [UniqueRec] ON [dbo].[RegionName] 
(
	[RegionID] ASC,
	[LanguageID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
go

print '%Creating table% [Language]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Language]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Language](
	[LanguageID] [bigint] NOT NULL,
	[Name] [dbo].[utName] NULL,
	[LanguageCode] [nvarchar](5) NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [AbsenceTimePlanning]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AbsenceTimePlanning]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AbsenceTimePlanning](
	[AbsenceTimePlanningID] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [bigint] NOT NULL,
	[Date] [smalldatetime] NOT NULL,
	[AbsenceID] [bigint] NOT NULL,
	[Begin] [dbo].[utsMinutes] NOT NULL,
	[End] [dbo].[utsMinutes] NOT NULL,
	[Time] [dbo].[utsMinutes] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_AbsenceTime] PRIMARY KEY CLUSTERED 
(
	[AbsenceTimePlanningID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [AbsenceTimeRecording]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AbsenceTimeRecording]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AbsenceTimeRecording](
	[AbsenceTimeRecordingID] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [bigint] NOT NULL,
	[Date] [smalldatetime] NOT NULL,
	[AbsenceID] [bigint] NOT NULL,
	[Begin] [dbo].[utsMinutes] NOT NULL,
	[End] [dbo].[utsMinutes] NOT NULL,
	[Time] [dbo].[utsMinutes] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_AbsenceRecording] PRIMARY KEY CLUSTERED 
(
	[AbsenceTimeRecordingID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [WorkingTimePlanning]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkingTimePlanning]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WorkingTimePlanning](
	[WorkingTimePlanningID] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [bigint] NOT NULL,
	[Date] [smalldatetime] NOT NULL,
	[Begin] [dbo].[utsMinutes] NOT NULL,
	[End] [dbo].[utsMinutes] NOT NULL,
	[Time] [dbo].[utsMinutes] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_WorkingTime] PRIMARY KEY CLUSTERED 
(
	[WorkingTimePlanningID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [StoreWorkingTime]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StoreWorkingTime]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StoreWorkingTime](
	[StoreWorkingTimeID] [bigint] NOT NULL,
	[StoreID] [bigint] NOT NULL,
	[BeginTime] [smalldatetime] NOT NULL,
	[EndTime] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_StoreWorkingTime] PRIMARY KEY CLUSTERED 
(
	[StoreWorkingTimeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
go

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StoreWorkingTime]') AND name = N'UniqueRec')
CREATE UNIQUE NONCLUSTERED INDEX [UniqueRec] ON [dbo].[StoreWorkingTime] 
(
	[StoreID] ASC,
	[BeginTime] ASC,
	[EndTime] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
go

print '%Creating table% [StoreWTWeekday]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StoreWTWeekday]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StoreWTWeekday](
	[StoreWTWeekdayID] [bigint] NOT NULL,
	[StoreWorkingTimeID] [bigint] NULL,
	[Weekday] [tinyint] NULL,
	[Opentime] [dbo].[utsMinutes] NULL,
	[Closetime] [dbo].[utsMinutes] NULL,
 CONSTRAINT [PK_StoreWTWeekday] PRIMARY KEY CLUSTERED 
(
	[StoreWTWeekdayID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [WorkingTimeRecording]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkingTimeRecording]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WorkingTimeRecording](
	[WorkingTimeRecordingID] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [bigint] NOT NULL,
	[Date] [smalldatetime] NOT NULL,
	[Begin] [dbo].[utsMinutes] NOT NULL,
	[End] [dbo].[utsMinutes] NOT NULL,
	[Time] [dbo].[utsMinutes] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_TimeRecording] PRIMARY KEY CLUSTERED 
(
	[WorkingTimeRecordingID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
go

print '%Creating table% [dbProperties]'
go
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dbProperties]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dbProperties](
	[Version] [nvarchar](250) NULL CONSTRAINT [DF_dbProperties_Version]  DEFAULT (N'0.0.1'),
	[DefaultLanguageID] [bigint] NULL,
	[AustriaCountryID] [bigint] NULL,
	[BusinessValuesBegin] [smalldatetime] NOT NULL DEFAULT ('20031229')
) ON [PRIMARY]
END
go

print '%Creating indexes%'
go

--Store
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Store]') AND name = N'IX_Store__SystemID')
DROP INDEX [IX_Store__SystemID] ON [dbo].[Store] WITH ( ONLINE = OFF )
go
CREATE UNIQUE NONCLUSTERED INDEX [IX_Store__SystemID] ON [dbo].[Store] 
(
	[SystemID] ASC
)
go

--Region
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Region]') AND name = N'IX_Region__RegionSysID')
DROP INDEX [IX_Region__RegionSysID] ON [dbo].[Region] WITH ( ONLINE = OFF )
go
CREATE UNIQUE NONCLUSTERED INDEX [IX_Region__RegionSysID] ON [dbo].[Region] 
(
	[RegionSysID] ASC
)
go

--Country
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Country]') AND name = N'IX_Country__SystemID1')
DROP INDEX [IX_Country__SystemID1] ON [dbo].[Country] WITH ( ONLINE = OFF )
go
CREATE UNIQUE NONCLUSTERED INDEX [IX_Country__SystemID1] ON [dbo].[Country] 
(
	[SystemID1] ASC
)
go

--HWGR
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[HWGR]') AND name = N'IX_HWGR__SystemID')
DROP INDEX [IX_HWGR__SystemID] ON [dbo].[HWGR] WITH ( ONLINE = OFF )
go
CREATE UNIQUE NONCLUSTERED INDEX [IX_HWGR__SystemID] ON [dbo].[HWGR] 
(
	[SystemID] ASC
)
go

--WGR
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[WGR]') AND name = N'IX_WGR__SystemID')
DROP INDEX [IX_WGR__SystemID] ON [dbo].[WGR] WITH ( ONLINE = OFF )
go
CREATE UNIQUE NONCLUSTERED INDEX [IX_WGR__SystemID] ON [dbo].[WGR] 
(
	[SystemID] ASC
)
go

--World
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[World]') AND name = N'IX_World__ExSystemID')
DROP INDEX [IX_World__ExSystemID] ON [dbo].[World] WITH ( ONLINE = OFF )
go
CREATE UNIQUE NONCLUSTERED INDEX [IX_World__ExSystemID] ON [dbo].[World] 
(
	[ExSystemID] ASC
)
go

/*
print '%Creating index% [index_HWGR_WGR__WGR_ID_World_HWGR_ID]'
CREATE UNIQUE NONCLUSTERED INDEX [index_HWGR_WGR__WGR_ID_World_HWGR_ID] ON [dbo].[HWGR_WGR] 
(
	[WGR_ID] ASC,
	[World_HWGR_ID] ASC,
	[BeginTime] ASC,
	[EndTime] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
*/
CREATE UNIQUE NONCLUSTERED INDEX [UniqueRec] ON [dbo].[AvgWorkingDaysInWeek] 
(
	[CountryID] ASC,
	[Year] ASC
)
go

print '%Creating index% [Index_Absence__CountryCharID]'
go
CREATE UNIQUE NONCLUSTERED INDEX [Index_Absence__CountryCharID] ON [dbo].[Absence] 
(
	[CountryID] ASC,
	[CharID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY]

print '%Creating index% [IX_User_LoginName]'
go
CREATE UNIQUE NONCLUSTERED INDEX [IX_User_LoginName] ON [dbo].[User] 
(
     [LoginName] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
go

print '%Creating index% [IX_EDSR_DateEmployeeID]'
go
CREATE UNIQUE NONCLUSTERED INDEX [IX_EDSR_DateEmployeeID] ON [dbo].[EmployeeDayStateRecording] 
(
	[Date] ASC,
	[EmployeeID] ASC
)
go

print '%Creating index% [IX_EDSP_DateEmployeeID]'
go
CREATE UNIQUE NONCLUSTERED INDEX [IX_EDSP_DateEmployeeID] ON [dbo].[EmployeeDayStatePlanning] 
(
	[Date] ASC,
	[EmployeeID] ASC
)
go

print '%Creating index% [IX_EWTP_WeekBeginEmployeeID]'
go
CREATE UNIQUE NONCLUSTERED INDEX [IX_EWTP_WeekBeginEmployeeID] ON [dbo].[EmployeeWeekTimePlanning] 
(
	[WeekBegin] ASC,
	[EmployeeID] ASC
)
go

print '%Creating index% [IX_EWTR_WeekBeginEmployeeID]'
go
CREATE UNIQUE NONCLUSTERED INDEX [IX_EWTR_WeekBeginEmployeeID] ON [dbo].[EmployeeWeekTimeRecording] 
(
	[WeekBegin] ASC,
	[EmployeeID] ASC
)
go

print '%Creating index% [IX_ER_EmployeeID]'
go
CREATE NONCLUSTERED INDEX [IX_ER_EmployeeID] ON [dbo].[Employee_Relations] 
(
	[EmployeeID] ASC
)
go

print '%Creating index% [IX_EC_EmployeeID]'
go
CREATE NONCLUSTERED INDEX [IX_EC_EmployeeID] ON [dbo].[EmployeeContract]
(
	[EmployeeID] ASC
)
go

print '%Creating relationships%...'
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User]  WITH NOCHECK ADD  CONSTRAINT [FK_User_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_UserRole]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User]  WITH NOCHECK ADD  CONSTRAINT [FK_User_UserRole] FOREIGN KEY([UserRoleID])
REFERENCES [dbo].[UserRole] ([UserRoleID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRoleName_UserRole]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRoleName]'))
ALTER TABLE [dbo].[UserRoleName]  WITH CHECK ADD  CONSTRAINT [FK_UserRoleName_UserRole] FOREIGN KEY([UserRoleID])
REFERENCES [dbo].[UserRole] ([UserRoleID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Region_Region]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Region]'))
ALTER TABLE [dbo].[User_Region]  WITH CHECK ADD  CONSTRAINT [FK_User_Region_Region] FOREIGN KEY([RegionID])
REFERENCES [dbo].[Region] ([RegionID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Region_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Region]'))
ALTER TABLE [dbo].[User_Region]  WITH NOCHECK ADD  CONSTRAINT [FK_User_Region_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Store_Store]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Store]'))
ALTER TABLE [dbo].[User_Store]  WITH CHECK ADD  CONSTRAINT [FK_User_Store_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([StoreID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Store_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Store]'))
ALTER TABLE [dbo].[User_Store]  WITH NOCHECK ADD  CONSTRAINT [FK_User_Store_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Country_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Country]'))
ALTER TABLE [dbo].[User_Country]  WITH CHECK ADD  CONSTRAINT [FK_User_Country_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Country_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Country]'))
ALTER TABLE [dbo].[User_Country]  WITH NOCHECK ADD  CONSTRAINT [FK_User_Country_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([Id])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Country_Language]') AND parent_object_id = OBJECT_ID(N'[dbo].[Country]'))
ALTER TABLE [dbo].[Country]  WITH CHECK ADD  CONSTRAINT [FK_Country_Language] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Language] ([LanguageID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Absence_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[Absence]'))
ALTER TABLE [dbo].[Absence]  WITH CHECK ADD  CONSTRAINT [FK_Absence_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AbsenceName_Absence]') AND parent_object_id = OBJECT_ID(N'[dbo].[AbsenceName]'))
ALTER TABLE [dbo].[AbsenceName]  WITH CHECK ADD  CONSTRAINT [FK_AbsenceName_Absence] FOREIGN KEY([AbsenceID])
REFERENCES [dbo].[Absence] ([AbsenceID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Store_Region]') AND parent_object_id = OBJECT_ID(N'[dbo].[Store]'))
ALTER TABLE [dbo].[Store]  WITH CHECK ADD  CONSTRAINT [FK_Store_Region] FOREIGN KEY([RegionID])
REFERENCES [dbo].[Region] ([RegionID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Region_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[Region]'))
ALTER TABLE [dbo].[Region]  WITH CHECK ADD  CONSTRAINT [FK_Region_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkingModel_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkingModel]'))
ALTER TABLE [dbo].[WorkingModel]  WITH CHECK ADD  CONSTRAINT [FK_WorkingModel_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Feasts_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[Feasts]'))
ALTER TABLE [dbo].[Feasts]  WITH CHECK ADD  CONSTRAINT [FK_Feasts_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HWGR_Name_HWGR]') AND parent_object_id = OBJECT_ID(N'[dbo].[HWGR_Name]'))
ALTER TABLE [dbo].[HWGR_Name]  WITH CHECK ADD  CONSTRAINT [FK_HWGR_Name_HWGR] FOREIGN KEY([HWGR_ID])
REFERENCES [dbo].[HWGR] ([HWGR_ID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CountryName_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[CountryName]'))
ALTER TABLE [dbo].[CountryName]  WITH CHECK ADD  CONSTRAINT [FK_CountryName_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StoreName_Store]') AND parent_object_id = OBJECT_ID(N'[dbo].[StoreName]'))
ALTER TABLE [dbo].[StoreName]  WITH CHECK ADD  CONSTRAINT [FK_StoreName_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([StoreID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorldName_World]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorldName]'))
ALTER TABLE [dbo].[WorldName]  WITH CHECK ADD  CONSTRAINT [FK_WorldName_World] FOREIGN KEY([WorldID])
REFERENCES [dbo].[World] ([WorldID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkingModelName_WorkingModel]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkingModelName]'))
ALTER TABLE [dbo].[WorkingModelName]  WITH CHECK ADD  CONSTRAINT [FK_WorkingModelName_WorkingModel] FOREIGN KEY([WorkingModelID])
REFERENCES [dbo].[WorkingModel] ([WorkingModelID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WGR_Name_WGR]') AND parent_object_id = OBJECT_ID(N'[dbo].[WGR_Name]'))
ALTER TABLE [dbo].[WGR_Name]  WITH CHECK ADD  CONSTRAINT [FK_WGR_Name_WGR] FOREIGN KEY([WRG_ID])
REFERENCES [dbo].[WGR] ([WGR_ID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RegionName_Region]') AND parent_object_id = OBJECT_ID(N'[dbo].[RegionName]'))
ALTER TABLE [dbo].[RegionName]  WITH CHECK ADD  CONSTRAINT [FK_RegionName_Region] FOREIGN KEY([RegionID])
REFERENCES [dbo].[Region] ([RegionID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AbsenceTime_Absence]') AND parent_object_id = OBJECT_ID(N'[dbo].[AbsenceTimePlanning]'))
ALTER TABLE [dbo].[AbsenceTimePlanning]  WITH CHECK ADD  CONSTRAINT [FK_AbsenceTime_Absence] FOREIGN KEY([AbsenceID])
REFERENCES [dbo].[Absence] ([AbsenceID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AbsenceRecording_Absence]') AND parent_object_id = OBJECT_ID(N'[dbo].[AbsenceTimeRecording]'))
ALTER TABLE [dbo].[AbsenceTimeRecording]  WITH CHECK ADD  CONSTRAINT [FK_AbsenceRecording_Absence] FOREIGN KEY([AbsenceID])
REFERENCES [dbo].[Absence] ([AbsenceID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkingTime_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkingTimePlanning]'))
ALTER TABLE [dbo].[WorkingTimePlanning]  WITH CHECK ADD  CONSTRAINT [FK_WorkingTime_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StoreWorkingTime_Store]') AND parent_object_id = OBJECT_ID(N'[dbo].[StoreWorkingTime]'))
ALTER TABLE [dbo].[StoreWorkingTime]  WITH CHECK ADD  CONSTRAINT [FK_StoreWorkingTime_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([StoreID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TimeRecording_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkingTimeRecording]'))
ALTER TABLE [dbo].[WorkingTimeRecording]  WITH CHECK ADD  CONSTRAINT [FK_TimeRecording_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Colouring_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[Colouring]'))
ALTER TABLE [dbo].[Colouring]  WITH CHECK ADD  CONSTRAINT [FK_Colouring_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkingModelMessage_WorkingModel]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkingModelMessage]'))
ALTER TABLE [dbo].[WorkingModelMessage]  WITH CHECK ADD  CONSTRAINT [FK_WorkingModelMessage_WorkingModel] FOREIGN KEY([WorkingModelID])
REFERENCES [dbo].[WorkingModel] ([WorkingModelID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AvgAmounts_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[AvgAmounts]'))
ALTER TABLE [dbo].[AvgAmounts]  WITH CHECK ADD  CONSTRAINT [FK_AvgAmounts_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_YearlyWorkingDays_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[YearlyWorkingDays]'))
ALTER TABLE [dbo].[YearlyWorkingDays]  WITH CHECK ADD  CONSTRAINT [FK_YearlyWorkingDays_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRole_ServiceList_ServiceList]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRole_ServiceList]'))
ALTER TABLE [dbo].[UserRole_ServiceList]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_ServiceList_ServiceList] FOREIGN KEY([ServiceListID])
REFERENCES [dbo].[ServiceList] ([ServiceListID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRole_ServiceList_UserRole]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRole_ServiceList]'))
ALTER TABLE [dbo].[UserRole_ServiceList]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_ServiceList_UserRole] FOREIGN KEY([UserRoleID])
REFERENCES [dbo].[UserRole] ([UserRoleID])
go

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_World_HWGR_HWGR]') AND parent_object_id = OBJECT_ID(N'[dbo].[World_HWGR]'))
ALTER TABLE [dbo].[World_HWGR]  WITH CHECK ADD  CONSTRAINT [FK_World_HWGR_HWGR] FOREIGN KEY([HWGR_ID])
REFERENCES [dbo].[HWGR] ([HWGR_ID])
go

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HWGR_WGR_WGR]') AND parent_object_id = OBJECT_ID(N'[dbo].[HWGR_WGR]'))
ALTER TABLE [dbo].[HWGR_WGR]  WITH CHECK ADD  CONSTRAINT [FK_HWGR_WGR_WGR] FOREIGN KEY([WGR_ID])
REFERENCES [dbo].[WGR] ([WGR_ID])
go

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Store_World_Store]') AND parent_object_id = OBJECT_ID(N'[dbo].[Store_World]'))
ALTER TABLE [dbo].[Store_World]  WITH CHECK ADD  CONSTRAINT [FK_Store_World_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([StoreID])
go

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Store_World_World]') AND parent_object_id = OBJECT_ID(N'[dbo].[Store_World]'))
ALTER TABLE [dbo].[Store_World]  WITH CHECK ADD  CONSTRAINT [FK_Store_World_World] FOREIGN KEY([WorldID])
REFERENCES [dbo].[World] ([WorldID])
go

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StoreWTWeekday_StoreWorkingTime]') AND parent_object_id = OBJECT_ID(N'[dbo].[StoreWTWeekday]'))
ALTER TABLE [dbo].[StoreWTWeekday]  WITH CHECK ADD  CONSTRAINT [FK_StoreWTWeekday_StoreWorkingTime] FOREIGN KEY([StoreWorkingTimeID])
REFERENCES [dbo].[StoreWorkingTime] ([StoreWorkingTimeID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DS_World_HWGR_HWGR]') AND parent_object_id = OBJECT_ID(N'[dbo].[DS_World_HWGR]'))
ALTER TABLE [dbo].[DS_World_HWGR]  WITH CHECK ADD  CONSTRAINT [FK_DS_World_HWGR_HWGR] FOREIGN KEY([HWGR_ID])
REFERENCES [dbo].[HWGR] ([HWGR_ID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DS_World_HWGR_World]') AND parent_object_id = OBJECT_ID(N'[dbo].[DS_World_HWGR]'))
ALTER TABLE [dbo].[DS_World_HWGR]  WITH CHECK ADD  CONSTRAINT [FK_DS_World_HWGR_World] FOREIGN KEY([WorldID])
REFERENCES [dbo].[World] ([WorldID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DS_HWGR_WGR_HWGR]') AND parent_object_id = OBJECT_ID(N'[dbo].[DS_HWGR_WGR]'))
ALTER TABLE [dbo].[DS_HWGR_WGR]  WITH CHECK ADD  CONSTRAINT [FK_DS_HWGR_WGR_HWGR] FOREIGN KEY([HWGR_ID])
REFERENCES [dbo].[HWGR] ([HWGR_ID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DS_HWGR_WGR_WGR]') AND parent_object_id = OBJECT_ID(N'[dbo].[DS_HWGR_WGR]'))
ALTER TABLE [dbo].[DS_HWGR_WGR]  WITH CHECK ADD  CONSTRAINT [FK_DS_HWGR_WGR_WGR] FOREIGN KEY([WGR_ID])
REFERENCES [dbo].[WGR] ([WGR_ID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BufferHours_Store_World]') AND parent_object_id = OBJECT_ID(N'[dbo].[BufferHours]'))
ALTER TABLE [dbo].[BufferHours]  WITH CHECK ADD  CONSTRAINT [FK_BufferHours_Store_World] FOREIGN KEY([Store_WorldID])
REFERENCES [dbo].[Store_World] ([Store_WorldID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TrendCorrection_Store_World]') AND parent_object_id = OBJECT_ID(N'[dbo].[TrendCorrection]'))
ALTER TABLE [dbo].[TrendCorrection]  WITH CHECK ADD  CONSTRAINT [FK_TrendCorrection_Store_World] FOREIGN KEY([Store_WorldID])
REFERENCES [dbo].[Store_World] ([Store_WorldID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Benchmark_Store_World]') AND parent_object_id = OBJECT_ID(N'[dbo].[Benchmark]'))
ALTER TABLE [dbo].[Benchmark]  WITH CHECK ADD  CONSTRAINT [FK_Benchmark_Store_World] FOREIGN KEY([Store_WorldID])
REFERENCES [dbo].[Store_World] ([Store_WorldID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee_Relations_Store1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employee_Relations]'))
ALTER TABLE [dbo].[Employee_Relations]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Relations_Store1] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([StoreID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee_Relations_HWGR]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employee_Relations]'))
ALTER TABLE [dbo].[Employee_Relations]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Relations_HWGR] FOREIGN KEY([HWGR_ID])
REFERENCES [dbo].[HWGR] ([HWGR_ID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee_Relations_World]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employee_Relations]'))
ALTER TABLE [dbo].[Employee_Relations]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Relations_World] FOREIGN KEY([WorldID])
REFERENCES [dbo].[World] ([WorldID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee_LongTimeAbsence_LongTimeAbsence]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employee_LongTimeAbsence]'))
ALTER TABLE [dbo].[Employee_LongTimeAbsence]  WITH CHECK ADD  CONSTRAINT [FK_Employee_LongTimeAbsence_LongTimeAbsence] FOREIGN KEY([LongTimeAbsenceID])
REFERENCES [dbo].[LongTimeAbsence] ([LongTimeAbsenceID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PersonMinMax_Store_World]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonMinMax]'))
ALTER TABLE [dbo].[PersonMinMax]  WITH CHECK ADD  CONSTRAINT [FK_PersonMinMax_Store_World] FOREIGN KEY([Store_WorldID])
REFERENCES [dbo].[Store_World] ([Store_WorldID])
go

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee_Relations_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employee_Relations]'))
ALTER TABLE [dbo].[Employee_Relations]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Relations_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
ON UPDATE CASCADE
ON DELETE CASCADE
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee_LongTimeAbsence_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employee_LongTimeAbsence]'))
ALTER TABLE [dbo].[Employee_LongTimeAbsence]  WITH CHECK ADD  CONSTRAINT [FK_Employee_LongTimeAbsence_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
ON UPDATE CASCADE
ON DELETE CASCADE
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmployeeContract_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmployeeContract]'))
ALTER TABLE [dbo].[EmployeeContract]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeContract_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
ON UPDATE CASCADE
ON DELETE CASCADE
go

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_World_HWGR_Store_World]') AND parent_object_id = OBJECT_ID(N'[dbo].[World_HWGR]'))
ALTER TABLE [dbo].[World_HWGR]  WITH CHECK ADD  CONSTRAINT [FK_World_HWGR_Store_World] FOREIGN KEY([StoreID], [WorldID])
REFERENCES [dbo].[Store_World] ([StoreID], [WorldID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HWGR_WGR_HWGR]') AND parent_object_id = OBJECT_ID(N'[dbo].[HWGR_WGR]'))
ALTER TABLE [dbo].[HWGR_WGR]  WITH CHECK ADD  CONSTRAINT [FK_HWGR_WGR_HWGR] FOREIGN KEY([HWGR_ID])
REFERENCES [dbo].[HWGR] ([HWGR_ID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HWGR_WGR_Store]') AND parent_object_id = OBJECT_ID(N'[dbo].[HWGR_WGR]'))
ALTER TABLE [dbo].[HWGR_WGR]  WITH CHECK ADD  CONSTRAINT [FK_HWGR_WGR_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([StoreID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LongTimeAbsence_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[LongTimeAbsence]'))
ALTER TABLE [dbo].[LongTimeAbsence]  WITH CHECK ADD  CONSTRAINT [FK_LongTimeAbsence_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
go
ALTER TABLE [dbo].[UIResources]  WITH CHECK ADD  CONSTRAINT [FK_UIResources_Language] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Language] ([LanguageID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AbsenceTimePlanning_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[AbsenceTimePlanning]'))
ALTER TABLE [dbo].[AbsenceTimePlanning]  WITH CHECK ADD  CONSTRAINT [FK_AbsenceTimePlanning_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AbsenceTimeRecording_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[AbsenceTimeRecording]'))
ALTER TABLE [dbo].[AbsenceTimeRecording]  WITH CHECK ADD  CONSTRAINT [FK_AbsenceTimeRecording_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
go
ALTER TABLE [dbo].[AvgWorkingDaysInWeek]  WITH CHECK ADD  CONSTRAINT [FK_AvgWorkingDaysInWeek_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmployeeDayStatePlanning_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmployeeDayStatePlanning]'))
ALTER TABLE [dbo].[EmployeeDayStatePlanning]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeDayStatePlanning_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmployeeDayStateRecording_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmployeeDayStateRecording]'))
ALTER TABLE [dbo].[EmployeeDayStateRecording]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeDayStateRecording_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmployeeWeekTimePlanning_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmployeeWeekTimePlanning]'))
ALTER TABLE [dbo].[EmployeeWeekTimePlanning]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeWeekTimePlanning_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmployeeWeekTimeRecording_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmployeeWeekTimeRecording]'))
ALTER TABLE [dbo].[EmployeeWeekTimeRecording]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeWeekTimeRecording_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmployeePlanningWorkingModel_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmployeePlanningWorkingModel]'))
ALTER TABLE [dbo].[EmployeePlanningWorkingModel]  WITH CHECK ADD  CONSTRAINT [FK_EmployeePlanningWorkingModel_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmployeePlanningWorkingModel_WorkingModel]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmployeePlanningWorkingModel]'))
ALTER TABLE [dbo].[EmployeePlanningWorkingModel]  WITH CHECK ADD  CONSTRAINT [FK_EmployeePlanningWorkingModel_WorkingModel] FOREIGN KEY([WorkingModelID])
REFERENCES [dbo].[WorkingModel] ([WorkingModelID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CountryAdditionalHours_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[CountryAdditionalHours]'))
ALTER TABLE [dbo].[CountryAdditionalHours]  WITH CHECK ADD  CONSTRAINT [FK_CountryAdditionalHours_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmployeeRecordingWorkingModel_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmployeeRecordingWorkingModel]'))
ALTER TABLE [dbo].[EmployeeRecordingWorkingModel]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeRecordingWorkingModel_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmployeeRecordingWorkingModel_WorkingModel]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmployeeRecordingWorkingModel]'))
ALTER TABLE [dbo].[EmployeeRecordingWorkingModel]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeRecordingWorkingModel_WorkingModel] FOREIGN KEY([WorkingModelID])
REFERENCES [dbo].[WorkingModel] ([WorkingModelID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StoreAdditionalHours_Store]') AND parent_object_id = OBJECT_ID(N'[dbo].[StoreAdditionalHours]'))
ALTER TABLE [dbo].[StoreAdditionalHours]  WITH CHECK ADD  CONSTRAINT [FK_StoreAdditionalHours_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([StoreID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmployeeDayStatePlanning_Store_World]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmployeeDayStatePlanning]'))
ALTER TABLE [dbo].[EmployeeDayStatePlanning]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeDayStatePlanning_Store_World] FOREIGN KEY([Store_WorldID])
REFERENCES [dbo].[Store_World] ([Store_WorldID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmployeeDayStateRecording_Store_World]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmployeeDayStateRecording]'))
ALTER TABLE [dbo].[EmployeeDayStateRecording]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeDayStateRecording_Store_World] FOREIGN KEY([Store_WorldID])
REFERENCES [dbo].[Store_World] ([Store_WorldID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CountryReportingIdentifier_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[CountryReportingIdentifier]'))
ALTER TABLE [dbo].[CountryReportingIdentifier]  WITH CHECK ADD  CONSTRAINT [FK_CountryReportingIdentifier_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmployeeHolidaysInfo_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmployeeHolidaysInfo]'))
ALTER TABLE [dbo].[EmployeeHolidaysInfo]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeHolidaysInfo_Employee] FOREIGN KEY(EmployeeID)
REFERENCES [dbo].[Employee] ([EmployeeID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BufferHourAvailable_Store_World]') AND parent_object_id = OBJECT_ID(N'[dbo].[BufferHourAvailable]'))
ALTER TABLE [dbo].[BufferHourAvailable]  WITH CHECK ADD  CONSTRAINT [FK_BufferHourAvailable_Store_World] FOREIGN KEY([Store_WorldID])
REFERENCES [dbo].[Store_World] ([Store_WorldID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmployeeAllIn_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmployeeAllIn]'))
ALTER TABLE [dbo].[EmployeeAllIn]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeAllIn_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
go
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee_HWGR]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employee]'))
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_HWGR] FOREIGN KEY([OrderHwgrID])
REFERENCES [dbo].[HWGR] ([HWGR_ID])
go
ALTER TABLE dbo.CountryPersShowMode ADD CONSTRAINT
	FK_CountryPersShowMode_Country FOREIGN KEY
	(
	CountryID
	) REFERENCES dbo.Country
	(
	CountryID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
go