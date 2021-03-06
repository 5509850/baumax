namespace Baumax.ClientUI.FormEntities.AnotherWorld
{
    partial class UCWorldList2
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(UCWorldList2));
            DevExpress.Utils.SerializableAppearanceObject serializableAppearanceObject1 = new DevExpress.Utils.SerializableAppearanceObject();
            DevExpress.Utils.SerializableAppearanceObject serializableAppearanceObject2 = new DevExpress.Utils.SerializableAppearanceObject();
            this.split1 = new DevExpress.XtraEditors.SplitContainerControl();
            this.navBarControl = new DevExpress.XtraNavBar.NavBarControl();
            this.nb_Import = new DevExpress.XtraNavBar.NavBarGroup();
            this.nbi_ImportWorld = new DevExpress.XtraNavBar.NavBarItem();
            this.nbi_ImportHwgr = new DevExpress.XtraNavBar.NavBarItem();
            this.nbi_ImportWgr = new DevExpress.XtraNavBar.NavBarItem();
            this.nb_StructureManager = new DevExpress.XtraNavBar.NavBarGroup();
            this.nbi_ViewMinMax = new DevExpress.XtraNavBar.NavBarItem();
            this.nbi_AssignHwgr = new DevExpress.XtraNavBar.NavBarItem();
            this.nbi_AssignWgr = new DevExpress.XtraNavBar.NavBarItem();
            this.nbi_ViewHistory = new DevExpress.XtraNavBar.NavBarItem();
            this.nbi_ChangeTimeRange = new DevExpress.XtraNavBar.NavBarItem();
            this.barImages = new DevExpress.Utils.ImageCollection(this.components);
            this.split2 = new DevExpress.XtraEditors.SplitContainerControl();
            this._worldDetail = new Baumax.ClientUI.FormEntities.AnotherWorld.UCWorldDetail();
            this.layoutControl1 = new DevExpress.XtraLayout.LayoutControl();
            this.btn_ApplyYear = new DevExpress.XtraEditors.SimpleButton();
            this.edYear = new DevExpress.XtraEditors.SpinEdit();
            this.edStore = new DevExpress.XtraEditors.GridLookUpEdit();
            this.gridView = new DevExpress.XtraGrid.Views.Grid.GridView();
            this.gc_Name = new DevExpress.XtraGrid.Columns.GridColumn();
            this.edViewStyle = new DevExpress.XtraEditors.ImageComboBoxEdit();
            this.comboImages = new DevExpress.Utils.ImageCollection(this.components);
            this.layoutControlGroup1 = new DevExpress.XtraLayout.LayoutControlGroup();
            this.lc_Store = new DevExpress.XtraLayout.LayoutControlItem();
            this.lc_Year = new DevExpress.XtraLayout.LayoutControlItem();
            this.lcEdVievStyle = new DevExpress.XtraLayout.LayoutControlItem();
            this.lcApplyYear = new DevExpress.XtraLayout.LayoutControlItem();
            this.storeTree = new Baumax.ClientUI.FormEntities.AnotherWorld.UCStoreTree();
            this.panelControl2 = new DevExpress.XtraEditors.PanelControl();
            this.lbl_FilterByDate = new DevExpress.XtraEditors.LabelControl();
            this.edFilterDate = new DevExpress.XtraEditors.DateEdit();
            ((System.ComponentModel.ISupportInitialize)(this.split1)).BeginInit();
            this.split1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.navBarControl)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.barImages)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.split2)).BeginInit();
            this.split2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControl1)).BeginInit();
            this.layoutControl1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.edYear.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.edStore.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.edViewStyle.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.comboImages)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlGroup1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.lc_Store)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.lc_Year)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.lcEdVievStyle)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.lcApplyYear)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.panelControl2)).BeginInit();
            this.panelControl2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.edFilterDate.Properties.VistaTimeProperties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.edFilterDate.Properties)).BeginInit();
            this.SuspendLayout();
            // 
            // split1
            // 
            this.split1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.split1.Location = new System.Drawing.Point(0, 0);
            this.split1.Name = "split1";
            this.split1.Panel1.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.NoBorder;
            this.split1.Panel1.Controls.Add(this.navBarControl);
            this.split1.Panel1.Padding = new System.Windows.Forms.Padding(2);
            this.split1.Panel1.Text = "Panel1";
            this.split1.Panel2.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.NoBorder;
            this.split1.Panel2.Controls.Add(this.split2);
            this.split1.Panel2.Text = "Panel2";
            this.split1.Size = new System.Drawing.Size(817, 605);
            this.split1.SplitterPosition = 154;
            this.split1.TabIndex = 0;
            this.split1.Text = "splitContainerControl1";
            // 
            // navBarControl
            // 
            this.navBarControl.ActiveGroup = this.nb_Import;
            this.navBarControl.Dock = System.Windows.Forms.DockStyle.Fill;
            this.navBarControl.DragDropFlags = DevExpress.XtraNavBar.NavBarDragDrop.None;
            this.navBarControl.Groups.AddRange(new DevExpress.XtraNavBar.NavBarGroup[] {
            this.nb_Import,
            this.nb_StructureManager});
            this.navBarControl.Items.AddRange(new DevExpress.XtraNavBar.NavBarItem[] {
            this.nbi_ImportWorld,
            this.nbi_AssignHwgr,
            this.nbi_AssignWgr,
            this.nbi_ChangeTimeRange,
            this.nbi_ImportHwgr,
            this.nbi_ImportWgr,
            this.nbi_ViewMinMax,
            this.nbi_ViewHistory});
            this.navBarControl.LargeImages = this.barImages;
            this.navBarControl.Location = new System.Drawing.Point(2, 1);
            this.navBarControl.Margin = new System.Windows.Forms.Padding(0);
            this.navBarControl.Name = "navBarControl";
            this.navBarControl.OptionsNavPane.ExpandedWidth = 150;
            this.navBarControl.Size = new System.Drawing.Size(150, 602);
            this.navBarControl.TabIndex = 0;
            this.navBarControl.Text = "navBarControl1";
            this.navBarControl.View = new DevExpress.XtraNavBar.ViewInfo.SkinExplorerBarViewInfoRegistrator();
            // 
            // nb_Import
            // 
            this.nb_Import.Caption = "Import";
            this.nb_Import.Expanded = true;
            this.nb_Import.GroupStyle = DevExpress.XtraNavBar.NavBarGroupStyle.LargeIconsList;
            this.nb_Import.ItemLinks.AddRange(new DevExpress.XtraNavBar.NavBarItemLink[] {
            new DevExpress.XtraNavBar.NavBarItemLink(this.nbi_ImportWorld),
            new DevExpress.XtraNavBar.NavBarItemLink(this.nbi_ImportHwgr),
            new DevExpress.XtraNavBar.NavBarItemLink(this.nbi_ImportWgr)});
            this.nb_Import.Name = "nb_Import";
            // 
            // nbi_ImportWorld
            // 
            this.nbi_ImportWorld.Caption = "Import Worlds";
            this.nbi_ImportWorld.LargeImageIndex = 4;
            this.nbi_ImportWorld.Name = "nbi_ImportWorld";
            this.nbi_ImportWorld.LinkClicked += new DevExpress.XtraNavBar.NavBarLinkEventHandler(this.ImportWorldClick);
            // 
            // nbi_ImportHwgr
            // 
            this.nbi_ImportHwgr.Caption = "Import HWGRs";
            this.nbi_ImportHwgr.LargeImageIndex = 6;
            this.nbi_ImportHwgr.Name = "nbi_ImportHwgr";
            this.nbi_ImportHwgr.LinkClicked += new DevExpress.XtraNavBar.NavBarLinkEventHandler(this.ImportHwgrClick);
            // 
            // nbi_ImportWgr
            // 
            this.nbi_ImportWgr.Caption = "Import WGRs";
            this.nbi_ImportWgr.LargeImageIndex = 5;
            this.nbi_ImportWgr.Name = "nbi_ImportWgr";
            this.nbi_ImportWgr.LinkClicked += new DevExpress.XtraNavBar.NavBarLinkEventHandler(this.ImportWgrClick);
            // 
            // nb_StructureManager
            // 
            this.nb_StructureManager.Caption = "Structure manager";
            this.nb_StructureManager.Expanded = true;
            this.nb_StructureManager.GroupStyle = DevExpress.XtraNavBar.NavBarGroupStyle.LargeIconsList;
            this.nb_StructureManager.ItemLinks.AddRange(new DevExpress.XtraNavBar.NavBarItemLink[] {
            new DevExpress.XtraNavBar.NavBarItemLink(this.nbi_ViewMinMax),
            new DevExpress.XtraNavBar.NavBarItemLink(this.nbi_AssignHwgr),
            new DevExpress.XtraNavBar.NavBarItemLink(this.nbi_AssignWgr),
            new DevExpress.XtraNavBar.NavBarItemLink(this.nbi_ViewHistory)});
            this.nb_StructureManager.Name = "nb_StructureManager";
            // 
            // nbi_ViewMinMax
            // 
            this.nbi_ViewMinMax.Caption = "View min \\ max persons";
            this.nbi_ViewMinMax.Enabled = false;
            this.nbi_ViewMinMax.LargeImageIndex = 7;
            this.nbi_ViewMinMax.Name = "nbi_ViewMinMax";
            this.nbi_ViewMinMax.LinkClicked += new DevExpress.XtraNavBar.NavBarLinkEventHandler(this.nbi_ViewMinMax_LinkClicked);
            // 
            // nbi_AssignHwgr
            // 
            this.nbi_AssignHwgr.Caption = "Assign HWGR";
            this.nbi_AssignHwgr.Enabled = false;
            this.nbi_AssignHwgr.LargeImageIndex = 0;
            this.nbi_AssignHwgr.Name = "nbi_AssignHwgr";
            this.nbi_AssignHwgr.LinkClicked += new DevExpress.XtraNavBar.NavBarLinkEventHandler(this.nbi_AssignHwgr_LinkClicked);
            // 
            // nbi_AssignWgr
            // 
            this.nbi_AssignWgr.Caption = "Assign WGR";
            this.nbi_AssignWgr.Enabled = false;
            this.nbi_AssignWgr.LargeImageIndex = 1;
            this.nbi_AssignWgr.Name = "nbi_AssignWgr";
            this.nbi_AssignWgr.LinkClicked += new DevExpress.XtraNavBar.NavBarLinkEventHandler(this.nbi_AssignWgr_LinkClicked);
            // 
            // nbi_ViewHistory
            // 
            this.nbi_ViewHistory.Caption = "View history";
            this.nbi_ViewHistory.Enabled = false;
            this.nbi_ViewHistory.LargeImageIndex = 8;
            this.nbi_ViewHistory.Name = "nbi_ViewHistory";
            this.nbi_ViewHistory.LinkClicked += new DevExpress.XtraNavBar.NavBarLinkEventHandler(this.nbi_ViewHistory_LinkClicked);
            // 
            // nbi_ChangeTimeRange
            // 
            this.nbi_ChangeTimeRange.Caption = "Change time range";
            this.nbi_ChangeTimeRange.Enabled = false;
            this.nbi_ChangeTimeRange.LargeImageIndex = 2;
            this.nbi_ChangeTimeRange.Name = "nbi_ChangeTimeRange";
            // 
            // barImages
            // 
            this.barImages.ImageSize = new System.Drawing.Size(32, 32);
            this.barImages.ImageStream = ((DevExpress.Utils.ImageCollectionStreamer)(resources.GetObject("barImages.ImageStream")));
            // 
            // split2
            // 
            this.split2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.split2.Horizontal = false;
            this.split2.Location = new System.Drawing.Point(0, 0);
            this.split2.Name = "split2";
            this.split2.Panel1.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.NoBorder;
            this.split2.Panel1.Controls.Add(this._worldDetail);
            this.split2.Panel1.Controls.Add(this.layoutControl1);
            this.split2.Panel1.Text = "Panel1";
            this.split2.Panel2.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.NoBorder;
            this.split2.Panel2.Controls.Add(this.storeTree);
            this.split2.Panel2.Controls.Add(this.panelControl2);
            this.split2.Panel2.Text = "Panel2";
            this.split2.Size = new System.Drawing.Size(657, 605);
            this.split2.SplitterPosition = 244;
            this.split2.TabIndex = 0;
            this.split2.Text = "splitContainerControl1";
            // 
            // _worldDetail
            // 
            this._worldDetail.Dock = System.Windows.Forms.DockStyle.Fill;
            this._worldDetail.Entity = null;
            this._worldDetail.Location = new System.Drawing.Point(0, 35);
            this._worldDetail.LookAndFeel.SkinName = "iMaginary";
            this._worldDetail.Name = "_worldDetail";
            this._worldDetail.Size = new System.Drawing.Size(657, 209);
            this._worldDetail.TabIndex = 3;
            // 
            // layoutControl1
            // 
            this.layoutControl1.AllowCustomizationMenu = false;
            this.layoutControl1.Appearance.Control.BorderColor = System.Drawing.Color.Transparent;
            this.layoutControl1.Appearance.Control.Options.UseBorderColor = true;
            this.layoutControl1.Controls.Add(this.btn_ApplyYear);
            this.layoutControl1.Controls.Add(this.edYear);
            this.layoutControl1.Controls.Add(this.edStore);
            this.layoutControl1.Controls.Add(this.edViewStyle);
            this.layoutControl1.Dock = System.Windows.Forms.DockStyle.Top;
            this.layoutControl1.Location = new System.Drawing.Point(0, 0);
            this.layoutControl1.Name = "layoutControl1";
            this.layoutControl1.Root = this.layoutControlGroup1;
            this.layoutControl1.Size = new System.Drawing.Size(657, 35);
            this.layoutControl1.TabIndex = 2;
            this.layoutControl1.Text = "layoutControl1";
            // 
            // btn_ApplyYear
            // 
            this.btn_ApplyYear.Enabled = false;
            this.btn_ApplyYear.Location = new System.Drawing.Point(385, 6);
            this.btn_ApplyYear.Name = "btn_ApplyYear";
            this.btn_ApplyYear.Size = new System.Drawing.Size(66, 22);
            this.btn_ApplyYear.StyleController = this.layoutControl1;
            this.btn_ApplyYear.TabIndex = 6;
            this.btn_ApplyYear.Text = "Apply year";
            this.btn_ApplyYear.Click += new System.EventHandler(this.btn_ApplyYear_Click);
            // 
            // edYear
            // 
            this.edYear.EditValue = new decimal(new int[] {
            2007,
            0,
            0,
            0});
            this.edYear.Enabled = false;
            this.edYear.Location = new System.Drawing.Point(278, 6);
            this.edYear.Name = "edYear";
            this.edYear.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton()});
            this.edYear.Properties.Mask.EditMask = "f0";
            this.edYear.Properties.MaxValue = new decimal(new int[] {
            2079,
            0,
            0,
            0});
            this.edYear.Properties.MinValue = new decimal(new int[] {
            1901,
            0,
            0,
            0});
            this.edYear.Size = new System.Drawing.Size(96, 20);
            this.edYear.StyleController = this.layoutControl1;
            this.edYear.TabIndex = 5;
            // 
            // edStore
            // 
            this.edStore.Location = new System.Drawing.Point(37, 6);
            this.edStore.Name = "edStore";
            this.edStore.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo)});
            this.edStore.Properties.DisplayMember = "Name";
            this.edStore.Properties.NullText = "";
            this.edStore.Properties.ShowFooter = false;
            this.edStore.Properties.View = this.gridView;
            this.edStore.Size = new System.Drawing.Size(203, 20);
            this.edStore.StyleController = this.layoutControl1;
            this.edStore.TabIndex = 4;
            this.edStore.EditValueChanged += new System.EventHandler(this.edStore_EditValueChanged);
            this.edStore.SizeChanged += new System.EventHandler(this.edStore_SizeChanged);
            this.edStore.Popup += new System.EventHandler(this.edStore_SizeChanged);
            // 
            // gridView
            // 
            this.gridView.Columns.AddRange(new DevExpress.XtraGrid.Columns.GridColumn[] {
            this.gc_Name});
            this.gridView.FocusRectStyle = DevExpress.XtraGrid.Views.Grid.DrawFocusRectStyle.RowFocus;
            this.gridView.Name = "gridView";
            this.gridView.OptionsFilter.AllowFilterEditor = false;
            this.gridView.OptionsSelection.EnableAppearanceFocusedCell = false;
            this.gridView.OptionsView.ShowAutoFilterRow = true;
            this.gridView.OptionsView.ShowGroupPanel = false;
            // 
            // gc_Name
            // 
            this.gc_Name.Caption = "Name";
            this.gc_Name.FieldName = "Name";
            this.gc_Name.Name = "gc_Name";
            this.gc_Name.Visible = true;
            this.gc_Name.VisibleIndex = 0;
            // 
            // edViewStyle
            // 
            this.edViewStyle.Enabled = false;
            this.edViewStyle.Location = new System.Drawing.Point(462, 6);
            this.edViewStyle.MaximumSize = new System.Drawing.Size(174, 24);
            this.edViewStyle.MinimumSize = new System.Drawing.Size(190, 24);
            this.edViewStyle.Name = "edViewStyle";
            this.edViewStyle.Properties.Appearance.BackColor = System.Drawing.Color.Transparent;
            this.edViewStyle.Properties.Appearance.Options.UseBackColor = true;
            this.edViewStyle.Properties.AppearanceDisabled.ForeColor = System.Drawing.Color.Silver;
            this.edViewStyle.Properties.AppearanceDisabled.Options.UseForeColor = true;
            this.edViewStyle.Properties.AutoHeight = false;
            this.edViewStyle.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.NoBorder;
            serializableAppearanceObject1.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical;
            serializableAppearanceObject2.ForeColor = System.Drawing.Color.Black;
            serializableAppearanceObject2.Options.UseForeColor = true;
            serializableAppearanceObject2.Options.UseTextOptions = true;
            serializableAppearanceObject2.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near;
            this.edViewStyle.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo, "", -1, true, true, true, DevExpress.Utils.HorzAlignment.Center, null, new DevExpress.Utils.KeyShortcut((System.Windows.Forms.Keys.Alt | System.Windows.Forms.Keys.F7)), serializableAppearanceObject1, "Alt + F7"),
            new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Glyph, "View in cards     ", 165, true, true, true, DevExpress.Utils.HorzAlignment.Near, global::Baumax.ClientUI.Properties.Resources._EDIT, new DevExpress.Utils.KeyShortcut(System.Windows.Forms.Keys.None), serializableAppearanceObject2, "", "card")});
            this.edViewStyle.Properties.GlyphAlignment = DevExpress.Utils.HorzAlignment.Far;
            this.edViewStyle.Properties.Items.AddRange(new DevExpress.XtraEditors.Controls.ImageComboBoxItem[] {
            new DevExpress.XtraEditors.Controls.ImageComboBoxItem("View in cards", "card", 0),
            new DevExpress.XtraEditors.Controls.ImageComboBoxItem("View in vertical table", "vgrid", 2),
            new DevExpress.XtraEditors.Controls.ImageComboBoxItem("View in table", "grid", 1)});
            this.edViewStyle.Properties.SmallImages = this.comboImages;
            this.edViewStyle.Properties.TextEditStyle = DevExpress.XtraEditors.Controls.TextEditStyles.HideTextEditor;
            this.edViewStyle.Properties.ButtonClick += new DevExpress.XtraEditors.Controls.ButtonPressedEventHandler(this.edViewStyle_Properties_ButtonClick);
            this.edViewStyle.Size = new System.Drawing.Size(190, 24);
            this.edViewStyle.StyleController = this.layoutControl1;
            this.edViewStyle.TabIndex = 7;
            this.edViewStyle.SelectedValueChanged += new System.EventHandler(this.edViewStyle_SelectedValueChanged);
            // 
            // comboImages
            // 
            this.comboImages.ImageStream = ((DevExpress.Utils.ImageCollectionStreamer)(resources.GetObject("comboImages.ImageStream")));
            // 
            // layoutControlGroup1
            // 
            this.layoutControlGroup1.AppearanceGroup.BorderColor = System.Drawing.Color.Transparent;
            this.layoutControlGroup1.AppearanceGroup.Options.UseBorderColor = true;
            this.layoutControlGroup1.CustomizationFormText = "layoutControlGroup1";
            this.layoutControlGroup1.GroupBordersVisible = false;
            this.layoutControlGroup1.Items.AddRange(new DevExpress.XtraLayout.BaseLayoutItem[] {
            this.lc_Store,
            this.lc_Year,
            this.lcEdVievStyle,
            this.lcApplyYear});
            this.layoutControlGroup1.Location = new System.Drawing.Point(0, 0);
            this.layoutControlGroup1.Name = "layoutControlGroup1";
            this.layoutControlGroup1.Padding = new DevExpress.XtraLayout.Utils.Padding(0, 0, 0, 0);
            this.layoutControlGroup1.Size = new System.Drawing.Size(657, 35);
            this.layoutControlGroup1.Spacing = new DevExpress.XtraLayout.Utils.Padding(0, 0, 0, 0);
            this.layoutControlGroup1.Text = "layoutControlGroup1";
            this.layoutControlGroup1.TextVisible = false;
            // 
            // lc_Store
            // 
            this.lc_Store.Control = this.edStore;
            this.lc_Store.CustomizationFormText = "Store";
            this.lc_Store.Location = new System.Drawing.Point(0, 0);
            this.lc_Store.Name = "lc_Store";
            this.lc_Store.Padding = new DevExpress.XtraLayout.Utils.Padding(5, 5, 5, 5);
            this.lc_Store.Size = new System.Drawing.Size(245, 35);
            this.lc_Store.Spacing = new DevExpress.XtraLayout.Utils.Padding(0, 0, 0, 0);
            this.lc_Store.Text = "Store";
            this.lc_Store.TextAlignMode = DevExpress.XtraLayout.TextAlignModeItem.AutoSize;
            this.lc_Store.TextSize = new System.Drawing.Size(26, 20);
            // 
            // lc_Year
            // 
            this.lc_Year.Control = this.edYear;
            this.lc_Year.CustomizationFormText = "Year";
            this.lc_Year.Location = new System.Drawing.Point(245, 0);
            this.lc_Year.Name = "lc_Year";
            this.lc_Year.Padding = new DevExpress.XtraLayout.Utils.Padding(5, 5, 5, 5);
            this.lc_Year.Size = new System.Drawing.Size(134, 35);
            this.lc_Year.Spacing = new DevExpress.XtraLayout.Utils.Padding(0, 0, 0, 0);
            this.lc_Year.Text = "Year";
            this.lc_Year.TextAlignMode = DevExpress.XtraLayout.TextAlignModeItem.AutoSize;
            this.lc_Year.TextSize = new System.Drawing.Size(22, 20);
            // 
            // lcEdVievStyle
            // 
            this.lcEdVievStyle.Control = this.edViewStyle;
            this.lcEdVievStyle.CustomizationFormText = "layoutControlItem2";
            this.lcEdVievStyle.Location = new System.Drawing.Point(456, 0);
            this.lcEdVievStyle.Name = "lcEdVievStyle";
            this.lcEdVievStyle.Padding = new DevExpress.XtraLayout.Utils.Padding(5, 5, 5, 5);
            this.lcEdVievStyle.Size = new System.Drawing.Size(201, 35);
            this.lcEdVievStyle.Spacing = new DevExpress.XtraLayout.Utils.Padding(0, 0, 0, 0);
            this.lcEdVievStyle.Text = "lcEdVievStyle";
            this.lcEdVievStyle.TextSize = new System.Drawing.Size(0, 0);
            this.lcEdVievStyle.TextToControlDistance = 0;
            this.lcEdVievStyle.TextVisible = false;
            // 
            // lcApplyYear
            // 
            this.lcApplyYear.Control = this.btn_ApplyYear;
            this.lcApplyYear.CustomizationFormText = "lcApplyYear";
            this.lcApplyYear.Location = new System.Drawing.Point(379, 0);
            this.lcApplyYear.Name = "lcApplyYear";
            this.lcApplyYear.Padding = new DevExpress.XtraLayout.Utils.Padding(5, 5, 5, 5);
            this.lcApplyYear.Size = new System.Drawing.Size(77, 35);
            this.lcApplyYear.Spacing = new DevExpress.XtraLayout.Utils.Padding(0, 0, 0, 0);
            this.lcApplyYear.Text = "lcApplyYear";
            this.lcApplyYear.TextSize = new System.Drawing.Size(0, 0);
            this.lcApplyYear.TextToControlDistance = 0;
            this.lcApplyYear.TextVisible = false;
            // 
            // storeTree
            // 
            this.storeTree.Appearance.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(254)))), ((int)(((byte)(254)))), ((int)(((byte)(254)))));
            this.storeTree.Appearance.Options.UseBackColor = true;
            this.storeTree.Dock = System.Windows.Forms.DockStyle.Fill;
            this.storeTree.Entity = null;
            this.storeTree.Location = new System.Drawing.Point(0, 32);
            this.storeTree.LookAndFeel.SkinName = "iMaginary";
            this.storeTree.Name = "storeTree";
            this.storeTree.Size = new System.Drawing.Size(657, 323);
            this.storeTree.TabIndex = 6;
            // 
            // panelControl2
            // 
            this.panelControl2.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.NoBorder;
            this.panelControl2.Controls.Add(this.lbl_FilterByDate);
            this.panelControl2.Controls.Add(this.edFilterDate);
            this.panelControl2.Dock = System.Windows.Forms.DockStyle.Top;
            this.panelControl2.Location = new System.Drawing.Point(0, 0);
            this.panelControl2.Name = "panelControl2";
            this.panelControl2.Size = new System.Drawing.Size(657, 32);
            this.panelControl2.TabIndex = 7;
            // 
            // lbl_FilterByDate
            // 
            this.lbl_FilterByDate.Location = new System.Drawing.Point(13, 9);
            this.lbl_FilterByDate.Name = "lbl_FilterByDate";
            this.lbl_FilterByDate.Size = new System.Drawing.Size(64, 13);
            this.lbl_FilterByDate.TabIndex = 5;
            this.lbl_FilterByDate.Text = "Filter by date";
            // 
            // edFilterDate
            // 
            this.edFilterDate.EditValue = null;
            this.edFilterDate.Enabled = false;
            this.edFilterDate.Location = new System.Drawing.Point(134, 6);
            this.edFilterDate.Name = "edFilterDate";
            this.edFilterDate.Properties.AllowNullInput = DevExpress.Utils.DefaultBoolean.False;
            this.edFilterDate.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo)});
            this.edFilterDate.Properties.ShowWeekNumbers = true;
            this.edFilterDate.Properties.VistaTimeProperties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton()});
            this.edFilterDate.Properties.WeekNumberRule = DevExpress.XtraEditors.Controls.WeekNumberRule.FirstFourDayWeek;
            this.edFilterDate.Size = new System.Drawing.Size(124, 20);
            this.edFilterDate.TabIndex = 8;
            this.edFilterDate.EditValueChanged += new System.EventHandler(this.edFilterDate_EditValueChanged);
            // 
            // UCWorldList2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.split1);
            this.LookAndFeel.SkinName = "iMaginary";
            this.Name = "UCWorldList2";
            this.Size = new System.Drawing.Size(817, 605);
            this.Load += new System.EventHandler(this.UCWorldList2_Load);
            ((System.ComponentModel.ISupportInitialize)(this.split1)).EndInit();
            this.split1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.navBarControl)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.barImages)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.split2)).EndInit();
            this.split2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.layoutControl1)).EndInit();
            this.layoutControl1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.edYear.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.edStore.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.edViewStyle.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.comboImages)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlGroup1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.lc_Store)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.lc_Year)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.lcEdVievStyle)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.lcApplyYear)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.panelControl2)).EndInit();
            this.panelControl2.ResumeLayout(false);
            this.panelControl2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.edFilterDate.Properties.VistaTimeProperties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.edFilterDate.Properties)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private DevExpress.XtraEditors.SplitContainerControl split1;
        private DevExpress.XtraNavBar.NavBarControl navBarControl;
        private DevExpress.XtraNavBar.NavBarGroup nb_Import;
        private DevExpress.XtraNavBar.NavBarItem nbi_ImportWorld;
        private DevExpress.XtraNavBar.NavBarGroup nb_StructureManager;
        private DevExpress.XtraNavBar.NavBarItem nbi_AssignHwgr;
        private DevExpress.XtraNavBar.NavBarItem nbi_AssignWgr;
        private DevExpress.XtraNavBar.NavBarItem nbi_ChangeTimeRange;
        private DevExpress.XtraEditors.SplitContainerControl split2;
        private DevExpress.Utils.ImageCollection barImages;
        private DevExpress.XtraNavBar.NavBarItem nbi_ImportHwgr;
        private DevExpress.XtraNavBar.NavBarItem nbi_ImportWgr;
        private DevExpress.XtraLayout.LayoutControl layoutControl1;
        private DevExpress.XtraLayout.LayoutControlGroup layoutControlGroup1;
        private UCWorldDetail _worldDetail;
        private UCStoreTree storeTree;
        private DevExpress.XtraEditors.GridLookUpEdit edStore;
        private DevExpress.XtraGrid.Views.Grid.GridView gridView;
        private DevExpress.XtraLayout.LayoutControlItem lc_Store;
        private DevExpress.XtraEditors.SpinEdit edYear;
        private DevExpress.XtraLayout.LayoutControlItem lc_Year;
        private DevExpress.XtraGrid.Columns.GridColumn gc_Name;
        private DevExpress.XtraNavBar.NavBarItem nbi_ViewMinMax;
        private DevExpress.XtraNavBar.NavBarItem nbi_ViewHistory;
        private DevExpress.XtraEditors.PanelControl panelControl2;
        private DevExpress.XtraEditors.LabelControl lbl_FilterByDate;
        private DevExpress.XtraEditors.DateEdit edFilterDate;
        private DevExpress.Utils.ImageCollection comboImages;
        private DevExpress.XtraEditors.ImageComboBoxEdit edViewStyle;
        private DevExpress.XtraLayout.LayoutControlItem lcEdVievStyle;
        private DevExpress.XtraEditors.SimpleButton btn_ApplyYear;
        private DevExpress.XtraLayout.LayoutControlItem lcApplyYear;
    }
}
