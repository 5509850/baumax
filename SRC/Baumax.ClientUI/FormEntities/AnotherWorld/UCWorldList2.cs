using System;
using System.Collections.Generic;
using System.Drawing;
using Baumax.ClientUI.Import;
using Baumax.Contract;
using Baumax.Domain;
using Baumax.Environment;
using DevExpress.XtraEditors.Controls;
using DevExpress.XtraNavBar;

namespace Baumax.ClientUI.FormEntities.AnotherWorld
{
    public partial class UCWorldList2 : UCBaseEntity
    {
        private StoreStructureContext m_context = new StoreStructureContext();
        private bool isUserStoreAdministrator = false;
        private bool isUserControlling = false;

        public UCWorldList2()
        {
            InitializeComponent();

            if (!IsDesignMode)
            {
                    nb_Import.Visible = (ClientEnvironment.AuthorizationService
                        .GetAccess(ClientEnvironment.WorldService) & AccessType.Import) != 0;
                    if ((ClientEnvironment.AuthorizationService.GetCurrentUser().UserRoleID.HasValue) &&
                    (ClientEnvironment.AuthorizationService.GetCurrentUser().UserRoleID.Value == (long)UserRoleId.StoreAdmin))
                            isUserStoreAdministrator = true;
                    else
                        if ((ClientEnvironment.AuthorizationService.GetCurrentUser().UserRoleID.HasValue) &&
                (ClientEnvironment.AuthorizationService.GetCurrentUser().UserRoleID.Value == (long)UserRoleId.Controlling))
                            isUserControlling = true;
                    if (isUserStoreAdministrator)
                    {
                        nbi_ViewMinMax.Visible =
                            nbi_AssignHwgr.Visible = false;
                    }
                    if (isUserControlling)
                    {
                        nbi_AssignHwgr.Visible = 
                            nbi_AssignWgr.Visible = false;
                    }
            }
        }
        
        private void ImportWorldClick(object sender, NavBarLinkEventArgs e)
        {
            ImportUI.ImportWorlds();
            m_context.Invalidate();
        }

        private void ImportHwgrClick(object sender, NavBarLinkEventArgs e)
        {
            ImportUI.ImportHwgrs();
            m_context.Invalidate();
        }

        private void ImportWgrClick(object sender, NavBarLinkEventArgs e)
        {
            ImportUI.ImportWgrs();
            m_context.Invalidate();
        }

        private void UCWorldList2_Load(object sender, EventArgs e)
        {
            if (!IsDesignMode)
            {
                List<Store> list = ClientEnvironment.StoreService.FindAll();
                if (list != null)
                {
                    edStore.Properties.DataSource = list;
                    if (list.Count == 1)
                    {
                        edStore.EditValue = list[0];
                    }
                }
                edFilterDate.DateTime = DateTime.Today;
                edYear.EditValue = DateTime.Today.Year;

                m_context.WorldChanged += context_WorldChanged;
                m_context.HwgrChanged += context_WgrChanged;
                m_context.WgrChanged += context_WgrChanged;
                edStore_SizeChanged(this, null);
                edViewStyle.Properties.Buttons[1].Image = comboImages.Images[0];
                AssignLanguage();
            }
            
        }

        private void context_WorldChanged(object sender, EventArgs e)
        {
            StoreToWorld world = m_context.TakeStoreWorld.GetWorld(m_context.StoreToWorldID);
            bool realWorld = world != null,
                 anyWgr = m_context.TakeStoreStructure.IsAnyWgr;

            nbi_ViewMinMax.Enabled = realWorld;
            nbi_ViewHistory.Enabled = realWorld && world.IsWorld && anyWgr;
            nbi_AssignWgr.Enabled = nbi_AssignHwgr.Enabled = 
                realWorld && world.IsWorld && anyWgr;
        }

        private void context_WgrChanged(object sender, EventArgs e)
        {
            nbi_AssignHwgr.Enabled = nbi_AssignWgr.Enabled = 
                m_context.TakeStoreStructure.IsAnyWgr;
        }

        private void edStore_EditValueChanged(object sender, EventArgs e)
        {
            if (edStore.EditValue != null)
            {
                m_context.Store = edStore.EditValue as Store;

                _worldDetail.Entity = m_context;
                storeTree.Entity = m_context;

                _worldDetail.Bind();
                storeTree.Bind();
                edYear.Value = DateTime.Today.Year;
                edFilterDate.Enabled = true;
                edViewStyle.Enabled = true;
                edYear.Enabled = true;
                btn_ApplyYear.Enabled = true;
            }
        }

        private void nbi_AssignWgr_LinkClicked(object sender, NavBarLinkEventArgs e)
        {
            storeTree.NewAssignWgrToHwgr ();
        }

        private void nbi_AssignHwgr_LinkClicked(object sender, NavBarLinkEventArgs e)
        {
            storeTree.NewAssignHwgrToWorld ();
        }

        private void edFilterDate_EditValueChanged(object sender, EventArgs e)
        {
            if (m_context.TakeStoreStructure != null)
            {
                DateTime date = DateTimeHelper.GetMonday (edFilterDate.DateTime.Date);

                if (date != edFilterDate.DateTime.Date)
                    edFilterDate.DateTime = date;

                if (date != m_context.TakeStoreStructure.FilterDate)
                {
                    m_context.TakeStoreStructure.FilterDate = edFilterDate.DateTime;
                }
            }
        }

        private void nbi_ViewMinMax_LinkClicked(object sender, NavBarLinkEventArgs e)
        {
            _worldDetail.ViewAllMinMax();
        }

        private void edStore_SizeChanged(object sender, EventArgs e)
        {
            edStore.Properties.PopupFormMinSize = new Size(
                edStore.Size.Width,edStore.Properties.PopupFormMinSize.Height);
        }

        private void nbi_ViewHistory_LinkClicked(object sender, NavBarLinkEventArgs e)
        {
            using (FormViewHistory form = new FormViewHistory())
            {
                form.Entity = m_context;
                if (storeTree.FocusedEntity.IsHwgr)
                    m_context.TakeStoreStructure.HwgrHistory = m_context.TakeStoreStructure.GetHwgr(m_context.WorldToHwgr);
                else
                    m_context.TakeStoreStructure.WgrHistory = m_context.TakeStoreStructure.GetWgr(m_context.HwgrToWgr);
                form.ShowDialog();
            }
        }
        public override void AssignLanguage()
        {
            base.AssignLanguage();
            if (!IsDesignMode)
            {
                LocalizerControl.ComponentsLocalize(components);
                edViewStyle.Properties.Buttons[1].Caption = GetLocalized("ViewInCards");
                edViewStyle.Properties.Items[0].Description = GetLocalized("ViewInCards");
                edViewStyle.Properties.Items[1].Description = GetLocalized("ViewInVerticalTable");
                edViewStyle.Properties.Items[2].Description = GetLocalized("ViewInTable");
            }
        }


        private void ExchangeView(string p)
        {
            EditorButton btn = edViewStyle.Properties.Buttons[1];
            switch (p)
                {
                    case "card":
                        btn.Image = comboImages.Images[2];
                        btn.Tag = "vgrid";
                        btn.Caption = GetLocalized("ViewInVerticalTable");
                        break;
                    
                    case "vgrid":
                        btn.Image = comboImages.Images[1];
                        btn.Tag = "grid";
                        btn.Caption = GetLocalized("ViewInTable");
                        break;
                    
                    case "grid":
                        btn.Image = comboImages.Images[0];
                        btn.Tag = "card";
                        btn.Caption = GetLocalized("ViewInCards");
                        break;
                }
                _worldDetail.ExchangeView(p);
        }

        private void edViewStyle_Properties_ButtonClick(object sender, ButtonPressedEventArgs e)
        {
            if (e.Button == edViewStyle.Properties.Buttons[1])
                ExchangeView(e.Button.Tag.ToString());
        }

        private void edViewStyle_SelectedValueChanged(object sender, EventArgs e)
        {
            ExchangeView(((ImageComboBoxItem)edViewStyle.SelectedItem).Value.ToString());
        }

        private void btn_ApplyYear_Click(object sender, EventArgs e)
        {
            m_context.TakeWorldDetail.Year = (short)edYear.Value;
        }
    }
}
