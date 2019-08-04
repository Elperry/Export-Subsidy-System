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
        public static List<lang> langs = new List<lang>()
        {
            new lang("EN","English"),
            new lang("AR","Arabic")
        };
        public static ObservableCollection<object> countries { get; set; }
        public static ObservableCollection<MenuItemViewModel> MenuItems { get; set; }
    }
}
