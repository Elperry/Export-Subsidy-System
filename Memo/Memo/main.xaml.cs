
using System.Collections.Generic;

using System.Windows;

using System.Collections.ObjectModel;



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
                if(w.Title == translate.trans("Countries"))
                {
                    w.Activate();return;
                }
            }
            template t = new template();
            object W = new Window();
            object country = new Country((Window)W);
            if(Global.countrys == null)
            {
                Global.countrys = Country.getTable();
            }
            t.template1(W,ref country, translate.trans("Countries"), new List<string>() { "name", "nolon", "manifest", "add", "edit", "del", "close" }, Global.countrys, 0, 0, false);
            Global.addWindow((Window)W);

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
                if (w.Title == translate.trans("ShippingCompanies"))
                {
                    w.Activate(); return;
                }
            }
            template t = new template();
            object W = new Window();
            object shippingCompany = new ShippingCompany((Window)W);
            Global.shippingCompanys = ShippingCompany.getTable();
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
                if (w.Title == translate.trans("Companies"))
                {
                    w.Activate(); return;
                }
            }
            template t = new template();
            object W = new Window();
            object company = new Company((Window)W);
            Global.companys = Company.getTable();
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

            if (Global.companys == null)
            {
                Global.companys = Company.getTable();
            }
            if (Global.usr.admin)
            {
                InputDialogSample inputDialog = new InputDialogSample(translate.trans("Please Select Company :"), Global.companys);
                if (inputDialog.ShowDialog() == true)
                {
                    Global.company = (Company)inputDialog.Answer;
                }
                else
                {
                    return;
                }
                if (Global.company == null)
                {
                    return;
                }

            }
            foreach (Window w in Global.windows)
            {
                if (w.Title == translate.trans("Clients"))
                {
                    w.Activate(); return;
                }
            }
            template t = new template();
            object W = new Window();
            object client = new Client((Window)W);
            Global.clients = Client.getTable();
            Global.countrys = Country.getTable();
            if (Global.clients == null)
            {
                
            }
            t.template1(W, ref client, translate.trans("Clients"), new List<string>() { "name", "email", "fax", "phone", "country","address", "notes", "add", "edit", "del", "close" }, Global.clients, 0, 0, false);
            Global.addWindow((Window)W);

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
                if (w.Title == translate.trans("Ports"))
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
                if (w.Title == translate.trans("Brand Categories"))
                {
                    w.Activate(); return;
                }
            }
            template t = new template();
            object W = new Window();
            object brandCat = new BrandCat((Window)W);
            if (Global.companys == null)
            {
                Global.companys = Company.getTable();
            }
            if (Global.usr.admin)
            {
                InputDialogSample inputDialog = new InputDialogSample(translate.trans("Please Select Company :"), Global.companys);
                if (inputDialog.ShowDialog() == true)
                {
                    Global.company = (Company)inputDialog.Answer;
                }
                else
                {
                    return;
                }
                if (Global.company == null)
                {
                    return;
                }

            }
            Global.brandCats = BrandCat.getTable();
            t.template1(W, ref brandCat, translate.trans("Brand Categories"), new List<string>() { "name", "add", "edit", "del", "close" }, Global.brandCats, 0, 0, false);
            Global.addWindow((Window)W);
 
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
                if (w.Title == translate.trans("Brands"))
                {
                    w.Activate(); return;
                }
            }
            template t = new template();
            object W = new Window();
            object brand = new Brand((Window)W);
            if (Global.companys == null)
            {
                Global.companys = Company.getTable();
            }
            if (Global.usr.admin)
            {
                InputDialogSample inputDialog = new InputDialogSample(translate.trans("Please Select Company :"), Global.companys);
                if (inputDialog.ShowDialog() == true)
                {
                    Global.company = (Company)inputDialog.Answer;
                }
                else
                {
                    return;
                }
                if (Global.company == null)
                {
                    return;
                }

            }
            Global.brands = Brand.getTable();
            Global.brandCats = BrandCat.getTable();
            t.template1(W, ref brand, translate.trans("Brands"), new List<string>() { "name","brandCat", "supportPercentage", "add", "edit", "del", "close" }, Global.brands, 0, 0, false);
            Global.addWindow((Window)W);

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
                if (w.Title == translate.trans("Export Certificates"))
                {
                    w.Activate(); return;
                }
            }
            template t = new template();
            object W = new Window();
            object exportCertificate = new ExportCertificate((Window)W);
            List<Property> P = new List<Property>()
            {
                new Property("num","txt",_action:"select"),
                new Property("dat","date"),
                new Property("country","cmb"),
                new Property("port","cmb"),
                new Property("shippingCompany","cmb"),
                new Property("usdToEgp","txt"),
                new Property("boles"),
                new Property("nolon","num","country.nolon"),
                new Property("manifesto","bool","country.manifest"),
                new Property("receiptDate","date"),
                new Property("manualWork","bool"),
                new Property("PTREgp","txt",_readOnly:true),
                new Property("ptr_nolon_man","txt",_readOnly:true),
                new Property("totalEgp","txt",_readOnly:true),
                new Property("notes","txt"),

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

            Global.countrys = Country.getTable();
            Global.shippingCompanys = ShippingCompany.getTable();
            Global.ports = Port.getTable();
            Global.exportCertificates = ExportCertificate.getTable();
            t.Moderntemplate(W, ref exportCertificate, translate.trans("Export Certificates"), P, new List<string>() { "add", "edit", "del", "openInvoice","clear", "close" }, Global.exportCertificates,null, 0, 0, false);
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
                if (w.Title == translate.trans("Users"))
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
            List<Property> P = new List<Property>()
            {
                new Property("name"),
                new Property("email"),
                new Property("pass"),
                new Property("company"),
                new Property("admin","bool",_action:"chckClicked")
            };
            t.Moderntemplate(W, ref users, translate.trans("Users"),P, new List<string>() {"add", "edit", "del", "close" }, Global.users,parent:false);
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
                if (w.Title == translate.trans("FileNo"))
                {
                    w.Activate(); return;
                }
            }

            if (Global.usr.admin)
            {
                if (Global.companys == null)
                {
                    Global.companys = Company.getTable();
                }
                InputDialogSample inputDialog = new InputDialogSample(translate.trans("Please Select Company :"), Global.companys);
                if (inputDialog.ShowDialog() == true)
                {
                    Global.company = (Company)inputDialog.Answer;
                }
                else
                {
                    return;
                }
                if (Global.company == null)
                {
                    return;
                }

            }
            template t = new template();
            object W = new Window();
            object fileNo = new FileNo((Window)W);
            Global.fileNos = FileNo.getTable();
            //Global.exportCertificates = ExportCertificate.getTable();

            List<Property> P = new List<Property>()
            {
                new Property("num","txt"),
                new Property("dat","date"),
                new Property("exportCertificate","cmb",_displayPath : "num"),
            };
            List<TableCol> tbcs = new List<TableCol>()
            {
                new TableCol("num","num"),
                new TableCol("dat","dat"),
                new TableCol("exportCertificate","exportCertificate.num"),
            };
            t.Moderntemplate(W, ref fileNo, translate.trans("FileNo"), P,new List<string>() {"add", "edit", "del", "close" }, Global.fileNos, tbcs,0, 0, false);
            Global.addWindow((Window)W);

            if (((FileNo)Global.fileNos[0]).id == string.Empty || ((FileNo)Global.fileNos[0]).id == "" || ((FileNo)Global.fileNos[0]).id == null)
            {
                Global.fileNos.RemoveAt(0);
            }
            ((Window)W).Show();
        }
        public void openBankReceipt()
        {

            foreach (Window w in Global.windows)
            {
                if (w.Title == translate.trans("BankReceipt"))
                {
                    w.Activate(); return;
                }
            }
            if (Global.usr.admin)
            {
                if (Global.companys == null)
                {
                    Global.companys = Company.getTable();
                }
                InputDialogSample inputDialog = new InputDialogSample(translate.trans("Please Select Company :"), Global.companys);
                if (inputDialog.ShowDialog() == true)
                {
                    Global.company = (Company)inputDialog.Answer;
                }
                else
                {
                    return;
                }
                if (Global.company == null)
                {
                    return;
                }

            }
            template t = new template();
            object W = new Window();
            object bankReceipt = new BankReceipt((Window)W);
                Global.bankReceipts = BankReceipt.getTable();
                Global.countrys = Country.getTable();

            List<Property> P = new List<Property>()
            {
                new Property("num","txt",_action:"select"),
                new Property("country","cmb",_displayPath:"name"),
                new Property("usd","num"),
                new Property("dat","date"),
            };
            List<TableCol> tbcs = new List<TableCol>()
            {
                new TableCol("num","num"),
                new TableCol("client","client.name"),
                new TableCol("usd","usd"),
                new TableCol("dat","dat"),
            };
            t.Moderntemplate(W, ref bankReceipt, translate.trans("BankReceipt"), P, new List<string>() { "add", "edit", "del", "openBankReceiptData", "close" }, Global.bankReceipts, tbcs, 0, 0, false);
            Global.addWindow((Window)W);

            if (((BankReceipt)Global.bankReceipts[0]).id == string.Empty || ((BankReceipt)Global.bankReceipts[0]).id == "" || ((BankReceipt)Global.bankReceipts[0]).id == null)
            {
                Global.bankReceipts.RemoveAt(0);
            }
           ((Window)W).Show();
        }
        public void openCheque()
        {

            foreach (Window w in Global.windows)
            {
                if (w.Title == translate.trans("Cheque"))
                {
                    w.Activate(); return;
                }
            }
            if (Global.usr.admin)
            {
                if (Global.companys == null)
                {
                    Global.companys = Company.getTable();
                }
                InputDialogSample inputDialog = new InputDialogSample(translate.trans("Please Select Company :"), Global.companys);
                if (inputDialog.ShowDialog() == true)
                {
                    Global.company = (Company)inputDialog.Answer;
                }
                else
                {
                    return;
                }
                if (Global.company == null)
                {
                    return;
                }

            }
            template t = new template();
            object W = new Window();
            object cheque = new Cheque((Window)W);
            Global.cheques = Cheque.getTable();
            if (Global.cheques == null || Global.cheques.Count == 0)
            {
                
                Global.exportCertificates = ExportCertificate.getTable();
            }
            List<Property> P = new List<Property>()
            {
                new Property("num","txt"),
                new Property("valueEgp","num"),
                new Property("dat","date"),
            };
            List<TableCol> tbcs = new List<TableCol>()
            {
                new TableCol("num","num"),
                new TableCol("valueEgp","valueEgp"),
                new TableCol("dat","dat"),
            };
            t.Moderntemplate(W, ref cheque, translate.trans("Cheque"), P, new List<string>() { "add", "edit", "del", "openChequeData", "close" }, Global.cheques, tbcs, 0, 0, false);
            Global.addWindow((Window)W);

            if (((Cheque)Global.cheques[0]).id == string.Empty || ((Cheque)Global.cheques[0]).id == "" || ((Cheque)Global.cheques[0]).id == null)
            {
                Global.cheques.RemoveAt(0);
            }
           ((Window)W).Show();
        }
        public void openBooked()
        {

            foreach (Window w in Global.windows)
            {
                if (w.Title == translate.trans("Booked"))
                {
                    w.Activate(); return;
                }
            }
            if (Global.usr.admin)
            {
                if (Global.companys == null)
                {
                    Global.companys = Company.getTable();
                }
                InputDialogSample inputDialog = new InputDialogSample(translate.trans("Please Select Company :"), Global.companys);
                if (inputDialog.ShowDialog() == true)
                {
                    Global.company = (Company)inputDialog.Answer;
                }
                else
                {
                    return;
                }
                if (Global.company == null)
                {
                    return;
                }

            }
            template t = new template();
            object W = new Window();
            object booked = new Booked((Window)W);
            Global.bookeds = Booked.getTable();
            if (Global.bookeds == null || Global.bookeds.Count == 0)
            {
                Global.bookeds = Booked.getTable();
                Global.exportCertificates = ExportCertificate.getTable();
            }
            List<Property> P = new List<Property>()
            {
                new Property("id","num" , _readOnly:true),
                new Property("valueEgp","num"),
                new Property("dat","date"),
            };
            List<TableCol> tbcs = new List<TableCol>()
            {
                new TableCol("id","id"),
                new TableCol("valueEgp","valueEgp"),
                new TableCol("dat","dat"),
            };
            t.Moderntemplate(W, ref booked, translate.trans("Booked"), P, new List<string>() { "add", "edit", "del", "close" }, Global.bookeds, tbcs, 0, 0, false);
            Global.addWindow((Window)W);

            if (((Booked)Global.bookeds[0]).id == string.Empty || ((Booked)Global.bookeds[0]).id == "" || ((Booked)Global.bookeds[0]).id == null)
            {
                Global.bookeds.RemoveAt(0);
            }
           ((Window)W).Show();
        }
        public void openEstiva()
        {

            foreach (Window w in Global.windows)
            {
                if (w.Title == translate.trans("Estiva"))
                {
                    w.Activate(); return;
                }
            }
            if (Global.usr.admin)
            {
                if (Global.companys == null)
                {
                    Global.companys = Company.getTable();
                }
                InputDialogSample inputDialog = new InputDialogSample(translate.trans("Please Select Company :"), Global.companys);
                if (inputDialog.ShowDialog() == true)
                {
                    Global.company = (Company)inputDialog.Answer;
                }
                else
                {
                    return;
                }
                if (Global.company == null)
                {
                    return;
                }

            }
            template t = new template();
            object W = new Window();
            object estiva = new Estiva((Window)W);
            Global.estivas = Estiva.getTable();
            Global.exportCertificates = ExportCertificate.getTable();

            List<Property> P = new List<Property>()
            {
                new Property("id","num" , _readOnly:true),
                 new Property("exportCertificate","cmb",_displayPath : "num"),
                new Property("dat","date"),
                new Property("note","txt"),
            };
            List<TableCol> tbcs = new List<TableCol>()
            {
                new TableCol("id","id"),
                new TableCol("exportCertificate","exportCertificate.num"),
                new TableCol("dat","dat"),
                new TableCol("note","note"),
            };
            t.Moderntemplate(W, ref estiva, translate.trans("Estiva"), P, new List<string>() { "add", "edit", "del", "close" }, Global.estivas, tbcs, 0, 0, false);
            Global.addWindow((Window)W);

            if (((Estiva)Global.estivas[0]).id == string.Empty || ((Estiva)Global.estivas[0]).id == "" || ((Estiva)Global.estivas[0]).id == null)
            {
                Global.estivas.RemoveAt(0);
            }
   ((Window)W).Show();
        }
        private void Login_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            close();
        }
        public void openReportViewer()
        {
            if (Global.companys == null)
            {
                Global.companys = Company.getTable();
            }
            if (Global.usr.admin)
            {
                InputDialogSample inputDialog = new InputDialogSample(translate.trans("Please Select Company :"), Global.companys);
                if (inputDialog.ShowDialog() == true)
                {
                    Global.company = (Company)inputDialog.Answer;
                }
                else
                {
                    return;
                }
                if (Global.company == null)
                {
                    return;
                }

            }
            foreach (Window w in Global.windows)
            {
                if (w.Title == translate.trans("Report Viewer"))
                {
                    w.Activate(); return;
                }
            }
            template t = new template();
            object W = new Window();
            object reportViewerPage = new ReportViewerPage((Window)W);
            List<Property> P = new List<Property>()
            {
                new Property("repoName","cmb",_action:"onReportNameChange"),
                new Property("col","cmb",_action:"onColChange"),
                new Property("op","cmb" , _action:"onOpChange"),
                new Property("value","txt","isText"),
                new Property("value2","txt","isBetweenV"),
                new Property("date1","date","isDate"),
                new Property("date2","date","isBetween"),
                new Property("pageSetup", "cmb"),
                new Property("cond","txt",_readOnly:true),
                
            };
           
            t.Moderntemplate(W, ref reportViewerPage, translate.trans("Report Viewer"), P, new List<string>() { "addCondition", "showReport", "clear","close" },null, null, 0, 0, false);
            Global.addWindow((Window)W);
            ((Window)W).Show();


        }

        public void openReports()
        {
            ReportsWindow rw = new ReportsWindow();
            rw.Show();
            
        }
    }
}
