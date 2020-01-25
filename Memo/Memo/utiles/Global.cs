using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.ObjectModel;
using System.Windows;
using System.Windows.Input;
using System.Windows.Controls;
using System.Globalization;
using System.Threading;

namespace Memo {
    public static class Global
    {
        public static CultureInfo culture { get; set; }
        public static double tempsum { get; set; }
        public static double tempsum2 { get; set; }
        public static List<Window> windows { get; set; }
        public static User usr { get; set; }
        public static lang Lang { get; set; }
        public static Company company { get; set; }
        public static List<lang> langs = new List<lang>()
        {
            new lang("EN","English"),
            new lang("AR","Arabic")
        };
        public static main mainWindow { get; set; }
        public static ObservableCollection<object> countrys{ get; set; }
        public static ObservableCollection<object> brandCats { get; set; }
        public static ObservableCollection<object> committees { get; set; }
        public static ObservableCollection<object> brands { get; set; }
        public static ObservableCollection<object> ports { get; set; }
        public static ObservableCollection<object> shippingCompanys { get; set; }
        public static ObservableCollection<object> companys { get; set; }  
        public static ObservableCollection<object> clients { get; set; }
        public static ObservableCollection<object> invoices { get; set; }
        public static ObservableCollection<object> invoiceDatas { get; set; }
        public static ObservableCollection<object> fileNos { get; set; }
        public static ObservableCollection<object> fileNoDatas { get; set; }
        public static ObservableCollection<object> users { get; set; }
        public static ObservableCollection<object> bankReceipts { get; set; }
        public static ObservableCollection<object> bankReceiptDatas { get; set; }
        public static ObservableCollection<object> cheques { get; set; }
        public static ObservableCollection<object> bookeds { get; set; }
        public static ObservableCollection<object> chequeDatas { get; set; }
        public static ObservableCollection<object> exportCertificates { get; set; }
        public static ObservableCollection<object> estivas { get; set; }
        public static ObservableCollection<object> bankReceiptInvoices { get; set; }
        public static ObservableCollection<MenuItemViewModel> MainMenu { get; set; }
        public static ObservableCollection<MenuItemViewModel> getOpenWin()
        {
            ObservableCollection<MenuItemViewModel> opW = new ObservableCollection<MenuItemViewModel>();
            if (Global.windows == null || Global.windows.Count == 0)
            {
                return null;
            }
            foreach (Window w in Global.windows)
            {
                void method()
                {
                    w.Activate();
                }
                MenuItemViewModel m = new MenuItemViewModel { Header = w.Title, Command = new CommandViewModel(method) };
                opW.Add(m);
                //MessageBox.Show(w.Name);
            }
            return opW;
        }
        public static void addWindow(Window o)
        {
            windows.Add(o);
            refreshMenu();
            Menu m = (Menu)((DockPanel)((Grid)mainWindow.Content).Children[1]).Children[0];
            m.ItemsSource = MainMenu;
        }
        public static void removeWindow(Window o)
        {
            foreach( Window w in Global.windows)
            {
                if (o.Title == w.Title)
                {  
                    windows.Remove(w);
                    refreshMenu();
                    Menu m = (Menu)((DockPanel)((Grid)mainWindow.Content).Children[1]).Children[0];
                    m.ItemsSource = MainMenu;
                    //MessageBox.Show(MainMenu.Count.ToString());
                    return;
                }
            }
            
           
        }
        public static string dateFormate(string s)
        {
            if(s == string.Empty || s == null)
            {
                return "NULL";
            }

            DateTime theDate;
            if(s.Length < 10)
            {
                try
                {
                    DateTime conv = DateTime.FromOADate(Convert.ToDouble(s));
                    return "'" + conv.ToString("yyyy-MM-dd") + "'";
                }
                catch (Exception)
                {

                }
                return "NULL";
            }
            if (DateTime.TryParseExact(s.Substring(0,10), "dd/MM/yyyy",
                    CultureInfo.InvariantCulture, DateTimeStyles.None, out theDate))
            {
                // the string was successfully parsed into theDate  2019-08-11
                return "'"+theDate.ToString("yyyy-MM-dd")+"'";
            }
            else if (DateTime.TryParseExact(s.Substring(0, 10), "yyyy-MM-dd",CultureInfo.InvariantCulture, DateTimeStyles.None, out theDate))
            {
                return "'" + theDate.ToString("yyyy-MM-dd") + "'";
            }
                else if (DateTime.TryParse(s, out theDate))
            {
                return "'" + theDate.ToString("yyyy-MM-dd") + "'";
            }
            else
            {
                // the parsing failed, return some sensible default value
                return "NULL";
            }
        }
        public static string stringFrmBytes(byte[] data)
        {
            if (data == null)
            {
                return "NULL";
            }
            string o = "'";
            foreach ( byte b in data)
            {
                o = o + b.ToString() + ",";
            }
            o = o.Substring(0, o.Length - 1);
            return o+"'";
        }
        public static void refreshMenu()
        {
            if (Global.usr.admin)
            {
                MainMenu = new ObservableCollection<MenuItemViewModel> {
                new MenuItemViewModel
                {
                    Header =  translate.trans("Basic Info"),
                    MenuItems = new ObservableCollection<MenuItemViewModel>
                        {
                            new MenuItemViewModel { Header = translate.trans("Companies"),Command = new CommandViewModel(mainWindow.openCompany)  },
                            new MenuItemViewModel { Header = translate.trans("Shipping Companies"),Command = new CommandViewModel(mainWindow.openShippingCompany)  },
                            new MenuItemViewModel { Header =  translate.trans("Clients"),Command = new CommandViewModel(mainWindow.openClient) },
                            new MenuItemViewModel { Header =  translate.trans("Brand Categories"),Command = new CommandViewModel(mainWindow.openBrandCat) },
                            new MenuItemViewModel { Header =  translate.trans("Brands"),Command = new CommandViewModel(mainWindow.openBrand) },
                            new MenuItemViewModel { Header =  translate.trans("Committees"),Command = new CommandViewModel(mainWindow.openCommittee) },
                            new MenuItemViewModel { Header =  translate.trans("Countries") , Command = new CommandViewModel(mainWindow.openCountry) },
                            new MenuItemViewModel { Header = translate.trans( "Ports"),Command = new CommandViewModel(mainWindow.openPort) },
                            new MenuItemViewModel { Header = translate.trans( "Users"),Command = new CommandViewModel(mainWindow.openUser) },
                        }
                },
                new MenuItemViewModel { Header =  translate.trans("Actions"),
                                MenuItems = new ObservableCollection<MenuItemViewModel>
                                {
                                    new MenuItemViewModel { Header =  translate.trans("Export Certificates"),Command = new CommandViewModel(mainWindow.openExportCer) },
                                    new MenuItemViewModel { Header =  translate.trans("FileNo"),Command = new CommandViewModel(mainWindow.openFileNo) },
                                    new MenuItemViewModel { Header =  translate.trans("BankReceipt"),Command = new CommandViewModel(mainWindow.openBankReceipt) },
                                    new MenuItemViewModel { Header =  translate.trans("Cheque"),Command = new CommandViewModel(mainWindow.openCheque) },
                                    new MenuItemViewModel { Header =  translate.trans("Booked"),Command = new CommandViewModel(mainWindow.openBooked) },
                                    new MenuItemViewModel {Header =  translate.trans("Estiva") , Command = new CommandViewModel(mainWindow.openEstiva) },
                                }
                },
                new MenuItemViewModel { Header =  translate.trans("Reports"),
                                MenuItems = new ObservableCollection<MenuItemViewModel>
                                {
                                    new MenuItemViewModel { Header =  translate.trans("openReportViewer") , Command = new CommandViewModel(mainWindow.openReportViewer) },

                                }
                },
                new MenuItemViewModel { Header =  translate.trans("Import/Export"),
                    MenuItems = new ObservableCollection<MenuItemViewModel>
                    {
                        new MenuItemViewModel { Header =  translate.trans("Import From Excel") , Command = new CommandViewModel(mainWindow.import) },

                    }
                },
                new MenuItemViewModel
                {
                    Header =  translate.trans("Opened Windows"),
                    MenuItems = getOpenWin()

                },

                };
            }
            else
            {
                MainMenu = new ObservableCollection<MenuItemViewModel> {

                new MenuItemViewModel { Header =  translate.trans("Actions"),
                                MenuItems = new ObservableCollection<MenuItemViewModel>
                                {
                                    new MenuItemViewModel { Header =  translate.trans("Export Certificates"),Command = new CommandViewModel(mainWindow.openExportCer) },
                                    new MenuItemViewModel { Header =  translate.trans("FileNo"),Command = new CommandViewModel(mainWindow.openFileNo) },
                                    new MenuItemViewModel { Header =  translate.trans("BankReceipt"),Command = new CommandViewModel(mainWindow.openBankReceipt) },
                                    new MenuItemViewModel { Header =  translate.trans("Cheque"),Command = new CommandViewModel(mainWindow.openCheque) },
                                    new MenuItemViewModel { Header =  translate.trans("Booked"),Command = new CommandViewModel(mainWindow.openBooked) },
                                    new MenuItemViewModel {Header =  translate.trans("Estiva") , Command = new CommandViewModel(mainWindow.openEstiva) },
                                }
                },
                new MenuItemViewModel { Header =  translate.trans("Reports"),
                                MenuItems = new ObservableCollection<MenuItemViewModel>
                                {
                                    new MenuItemViewModel { Header =  translate.trans("openReportViewer") , Command = new CommandViewModel(mainWindow.openReportViewer) },

                                }
                },
                new MenuItemViewModel
                {
                    Header =  translate.trans("Opened Windows"),
                    MenuItems = getOpenWin()

                },

            };
            }
            
            
        }
        public static bool isNum(string s)
        {
            try
            {
                double d = Convert.ToDouble(s);
                return true;
            }
            catch (Exception)
            {

                return false;
            }
        }
        public static string reportTemplate = @"<FlowDocument xmlns=""http://schemas.microsoft.com/winfx/2006/xaml/presentation""
                          xmlns:x=""http://schemas.microsoft.com/winfx/2006/xaml""
                          xmlns:xrd=""clr-namespace:CodeReason.Reports.Document;assembly=CodeReason.Reports""
                          PageHeight=""_PageHeight"" PageWidth=""_PageWidth"" ColumnWidth=""21cm"">
              <xrd:ReportProperties>
                <xrd:ReportProperties.ReportName>RName</xrd:ReportProperties.ReportName>
                <xrd:ReportProperties.ReportTitle>RHeader</xrd:ReportProperties.ReportTitle>
              </xrd:ReportProperties>
              <Section Padding=""40,10,40,10"" FontSize=""12"">
                <Paragraph FontSize=""24"" FontWeight=""Bold"">
                  <xrd:InlineContextValue PropertyName=""ReportTitle"" />
                </Paragraph>
                <Paragraph>
                  RDescription
                </Paragraph>
                <xrd:SectionDataGroup DataGroupName=""DataGroupTitle"">
                  <Paragraph FontSize=""20"" FontWeight=""Bold"">RTitle</Paragraph>
                  <Table CellSpacing=""0"" BorderBrush=""Black"" BorderThickness=""0.02cm"">
                    <Table.Resources>
                      <!-- Style for header/footer rows. -->
                      <Style x:Key=""headerFooterRowStyle"" TargetType=""{x:Type TableRowGroup}"">
                        <Setter Property=""FontWeight"" Value=""DemiBold""/>
                        <Setter Property=""FontSize"" Value=""12""/>
                        <Setter Property=""Background"" Value=""LightGray""/>
                      </Style>

                      <!-- Style for data rows. -->
                      <Style x:Key=""dataRowStyle"" TargetType=""{x:Type TableRowGroup}"">
                        <Setter Property=""FontSize"" Value=""10""/>
                      </Style>

                      <!-- Style for data cells. -->
                      <Style TargetType=""{x:Type TableCell}"">
                        <Setter Property=""Padding"" Value=""0.1cm""/>
                        <Setter Property=""BorderBrush"" Value=""Black""/>
                        <Setter Property=""BorderThickness"" Value=""0.01cm""/>
                      </Style>
                    </Table.Resources>

                    <TableRowGroup Style=""{StaticResource headerFooterRowStyle}"">
                      <TableRow>
                        
                            RTableHeaderXml
                        
                      </TableRow>
                    </TableRowGroup>
                    <TableRowGroup Style=""{StaticResource dataRowStyle}"">
                      <xrd:TableRowForDataTable TableName=""RTable"">
                       
                        RTableXml
                                                
                      </xrd:TableRowForDataTable>
                    </TableRowGroup>
                  </Table>
                  <Paragraph FontSize=""14"" FontWeight=""Bold"">
                    RSummary
                  </Paragraph>
                </xrd:SectionDataGroup>
              </Section>
            </FlowDocument>
            ";
        public static double ToDouble(string s)
        {
            try
            {
                return Convert.ToDouble(s);
            }
            catch (Exception)
            {

                return 0.00;
            }
        }
        public static LoadingWait Busy(Window w)
        {

            LoadingWait ld = (LoadingWait)((Grid)w.Content).Children[0];
            ld.Start();    

            return ld;
        }

        public static string getValue(Microsoft.Office.Interop.Excel.Worksheet sheet , int i , int j)
        {

            try
            {
                if (sheet.Cells[i, j].Value2 == null) 
                {
                    return " ";
                }
                else
                {
                    return sheet.Cells[i, j].Value2.ToString();
                }
            }
            catch (Exception)
            {

                return null;
            }

           
        }

    }
}
