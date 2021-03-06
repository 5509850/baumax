using System;
using System.Collections.Generic;
using System.Text;
using Baumax.Contract.Interfaces;
using Baumax.Domain;
using System.IO;
using System.Collections;
using Baumax.Contract.QueryResult;

using Baumax.Contract;
using LumenWorks.Framework.IO.Csv;


namespace Baumax.Import
{
	internal class ImportWGRdb2 : ImportHWGR
	{
		const int _HWGR_IDIndex = 0;
		const int _WGR_IDIndex = 1;
		const int _WGR_NameIndex = 3;

		internal ImportWGRdb2(string fileName, IStoreService storeService)
			: base(fileName, storeService)
		{ }

		protected override string ImportName
		{
			get
			{
				return GetLocalized("inWGRs");
			}
		}

		private Dictionary<long, WGR> getDBwgrHash()
		{
			Dictionary<long, WGR> dbwgrHash;
			List<WGR> dbwgrList = _IStoreService.WGRService.FindAll();
			if (dbwgrList != null)
			{
				dbwgrHash = new Dictionary<long, WGR>(dbwgrList.Count);
				for (int i = 0; i < dbwgrList.Count; i++)
					dbwgrHash.Add(dbwgrList[i].SystemID, dbwgrList[i]);
			}
			else
				dbwgrHash = new Dictionary<long, WGR>();
			return dbwgrHash;
		}

		protected override void readCSVFile(CachedCsvReader csv)
		{
#if(UseHeaders)
			int hwgr_IDIndex = csv.GetFieldIndex(_HWGR_ID);
			int wgr_IDIndex = csv.GetFieldIndex(_WGR_ID);
			int wgr_NameIndex = csv.GetFieldIndex(_WGR_Name);
#else
			int hwgr_IDIndex = _HWGR_IDIndex;
			int wgr_IDIndex = _WGR_IDIndex;
			int wgr_NameIndex = _WGR_NameIndex;
#endif
			Dictionary<string, ImportDataWGR> data = new Dictionary<string, ImportDataWGR>();
			Dictionary<long, WGR> dbwgrHash = getDBwgrHash();
			List<WGR> wgrSaveList = new List<WGR>();


			//Add WGR
			int i = 1;
			while (csv.ReadNextRecord())
			{
				csvDataNextRow();
				int hwgrID = int.Parse(csv[hwgr_IDIndex]);
				int wgrID = int.Parse(csv[wgr_IDIndex]);
				string wgrName = csv[wgr_NameIndex];
				string key = hwgrID.ToString() + wgrID.ToString();
				if (!data.ContainsKey(key))
				{
					data.Add(key, new ImportDataWGR(i, hwgrID, wgrID, wgrName, key));
                    WGR wgr;
                    if (!dbwgrHash.ContainsKey(wgrID))
                    {
                        wgr = new WGR(wgrID, SharedConsts.NeutralLangId, wgrName);
                        wgr.Import = true;
                        wgrSaveList.Add(wgr);
                        dbwgrHash.Add(wgrID, wgr);
                    }
                    else
                    {
                        wgr = dbwgrHash[wgrID];
                        wgr.Name = wgrName;
                        wgrSaveList.Add(wgr);
                    }
                }
				else
				{
					message(string.Format(GetLocalized("WGRExists"), i, _WorldID, "not exists in this inport file", _HWGR_ID, hwgrID, _WGR_ID, wgrID));
				}
				i++;
			}
			csvDataEndRead();
			if (wgrSaveList.Count > 0)
			{
				SaveOrUpdateList<WGR>(_IStoreService.WGRService, wgrSaveList);
			}

			//Add HwgrToWgr
			List<HWGR_WGR_SysValuesShort> list = new List<HWGR_WGR_SysValuesShort>(data.Count);
			foreach (ImportDataWGR value in data.Values)
			{
				list.Add(new HWGR_WGR_SysValuesShort(value.HWGR_ID, value.WGR_ID));
			}
			SaveDataResult saveDataResult = _IStoreService.HwgrToWgrService.Save_HWGR_WGR_Values(list);
			list = (List<HWGR_WGR_SysValuesShort>)saveDataResult.Data;
			foreach (HWGR_WGR_SysValuesShort value in list)
			{
				string key = value.World_SystemID.ToString() + value.HWGR_SystemID.ToString() + value.WGR_SystemID.ToString();
				message(string.Format(GetLocalized("HWGRNotExistsDB"), data[key].RecordNumber, _WorldID, value.World_SystemID, _HWGR_ID, value.HWGR_SystemID));
			}
		}

		protected class ImportDataWGR 
		{
			internal string Key;
			internal int WGR_ID;
			internal int HWGR_ID;
			internal string Name;
			internal int RecordNumber;

			internal ImportDataWGR(int recordNumber, int hwgr_ID, int wgr_ID, string name, string key)
			{
				Key = key;
				WGR_ID = wgr_ID;
				HWGR_ID = hwgr_ID;
				Name = name;
				RecordNumber = recordNumber;

			}
		}

	}
}
