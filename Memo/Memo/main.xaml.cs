﻿using System;
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

            /*//Global.clients = Client.getTable();
            //Global.countrys = Country.getTable();
            Global.companys = Company.getTable();
            Global.shippingCompanys = ShippingCompany.getTable();
            Global.ports = Port.getTable();
            Global.exportCertificates = ExportCertificate.getTable();  //Very Important
            Global.brandCats = BrandCat.getTable();
            Global.brands = Brand.getTable();*/
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
        public void openCountry()
        {
            
            foreach( Window w in Global.windows)
            {
                if(w.Name == translate.trans("Countries"))
                {
                    w.Activate();return;
                }
            }
            template t = new template();
            object W = new Window();
            object country = new Country((Window)W);
         
            t.template1(W,ref country, translate.trans("Countries"), new List<string>() { "name", "nolon", "manifest", "add", "edit", "del", "close" }, Global.countrys, 0, 0, false);
            Global.addWindow((Window)W);
            if(Global.countrys == null)
            {
                Global.countrys = Country.getTable();
            }
            if (((Country)Global.countrys[0]).id == string.Empty || ((Country)Global.countrys[0]).id == "" || ((Country)Global.countrys[0]).id == null)
            {
                Global.countrys.RemoveAt(0);
            }
            ((Window)W).Show();
        }
        public void openShippingCompany()
        {

            foreach (Window w in Global.windows)
            {
                if (w.Name == translate.trans("ShippingCompanies"))
                {
                    w.Activate(); return;
                }
            }
            template t = new template();
            object W = new Window();
            object shippingCompany = new ShippingCompany((Window)W);

            t.template1(W, ref shippingCompany, translate.trans("ShippingCompanies"), new List<string>() { "name", "email", "phone", "fax","address","notes" ,"add", "edit", "del", "close" }, Global.shippingCompanys, 0, 0, false);
            Global.addWindow((Window)W);
            if (((ShippingCompany)Global.shippingCompanys[0]).id == string.Empty || ((ShippingCompany)Global.shippingCompanys[0]).id == "" || ((ShippingCompany)Global.shippingCompanys[0]).id == null)
            {
                Global.shippingCompanys.RemoveAt(0);
            }
            ((Window)W).Show();
        }
        public void openCompany()
        {

            foreach (Window w in Global.windows)
            {
                if (w.Name == translate.trans("Companies"))
                {
                    w.Activate(); return;
                }
            }
            template t = new template();
            object W = new Window();
            object company = new Company((Window)W);

            t.template1(W, ref company, translate.trans("Companies"), new List<string>() { "name", "email", "phone", "fax", "address", "notes", "add", "edit", "del", "close" }, Global.companys, 0, 0, false);
            Global.addWindow((Window)W);
            if(Global.companys == null)
            {
                Global.companys = Company.getTable();
            }
            if (((Company)Global.companys[0]).id == string.Empty || ((Company)Global.companys[0]).id == "" || ((Company)Global.companys[0]).id == null)
            {
                Global.companys.RemoveAt(0);
            }
            ((Window)W).Show();
        }
        public void openClient()
        {

            foreach (Window w in Global.windows)
            {
                if (w.Name == translate.trans("Clients"))
                {
                    w.Activate(); return;
                }
            }
            template t = new template();
            object W = new Window();
            object client = new Client((Window)W);

            t.template1(W, ref client, translate.trans("Clients"), new List<string>() { "name", "email", "fax", "phone", "country","address", "notes", "add", "edit", "del", "close" }, Global.clients, 0, 0, false);
            Global.addWindow((Window)W);
            if(Global.clients == null)
            {
                Global.clients = Client.getTable();
            }
            if (((Client)Global.clients[0]).id == string.Empty || ((Client)Global.clients[0]).id == "" || ((Client)Global.clients[0]).id == null)
            {
                Global.clients.RemoveAt(0);
            }
            ((Window)W).Show();
        }
        public void openPort()
        {

            foreach (Window w in Global.windows)
            {
                if (w.Name == translate.trans("Ports"))
                {
                    w.Activate(); return;
                }
            }
            template t = new template();
            object W = new Window();
            object port = new Port((Window)W);
            if(Global.ports == null)
            {
                Global.ports = Port.getTable();
            }
            t.template1(W, ref port, translate.trans("Ports"), new List<string>() { "name", "notes", "add", "edit", "del", "close" }, Global.ports, 0, 0, false);
            Global.addWindow((Window)W);

            if (((Port)Global.ports[0]).id == string.Empty || ((Port)Global.ports[0]).id == "" || ((Port)Global.ports[0]).id == null)
            {
                Global.ports.RemoveAt(0);
            }
            ((Window)W).Show();
        }
        public void openBrandCat()
        {

            foreach (Window w in Global.windows)
            {
                if (w.Name == translate.trans("Brand Categories"))
                {
                    w.Activate(); return;
                }
            }
            template t = new template();
            object W = new Window();
            object brandCat = new BrandCat((Window)W);

            t.template1(W, ref brandCat, translate.trans("Brand Categories"), new List<string>() { "name", "add", "edit", "del", "close" }, Global.brandCats, 0, 0, false);
            Global.addWindow((Window)W);
            if(Global.brandCats == null)
            {
                Global.brandCats = BrandCat.getTable();
            }
            if (((BrandCat)Global.brandCats[0]).id == string.Empty || ((BrandCat)Global.brandCats[0]).id == "" || ((BrandCat)Global.brandCats[0]).id == null)
            {
                Global.brandCats.RemoveAt(0);
            }
            ((Window)W).Show();
        }
        public void openBrand()
        {

            foreach (Window w in Global.windows)
            {
                if (w.Name == translate.trans("Brands"))
                {
                    w.Activate(); return;
                }
            }
            template t = new template();
            object W = new Window();
            object brand = new Brand((Window)W);

            t.template1(W, ref brand, translate.trans("Brands"), new List<string>() { "name","brandCat", "supportPercentage", "add", "edit", "del", "close" }, Global.brands, 0, 0, false);
            Global.addWindow((Window)W);
            if(Global.brands == null)
            {
                Global.brands = Brand.getTable();
            }
            if (((Brand)Global.brands[0]).id == string.Empty || ((Brand)Global.brands[0]).id == "" || ((Brand)Global.brands[0]).id == null)
            {
                Global.brands.RemoveAt(0);
            }
            ((Window)W).Show();
        }
        public void openExportCer()
        {

            foreach (Window w in Global.windows)
            {
                if (w.Name == translate.trans(" Export Certificates"))
                {
                    w.Activate(); return;
                }
            }
            template t = new template();
            object W = new Window();
            object exportCertificate = new ExportCertificate((Window)W);
            List<Property> P = new List<Property>()
            {
                new Property("num","txt",""),
                new Property("dat","date"),
                new Property("country","cmb"),
                new Property("port","cmb"),
                new Property("shippingCompany","cmb"),
                new Property("usdToEgp","txt"),
                new Property("boles"),
                new Property("bankReciete"),
                new Property("nolon","bool","country.nolon"),
                new Property("manifesto","bool","country.manifest"),
                new Property("submitDate","date"),
                new Property("accrualDate","date"),
                new Property("usdVal","txt",_readOnly:true),
                new Property("egpVal","txt",_readOnly:true),
                new Property("PTREgp","txt",_readOnly:true),
                new Property("ptr_nolon_man","txt",_readOnly:true),
                new Property("totalEgp","txt",_readOnly:true),

            };
            if(Global.companys == null)
            {
                Global.companys = Company.getTable();
            }
            if(Global.usr.admin)
            {
                InputDialogSample inputDialog = new InputDialogSample(translate.trans("Please Select Company :"), Global.companys);
                if (inputDialog.ShowDialog() == true)
                {
                     Global.company =(Company)inputDialog.Answer;
                }
                else
                {
                    return;
                }
                if(Global.company == null)
                {
                    return;
                }
                   
            }
            if (Global.exportCertificates == null)
            {
                Global.exportCertificates = ExportCertificate.getTable();
                Global.countrys = Country.getTable();
                Global.shippingCompanys = ShippingCompany.getTable();
                Global.ports = Port.getTable();
            }
            t.Moderntemplate(W, ref exportCertificate, translate.trans(" Export Certificates"), P, new List<string>() { "add", "edit", "del", "openInvoice", "close" }, Global.exportCertificates, 0, 0, false);
            Global.addWindow((Window)W);
            ((Window)W).Show();
            //MessageBox.Show("++"+((ExportCertificate)Global.exportCertificates[0]).num+"++");

            if (((ExportCertificate)Global.exportCertificates[0]).num == string.Empty || ((ExportCertificate)Global.exportCertificates[0]).num == "" || ((ExportCertificate)Global.exportCertificates[0]).num == null)
            {
                Global.exportCertificates.RemoveAt(0);
            }
            
        }
        public void openUser()
        {

            foreach (Window w in Global.windows)
            {
                if (w.Name == translate.trans("Users"))
                {
                    w.Activate(); return;
                }
            }
            template t = new template();
            object W = new Window();
            object users = new Users((Window)W);
            if (Global.users == null || Global.users.Count == 0)
            {
                Global.users = Users.getTable();
                Global.companys = Company.getTable();
            }
            t.template1(W, ref users, translate.trans("Users"), new List<string>() { "name", "email","pass","company","admin","add", "edit", "del", "close" }, Global.users, 0, 0, false);
            Global.addWindow((Window)W);

            if (((Users)Global.users[0]).id == string.Empty || ((Users)Global.users[0]).id == "" || ((Users)Global.users[0]).id == null)
            {
                Global.users.RemoveAt(0);
            }
            ((Window)W).Show();
        }
        public void openFileNo()
        {

            foreach (Window w in Global.windows)
            {
                if (w.Name == translate.trans("FileNo"))
                {
                    w.Activate(); return;
                }
            }
            template t = new template();
            object W = new Window();
            object fileNo = new FileNo((Window)W);
            if (Global.fileNos == null || Global.fileNos.Count == 0)
            {
                Global.fileNos = FileNo.getTable();
                Global.exportCertificates = ExportCertificate.getTable();
            }
            List<Property> P = new List<Property>()
            {
                new Property("num","num"),
                new Property("dat","date"),
                new Property("exportCertificate","cmb"),
            };
            t.Moderntemplate(W, ref fileNo, translate.trans("FileNo"), P,new List<string>() {"add", "edit", "del", "close" }, Global.fileNos, 0, 0, false);
            Global.addWindow((Window)W);

            if (((FileNo)Global.fileNos[0]).id == string.Empty || ((FileNo)Global.fileNos[0]).id == "" || ((FileNo)Global.fileNos[0]).id == null)
            {
                Global.fileNos.RemoveAt(0);
            }
            ((Window)W).Show();
        }
        private void Login_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            close();
        }
    }
}
