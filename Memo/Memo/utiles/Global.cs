using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.ObjectModel;
using System.Windows;
using System.Windows.Input;

namespace Memo {
    public static class Global
    {
        public static List<Window> windows { get; set; } 
        public static User usr {get; set;}
        public static lang Lang { get; set; }
        public static object country { get; set; }
        public static List<lang> langs = new List<lang>()
        {
            new lang("EN","English"),
            new lang("AR","Arabic")
        };
        public static main mainWindow { get; set; }
        public static ObservableCollection<object> countries { get; set; }
        public static ObservableCollection<object> shippingCompanies { get; set; }
        public static ObservableCollection<MenuItemViewModel> MainMenu {get ; set ;  }
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
                MenuItemViewModel m = new MenuItemViewModel { Header = w.Name, Command = new CommandViewModel(method) };
                opW.Add(m);
            }
            return opW;
        }
        public static void addWindow(Window o)
        {
            windows.Add(o);
            refreshMenu();
        }
        public static void removeWindow(Window o)
        {
            windows.Remove(o);
            refreshMenu();
        }

        public static void refreshMenu()
        {
            MainMenu = new ObservableCollection<MenuItemViewModel> {
                new MenuItemViewModel
                {
                    Header = "Basic Info",
                    MenuItems = new ObservableCollection<MenuItemViewModel>
                        {
                            new MenuItemViewModel { Header = "Shipping Companies" },
                            new MenuItemViewModel { Header = "Clients" },
                            new MenuItemViewModel { Header = "Brands" },
                            new MenuItemViewModel { Header = "Countries" , Command = new CommandViewModel(mainWindow.openCountries) },
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
                new MenuItemViewModel
                {
                    Header = "Export Certificates",
                    MenuItems = new ObservableCollection<MenuItemViewModel>
                    {
                        new MenuItemViewModel {Header = "New Export Certificates"},
                        new MenuItemViewModel {Header = "Edit Export Certificates"},
                        new MenuItemViewModel {Header = "automatic Bank check Setter"}
                    }

                },
                new MenuItemViewModel
                {
                    Header = "Open Windows",
                    MenuItems = getOpenWin()

                },

            };
            
        }
    }
}
