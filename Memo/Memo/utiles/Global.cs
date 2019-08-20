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

namespace Memo {
    public static class Global
    {
        public static double tempsum { get; set; }
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
        public static ObservableCollection<object> brands { get; set; }
        public static ObservableCollection<object> ports { get; set; }
        public static ObservableCollection<object> shippingCompanys { get; set; }
        public static ObservableCollection<object> companys { get; set; }  
        public static ObservableCollection<object> clients { get; set; }
        public static ObservableCollection<object> invoices { get; set; }
        public static ObservableCollection<object> invoiceDatas { get; set; }
        public static ObservableCollection<object> fileNos { get; set; }
        public static ObservableCollection<object> users { get; set; }
        public static ObservableCollection<object> bankReceipts { get; set; }
        public static ObservableCollection<object> bankReceiptDatas { get; set; }
        public static ObservableCollection<object> cheques { get; set; }
        public static ObservableCollection<object> bookeds { get; set; }
        public static ObservableCollection<object> chequeDatas { get; set; }
        public static ObservableCollection<object> exportCertificates { get; set; }
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
            Menu m = (Menu)((DockPanel)mainWindow.Content).Children[0];
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
                    Menu m = (Menu)((DockPanel)mainWindow.Content).Children[0];
                    m.ItemsSource = MainMenu;
                    //MessageBox.Show(MainMenu.Count.ToString());
                    return;
                }
            }
            
           
        }
        public static string dateFormate(string s)
        {

            DateTime theDate;
            if(s.Length < 10)
            {
                return "NULL";
            }
            if (DateTime.TryParseExact(s.Substring(0,10), "dd/MM/yyyy",
                    CultureInfo.InvariantCulture, DateTimeStyles.None, out theDate))
            {
                // the string was successfully parsed into theDate  2019-08-11
                return "'"+theDate.ToString("yyyy-MM-dd")+"'";
            }
            else
            {
                // the parsing failed, return some sensible default value
                return "NULL";
            }
        }
        public static void refreshMenu()
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
                                    new MenuItemViewModel {Header =  translate.trans("automatic Bank check Setter")}
                                }
                },
                new MenuItemViewModel { Header =  translate.trans("Reports"),
                                MenuItems = new ObservableCollection<MenuItemViewModel>
                                {
                                    new MenuItemViewModel { Header =  translate.trans("Error Report") , Command = new CommandViewModel(mainWindow.openReports) },
                                    new MenuItemViewModel { Header =  translate.trans("Monthes Report") },
                                    new MenuItemViewModel { Header =  translate.trans("FileNO") },

                                }
                },
                new MenuItemViewModel
                {
                    Header =  translate.trans("Opened Windows"),
                    MenuItems = getOpenWin()

                },

            };
            
        }

        public static string reportTemplate = @"<FlowDocument xmlns=""http://schemas.microsoft.com/winfx/2006/xaml/presentation""
                          xmlns:x=""http://schemas.microsoft.com/winfx/2006/xaml""
                          xmlns:xrd=""clr-namespace:CodeReason.Reports.Document;assembly=CodeReason.Reports""
                          PageHeight=""29.7cm"" PageWidth=""21cm"" ColumnWidth=""21cm"">
              <xrd:ReportProperties>
                <xrd:ReportProperties.ReportName>SimpleReport</xrd:ReportProperties.ReportName>
                <xrd:ReportProperties.ReportTitle>Simple Report</xrd:ReportProperties.ReportTitle>
              </xrd:ReportProperties>
              <Section Padding=""80,10,40,10"" FontSize=""12"">
                <Paragraph FontSize=""24"" FontWeight=""Bold"">
                  <xrd:InlineContextValue PropertyName=""ReportTitle"" />
                </Paragraph>
                <Paragraph>
                  This is a hahaha report example that contains a table.
                  The table is filled using a DataTable object.
                </Paragraph>
                <xrd:SectionDataGroup DataGroupName=""ItemList"">
                  <Paragraph FontSize=""20"" FontWeight=""Bold"">Item List</Paragraph>
                  <Table CellSpacing=""0"" BorderBrush=""Black"" BorderThickness=""0.02cm"">
                    <Table.Resources>
                      <!-- Style for header/footer rows. -->
                      <Style x:Key=""headerFooterRowStyle"" TargetType=""{x:Type TableRowGroup}"">
                        <Setter Property=""FontWeight"" Value=""DemiBold""/>
                        <Setter Property=""FontSize"" Value=""16""/>
                        <Setter Property=""Background"" Value=""LightGray""/>
                      </Style>

                      <!-- Style for data rows. -->
                      <Style x:Key=""dataRowStyle"" TargetType=""{x:Type TableRowGroup}"">
                        <Setter Property=""FontSize"" Value=""12""/>
                      </Style>

                      <!-- Style for data cells. -->
                      <Style TargetType=""{x:Type TableCell}"">
                        <Setter Property=""Padding"" Value=""0.1cm""/>
                        <Setter Property=""BorderBrush"" Value=""Black""/>
                        <Setter Property=""BorderThickness"" Value=""0.01cm""/>
                      </Style>
                    </Table.Resources>

                    <Table.Columns>
                      <TableColumn Width=""0.5*"" />
                      <TableColumn Width=""2*"" />
                      <TableColumn Width=""*"" />
                      <TableColumn Width=""0.5*"" />
                    </Table.Columns>
                    <TableRowGroup Style=""{StaticResource headerFooterRowStyle}"">
                      <TableRow>
                        <TableCell>
                          <Paragraph TextAlignment=""Center"">
                            <Bold>Pos.</Bold>
                          </Paragraph>
                        </TableCell>
                        <TableCell>
                          <Paragraph TextAlignment=""Center"">
                            <Bold>Item Name</Bold>
                          </Paragraph>
                        </TableCell>
                        <TableCell>
                          <Paragraph TextAlignment=""Center"">
                            <Bold>EAN</Bold>
                          </Paragraph>
                        </TableCell>
                        <TableCell>
                          <Paragraph TextAlignment=""Center"">
                            <Bold>Count</Bold>
                          </Paragraph>
                        </TableCell>
                      </TableRow>
                    </TableRowGroup>
                    <TableRowGroup Style=""{StaticResource dataRowStyle}"">
                      <xrd:TableRowForDataTable TableName=""Ean"">
                        <TableCell>
                          <Paragraph>
                            <xrd:InlineTableCellValue PropertyName=""Position"" />
                          </Paragraph>
                        </TableCell>
                        <TableCell>
                          <Paragraph>
                            <xrd:InlineTableCellValue PropertyName=""Item"" />
                          </Paragraph>
                        </TableCell>
                        <TableCell>
                          <Paragraph>
                            <xrd:InlineTableCellValue PropertyName=""EAN""/>
                          </Paragraph>
                        </TableCell>
                        <TableCell>
                          <Paragraph TextAlignment=""Center"">
                            <xrd:InlineTableCellValue PropertyName=""Count"" AggregateGroup=""ItemCount""/>
                          </Paragraph>
                        </TableCell>
                      </xrd:TableRowForDataTable>
                    </TableRowGroup>
                  </Table>
                  <Paragraph>
                    There are
                    <xrd:InlineAggregateValue AggregateGroup=""ItemCount"" AggregateValueType=""Count"" EmptyValue=""no"" FontWeight=""Bold"" /> item positions with a total of
                    <xrd:InlineAggregateValue AggregateGroup=""ItemCount"" AggregateValueType=""Sum"" EmptyValue=""0"" FontWeight=""Bold"" /> items listed.
                  </Paragraph>
                </xrd:SectionDataGroup>
              </Section>
            </FlowDocument>
            ";
    }
}
