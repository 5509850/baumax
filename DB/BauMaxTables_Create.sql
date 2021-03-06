IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'utName' AND ss.name = N'dbo')
CREATE TYPE [dbo].[utName] FROM [nchar](50) NULL
GO
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'utsMinutes' AND ss.name = N'dbo')
CREATE TYPE [dbo].[utsMinutes] FROM [smallint] NULL
GO
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'utiMinutes' AND ss.name = N'dbo')
CREATE TYPE [dbo].[utiMinutes] FROM [int] NULL
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Colouring]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Colouring](
	[ColouringID] [int] IDENTITY(1,1) NOT NULL,
	[AddChargesEmplSum] [int] NOT NULL,
	[Other Colours add later] [int] NULL,
 CONSTRAINT [PK_Colouring] PRIMARY KEY CLUSTERED 
(
	[ColouringID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRole]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserRole](
	[UserRoleID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserOperations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserOperations](
	[UserOperationID] [int] NOT NULL,
 CONSTRAINT [PK_UserOperations] PRIMARY KEY CLUSTERED 
(
	[UserOperationID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AbsenceType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AbsenceType](
	[AbsenceTypeID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_AbsenceType] PRIMARY KEY CLUSTERED 
(
	[AbsenceTypeID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reaction]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Reaction](
	[ReactionID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Reaction] PRIMARY KEY CLUSTERED 
(
	[ReactionID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorldType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WorldType](
	[WorldTypeID] [int] NOT NULL,
 CONSTRAINT [PK_WorldType] PRIMARY KEY CLUSTERED 
(
	[WorldTypeID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AvgAmounts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AvgAmounts](
	[CountryID] [int] NOT NULL,
	[Year] [smallint] NOT NULL,
	[AvgWeeks] [tinyint] NULL,
	[AvgContractTime] [smallint] NULL,
	[CashDeskAmount] [smallint] NULL,
 CONSTRAINT [PK_AvgAmounts] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC,
	[Year] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkingModel]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WorkingModel](
	[WorkingModelID] [int] IDENTITY(1,1) NOT NULL,
	[CountryID] [int] NULL,
 CONSTRAINT [PK_WorkingModel] PRIMARY KEY CLUSTERED 
(
	[WorkingModelID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Absence]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Absence](
	[AbsenceID] [int] IDENTITY(1,1) NOT NULL,
	[CountryID] [int] NULL,
	[AbsenceTypeID] [int] NULL,
	[Color] [int] NULL,
	[CharID] [nchar](1) NULL,
 CONSTRAINT [PK_Absence] PRIMARY KEY CLUSTERED 
(
	[AbsenceID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_Country]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User_Country](
	[UserID] [int] NOT NULL,
	[CountryID] [int] NOT NULL,
 CONSTRAINT [PK_User_Country] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[CountryID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Region]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Region](
	[RegionID] [int] IDENTITY(1,1) NOT NULL,
	[CountryID] [int] NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[RegionID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Feasts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Feasts](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Feasts] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC,
	[Date] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_Region]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User_Region](
	[UserID] [int] NOT NULL,
	[RegionID] [int] NOT NULL,
 CONSTRAINT [PK_User_Region] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[RegionID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Store]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Store](
	[StoreID] [int] IDENTITY(1,1) NOT NULL,
	[RegionID] [int] NULL,
	[SystemID] [int] NULL,
	[Number] [int] NULL,
	[Location] [nchar](100) NULL,
 CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_Store]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User_Store](
	[UserID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
 CONSTRAINT [PK_User_Store] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[StoreID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Country]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[LanguageID] [int] NULL,
	[ColouringID] [int] NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AbsenceName]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AbsenceName](
	[AbsenceID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nchar](50) NULL,
 CONSTRAINT [PK_AbsenceName] PRIMARY KEY CLUSTERED 
(
	[AbsenceID] ASC,
	[LanguageID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRoleName]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserRoleName](
	[UserRoleID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nchar](25) NULL,
 CONSTRAINT [PK_UserRoleName] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC,
	[LanguageID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NULL,
	[LoginName] [nchar](50) NULL,
	[Password] [nchar](255) NULL,
	[UserRoleID] [int] NULL,
	[LanguageID] [int] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRole_UserOperations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserRole_UserOperations](
	[UserRoleID] [int] NOT NULL,
	[UserOperationID] [int] NOT NULL,
 CONSTRAINT [PK_UserRole_UserOperations] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC,
	[UserOperationID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserOperationName]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserOperationName](
	[UserOperationID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nchar](50) NULL,
 CONSTRAINT [PK_UserOperationName] PRIMARY KEY CLUSTERED 
(
	[UserOperationID] ASC,
	[LanguageID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AbsenceTypeName]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AbsenceTypeName](
	[AbsenceTypeID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nchar](50) NULL,
 CONSTRAINT [PK_AbsenceTypeName] PRIMARY KEY CLUSTERED 
(
	[AbsenceTypeID] ASC,
	[LanguageID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[World]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[World](
	[WorldID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NULL,
	[ExSystemID] [int] NULL,
	[WorldTypeID] [int] NULL,
 CONSTRAINT [PK_World] PRIMARY KEY CLUSTERED 
(
	[WorldID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NULL,
	[PersID] [int] NULL,
	[Name] [nchar](50) NULL,
	[FirstName] [nchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Event]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Event](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[WorkingModelID] [int] NULL,
	[Value] [int] NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventName]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EventName](
	[EventID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nchar](100) NULL,
 CONSTRAINT [PK_EventName] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC,
	[LanguageID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Event_Reaction]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Event_Reaction](
	[EventID] [int] NOT NULL,
	[ReactionID] [int] NOT NULL,
 CONSTRAINT [PK_Event_Reaction] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC,
	[ReactionID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReactionName]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ReactionName](
	[ReactionID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nchar](100) NULL,
 CONSTRAINT [PK_ReactionName] PRIMARY KEY CLUSTERED 
(
	[ReactionID] ASC,
	[LanguageID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonMinMax]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PersonMinMax](
	[WorldID] [int] NOT NULL,
	[Year] [smallint] NOT NULL,
	[Min] [smallint] NULL,
	[Max] [smallint] NULL,
 CONSTRAINT [PK_PersonMinMax] PRIMARY KEY CLUSTERED 
(
	[WorldID] ASC,
	[Year] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BufferHours]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BufferHours](
	[WorldID] [int] NOT NULL,
	[Year] [smallint] NOT NULL,
	[BufHours] [int] NULL,
 CONSTRAINT [PK_BufferHours] PRIMARY KEY CLUSTERED 
(
	[WorldID] ASC,
	[Year] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TrendCorrection]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TrendCorrection](
	[WorldID] [int] NOT NULL,
	[BeginTime] [smalldatetime] NOT NULL,
	[EndTime] [smalldatetime] NOT NULL,
	[Correction] [int] NULL,
 CONSTRAINT [PK_TrendCorrection] PRIMARY KEY CLUSTERED 
(
	[WorldID] ASC,
	[BeginTime] ASC,
	[EndTime] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Benchmark]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Benchmark](
	[WorldID] [int] NOT NULL,
	[Year] [smallint] NOT NULL,
	[Benchmark] [int] NULL,
 CONSTRAINT [PK_Benchmark] PRIMARY KEY CLUSTERED 
(
	[WorldID] ASC,
	[Year] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HWGR]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HWGR](
	[HWRG_ID] [int] IDENTITY(1,1) NOT NULL,
	[WorldID] [int] NULL,
	[BeginTime] [smalldatetime] NULL,
	[EndTime] [smalldatetime] NULL,
	[SystemID] [int] NULL,
 CONSTRAINT [PK_HWGR] PRIMARY KEY CLUSTERED 
(
	[HWRG_ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[World_Employee]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[World_Employee](
	[WorldID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[BeginTime] [smalldatetime] NOT NULL,
	[EndTime] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_World_Employee] PRIMARY KEY CLUSTERED 
(
	[WorldID] ASC,
	[EmployeeID] ASC,
	[BeginTime] ASC,
	[EndTime] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WGR]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WGR](
	[WRG_ID] [int] NOT NULL,
	[HWRG_ID] [int] NULL,
	[BeginTime] [smalldatetime] NULL,
	[EndTime] [smalldatetime] NULL,
	[SystemID] [int] NULL,
 CONSTRAINT [PK_WGR] PRIMARY KEY CLUSTERED 
(
	[WRG_ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BussinessVolume]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BussinessVolume](
	[WGR_ID] [int] NOT NULL,
	[Date] [smalldatetime] NOT NULL,
	[Volume] [nchar](10) NULL,
 CONSTRAINT [PK_BussinessVolume] PRIMARY KEY CLUSTERED 
(
	[WGR_ID] ASC,
	[Date] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Language]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Language](
	[LanguageID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [dbo].[utName] NULL,
	[LanguageCode] [nchar](5) NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CountryName]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CountryName](
	[CountryID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [dbo].[utName] NULL,
 CONSTRAINT [PK_CountryName] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC,
	[LanguageID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RegionName]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RegionName](
	[RegionID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [dbo].[utName] NULL,
 CONSTRAINT [PK_RegionName] PRIMARY KEY CLUSTERED 
(
	[RegionID] ASC,
	[LanguageID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WGR_Name]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WGR_Name](
	[WRG_ID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [dbo].[utName] NULL,
 CONSTRAINT [PK_WGR_Name] PRIMARY KEY CLUSTERED 
(
	[WRG_ID] ASC,
	[LanguageID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HWGR_Name]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HWGR_Name](
	[HWRG_ID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [dbo].[utName] NULL,
 CONSTRAINT [PK_HWGR_Name] PRIMARY KEY CLUSTERED 
(
	[HWRG_ID] ASC,
	[LanguageID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorldName]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WorldName](
	[WorldID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [dbo].[utName] NULL,
 CONSTRAINT [PK_WorldName] PRIMARY KEY CLUSTERED 
(
	[WorldID] ASC,
	[LanguageID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorldTypeName]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WorldTypeName](
	[WorldTypeID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [dbo].[utName] NULL,
 CONSTRAINT [PK_WorldTypeName] PRIMARY KEY CLUSTERED 
(
	[WorldTypeID] ASC,
	[LanguageID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkingModelName]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WorkingModelName](
	[WorkingModelID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [dbo].[utName] NULL,
 CONSTRAINT [PK_WorkingModelName] PRIMARY KEY CLUSTERED 
(
	[WorkingModelID] ASC,
	[LanguageID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StoreName]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StoreName](
	[StoreID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [dbo].[utName] NULL,
 CONSTRAINT [PK_StoreName] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC,
	[LanguageID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StoreWorkingTime]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StoreWorkingTime](
	[StoreID] [int] NOT NULL,
	[BeginTime] [smalldatetime] NOT NULL,
	[EndTime] [smalldatetime] NOT NULL,
	[Opentime] [dbo].[utsMinutes] NULL,
	[Closetime] [dbo].[utsMinutes] NULL,
	[Weekday] [tinyint] NULL,
 CONSTRAINT [PK_StoreWorkingTime] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC,
	[BeginTime] ASC,
	[EndTime] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AbsenceTime]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AbsenceTime](
	[AbsenceTimeID] [int] IDENTITY(1,1) NOT NULL,
	[WorkingTimeID] [int] NULL,
	[AbsenseID] [int] NULL,
	[Begin] [dbo].[utsMinutes] NULL,
	[End] [dbo].[utsMinutes] NULL,
	[Time] [dbo].[utsMinutes] NULL,
 CONSTRAINT [PK_AbsenceTime] PRIMARY KEY CLUSTERED 
(
	[AbsenceTimeID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkingTime]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WorkingTime](
	[WorkingTimeID] [int] IDENTITY(1,1) NOT NULL,
	[EmloyeeID] [int] NULL,
	[Date] [smalldatetime] NULL,
	[Begin] [dbo].[utsMinutes] NULL,
	[End] [dbo].[utsMinutes] NULL,
	[Time] [dbo].[utsMinutes] NULL,
 CONSTRAINT [PK_WorkingTime] PRIMARY KEY CLUSTERED 
(
	[WorkingTimeID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TimeRecording]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TimeRecording](
	[TimeRecordingID] [int] NOT NULL,
	[EmloyeeID] [int] NULL,
	[Date] [smalldatetime] NULL,
	[Begin] [dbo].[utsMinutes] NULL,
	[End] [dbo].[utsMinutes] NULL,
	[Time] [dbo].[utsMinutes] NULL,
 CONSTRAINT [PK_TimeRecording] PRIMARY KEY CLUSTERED 
(
	[TimeRecordingID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AbsenceRecording]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AbsenceRecording](
	[AbsenceRecordingID] [int] NOT NULL,
	[TimeRecordingID] [int] NULL,
	[AbsenseID] [int] NULL,
	[Begin] [dbo].[utsMinutes] NULL,
	[End] [dbo].[utsMinutes] NULL,
	[Time] [dbo].[utsMinutes] NULL,
 CONSTRAINT [PK_AbsenceRecording] PRIMARY KEY CLUSTERED 
(
	[AbsenceRecordingID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EstWeekWTime]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EstWeekWTime](
	[EstWeekWTimeID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NULL,
	[Year] [smallint] NULL,
	[WeekNumber] [tinyint] NULL,
	[Time] [dbo].[utiMinutes] NULL,
 CONSTRAINT [PK_EstWeekWTime] PRIMARY KEY CLUSTERED 
(
	[EstWeekWTimeID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HolidaysSum]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HolidaysSum](
	[EmployeeID] [int] NOT NULL,
	[Year] [smallint] NOT NULL,
	[OldHolidays] [dbo].[utiMinutes] NULL,
	[NewHolidays] [dbo].[utiMinutes] NULL,
	[AvailableHolidays] [dbo].[utiMinutes] NULL,
	[UsedHolidays] [dbo].[utiMinutes] NULL,
	[SpareHolidays] [dbo].[utiMinutes] NULL,
	[BalanceHours] [dbo].[utiMinutes] NULL,
 CONSTRAINT [PK_HolidaysSum] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[Year] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AvgAmounts_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[AvgAmounts]'))
ALTER TABLE [dbo].[AvgAmounts]  WITH CHECK ADD  CONSTRAINT [FK_AvgAmounts_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkingModel_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkingModel]'))
ALTER TABLE [dbo].[WorkingModel]  WITH CHECK ADD  CONSTRAINT [FK_WorkingModel_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Absence_AbsenceType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Absence]'))
ALTER TABLE [dbo].[Absence]  WITH CHECK ADD  CONSTRAINT [FK_Absence_AbsenceType] FOREIGN KEY([AbsenceTypeID])
REFERENCES [dbo].[AbsenceType] ([AbsenceTypeID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Absence_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[Absence]'))
ALTER TABLE [dbo].[Absence]  WITH CHECK ADD  CONSTRAINT [FK_Absence_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Country_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Country]'))
ALTER TABLE [dbo].[User_Country]  WITH CHECK ADD  CONSTRAINT [FK_User_Country_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Country_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Country]'))
ALTER TABLE [dbo].[User_Country]  WITH CHECK ADD  CONSTRAINT [FK_User_Country_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Region_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[Region]'))
ALTER TABLE [dbo].[Region]  WITH CHECK ADD  CONSTRAINT [FK_Region_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Feasts_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[Feasts]'))
ALTER TABLE [dbo].[Feasts]  WITH CHECK ADD  CONSTRAINT [FK_Feasts_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Region_Region]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Region]'))
ALTER TABLE [dbo].[User_Region]  WITH CHECK ADD  CONSTRAINT [FK_User_Region_Region] FOREIGN KEY([RegionID])
REFERENCES [dbo].[Region] ([RegionID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Region_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Region]'))
ALTER TABLE [dbo].[User_Region]  WITH CHECK ADD  CONSTRAINT [FK_User_Region_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Store_Region]') AND parent_object_id = OBJECT_ID(N'[dbo].[Store]'))
ALTER TABLE [dbo].[Store]  WITH CHECK ADD  CONSTRAINT [FK_Store_Region] FOREIGN KEY([RegionID])
REFERENCES [dbo].[Region] ([RegionID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Store_Store]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Store]'))
ALTER TABLE [dbo].[User_Store]  WITH CHECK ADD  CONSTRAINT [FK_User_Store_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([StoreID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Store_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Store]'))
ALTER TABLE [dbo].[User_Store]  WITH CHECK ADD  CONSTRAINT [FK_User_Store_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Country_Colouring]') AND parent_object_id = OBJECT_ID(N'[dbo].[Country]'))
ALTER TABLE [dbo].[Country]  WITH CHECK ADD  CONSTRAINT [FK_Country_Colouring] FOREIGN KEY([ColouringID])
REFERENCES [dbo].[Colouring] ([ColouringID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Country_Language]') AND parent_object_id = OBJECT_ID(N'[dbo].[Country]'))
ALTER TABLE [dbo].[Country]  WITH CHECK ADD  CONSTRAINT [FK_Country_Language] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Language] ([LanguageID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AbsenceName_Absence]') AND parent_object_id = OBJECT_ID(N'[dbo].[AbsenceName]'))
ALTER TABLE [dbo].[AbsenceName]  WITH CHECK ADD  CONSTRAINT [FK_AbsenceName_Absence] FOREIGN KEY([AbsenceID])
REFERENCES [dbo].[Absence] ([AbsenceID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRoleName_UserRole]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRoleName]'))
ALTER TABLE [dbo].[UserRoleName]  WITH CHECK ADD  CONSTRAINT [FK_UserRoleName_UserRole] FOREIGN KEY([UserRoleID])
REFERENCES [dbo].[UserRole] ([UserRoleID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_User] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_UserRole]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserRole] FOREIGN KEY([UserRoleID])
REFERENCES [dbo].[UserRole] ([UserRoleID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRole_UserOperations_UserOperations]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRole_UserOperations]'))
ALTER TABLE [dbo].[UserRole_UserOperations]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_UserOperations_UserOperations] FOREIGN KEY([UserOperationID])
REFERENCES [dbo].[UserOperations] ([UserOperationID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRole_UserOperations_UserRole]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRole_UserOperations]'))
ALTER TABLE [dbo].[UserRole_UserOperations]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_UserOperations_UserRole] FOREIGN KEY([UserRoleID])
REFERENCES [dbo].[UserRole] ([UserRoleID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserOperationName_UserOperations]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserOperationName]'))
ALTER TABLE [dbo].[UserOperationName]  WITH CHECK ADD  CONSTRAINT [FK_UserOperationName_UserOperations] FOREIGN KEY([UserOperationID])
REFERENCES [dbo].[UserOperations] ([UserOperationID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AbsenceTypeName_AbsenceType]') AND parent_object_id = OBJECT_ID(N'[dbo].[AbsenceTypeName]'))
ALTER TABLE [dbo].[AbsenceTypeName]  WITH CHECK ADD  CONSTRAINT [FK_AbsenceTypeName_AbsenceType] FOREIGN KEY([AbsenceTypeID])
REFERENCES [dbo].[AbsenceType] ([AbsenceTypeID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_World_Store]') AND parent_object_id = OBJECT_ID(N'[dbo].[World]'))
ALTER TABLE [dbo].[World]  WITH CHECK ADD  CONSTRAINT [FK_World_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([StoreID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_World_WorldType]') AND parent_object_id = OBJECT_ID(N'[dbo].[World]'))
ALTER TABLE [dbo].[World]  WITH CHECK ADD  CONSTRAINT [FK_World_WorldType] FOREIGN KEY([WorldTypeID])
REFERENCES [dbo].[WorldType] ([WorldTypeID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee_Store]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employee]'))
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([StoreID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Event_WorkingModel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Event]'))
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_WorkingModel] FOREIGN KEY([WorkingModelID])
REFERENCES [dbo].[WorkingModel] ([WorkingModelID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventName_Event]') AND parent_object_id = OBJECT_ID(N'[dbo].[EventName]'))
ALTER TABLE [dbo].[EventName]  WITH CHECK ADD  CONSTRAINT [FK_EventName_Event] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Event_Reaction_Event]') AND parent_object_id = OBJECT_ID(N'[dbo].[Event_Reaction]'))
ALTER TABLE [dbo].[Event_Reaction]  WITH CHECK ADD  CONSTRAINT [FK_Event_Reaction_Event] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Event_Reaction_Reaction]') AND parent_object_id = OBJECT_ID(N'[dbo].[Event_Reaction]'))
ALTER TABLE [dbo].[Event_Reaction]  WITH CHECK ADD  CONSTRAINT [FK_Event_Reaction_Reaction] FOREIGN KEY([ReactionID])
REFERENCES [dbo].[Reaction] ([ReactionID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ReactionName_Reaction]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReactionName]'))
ALTER TABLE [dbo].[ReactionName]  WITH CHECK ADD  CONSTRAINT [FK_ReactionName_Reaction] FOREIGN KEY([ReactionID])
REFERENCES [dbo].[Reaction] ([ReactionID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PersonMinMax_World]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonMinMax]'))
ALTER TABLE [dbo].[PersonMinMax]  WITH CHECK ADD  CONSTRAINT [FK_PersonMinMax_World] FOREIGN KEY([WorldID])
REFERENCES [dbo].[World] ([WorldID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BufferHours_World]') AND parent_object_id = OBJECT_ID(N'[dbo].[BufferHours]'))
ALTER TABLE [dbo].[BufferHours]  WITH CHECK ADD  CONSTRAINT [FK_BufferHours_World] FOREIGN KEY([WorldID])
REFERENCES [dbo].[World] ([WorldID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TrendCorrection_World]') AND parent_object_id = OBJECT_ID(N'[dbo].[TrendCorrection]'))
ALTER TABLE [dbo].[TrendCorrection]  WITH CHECK ADD  CONSTRAINT [FK_TrendCorrection_World] FOREIGN KEY([WorldID])
REFERENCES [dbo].[World] ([WorldID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Benchmark_World]') AND parent_object_id = OBJECT_ID(N'[dbo].[Benchmark]'))
ALTER TABLE [dbo].[Benchmark]  WITH CHECK ADD  CONSTRAINT [FK_Benchmark_World] FOREIGN KEY([WorldID])
REFERENCES [dbo].[World] ([WorldID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HWGR_World]') AND parent_object_id = OBJECT_ID(N'[dbo].[HWGR]'))
ALTER TABLE [dbo].[HWGR]  WITH CHECK ADD  CONSTRAINT [FK_HWGR_World] FOREIGN KEY([WorldID])
REFERENCES [dbo].[World] ([WorldID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_World_Employee_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[World_Employee]'))
ALTER TABLE [dbo].[World_Employee]  WITH CHECK ADD  CONSTRAINT [FK_World_Employee_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_World_Employee_World]') AND parent_object_id = OBJECT_ID(N'[dbo].[World_Employee]'))
ALTER TABLE [dbo].[World_Employee]  WITH CHECK ADD  CONSTRAINT [FK_World_Employee_World] FOREIGN KEY([WorldID])
REFERENCES [dbo].[World] ([WorldID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WGR_HWGR]') AND parent_object_id = OBJECT_ID(N'[dbo].[WGR]'))
ALTER TABLE [dbo].[WGR]  WITH CHECK ADD  CONSTRAINT [FK_WGR_HWGR] FOREIGN KEY([HWRG_ID])
REFERENCES [dbo].[HWGR] ([HWRG_ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BussinessVolume_WGR]') AND parent_object_id = OBJECT_ID(N'[dbo].[BussinessVolume]'))
ALTER TABLE [dbo].[BussinessVolume]  WITH CHECK ADD  CONSTRAINT [FK_BussinessVolume_WGR] FOREIGN KEY([WGR_ID])
REFERENCES [dbo].[WGR] ([WRG_ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CountryName_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[CountryName]'))
ALTER TABLE [dbo].[CountryName]  WITH CHECK ADD  CONSTRAINT [FK_CountryName_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RegionName_Region]') AND parent_object_id = OBJECT_ID(N'[dbo].[RegionName]'))
ALTER TABLE [dbo].[RegionName]  WITH CHECK ADD  CONSTRAINT [FK_RegionName_Region] FOREIGN KEY([RegionID])
REFERENCES [dbo].[Region] ([RegionID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WGR_Name_WGR]') AND parent_object_id = OBJECT_ID(N'[dbo].[WGR_Name]'))
ALTER TABLE [dbo].[WGR_Name]  WITH CHECK ADD  CONSTRAINT [FK_WGR_Name_WGR] FOREIGN KEY([WRG_ID])
REFERENCES [dbo].[WGR] ([WRG_ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HWGR_Name_HWGR]') AND parent_object_id = OBJECT_ID(N'[dbo].[HWGR_Name]'))
ALTER TABLE [dbo].[HWGR_Name]  WITH CHECK ADD  CONSTRAINT [FK_HWGR_Name_HWGR] FOREIGN KEY([HWRG_ID])
REFERENCES [dbo].[HWGR] ([HWRG_ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorldName_World]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorldName]'))
ALTER TABLE [dbo].[WorldName]  WITH CHECK ADD  CONSTRAINT [FK_WorldName_World] FOREIGN KEY([WorldID])
REFERENCES [dbo].[World] ([WorldID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorldTypeName_WorldType]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorldTypeName]'))
ALTER TABLE [dbo].[WorldTypeName]  WITH CHECK ADD  CONSTRAINT [FK_WorldTypeName_WorldType] FOREIGN KEY([WorldTypeID])
REFERENCES [dbo].[WorldType] ([WorldTypeID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkingModelName_WorkingModel]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkingModelName]'))
ALTER TABLE [dbo].[WorkingModelName]  WITH CHECK ADD  CONSTRAINT [FK_WorkingModelName_WorkingModel] FOREIGN KEY([WorkingModelID])
REFERENCES [dbo].[WorkingModel] ([WorkingModelID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StoreName_Store]') AND parent_object_id = OBJECT_ID(N'[dbo].[StoreName]'))
ALTER TABLE [dbo].[StoreName]  WITH CHECK ADD  CONSTRAINT [FK_StoreName_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([StoreID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StoreWorkingTime_Store]') AND parent_object_id = OBJECT_ID(N'[dbo].[StoreWorkingTime]'))
ALTER TABLE [dbo].[StoreWorkingTime]  WITH CHECK ADD  CONSTRAINT [FK_StoreWorkingTime_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([StoreID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AbsenceTime_Absence]') AND parent_object_id = OBJECT_ID(N'[dbo].[AbsenceTime]'))
ALTER TABLE [dbo].[AbsenceTime]  WITH CHECK ADD  CONSTRAINT [FK_AbsenceTime_Absence] FOREIGN KEY([AbsenseID])
REFERENCES [dbo].[Absence] ([AbsenceID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AbsenceTime_WorkingTime]') AND parent_object_id = OBJECT_ID(N'[dbo].[AbsenceTime]'))
ALTER TABLE [dbo].[AbsenceTime]  WITH CHECK ADD  CONSTRAINT [FK_AbsenceTime_WorkingTime] FOREIGN KEY([WorkingTimeID])
REFERENCES [dbo].[WorkingTime] ([WorkingTimeID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkingTime_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkingTime]'))
ALTER TABLE [dbo].[WorkingTime]  WITH CHECK ADD  CONSTRAINT [FK_WorkingTime_Employee] FOREIGN KEY([EmloyeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TimeRecording_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[TimeRecording]'))
ALTER TABLE [dbo].[TimeRecording]  WITH CHECK ADD  CONSTRAINT [FK_TimeRecording_Employee] FOREIGN KEY([EmloyeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AbsenceRecording_Absence]') AND parent_object_id = OBJECT_ID(N'[dbo].[AbsenceRecording]'))
ALTER TABLE [dbo].[AbsenceRecording]  WITH CHECK ADD  CONSTRAINT [FK_AbsenceRecording_Absence] FOREIGN KEY([AbsenseID])
REFERENCES [dbo].[Absence] ([AbsenceID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AbsenceRecording_TimeRecording]') AND parent_object_id = OBJECT_ID(N'[dbo].[AbsenceRecording]'))
ALTER TABLE [dbo].[AbsenceRecording]  WITH CHECK ADD  CONSTRAINT [FK_AbsenceRecording_TimeRecording] FOREIGN KEY([TimeRecordingID])
REFERENCES [dbo].[TimeRecording] ([TimeRecordingID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EstWeekWTime_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[EstWeekWTime]'))
ALTER TABLE [dbo].[EstWeekWTime]  WITH CHECK ADD  CONSTRAINT [FK_EstWeekWTime_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HolidaysSum_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[HolidaysSum]'))
ALTER TABLE [dbo].[HolidaysSum]  WITH CHECK ADD  CONSTRAINT [FK_HolidaysSum_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
