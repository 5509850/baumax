namespace Baumax.ClientUI.FormEntities.Country
{
    partial class FormCountry2
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

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.countryEntityControl1 = new Baumax.ClientUI.FormEntities.Country.CountryEntityControl();
            this.lblCaption = new DevExpress.XtraEditors.LabelControl();
            ((System.ComponentModel.ISupportInitialize)(this.panelTop)).BeginInit();
            this.panelTop.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.panelBottom)).BeginInit();
            this.panelBottom.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.panelClient)).BeginInit();
            this.panelClient.SuspendLayout();
            this.SuspendLayout();
            // 
            // panelTop
            // 
            this.panelTop.Controls.Add(this.lblCaption);
            this.panelTop.Size = new System.Drawing.Size(409, 34);
            this.panelTop.Visible = true;
            // 
            // panelBottom
            // 
            this.panelBottom.Location = new System.Drawing.Point(0, 203);
            this.panelBottom.Size = new System.Drawing.Size(409, 40);
            // 
            // panelClient
            // 
            this.panelClient.Controls.Add(this.countryEntityControl1);
            this.panelClient.Size = new System.Drawing.Size(409, 169);
            // 
            // button_Cancel
            // 
            this.button_Cancel.Location = new System.Drawing.Point(317, 8);
            // 
            // countryEntityControl1
            // 
            this.countryEntityControl1.Country = null;
            this.countryEntityControl1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.countryEntityControl1.Entity = null;
            this.countryEntityControl1.Location = new System.Drawing.Point(2, 2);
            this.countryEntityControl1.Name = "countryEntityControl1";
            this.countryEntityControl1.Size = new System.Drawing.Size(405, 165);
            this.countryEntityControl1.TabIndex = 0;
            // 
            // lblCaption
            // 
            this.lblCaption.Appearance.Font = new System.Drawing.Font("Tahoma", 10F, System.Drawing.FontStyle.Bold);
            this.lblCaption.Appearance.Options.UseFont = true;
            this.lblCaption.Appearance.Options.UseTextOptions = true;
            this.lblCaption.Appearance.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;
            this.lblCaption.Appearance.TextOptions.VAlignment = DevExpress.Utils.VertAlignment.Center;
            this.lblCaption.AutoSizeMode = DevExpress.XtraEditors.LabelAutoSizeMode.None;
            this.lblCaption.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblCaption.Location = new System.Drawing.Point(2, 2);
            this.lblCaption.Name = "lblCaption";
            this.lblCaption.Size = new System.Drawing.Size(405, 30);
            this.lblCaption.TabIndex = 0;
            this.lblCaption.Text = "Country";
            // 
            // FormCountry2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.ClientSize = new System.Drawing.Size(409, 243);
            this.Name = "FormCountry2";
            this.Text = "      ";
            ((System.ComponentModel.ISupportInitialize)(this.panelTop)).EndInit();
            this.panelTop.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.panelBottom)).EndInit();
            this.panelBottom.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.panelClient)).EndInit();
            this.panelClient.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private CountryEntityControl countryEntityControl1;
        private DevExpress.XtraEditors.LabelControl lblCaption;
    }
}
