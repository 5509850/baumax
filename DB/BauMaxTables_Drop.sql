IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HolidaysSum_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[HolidaysSum]'))
ALTER TABLE [dbo].[HolidaysSum] DROP CONSTRAINT [FK_HolidaysSum_Employee]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AbsenceRecording_Absence]') AND parent_object_id = OBJECT_ID(N'[dbo].[AbsenceRecording]'))
ALTER TABLE [dbo].[AbsenceRecording] DROP CONSTRAINT [FK_AbsenceRecording_Absence]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AbsenceRecording_TimeRecording]') AND parent_object_id = OBJECT_ID(N'[dbo].[AbsenceRecording]'))
ALTER TABLE [dbo].[AbsenceRecording] DROP CONSTRAINT [FK_AbsenceRecording_TimeRecording]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EstWeekWTime_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[EstWeekWTime]'))
ALTER TABLE [dbo].[EstWeekWTime] DROP CONSTRAINT [FK_EstWeekWTime_Employee]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AbsenceTime_Absence]') AND parent_object_id = OBJECT_ID(N'[dbo].[AbsenceTime]'))
ALTER TABLE [dbo].[AbsenceTime] DROP CONSTRAINT [FK_AbsenceTime_Absence]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AbsenceTime_WorkingTime]') AND parent_object_id = OBJECT_ID(N'[dbo].[AbsenceTime]'))
ALTER TABLE [dbo].[AbsenceTime] DROP CONSTRAINT [FK_AbsenceTime_WorkingTime]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Feasts_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[Feasts]'))
ALTER TABLE [dbo].[Feasts] DROP CONSTRAINT [FK_Feasts_Country]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Store_Store]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Store]'))
ALTER TABLE [dbo].[User_Store] DROP CONSTRAINT [FK_User_Store_Store]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Store_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Store]'))
ALTER TABLE [dbo].[User_Store] DROP CONSTRAINT [FK_User_Store_User]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Country_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Country]'))
ALTER TABLE [dbo].[User_Country] DROP CONSTRAINT [FK_User_Country_Country]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Country_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Country]'))
ALTER TABLE [dbo].[User_Country] DROP CONSTRAINT [FK_User_Country_User]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Region_Region]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Region]'))
ALTER TABLE [dbo].[User_Region] DROP CONSTRAINT [FK_User_Region_Region]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Region_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Region]'))
ALTER TABLE [dbo].[User_Region] DROP CONSTRAINT [FK_User_Region_User]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AbsenceName_Absence]') AND parent_object_id = OBJECT_ID(N'[dbo].[AbsenceName]'))
ALTER TABLE [dbo].[AbsenceName] DROP CONSTRAINT [FK_AbsenceName_Absence]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RegionName_Region]') AND parent_object_id = OBJECT_ID(N'[dbo].[RegionName]'))
ALTER TABLE [dbo].[RegionName] DROP CONSTRAINT [FK_RegionName_Region]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRoleName_UserRole]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRoleName]'))
ALTER TABLE [dbo].[UserRoleName] DROP CONSTRAINT [FK_UserRoleName_UserRole]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CountryName_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[CountryName]'))
ALTER TABLE [dbo].[CountryName] DROP CONSTRAINT [FK_CountryName_Country]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserOperationName_UserOperations]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserOperationName]'))
ALTER TABLE [dbo].[UserOperationName] DROP CONSTRAINT [FK_UserOperationName_UserOperations]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRole_UserOperations_UserOperations]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRole_UserOperations]'))
ALTER TABLE [dbo].[UserRole_UserOperations] DROP CONSTRAINT [FK_UserRole_UserOperations_UserOperations]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRole_UserOperations_UserRole]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRole_UserOperations]'))
ALTER TABLE [dbo].[UserRole_UserOperations] DROP CONSTRAINT [FK_UserRole_UserOperations_UserRole]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AbsenceTypeName_AbsenceType]') AND parent_object_id = OBJECT_ID(N'[dbo].[AbsenceTypeName]'))
ALTER TABLE [dbo].[AbsenceTypeName] DROP CONSTRAINT [FK_AbsenceTypeName_AbsenceType]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StoreName_Store]') AND parent_object_id = OBJECT_ID(N'[dbo].[StoreName]'))
ALTER TABLE [dbo].[StoreName] DROP CONSTRAINT [FK_StoreName_Store]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StoreWorkingTime_Store]') AND parent_object_id = OBJECT_ID(N'[dbo].[StoreWorkingTime]'))
ALTER TABLE [dbo].[StoreWorkingTime] DROP CONSTRAINT [FK_StoreWorkingTime_Store]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AvgAmounts_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[AvgAmounts]'))
ALTER TABLE [dbo].[AvgAmounts] DROP CONSTRAINT [FK_AvgAmounts_Country]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Event_Reaction_Event]') AND parent_object_id = OBJECT_ID(N'[dbo].[Event_Reaction]'))
ALTER TABLE [dbo].[Event_Reaction] DROP CONSTRAINT [FK_Event_Reaction_Event]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Event_Reaction_Reaction]') AND parent_object_id = OBJECT_ID(N'[dbo].[Event_Reaction]'))
ALTER TABLE [dbo].[Event_Reaction] DROP CONSTRAINT [FK_Event_Reaction_Reaction]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ReactionName_Reaction]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReactionName]'))
ALTER TABLE [dbo].[ReactionName] DROP CONSTRAINT [FK_ReactionName_Reaction]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkingModelName_WorkingModel]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkingModelName]'))
ALTER TABLE [dbo].[WorkingModelName] DROP CONSTRAINT [FK_WorkingModelName_WorkingModel]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventName_Event]') AND parent_object_id = OBJECT_ID(N'[dbo].[EventName]'))
ALTER TABLE [dbo].[EventName] DROP CONSTRAINT [FK_EventName_Event]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorldTypeName_WorldType]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorldTypeName]'))
ALTER TABLE [dbo].[WorldTypeName] DROP CONSTRAINT [FK_WorldTypeName_WorldType]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PersonMinMax_World]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonMinMax]'))
ALTER TABLE [dbo].[PersonMinMax] DROP CONSTRAINT [FK_PersonMinMax_World]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BufferHours_World]') AND parent_object_id = OBJECT_ID(N'[dbo].[BufferHours]'))
ALTER TABLE [dbo].[BufferHours] DROP CONSTRAINT [FK_BufferHours_World]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TrendCorrection_World]') AND parent_object_id = OBJECT_ID(N'[dbo].[TrendCorrection]'))
ALTER TABLE [dbo].[TrendCorrection] DROP CONSTRAINT [FK_TrendCorrection_World]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Benchmark_World]') AND parent_object_id = OBJECT_ID(N'[dbo].[Benchmark]'))
ALTER TABLE [dbo].[Benchmark] DROP CONSTRAINT [FK_Benchmark_World]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WGR_Name_WGR]') AND parent_object_id = OBJECT_ID(N'[dbo].[WGR_Name]'))
ALTER TABLE [dbo].[WGR_Name] DROP CONSTRAINT [FK_WGR_Name_WGR]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BussinessVolume_WGR]') AND parent_object_id = OBJECT_ID(N'[dbo].[BussinessVolume]'))
ALTER TABLE [dbo].[BussinessVolume] DROP CONSTRAINT [FK_BussinessVolume_WGR]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorldName_World]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorldName]'))
ALTER TABLE [dbo].[WorldName] DROP CONSTRAINT [FK_WorldName_World]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HWGR_Name_HWGR]') AND parent_object_id = OBJECT_ID(N'[dbo].[HWGR_Name]'))
ALTER TABLE [dbo].[HWGR_Name] DROP CONSTRAINT [FK_HWGR_Name_HWGR]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_World_Employee_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[World_Employee]'))
ALTER TABLE [dbo].[World_Employee] DROP CONSTRAINT [FK_World_Employee_Employee]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_World_Employee_World]') AND parent_object_id = OBJECT_ID(N'[dbo].[World_Employee]'))
ALTER TABLE [dbo].[World_Employee] DROP CONSTRAINT [FK_World_Employee_World]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee_Store]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employee]'))
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK_Employee_Store]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Absence_AbsenceType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Absence]'))
ALTER TABLE [dbo].[Absence] DROP CONSTRAINT [FK_Absence_AbsenceType]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Absence_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[Absence]'))
ALTER TABLE [dbo].[Absence] DROP CONSTRAINT [FK_Absence_Country]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkingTime_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkingTime]'))
ALTER TABLE [dbo].[WorkingTime] DROP CONSTRAINT [FK_WorkingTime_Employee]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TimeRecording_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[TimeRecording]'))
ALTER TABLE [dbo].[TimeRecording] DROP CONSTRAINT [FK_TimeRecording_Employee]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Country_Colouring]') AND parent_object_id = OBJECT_ID(N'[dbo].[Country]'))
ALTER TABLE [dbo].[Country] DROP CONSTRAINT [FK_Country_Colouring]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Country_Language]') AND parent_object_id = OBJECT_ID(N'[dbo].[Country]'))
ALTER TABLE [dbo].[Country] DROP CONSTRAINT [FK_Country_Language]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_User]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_UserRole]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_UserRole]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Store_Region]') AND parent_object_id = OBJECT_ID(N'[dbo].[Store]'))
ALTER TABLE [dbo].[Store] DROP CONSTRAINT [FK_Store_Region]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Region_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[Region]'))
ALTER TABLE [dbo].[Region] DROP CONSTRAINT [FK_Region_Country]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkingModel_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkingModel]'))
ALTER TABLE [dbo].[WorkingModel] DROP CONSTRAINT [FK_WorkingModel_Country]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Event_WorkingModel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Event]'))
ALTER TABLE [dbo].[Event] DROP CONSTRAINT [FK_Event_WorkingModel]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_World_Store]') AND parent_object_id = OBJECT_ID(N'[dbo].[World]'))
ALTER TABLE [dbo].[World] DROP CONSTRAINT [FK_World_Store]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_World_WorldType]') AND parent_object_id = OBJECT_ID(N'[dbo].[World]'))
ALTER TABLE [dbo].[World] DROP CONSTRAINT [FK_World_WorldType]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HWGR_World]') AND parent_object_id = OBJECT_ID(N'[dbo].[HWGR]'))
ALTER TABLE [dbo].[HWGR] DROP CONSTRAINT [FK_HWGR_World]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WGR_HWGR]') AND parent_object_id = OBJECT_ID(N'[dbo].[WGR]'))
ALTER TABLE [dbo].[WGR] DROP CONSTRAINT [FK_WGR_HWGR]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HolidaysSum]') AND type in (N'U'))
DROP TABLE [dbo].[HolidaysSum]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AbsenceRecording]') AND type in (N'U'))
DROP TABLE [dbo].[AbsenceRecording]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EstWeekWTime]') AND type in (N'U'))
DROP TABLE [dbo].[EstWeekWTime]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AbsenceTime]') AND type in (N'U'))
DROP TABLE [dbo].[AbsenceTime]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Feasts]') AND type in (N'U'))
DROP TABLE [dbo].[Feasts]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_Store]') AND type in (N'U'))
DROP TABLE [dbo].[User_Store]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_Country]') AND type in (N'U'))
DROP TABLE [dbo].[User_Country]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_Region]') AND type in (N'U'))
DROP TABLE [dbo].[User_Region]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AbsenceName]') AND type in (N'U'))
DROP TABLE [dbo].[AbsenceName]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RegionName]') AND type in (N'U'))
DROP TABLE [dbo].[RegionName]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRoleName]') AND type in (N'U'))
DROP TABLE [dbo].[UserRoleName]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CountryName]') AND type in (N'U'))
DROP TABLE [dbo].[CountryName]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserOperationName]') AND type in (N'U'))
DROP TABLE [dbo].[UserOperationName]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRole_UserOperations]') AND type in (N'U'))
DROP TABLE [dbo].[UserRole_UserOperations]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AbsenceTypeName]') AND type in (N'U'))
DROP TABLE [dbo].[AbsenceTypeName]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StoreName]') AND type in (N'U'))
DROP TABLE [dbo].[StoreName]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StoreWorkingTime]') AND type in (N'U'))
DROP TABLE [dbo].[StoreWorkingTime]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AvgAmounts]') AND type in (N'U'))
DROP TABLE [dbo].[AvgAmounts]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Event_Reaction]') AND type in (N'U'))
DROP TABLE [dbo].[Event_Reaction]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReactionName]') AND type in (N'U'))
DROP TABLE [dbo].[ReactionName]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkingModelName]') AND type in (N'U'))
DROP TABLE [dbo].[WorkingModelName]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventName]') AND type in (N'U'))
DROP TABLE [dbo].[EventName]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorldTypeName]') AND type in (N'U'))
DROP TABLE [dbo].[WorldTypeName]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonMinMax]') AND type in (N'U'))
DROP TABLE [dbo].[PersonMinMax]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BufferHours]') AND type in (N'U'))
DROP TABLE [dbo].[BufferHours]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TrendCorrection]') AND type in (N'U'))
DROP TABLE [dbo].[TrendCorrection]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Benchmark]') AND type in (N'U'))
DROP TABLE [dbo].[Benchmark]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WGR_Name]') AND type in (N'U'))
DROP TABLE [dbo].[WGR_Name]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BussinessVolume]') AND type in (N'U'))
DROP TABLE [dbo].[BussinessVolume]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorldName]') AND type in (N'U'))
DROP TABLE [dbo].[WorldName]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HWGR_Name]') AND type in (N'U'))
DROP TABLE [dbo].[HWGR_Name]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[World_Employee]') AND type in (N'U'))
DROP TABLE [dbo].[World_Employee]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
DROP TABLE [dbo].[Employee]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Language]') AND type in (N'U'))
DROP TABLE [dbo].[Language]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Colouring]') AND type in (N'U'))
DROP TABLE [dbo].[Colouring]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Absence]') AND type in (N'U'))
DROP TABLE [dbo].[Absence]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkingTime]') AND type in (N'U'))
DROP TABLE [dbo].[WorkingTime]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TimeRecording]') AND type in (N'U'))
DROP TABLE [dbo].[TimeRecording]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Country]') AND type in (N'U'))
DROP TABLE [dbo].[Country]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRole]') AND type in (N'U'))
DROP TABLE [dbo].[UserRole]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
DROP TABLE [dbo].[User]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Store]') AND type in (N'U'))
DROP TABLE [dbo].[Store]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AbsenceType]') AND type in (N'U'))
DROP TABLE [dbo].[AbsenceType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Region]') AND type in (N'U'))
DROP TABLE [dbo].[Region]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserOperations]') AND type in (N'U'))
DROP TABLE [dbo].[UserOperations]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkingModel]') AND type in (N'U'))
DROP TABLE [dbo].[WorkingModel]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Event]') AND type in (N'U'))
DROP TABLE [dbo].[Event]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reaction]') AND type in (N'U'))
DROP TABLE [dbo].[Reaction]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorldType]') AND type in (N'U'))
DROP TABLE [dbo].[WorldType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[World]') AND type in (N'U'))
DROP TABLE [dbo].[World]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HWGR]') AND type in (N'U'))
DROP TABLE [dbo].[HWGR]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WGR]') AND type in (N'U'))
DROP TABLE [dbo].[WGR]
GO
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'utiMinutes' AND ss.name = N'dbo')
DROP TYPE [dbo].[utiMinutes]
GO
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'utName' AND ss.name = N'dbo')
DROP TYPE [dbo].[utName]
GO
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'utsMinutes' AND ss.name = N'dbo')
DROP TYPE [dbo].[utsMinutes]
