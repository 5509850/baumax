print '%Creating view% vwHWGR_WGR'
GO

IF object_id(N'dbo.vwHWGR_WGR', 'V') IS NOT NULL
	DROP VIEW dbo.vwHWGR_WGR
GO

CREATE VIEW [dbo].[vwHWGR_WGR] AS
select hww.World_HWGR_ID, hww.WGR_ID, h.SystemID HWGR_SystemID, w.ExSystemID World_SystemID, WGR.SystemID WGR_SystemID from HWGR_WGR hww
inner join WGR
on
  hww.WGR_ID  = WGR.WGR_ID
inner join World_HWGR wh
on
  hww.World_HWGR_ID = wh.World_HWGR_ID 
inner join HWGR h
on
  wh.HWGR_ID = h.HWGR_ID
inner join Store_World sw
on
  sw.Store_WorldID = wh.Store_WorldID
inner join World w
on
  sw.WorldID = w.WorldID