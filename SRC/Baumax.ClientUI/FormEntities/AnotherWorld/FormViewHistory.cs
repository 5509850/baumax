using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using Baumax.Environment;
using Baumax.Localization;
using Baumax.Domain;

namespace Baumax.ClientUI.FormEntities.AnotherWorld
{
    public partial class FormViewHistory : FormBaseEntity
    {
        private StoreStructureContext m_context;
        private bool m_isHwgr = false;

        public override object  Entity
        {
	        get 
	        { 
		         return m_context;
	        }
	        set 
	        { 
		        base.Entity = value;
                m_context = value as StoreStructureContext;
                if (m_context != null)
                {
                    m_context.TakeStoreStructure.HwgrHistoryChanged += new EventHandler(TakeStoreStructure_HwgrHistoryChanged);
                    m_context.TakeStoreStructure.WgrHistoryChanged += new EventHandler(TakeStoreStructure_WgrHistoryChanged);
                }
	        }
        }

        void TakeStoreStructure_WgrHistoryChanged(object sender, EventArgs e)
        {
            m_isHwgr = false;
            gridControl.DataSource = m_context.TakeStoreStructure.GetWgrHistoty();
            gc_Parent.Caption = Localizer.GetLocalized("HWGR") ?? "HWGR";
            if (m_context.TakeStoreStructure.WgrHistory == null)
                lblText.Text = string.Format("{0} :\n ", Localizer.GetLocalized("WgrHistory") ?? "WGR history");
            else
            lblText.Text = string.Format("{0} :\n{1} ", Localizer.GetLocalized("WgrHistory") ?? "WGR history",
                m_context.TakeStoreStructure.WgrHistory.Name);
            
        }

        void TakeStoreStructure_HwgrHistoryChanged(object sender, EventArgs e)
        {
            m_isHwgr = true;
            gridControl.DataSource = m_context.TakeStoreStructure.GetHwgrHistory();
            gc_Parent.Caption = Localizer.GetLocalized("World") ?? "World";
            if (m_context.TakeStoreStructure.HwgrHistory != null)
            lblText.Text = string.Format("{0} :\n{1}", Localizer.GetLocalized("HwgrHistory") ?? "HWGR History",
                m_context.TakeStoreStructure.HwgrHistory.Name);
            else
            lblText.Text = string.Format("{0} :\n", Localizer.GetLocalized("HwgrHistory") ?? "HWGR History");
        }

        public FormViewHistory()
        {
            InitializeComponent();
            this.AccessibleRole = AccessibleRole.Dialog;
        }

        private void gridView_CustomUnboundColumnData(object sender, DevExpress.XtraGrid.Views.Base.CustomColumnDataEventArgs e)
        {
            if (m_isHwgr)
            {
                WorldToHwgr row = gridView.GetRow(e.RowHandle) as WorldToHwgr;
                if (e.IsGetData && row != null)
                {
                    if (e.Column == gc_Parent)
                        e.Value = m_context.TakeStoreStructure.GetWorld(row.WorldID).Name;
                }
            }
            else 
            {
                HwgrToWgr row = gridView.GetRow(e.RowHandle) as HwgrToWgr;
                if (e.IsGetData && row != null)
                {
                    if (e.Column == gc_Parent)
                        e.Value = m_context.TakeStoreStructure.GetHwgr(row).Name;
                }          
            }
        }

        protected override void OnClosing(CancelEventArgs e)
        {
            base.OnClosing(e);
            m_context.TakeStoreStructure.HwgrHistoryChanged -= new EventHandler(TakeStoreStructure_HwgrHistoryChanged);
            m_context.TakeStoreStructure.WgrHistoryChanged  -= new EventHandler(TakeStoreStructure_WgrHistoryChanged);
        }

        private void FormViewHistory_Activated(object sender, EventArgs e)
        {/*
            if (!Focused)
                Close();*/
        }

        private void button_Cancel_Click(object sender, EventArgs e)
        {
            Close();
        }       
    }
}