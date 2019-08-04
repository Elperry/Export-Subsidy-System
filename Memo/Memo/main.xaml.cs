using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Collections.ObjectModel;
using System.Dynamic;
using System.Reflection;
using System.Reflection.Emit;
using System.Globalization;


namespace Memo
{
    /// <summary>
    /// Interaction logic for main.xaml
    /// </summary>
    /// 

    
    public partial class main : Window
    {
        public ObservableCollection<MenuItemViewModel> MenuItems
        {
            get { return Global.MenuItems; }
            set { Global.MenuItems = value; }
        }

        public ObservableCollection<MenuItemViewModel> WMenu
        {
            get { return getOpenWin(); }
            
        }
        private ObservableCollection<MenuItemViewModel> getOpenWin()
        {
            ObservableCollection<MenuItemViewModel> opW = new ObservableCollection<MenuItemViewModel>();
            if(Global.windows == null || Global.windows.Count == 0)
            {
                return null;
            }
            foreach (Window w in Global.windows)
            {
                MenuItemViewModel m = new MenuItemViewModel { Header = w.Name, Command = new CommandViewModel(w.Show) };
                opW.Add(m);
            }
            return opW;
        }

        public main()
        {
            InitializeComponent();
            object o = new object();
            template t = new template();

            MenuItems = new ObservableCollection<MenuItemViewModel>
            {
                new MenuItemViewModel { Header = "Basic Info",
                    MenuItems = new ObservableCollection<MenuItemViewModel>
                        {
                            new MenuItemViewModel { Header = "Shipping Companies" },
                            new MenuItemViewModel { Header = "Clients" },
                            new MenuItemViewModel { Header = "Brands" },
                            new MenuItemViewModel { Header = "Countries" , Command = new CommandViewModel(openCountries) },
                            new MenuItemViewModel { Header = "Ports" },

                            new MenuItemViewModel { Header = "menu2_2",
                                MenuItems = new ObservableCollection<MenuItemViewModel>
                                {
                                    new MenuItemViewModel { Header = "menu2_2_1" },
                                    new MenuItemViewModel { Header = "menu2_2_2" },
                                    new MenuItemViewModel { Header = "menu2_2_3" }
                                }
                            },
                            new MenuItemViewModel { Header = "menu2_3" }
                        }
                },
                new MenuItemViewModel { Header = "Invoices" },
                new MenuItemViewModel { Header = "Export Certificates" ,
                    MenuItems = new ObservableCollection<MenuItemViewModel>
                    {
                        new MenuItemViewModel {Header = "New Export Certificates"},
                        new MenuItemViewModel {Header = "Edit Export Certificates"},
                        new MenuItemViewModel {Header = "automatic Bank check Setter"}
                    }

                },
                new MenuItemViewModel{Header = "Open Windows" ,
                    MenuItems = WMenu
                   
                },

            };
            t.template2(this, ref o, "", MenuItems);
            DataContext = this;
            //MenueList.Add()

        }

        private void ButtonClose_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }
        public void close()
        {
            Application.Current.Shutdown();
        }
        public void openCountries()
        {
            template t = new template();                    
            object W = new Window();
            object temp =new Country((Window)W);
            Global.countries = Country.getTable();
            t.template1(W, temp, "Countries", new List<string>() { "id", "nameEn" , "nameAr" ,"nolon", "mainfest","add","edit","del", "close" },Global.countries, 0, 0, false);

           ((Window)W).Show();
            
        }



    }
}
