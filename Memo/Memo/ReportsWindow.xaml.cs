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


namespace Memo
{
    /// <summary>
    /// Interaction logic for ReportsWindow.xaml
    /// </summary>
    public partial class ReportsWindow : Window
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
            Dispatcher.BeginInvoke(DispatcherPriority.ApplicationIdle, new Action(delegate
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
                    DataTable table = myReportData.table;
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

    }
}
