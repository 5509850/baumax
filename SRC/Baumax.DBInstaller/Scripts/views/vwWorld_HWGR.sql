print '%Creating view% vwWorld_HWGR'
GO

IF object_id(N'dbo.vwWorld_HWGR', 'V') IS NOT NULL
	DROP VIEW dbo.vwWorld_HWGR
GO

CREATE VIEW [dbo].[vwWorld_HWGR] AS
select wh.World_HWGR_ID, wh.StoreID, sw.WorldID, wh.HWGR_ID, h.SystemID HWGR_SystemID, w.ExSystemID World_SystemID
from World_HWGR wh
inner join HWGR h
on
  wh.HWGR_ID = h.HWGR_ID
inner join Store_World sw
on
  sw.StoreID = wh.StoreID
  and sw.WorldID = wh.WorldID
inner join World w
on
  sw.WorldID = w.WorldID