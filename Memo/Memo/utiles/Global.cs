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
                                    new MenuItemViewModel { Header =  translate.trans("Error Report") },
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
    }
}
