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
        public ObservableCollection<MenuItemViewModel> MainMenuItems
        {
            get { return Global.MainMenu; }
            set { Global.MainMenu = value; }
        }
        public main()
        {
            InitializeComponent();
            object o = new object();
            template t = new template();
            Global.mainWindow = this;
            Global.refreshMenu();
            t.template2(this, ref o, "", MainMenuItems);
            DataContext = this;
            //MessageBox.Show("hi");
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
            
            foreach( Window w in Global.windows)
            {
                if(w.Name == "Countries")
                {
                    w.Show();return;
                }
            }
           
            template t = new template();
            object W = new Window();
            object country = new Country((Window)W);
            Global.countries = Country.getTable();
            t.template1(W,ref country, "Countries", new List<string>() { "nameEn", "nameAr", "nolon", "manifest", "add", "edit", "del", "close" }, Global.countries, 0, 0, false);
            Global.addWindow((Window)W);
            ((Window)W).Show();
            Global.refreshMenu();
            Menu m = (Menu)((DockPanel)this.Content).Children[0];
            m.ItemsSource = MainMenuItems;
        }
        public void openShippingCompanies()
        {

            foreach (Window w in Global.windows)
            {
                if (w.Name == "Shipping_Companies")
                {
                    w.Show(); return;
                }
            }

            template t = new template();
            object W = new Window();
            object temp = new ShippingCompany((Window)W);
            Global.countries = Country.getTable();
            t.template1(W,ref temp, "Shipping_Companies", new List<string>() { "id", "nameEn", "nameAr", "nolon", "mainfest", "add", "edit", "del", "close" }, Global.countries, 0, 0, false);
            Global.addWindow((Window)W);
            ((Window)W).Show();
            Global.refreshMenu();
            Menu m = (Menu)((DockPanel)this.Content).Children[0];
            m.ItemsSource = MainMenuItems;
        }



    }
}
