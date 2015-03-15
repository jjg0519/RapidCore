﻿namespace ErpCore.CommonCtrl
{
    partial class MasterDetailViewGrid
    {
        /// <summary> 
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region 组件设计器生成的代码

        /// <summary> 
        /// 设计器支持所需的方法 - 不要
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.splitter1 = new System.Windows.Forms.Splitter();
            this.viewGrid = new ErpCore.CommonCtrl.ViewGrid();
            this.viewDetailGrid = new ErpCore.CommonCtrl.ViewDetailGrid();
            this.SuspendLayout();
            // 
            // splitter1
            // 
            this.splitter1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.splitter1.Cursor = System.Windows.Forms.Cursors.HSplit;
            this.splitter1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.splitter1.Location = new System.Drawing.Point(0, 204);
            this.splitter1.Name = "splitter1";
            this.splitter1.Size = new System.Drawing.Size(520, 3);
            this.splitter1.TabIndex = 3;
            this.splitter1.TabStop = false;
            // 
            // viewGrid
            // 
            this.viewGrid.BaseObjectMgr = null;
            this.viewGrid.CaptionText = "";
            this.viewGrid.Dock = System.Windows.Forms.DockStyle.Fill;
            this.viewGrid.Location = new System.Drawing.Point(0, 0);
            this.viewGrid.Name = "viewGrid";
            this.viewGrid.ShowTitleBar = false;
            this.viewGrid.ShowToolBar = true;
            this.viewGrid.Size = new System.Drawing.Size(520, 207);
            this.viewGrid.TabIndex = 2;
            this.viewGrid.View = null;
            // 
            // viewDetailGrid
            // 
            this.viewDetailGrid.BaseObjectMgr = null;
            this.viewDetailGrid.CaptionText = "";
            this.viewDetailGrid.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.viewDetailGrid.Location = new System.Drawing.Point(0, 207);
            this.viewDetailGrid.Name = "viewDetailGrid";
            this.viewDetailGrid.ShowTitleBar = false;
            this.viewDetailGrid.ShowToolBar = false;
            this.viewDetailGrid.Size = new System.Drawing.Size(520, 281);
            this.viewDetailGrid.TabIndex = 4;
            this.viewDetailGrid.ViewDetail = null;
            // 
            // MasterDetailViewGrid
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.splitter1);
            this.Controls.Add(this.viewGrid);
            this.Controls.Add(this.viewDetailGrid);
            this.Name = "MasterDetailViewGrid";
            this.Size = new System.Drawing.Size(520, 488);
            this.ResumeLayout(false);

        }

        #endregion

        private ViewGrid viewGrid;
        private System.Windows.Forms.Splitter splitter1;
        private ViewDetailGrid viewDetailGrid;
    }
}
