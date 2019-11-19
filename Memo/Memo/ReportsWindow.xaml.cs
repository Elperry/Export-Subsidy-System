using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.IO.Packaging;
using System;
using System.Data;
using System.IO;
using System.Windows;
using System.Windows.Threading;
using System.Windows.Xps.Packaging;
using CodeReason.Reports;
using System.Runtime.InteropServices;
using Microsoft.Office.Interop.Excel;
using Microsoft.Win32;

namespace Memo
{
    /// <summary>
    /// Interaction logic for ReportsWindow.xaml
    /// </summary>
    public partial class ReportsWindow : System.Windows.Window
    {
        private bool _firstActivated = true;
        private MyReportData myReportData;
        public ReportsWindow(MyReportData data = null)
        {
            InitializeComponent();
            myReportData = data;
        }

        private void Window_Activated(object sender, EventArgs e)
        {
            if (!_firstActivated) return;

            _firstActivated = false;
            if (myReportData == null) return;
            Dispatcher.BeginInvoke(DispatcherPriority.ApplicationIdle, new System.Action(delegate
            {
                try
                {
                    ReportDocument reportDocument = new ReportDocument();

                    reportDocument.XamlData = myReportData.Template;
                    //reportDocument.XamlData = Global.reportTemplate;

                    ReportData data = new ReportData();

                    // set constant document values
                    data.ReportDocumentValues.Add("PrintDate", DateTime.Now); // print date is now

                    // sample table "Ean"
                    System.Data.DataTable table = myReportData.table;
                    data.DataTables.Add(table);

                    DateTime dateTimeStart = DateTime.Now; // start time measure here

                    XpsDocument xps = reportDocument.CreateXpsDocument(data);
                    documentViewer.Document = xps.GetFixedDocumentSequence();

                    // show the elapsed time in window title
                    //Title += " - generated in " + (DateTime.Now - dateTimeStart).TotalMilliseconds + "ms";
                }
                catch (Exception ex)
                {
                    // show exception
                    MessageBox.Show(ex.Message + "\r\n\r\n" + ex.GetType() + "\r\n" + ex.StackTrace, ex.GetType().ToString(), MessageBoxButton.OK, MessageBoxImage.Stop);
                }
                finally
                {
                    busyDecorator.IsBusyIndicatorHidden = true;
                }
            }));
        }

        private void ExportDataTableToExcel(object sender, KeyEventArgs e)
        {
            System.Data.DataTable table = new System.Data.DataTable();


        }

        public void saveAsExcel(object sender, RoutedEventArgs e)
        {
            SaveFileDialog dlg = new SaveFileDialog();
            dlg.Filter = "xlsx Excel|*.xlsx|Excel |*.xls";
            dlg.Title = "Save an Excel File";
            dlg.ShowDialog();
            if (dlg.FileName == "") { return; }
            string filePath = dlg.FileName;
            DataSet ds = new DataSet();
            System.Data.DataTable table = myReportData.table.Copy();

            Microsoft.Office.Interop.Excel.Application excel = new Microsoft.Office.Interop.Excel.Application();
            Workbook book = excel.Application.Workbooks.Add(Type.Missing);
            excel.Visible = false;
            excel.DisplayAlerts = false;
            Worksheet excelWorkSheet = (Microsoft.Office.Interop.Excel.Worksheet)book.ActiveSheet;
            excelWorkSheet.Name = table.TableName;

            //progressBar1.Maximum = table.Columns.Count;
            for (int i = 1; i < table.Columns.Count + 1; i++) // Creating Header Column In Excel  
            {
                excelWorkSheet.Cells[1, i] = table.Columns[i - 1].ColumnName;

            }


            //progressBar1.Maximum = table.Rows.Count;
            for (int j = 0; j < table.Rows.Count; j++) // Exporting Rows in Excel  
            {
                for (int k = 0; k < table.Columns.Count; k++)
                {
                    excelWorkSheet.Cells[j + 2, k + 1] = table.Rows[j].ItemArray[k].ToString();
                }

            }


            book.SaveAs(filePath);
            book.Close(true);
            excel.Quit();

            Marshal.ReleaseComObject(book);
            Marshal.ReleaseComObject(book);
            Marshal.ReleaseComObject(excel);
        }

    }
}
