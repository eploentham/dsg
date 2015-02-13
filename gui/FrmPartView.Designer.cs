namespace dsg.gui
{
    partial class FrmPartView
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
            this.dgvView = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.btnAdd = new System.Windows.Forms.Button();
            this.btnPrint = new System.Windows.Forms.Button();
            this.cboPrint = new System.Windows.Forms.ComboBox();
            this.btnExcel = new System.Windows.Forms.Button();
            this.pB1 = new System.Windows.Forms.ProgressBar();
            ((System.ComponentModel.ISupportInitialize)(this.dgvView)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvView
            // 
            this.dgvView.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.dgvView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvView.Location = new System.Drawing.Point(9, 46);
            this.dgvView.Margin = new System.Windows.Forms.Padding(2);
            this.dgvView.Name = "dgvView";
            this.dgvView.RowTemplate.Height = 24;
            this.dgvView.Size = new System.Drawing.Size(931, 573);
            this.dgvView.TabIndex = 1;
            this.dgvView.CellDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvView_CellDoubleClick);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(32, 20);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(40, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "ค้นหา :";
            // 
            // textBox1
            // 
            this.textBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(222)));
            this.textBox1.Location = new System.Drawing.Point(72, 17);
            this.textBox1.Margin = new System.Windows.Forms.Padding(2);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(96, 26);
            this.textBox1.TabIndex = 3;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(172, 17);
            this.button1.Margin = new System.Windows.Forms.Padding(2);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(27, 24);
            this.button1.TabIndex = 4;
            this.button1.Text = "...";
            this.button1.UseVisualStyleBackColor = true;
            // 
            // btnAdd
            // 
            this.btnAdd.Location = new System.Drawing.Point(278, 10);
            this.btnAdd.Margin = new System.Windows.Forms.Padding(2);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(74, 32);
            this.btnAdd.TabIndex = 5;
            this.btnAdd.Text = "เพื่มใหม่";
            this.btnAdd.UseVisualStyleBackColor = true;
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
            // 
            // btnPrint
            // 
            this.btnPrint.Location = new System.Drawing.Point(832, 9);
            this.btnPrint.Margin = new System.Windows.Forms.Padding(2);
            this.btnPrint.Name = "btnPrint";
            this.btnPrint.Size = new System.Drawing.Size(74, 32);
            this.btnPrint.TabIndex = 6;
            this.btnPrint.Text = "Print Part";
            this.btnPrint.UseVisualStyleBackColor = true;
            this.btnPrint.Click += new System.EventHandler(this.btnPrint_Click);
            // 
            // cboPrint
            // 
            this.cboPrint.FormattingEnabled = true;
            this.cboPrint.Location = new System.Drawing.Point(622, 16);
            this.cboPrint.Name = "cboPrint";
            this.cboPrint.Size = new System.Drawing.Size(186, 21);
            this.cboPrint.TabIndex = 7;
            // 
            // btnExcel
            // 
            this.btnExcel.Location = new System.Drawing.Point(925, 9);
            this.btnExcel.Margin = new System.Windows.Forms.Padding(2);
            this.btnExcel.Name = "btnExcel";
            this.btnExcel.Size = new System.Drawing.Size(74, 32);
            this.btnExcel.TabIndex = 8;
            this.btnExcel.Text = "Excel Part";
            this.btnExcel.UseVisualStyleBackColor = true;
            this.btnExcel.Click += new System.EventHandler(this.btnExcel_Click);
            // 
            // pB1
            // 
            this.pB1.Location = new System.Drawing.Point(367, 13);
            this.pB1.Name = "pB1";
            this.pB1.Size = new System.Drawing.Size(226, 23);
            this.pB1.TabIndex = 9;
            // 
            // FrmPartView
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1044, 628);
            this.Controls.Add(this.pB1);
            this.Controls.Add(this.btnExcel);
            this.Controls.Add(this.cboPrint);
            this.Controls.Add(this.btnPrint);
            this.Controls.Add(this.btnAdd);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dgvView);
            this.Margin = new System.Windows.Forms.Padding(2);
            this.Name = "FrmPartView";
            this.Text = "FrmPartView";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.FrmPartView_Load);
            this.Resize += new System.EventHandler(this.FrmPartView_Resize);
            ((System.ComponentModel.ISupportInitialize)(this.dgvView)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvView;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.Button btnPrint;
        private System.Windows.Forms.ComboBox cboPrint;
        private System.Windows.Forms.Button btnExcel;
        private System.Windows.Forms.ProgressBar pB1;
    }
}