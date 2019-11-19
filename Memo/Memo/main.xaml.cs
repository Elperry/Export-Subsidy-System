using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Linq;
using System.Windows;
using System.Threading;
using Microsoft.Win32;
using System.Runtime.InteropServices;
using Excel = Microsoft.Office.Interop.Excel;
using System.Text;
using System.Diagnostics;

namespace Memo
{
    /// <summary>
    /// Interaction logic for main.xaml
    /// </summary>
    /// 

    public partial class main : Window
    {

        public int WorkingThreads=0;
        static object locker = new object();
        public Thread thr; LoadingWait ld;
        public ObservableCollection<MenuItemViewModel> MainMenuItems
        {
            get { return Global.MainMenu; }
            set { Global.MainMenu = value; }
        }
        public main()
        {
            InitializeComponent();

            try
            {
                object o = new object();
                template t = new template();
                Global.mainWindow = this;
                Global.refreshMenu();
                t.template2(this, ref o, "", MainMenuItems);
                DataContext = this;
                getData();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
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
        public void getData()
        {
            WorkingThreads = 15;

            try
            {
                ld = Global.Busy(this);

                Thread us = new Thread(() =>
                {
                    try
                    {
                        if (Global.usr.admin)
                        {
                            Global.users = Users.getTable();
                        }
                        else
                        {
                            Global.users = new ObservableCollection<object>();
                            Global.users.Add(Global.usr);
                        }
                        Monitor.Enter(locker);
                        WorkingThreads--;
                        if (WorkingThreads == 0)
                        {
                            this.Dispatcher.Invoke(() =>
                            {
                                ld.Close();
                            });
                        }
                        Monitor.Exit(locker);
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Error in Retriving users !!!\n"+ex.ToString());
                        WorkingThreads--;
                        if (WorkingThreads == 0)
                        {
                            this.Dispatcher.Invoke(() =>
                            {
                                ld.Close();
                            });
                        }
                        Monitor.Exit(locker);
                    }
                }); // For users
                Thread cl = new Thread(() =>
                {
                    try
                    {
                        if (Global.usr.admin)
                        {
                            Global.clients = Client.getTable();
                        }
                        else
                        {
                            Global.clients = Client.getTable(Global.company);
                        }
                        Monitor.Enter(locker);
                        WorkingThreads--;
                        if (WorkingThreads == 0)
                        {
                            this.Dispatcher.Invoke(() =>
                            {
                                ld.Close();
                            });
                        }
                        Monitor.Exit(locker);
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Erro in retriving Clients !!!\n"+ex.ToString());
                        WorkingThreads--;
                        if (WorkingThreads == 0)
                        {
                            this.Dispatcher.Invoke(() =>
                            {
                                ld.Close();
                            });
                        }
                        Monitor.Exit(locker);
                    }
                }); // For Clients
                Thread po = new Thread(() =>
                {
                    try
                    {
                        Global.ports = Port.getTable();
                        Monitor.Enter(locker);
                        WorkingThreads--;
                        if (WorkingThreads == 0)
                        {
                            this.Dispatcher.Invoke(() =>
                            {
                                ld.Close();
                            });
                        }
                        Monitor.Exit(locker);
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Error in retreiving Ports!!!\n" + ex.ToString());
                        WorkingThreads--;
                        if (WorkingThreads == 0)
                        {
                            this.Dispatcher.Invoke(() =>
                            {
                                ld.Close();
                            });
                        }
                        Monitor.Exit(locker);

                    }
                }); // For Ports
                Thread br = new Thread(() =>
                {
                    try
                    {
                        if (Global.usr.admin)
                        {
                            Global.brands = Brand.getTable();
                        }
                        else
                        {
                            Global.brands = Brand.getTable(Global.company);
                        }
                        Monitor.Enter(locker);
                        WorkingThreads--;
                        if (WorkingThreads == 0)
                        {
                            this.Dispatcher.Invoke(() =>
                            {
                                ld.Close();
                            });
                        }
                        Monitor.Exit(locker);
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Error in Retreiving Brands!!! \n" + ex.ToString());
                        WorkingThreads--;
                        if (WorkingThreads == 0)
                        {
                            this.Dispatcher.Invoke(() =>
                            {
                                ld.Close();
                            });
                        }
                        Monitor.Exit(locker);
                    }
                }); // For Brands
                Thread brCat = new Thread(() =>
                {
                    try
                    {
                        if (Global.usr.admin)
                        {
                            Global.brandCats = BrandCat.getTable();
                        }
                        else
                        {
                            Global.brandCats = BrandCat.getTable(Global.company);
                        }
                        Monitor.Enter(locker);
                        WorkingThreads--;
                        if (WorkingThreads == 0)
                        {
                            this.Dispatcher.Invoke(() =>
                            {
                                ld.Close();
                            });
                        }
                        Monitor.Exit(locker);
                        br.Start();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Error in Retreiving Brand Categories!!!\n" + ex.ToString());
                        WorkingThreads--;
                        if (WorkingThreads == 0)
                        {
                            this.Dispatcher.Invoke(() =>
                            {
                                ld.Close();
                            });
                        }
                        Monitor.Exit(locker);
                        br.Start();
                    }
                }); // For brandCat
                Thread ship = new Thread(() =>
                {
                    try
                    {
                        Global.shippingCompanys = ShippingCompany.getTable();
                        Monitor.Enter(locker);
                        WorkingThreads--;
                        if (WorkingThreads == 0)
                        {
                            this.Dispatcher.Invoke(() =>
                            {
                                ld.Close();
                            });
                        }
                        Monitor.Exit(locker);
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Error in Retreiving Shipping Companies!!\n" + ex.ToString());
                        WorkingThreads--;
                        if (WorkingThreads == 0)
                        {
                            this.Dispatcher.Invoke(() =>
                            {
                                ld.Close();
                            });
                        }
                        Monitor.Exit(locker);
                    }
                }); // for Shipping Companies
                Thread comm = new Thread(() =>
                {
                    try
                    {
                        if (Global.usr.admin)
                        {
                            Global.committees = Committee.getTable();
                        }
                        else
                        {
                            Global.committees = Committee.getTable(Global.company);
                        }
                        Monitor.Enter(locker);
                        WorkingThreads--;
                        if (WorkingThreads == 0)
                        {
                            this.Dispatcher.Invoke(() =>
                            {
                                ld.Close();
                            });
                        }
                        Monitor.Exit(locker);
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Error in Retreiving Committees!!\n" + ex.ToString());
                        WorkingThreads--;
                        if (WorkingThreads == 0)
                        {
                            this.Dispatcher.Invoke(() =>
                            {
                                ld.Close();
                            });
                        }
                        Monitor.Exit(locker);
                    }

                }); // for Committies
                Thread fno = new Thread(() =>
                {
                    try
                    {
                        if (Global.usr.admin)
                        {
                            Global.fileNos = FileNo.getTable();
                        }
                        else
                        {
                            Global.fileNos = FileNo.getTable(Global.company);
                        }
                        Monitor.Enter(locker);
                        WorkingThreads--;
                        if (WorkingThreads == 0)
                        {
                            this.Dispatcher.Invoke(() =>
                            {
                                ld.Close();
                            });
                        }
                        Monitor.Exit(locker);
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Error in Retreiving File Numbers!!!\n" + ex.ToString());
                        WorkingThreads--;
                        if (WorkingThreads == 0)
                        {
                            this.Dispatcher.Invoke(() =>
                            {
                                ld.Close();
                            });
                        }
                        Monitor.Exit(locker);
                    }
                }); // for File Nos
                Thread ch = new Thread(() =>
                {
                    try
                    {
                        if (Global.usr.admin)
                        {
                            Global.cheques = Cheque.getTable();
                        }
                        else
                        {
                            Global.cheques = Cheque.getTable();
                        }
                        Monitor.Enter(locker);
                        WorkingThreads--;
                        if (WorkingThreads == 0)
                        {
                            this.Dispatcher.Invoke(() =>
                            {
                                ld.Close();
                            });
                        }
                        Monitor.Exit(locker);
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Error in Retreiving Cheques!!!\n" + ex.ToString());
                        WorkingThreads--;
                        if (WorkingThreads == 0)
                        {
                            this.Dispatcher.Invoke(() =>
                            {
                                ld.Close();
                            });
                        }
                        Monitor.Exit(locker);
                    }
                }); // for Cheque
                Thread bank = new Thread(() =>
                {
                    try
                    {
                        if (Global.usr.admin)
                        {
                            Global.bankReceipts = BankReceipt.getTable();
                        }
                        else
                        {
                            Global.bankReceipts = BankReceipt.getTable(Global.company);
                        }
                        Monitor.Enter(locker);
                        WorkingThreads--;
                        if (WorkingThreads == 0)
                        {
                            this.Dispatcher.Invoke(() =>
                            {
                                ld.Close();
                            });
                        }
                        Monitor.Exit(locker);
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Error in Retreiving Bank Receipts!!!\n" + ex.ToString());
                        if (WorkingThreads == 0)
                        {
                            this.Dispatcher.Invoke(() =>
                            {
                                ld.Close();
                            });
                        }
                        Monitor.Exit(locker);
                    }
                }); // for Bank Reciept
                Thread count = new Thread(() =>
                {
                    try
                    {
                        Global.countrys = Country.getTable();
                        Monitor.Enter(locker);
                        WorkingThreads--;
                        if (WorkingThreads == 0)
                        {
                            this.Dispatcher.Invoke(() =>
                            {
                                ld.Close();
                            });
                        }
                        Monitor.Exit(locker);
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Error in Retreiving Countries!!!\n" + ex.ToString());
                        Global.countrys = Country.getTable();
                        Monitor.Enter(locker);
                        WorkingThreads--;
                        if (WorkingThreads == 0)
                        {
                            this.Dispatcher.Invoke(() =>
                            {
                                ld.Close();
                            });
                        }
                        Monitor.Exit(locker);
                    }
                }); // for Countries
                Thread bo = new Thread(() =>
                {
                    try
                    {
                        if (Global.usr.admin)
                        {
                            Global.bookeds = Booked.getTable();
                        }
                        else
                        {
                            Global.bookeds = Booked.getTable(Global.company);
                        }
                        Monitor.Enter(locker);
                        WorkingThreads--;
                        if (WorkingThreads == 0)
                        {
                            this.Dispatcher.Invoke(() =>
                            {
                                ld.Close();
                            });
                        }
                        Monitor.Exit(locker);
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Error in Retreiving Bookeds!!!\n" + ex.ToString());
                        WorkingThreads--;
                        if (WorkingThreads == 0)
                        {
                            this.Dispatcher.Invoke(() =>
                            {
                                ld.Close();
                            });
                        }
                        Monitor.Exit(locker);
                    }
                }); // For booked
                Thread sti = new Thread(() =>
                {
                    try
                    {

                        if (Global.usr.admin)
                        {
                            Global.estivas = Estiva.getTable();
                        }
                        else
                        {
                            Global.estivas = Estiva.getTable(Global.company);
                        }
                        Monitor.Enter(locker);
                        WorkingThreads--;
                        if (WorkingThreads == 0)
                        {
                            this.Dispatcher.Invoke(() =>
                            {
                                ld.Close();
                            });
                        }
                        Monitor.Exit(locker);
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Error in Retreiving Estivas!!!\n" + ex.ToString());
                        WorkingThreads--;
                        if (WorkingThreads == 0)
                        {
                            this.Dispatcher.Invoke(() =>
                            {
                                ld.Close();
                            });
                        }
                        Monitor.Exit(locker);
                    }
                }); // For Stiva
                Thread export = new Thread(() =>
                {
                    try
                    {
                        while (WorkingThreads != 1)
                        {
                            Thread.Sleep(200);
                        }
                        if (Global.usr.admin)
                        {
                            Global.exportCertificates = ExportCertificate.getTable();
                        }
                        else
                        {
                            Global.exportCertificates = ExportCertificate.getTable(Global.company);
                        }
                        Monitor.Enter(locker);
                        WorkingThreads--;
                        if (WorkingThreads == 0)
                        {
                            App.Current.Dispatcher.Invoke(() =>
                            {
                                ld.Close();
                            });

                        }
                        Monitor.Exit(locker);
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Error in Retreiving Export Cerificates !!!\n" + ex.ToString());
                        WorkingThreads--;
                        if (WorkingThreads == 0)
                        {
                            App.Current.Dispatcher.Invoke(() =>
                            {
                                ld.Close();
                            });

                        }
                        Monitor.Exit(locker);
                    }
                }); // for export certificate
                Thread comps = new Thread(() =>
                {
                    try
                    {
                        if (Global.usr.admin)
                        {
                            Global.companys = Company.getTable();
                            try
                            {
                                Global.company = (Company)Global.companys.Where(cc => (Company)cc == Global.company);
                            }
                            catch (Exception)
                            {

                            }

                        }
                        else
                        {
                            Global.companys = new ObservableCollection<object>();
                            Global.companys.Add(Global.company);
                        }
                        try
                        {
                            Global.company = (Company)Global.companys.Where(cc => ((Company)cc).id == Global.company.id).First();
                        }
                        catch (Exception)
                        {
                            //throw;
                        }

                        Monitor.Enter(locker);
                        WorkingThreads--;
                        if (WorkingThreads == 0)
                        {
                            this.Dispatcher.Invoke(() =>
                            {
                                ld.Close();
                            });
                        }
                        Monitor.Exit(locker);
                        comm.Start();
                        cl.Start();
                        po.Start();
                        brCat.Start();
                        ship.Start();
                        fno.Start();
                        ch.Start();
                        bank.Start();
                        count.Start();
                        bo.Start();
                        sti.Start();
                        export.Start();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Error in starting Threads || in Companies !!!\n" + ex.ToString());
                    }
                }); // For Companies
                comps.Name = "Companies";
                us.Name = "Users";
                cl.Name = "Clients";
                po.Name = "Ports";
                brCat.Name = "BrandCats";
                br.Name = "Brands";
                ship.Name = "ShippingCompanies";
                comm.Name = "Committees";
                fno.Name = "FileNos";
                ch.Name = "Cheques";
                bank.Name = "BankReceipts";
                count.Name = "Countries";
                bo.Name = "Bookeds";
                sti.Name = "Estivas";
                export.Name = "ExportCertificates";
                comps.Start();
                us.Start();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
                try
                {
                    ld.Close();
                }
                catch (Exception)
                {

                   // throw;
                }
            }

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
            LoadingWait ld = Global.Busy(this);
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
            t.template1(W,ref country, translate.trans("Countries"), new List<string>() { "name", "nolon", "manifest", "add", "edit", "del", "close" }, Global.countrys, 0, 0, false);
            Global.addWindow((Window)W);
            if (((Country)Global.countrys[0]).id == string.Empty || ((Country)Global.countrys[0]).id == "" || ((Country)Global.countrys[0]).id == null)
            {
                Global.countrys.RemoveAt(0);
            }
            ((Window)W).Show();
            ld.Close();
        }
        public void openShippingCompany()
        {
            LoadingWait ld = Global.Busy(this);
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
            t.template1(W, ref shippingCompany, translate.trans("ShippingCompanies"), new List<string>() { "name", "email", "phone", "fax","address","notes" ,"add", "edit", "del", "close" }, Global.shippingCompanys, 0, 0, false);
            Global.addWindow((Window)W);
            if (((ShippingCompany)Global.shippingCompanys[0]).id == string.Empty || ((ShippingCompany)Global.shippingCompanys[0]).id == "" || ((ShippingCompany)Global.shippingCompanys[0]).id == null)
            {
                Global.shippingCompanys.RemoveAt(0);
            }
            ((Window)W).Show();
            ld.Close();
        }
        public void openCompany()
        {
            LoadingWait ld = Global.Busy(this);
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
            ld.Close();
        }
        public void openClient()
        {
            
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
            LoadingWait ld = Global.Busy(this);
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
            ((Client)client).clients =new ObservableCollection<object>(Global.clients.Where(cc=>((Client)cc).company == Global.company));
            if (((Client)client).clients.Count == 0) { ((Client)client).clients.Add(new Client()); }
            t.template1(W, ref client, translate.trans("Clients"), new List<string>() { "name", "email", "fax", "phone", "country","address", "notes", "add", "edit", "del", "close" }, ((Client)client).clients, 0, 0, false);
            Global.addWindow((Window)W);
            if (((Client)((Client)client).clients[0]).id == string.Empty || ((Client)((Client)client).clients[0]).id == "" || ((Client)((Client)client).clients[0]).id == null)
            {
                ((Client)client).clients.RemoveAt(0);
            }
            ((Window)W).Show();
            ld.Close();
        }
        public void openPort()
        {
            LoadingWait ld = Global.Busy(this);
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
            t.template1(W, ref port, translate.trans("Ports"), new List<string>() { "name", "notes", "add", "edit", "del", "close" }, Global.ports, 0, 0, false);
            Global.addWindow((Window)W);
            if (((Port)Global.ports[0]).id == string.Empty || ((Port)Global.ports[0]).id == "" || ((Port)Global.ports[0]).id == null)
            {
                Global.ports.RemoveAt(0);
            }
            ((Window)W).Show();
            ld.Close();
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
            LoadingWait ld = Global.Busy(this);
            ((BrandCat)brandCat).brandCats = new ObservableCollection<object>(Global.brandCats.Where(bb => ((BrandCat)bb).company == Global.company));
            if (((BrandCat)brandCat).brandCats.Count == 0) { ((BrandCat)brandCat).brandCats.Add(new BrandCat()); }
            t.template1(W, ref brandCat, translate.trans("Brand Categories"), new List<string>() { "name", "add", "edit", "del", "close" }, ((BrandCat)brandCat).brandCats, 0, 0, false);
            Global.addWindow((Window)W);
 
            if (((BrandCat)((BrandCat)brandCat).brandCats[0]).id == string.Empty || ((BrandCat)((BrandCat)brandCat).brandCats[0]).id == "" || ((BrandCat)((BrandCat)brandCat).brandCats[0]).id == null)
            {
                ((BrandCat)brandCat).brandCats.RemoveAt(0);
            }
            ((Window)W).Show();
            ld.Close();
        }
        public void openCommittee()
        {
           
            foreach (Window w in Global.windows)
            {
                if (w.Title == translate.trans("Committees"))
                {
                    w.Activate(); return;
                }
            }
            template t = new template();
            object W = new Window();
            object committee = new Committee((Window)W);
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
            LoadingWait ld = Global.Busy(this);
            ((Committee)committee).committees = new ObservableCollection<object>(Global.committees.Where(cc => ((Committee)cc).company == Global.company));
            if(((Committee)committee).committees.Count == 0)
            {
                ((Committee)committee).committees.Add(new Committee());
            }
            t.template1(W, ref committee, translate.trans("Committees"), new List<string>() { "name", "add", "edit", "del", "close" }, ((Committee)committee).committees, 0, 0, false);
            Global.addWindow((Window)W);
            if (((Committee)((Committee)committee).committees[0]).id == string.Empty || ((Committee)((Committee)committee).committees[0]).id == "" || ((Committee)((Committee)committee).committees[0]).id == null)
            {
                ((Committee)committee).committees.RemoveAt(0);
            }
            ((Window)W).Show();
            ld.Close();
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
            LoadingWait ld = Global.Busy(this);
            ((Brand)brand).brands = new ObservableCollection<object>(Global.brands.Where(bb => ((Brand)bb).brandCat.company == Global.company));
            ((Brand)brand).brandCats = new ObservableCollection<object>(Global.brandCats.Where(bb => ((BrandCat)bb).company == Global.company));
            if(((Brand)brand).brands.Count == 0)
            {
                ((Brand)brand).brands.Add(new Brand());
            }
            t.template1(W, ref brand, translate.trans("Brands"), new List<string>() { "name","brandCat","committee", "supportPercentage", "add", "edit", "del", "close" }, ((Brand)brand).brands, 0, 0, false);
            Global.addWindow((Window)W);
            if (((Brand)((Brand)brand).brands[0]).id == string.Empty || ((Brand)((Brand)brand).brands[0]).id == "" || ((Brand)((Brand)brand).brands[0]).id == null)
            {
                ((Brand)brand).brands.RemoveAt(0);
            }
            ((Window)W).Show();
            ld.Close();
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
            LoadingWait ld = Global.Busy(this);

            ((ExportCertificate)exportCertificate).exportCertificates = new ObservableCollection<object>(Global.exportCertificates.Where(aa => ((ExportCertificate)aa).company == Global.company).Take(75));
            
            if (((ExportCertificate)exportCertificate).exportCertificates.Count == 0)
            {
                ((ExportCertificate)exportCertificate).exportCertificates.Add(new ExportCertificate());
            }
            t.Moderntemplate(W, ref exportCertificate, translate.trans("Export Certificates"), P, new List<string>() { "add", "edit", "del", "openInvoice","clear", "close" }, ((ExportCertificate)exportCertificate).exportCertificates,null, 0, 0, false);
            Global.addWindow((Window)W);
            ((Window)W).Show();
            if (((ExportCertificate)((ExportCertificate)exportCertificate).exportCertificates[0]).num == string.Empty || ((ExportCertificate)((ExportCertificate)exportCertificate).exportCertificates[0]).num == "" || ((ExportCertificate)((ExportCertificate)exportCertificate).exportCertificates[0]).num == null)
            {
                ((ExportCertificate)exportCertificate).exportCertificates.RemoveAt(0);
            }
            ld.Close();

        }
        public void openUser()
        {
            LoadingWait ld = Global.Busy(this);
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
            ld.Close();
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
            LoadingWait ld = Global.Busy(this);
            template t = new template();
            object W = new Window();
            object fileNo = new FileNo((Window)W);
            ((FileNo)fileNo).fileNos = new ObservableCollection<object>(Global.fileNos.Where(f => ((FileNo)f).company.id == Global.company.id).Take(50));
            List<Property> P = new List<Property>()
            {
                new Property("num","txt",_action:"select"),
                new Property("dat","date"),
                new Property("committee","cmb",_displayPath : "name"),
            };
            List<TableCol> tbcs = new List<TableCol>()
            {
                new TableCol("num","num"),
                new TableCol("dat","dat"),
                new TableCol("committee","committee.name"),
            };
            if (((FileNo)fileNo).fileNos.Count == 0)
            {
                ((FileNo)fileNo).fileNos.Add(new FileNo());
            }
            t.Moderntemplate(W, ref fileNo, translate.trans("FileNo"), P,new List<string>() {"add", "edit", "del", "openFileNoData", "close" }, ((FileNo)fileNo).fileNos, tbcs,0, 0, false);
            Global.addWindow((Window)W);

            if (((FileNo)((FileNo)fileNo).fileNos[0]).id == string.Empty || ((FileNo)((FileNo)fileNo).fileNos[0]).id == "" || ((FileNo)((FileNo)fileNo).fileNos[0]).id == null)
            {
                ((FileNo)fileNo).fileNos.RemoveAt(0);
            }
            ((Window)W).Show();
            ld.Close();
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
            LoadingWait ld = Global.Busy(this);
            template t = new template();
            object W = new Window();
            object bankReceipt = new BankReceipt((Window)W);
            ((BankReceipt)bankReceipt).bankReceipts = new ObservableCollection<object>(Global.bankReceipts.Where(bb => ((BankReceipt)bb).company == Global.company).Take(75));
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
            if(((BankReceipt)bankReceipt).bankReceipts.Count == 0)
            {
                ((BankReceipt)bankReceipt).bankReceipts.Add(new BankReceipt());
            }
            t.Moderntemplate(W, ref bankReceipt, translate.trans("BankReceipt"), P, new List<string>() { "add", "edit", "del", "openBankReceiptData", "close" }, ((BankReceipt)bankReceipt).bankReceipts, tbcs, 0, 0, false);
            Global.addWindow((Window)W);

            if (((BankReceipt)((BankReceipt)bankReceipt).bankReceipts[0]).id == string.Empty || ((BankReceipt)((BankReceipt)bankReceipt).bankReceipts[0]).id == "" || ((BankReceipt)((BankReceipt)bankReceipt).bankReceipts[0]).id == null)
            {
                ((BankReceipt)bankReceipt).bankReceipts.RemoveAt(0);
            }
           ((Window)W).Show();
            ld.Close();
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
            LoadingWait ld = Global.Busy(this);
            template t = new template();
            object W = new Window();
            object cheque = new Cheque((Window)W);
            ((Cheque)cheque).cheques = new ObservableCollection<object>(Global.cheques.Where(cc => ((Cheque)cc).company == Global.company));
            List<Property> P = new List<Property>()
            {
                new Property("num","txt"),
                new Property("valueEgp","num"),
                new Property("dat","date"),
                new Property("copy","image"),
            };
            List<TableCol> tbcs = new List<TableCol>()
            {
                new TableCol("num","num"),
                new TableCol("valueEgp","valueEgp"),
                new TableCol("dat","dat"),
            };
            if(((Cheque)cheque).cheques.Count == 0)
            {
                ((Cheque)cheque).cheques.Add(new Cheque());
            }
            t.Moderntemplate(W, ref cheque, translate.trans("Cheque"), P, new List<string>() { "add", "edit", "del", "openChequeData", "close" }, ((Cheque)cheque).cheques, tbcs, 0, 0, false);
            Global.addWindow((Window)W);

            if (((Cheque)((Cheque)cheque).cheques[0]).id == string.Empty || ((Cheque)((Cheque)cheque).cheques[0]).id == "" || ((Cheque)((Cheque)cheque).cheques[0]).id == null)
            {
                ((Cheque)cheque).cheques.RemoveAt(0);
            }
           ((Window)W).Show();
            ld.Close();
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
            LoadingWait ld = Global.Busy(this);
            template t = new template();
            object W = new Window();
            object booked = new Booked((Window)W);
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
            ((Booked)booked).bookeds = new ObservableCollection<object>(Global.bookeds.Where(bb=>((Booked)bb).company == Global.company));
            if (((Booked)booked).bookeds.Count == 0)
            {
                ((Booked)booked).bookeds.Add(new Booked());
            }
            t.Moderntemplate(W, ref booked, translate.trans("Booked"), P, new List<string>() { "add", "edit", "del", "close" }, ((Booked)booked).bookeds, tbcs, 0, 0, false);
            Global.addWindow((Window)W);

            if (((Booked)((Booked)booked).bookeds[0]).id == string.Empty || ((Booked)((Booked)booked).bookeds[0]).id == "" || ((Booked)((Booked)booked).bookeds[0]).id == null)
            {
                ((Booked)booked).bookeds.RemoveAt(0);
            }
           ((Window)W).Show();
            ld.Close();
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
            LoadingWait ld = Global.Busy(this);
            template t = new template();
            object W = new Window();
            object estiva = new Estiva((Window)W);
            ((Estiva)estiva).estivas = new ObservableCollection<object>(Global.estivas.Where(ee => ((Estiva)ee).company == Global.company));
            ((Estiva)estiva).exportCertificates = new ObservableCollection<object>(Global.exportCertificates.Where(ee => ((ExportCertificate)ee).company == Global.company)); 
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
            ld.Close();
        }
        private void Login_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            close();
        }
        public void openReportViewer()
        {
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

        public void import()
        {
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
            OpenFileDialog dlg = new OpenFileDialog();
            dlg.Filter = "xlsx Excel|*.xlsx|Excel |*.xls";
            dlg.Title = "Open an Excel File";
            dlg.ShowDialog();
            if (dlg.FileName == "") { return; }
            string filePath = dlg.FileName;
            ld = Global.Busy(this);
            thr = new Thread(() =>
            {
                
                importFromExcel(filePath);
                App.Current.Dispatcher.Invoke(()=> { ld.Close(); });
                
            });
            thr.Start();
        }

        [DllImport("user32.dll",CharSet = CharSet.Auto, SetLastError = true)]
        public static extern int GetWindowThreadProcessId(int handle, out int processId);
        public void importFromExcel(string filePath)
        {
            Mysqldb sql = new Mysqldb();
            Excel.Workbook MyBook = null;
            Excel.Application MyApp = null;
            Excel.Worksheet MySheet = null;

            MyApp = new Excel.Application();
            MyApp.Visible = false;
            MyBook = MyApp.Workbooks.Open(filePath);
            MySheet = (Excel.Worksheet)MyBook.Sheets[1]; // Explicit cast is not required here
            Excel.Range last = MySheet.Cells.SpecialCells(Excel.XlCellType.xlCellTypeLastCell, Type.Missing);
            Excel.Range range = MySheet.get_Range("A1", last);
            int lastUsedRow = last.Row;
            int lastUsedColumn = last.Column;
            bool err = false;
            DataTable errTb = new DataTable("Errors");
            int m = 1;
            errTb.Columns.Add(new DataColumn("Id"));
            errTb.Columns.Add(new DataColumn("Error"));
            List<string> Ls = new List<string>();
            for (int i = 1; i <= lastUsedColumn; i++)
            {
                string temp = MySheet.Cells[1, i].Value2.ToString().ToLower();
                temp = temp.Replace(" ", string.Empty);
                Ls.Add(temp);
            }
            ObservableCollection<Country> countries = new ObservableCollection<Country>();
            ObservableCollection<Port> ports = new ObservableCollection<Port>();
            ObservableCollection<BrandCat> brandCats = new ObservableCollection<BrandCat>();
            ObservableCollection<Committee> committees = new ObservableCollection<Committee>();
            ObservableCollection<Brand> brands = new ObservableCollection<Brand>();
            ObservableCollection<ShippingCompany> shippingCompanies = new ObservableCollection<ShippingCompany>();
            ObservableCollection<Client> clients = new ObservableCollection<Client>();
            ObservableCollection<ExportCertificate> exportCertificates = new ObservableCollection<ExportCertificate>();
            ObservableCollection<Invoice> invoices = new ObservableCollection<Invoice>();
            ObservableCollection<InvoiceData> invoiceDatas = new ObservableCollection<InvoiceData>();
            ObservableCollection<BankReceipt> bankReceipts = new ObservableCollection<BankReceipt>();
            ObservableCollection<BankReceiptData> bankReceiptDatas = new ObservableCollection<BankReceiptData>();
            ObservableCollection<FileNo> fileNos = new ObservableCollection<FileNo>();
            ObservableCollection<FileNoData> fileNoDatas = new ObservableCollection<FileNoData>();
            ObservableCollection<Cheque> cheques = new ObservableCollection<Cheque>();
            ObservableCollection<ChequeData> chequeDatas = new ObservableCollection<ChequeData>();
            for (int index = 2; index <= lastUsedRow; index++)
            {
                // Here what we gonna do 
                // make sure that all clients,countrys,shippingCompanies,Ports,BrandCats,Brands,Commitees are Stored in the DB 
                // so we here gona collect data
                int ii = Ls.IndexOf("country") + 1;
                if (ii == 0)
                {
                    MessageBox.Show("There is no Country Column !!");
                    goto finish;
                }
                Country country = new Country();
                {
                    string temp;
                    if (MySheet.Cells[index, ii].Value2 == null)
                    {
                        MessageBox.Show("Error: Missing Country name @ row =" + index.ToString()); goto finish;
                    }
                    else { temp = MySheet.Cells[index, ii].Value2.ToString(); }

                    IEnumerable<object> o = null;
                    if (Global.countrys != null && Global.countrys.Count != 0 && ((Country)Global.countrys[0]).id != "") o = Global.countrys.Where(cl => ((Country)cl).name.ToLower() == temp.ToLower());
                    if (o == null || o.Count() == 0)
                    {
                        MessageBox.Show("This Country ('" + temp + "') is not Stored in DataBase!!! \n Please Store it in the DataBase.");

                        goto finish;

                    }
                    else
                    {
                        country = (Country)o.First();
                    }
                }
                //Checking for ports
                ii = Ls.IndexOf("port") + 1;
                if (ii == 0)
                {
                    MessageBox.Show("There is no port Column !!");
                    goto finish;
                }
                Port port = new Port();
                {
                    string temp;
                    if (MySheet.Cells[index, ii].Value2 == null)
                    {
                        MessageBox.Show("Error: Missing Port name @ row =" + index.ToString()); goto finish;
                    }
                    else { temp = MySheet.Cells[index, ii].Value2.ToString(); }
                    IEnumerable<object> o = null;
                    if (Global.ports != null && Global.ports.Count != 0 && ((Port)Global.ports[0]).id != "") o = Global.ports.Where(cl => ((Port)cl).name.ToLower() == temp.ToLower());
                    if (o == null || o.Count() == 0)
                    {
                        App.Current.Dispatcher.Invoke(() =>
                        {
                            InputDialogSample inputDialog = new InputDialogSample(translate.trans("'" + temp + "' is not stored in the DataBase. \n Do you want to Store it as new ?"));
                            if (inputDialog.ShowDialog() == true)
                            {
                                port.name = temp;
                                port.notes = " ";
                                port.add(new object(), new RoutedEventArgs());

                            }
                            else
                            {
                                this.thr.Abort();
                                MyBook.Close(0);
                                MyApp.Quit();
                                ld.Close(); 
                                //Marshal.ReleaseComObject(MyBook);
                                int ProId1;
                                GetWindowThreadProcessId(MyApp.Hwnd, out ProId1);
                                Process[] allProcess1 = Process.GetProcessesByName("excel");
                                foreach (Process exc in allProcess1)
                                {
                                    if (exc.Id == ProId1) { exc.Kill(); }
                                }
                            }
                        });

                    }
                    else
                    {
                        port = (Port)o.First();
                    }
                }

                //check for brandCat
                ii = Ls.IndexOf("brandcat") + 1;
                if (ii == 0)
                {
                    MessageBox.Show("There is no brandcat Column !!");
                    goto finish;
                }
                BrandCat brandCat = new BrandCat();
                {
                    string temp;
                    if (MySheet.Cells[index, ii].Value2 == null)
                    {
                        MessageBox.Show("Error: Missing Brand Cat @ row =" + index.ToString()); goto finish;
                    }
                    else { temp = MySheet.Cells[index, ii].Value2.ToString(); }
                    IEnumerable<object> o = null;
                    if (Global.brandCats != null && Global.brandCats.Count != 0 && ((BrandCat)Global.brandCats[0]).id != "") o = Global.brandCats.Where(cl => ((BrandCat)cl).name.ToLower() == temp.ToLower() && ((BrandCat)cl).company.name == Global.company.name );
                    if (o == null || o.Count() == 0)
                    {
                        App.Current.Dispatcher.Invoke(() =>
                        {
                            InputDialogSample inputDialog = new InputDialogSample(translate.trans("'" + temp + "' is not stored in the DataBase. \n Do you want to Store it as new ?"));
                            if (inputDialog.ShowDialog() == true)
                            {
                                brandCat.name = temp;
                                brandCat.company = Global.company;
                                brandCat.add(new object(), new RoutedEventArgs());
                            }
                            else
                            {
                                thr.Abort();
                                MyBook.Close(0);
                                MyApp.Quit();
                                ld.Close();
                                //Marshal.ReleaseComObject(MyBook);
                                int ProId2;
                                GetWindowThreadProcessId(MyApp.Hwnd, out ProId2);
                                Process[] allProcess2 = Process.GetProcessesByName("excel");
                                foreach (Process exc in allProcess2)
                                {
                                    if (exc.Id == ProId2) { exc.Kill(); }
                                }
                            }
                        });

                    }
                    else
                    {
                        brandCat = (BrandCat)o.First();
                    }
                }

                //check for shippingCompanies
                ii = Ls.IndexOf("shippingcompany") + 1;
                if (ii == 0)
                {
                    MessageBox.Show("There is no shipping company Column !!");
                    goto finish;
                }
                ShippingCompany shippingCompany = new ShippingCompany();
                {
                    string temp;
                    if (MySheet.Cells[index, ii].Value2 == null)
                    {
                        MessageBox.Show("Error: Missing Shipping Company name @ row =" + index.ToString()); goto finish;
                    }
                    else { temp = MySheet.Cells[index, ii].Value2.ToString(); }
                    IEnumerable<object> o = null;
                    if (Global.shippingCompanys != null && Global.shippingCompanys.Count != 0 && ((ShippingCompany)Global.shippingCompanys[0]).id != "") o = Global.shippingCompanys.Where(cl => ((ShippingCompany)cl).name.ToLower() == temp.ToLower());
                    if (o == null || o.Count() == 0)
                    {
                        App.Current.Dispatcher.Invoke(() =>
                        {
                            InputDialogSample inputDialog = new InputDialogSample(translate.trans("'" + temp + "' is not stored in the DataBase. \n Do you want to Store it as new ?"));
                            if (inputDialog.ShowDialog() == true)
                            {
                                shippingCompany.name = temp;
                                shippingCompany.add(new object(), new RoutedEventArgs());
                            }
                            else
                            {
                                thr.Abort();
                                MyBook.Close(0);
                                MyApp.Quit();
                                ld.Close();
                                //Marshal.ReleaseComObject(MyBook);
                                int ProId3;
                                GetWindowThreadProcessId(MyApp.Hwnd, out ProId3);
                                Process[] allProcess3 = Process.GetProcessesByName("excel");
                                foreach (Process exc in allProcess3)
                                {
                                    if (exc.Id == ProId3) { exc.Kill(); }
                                }
                            }
                        });

                    }
                    else
                    {
                        shippingCompany = (ShippingCompany)o.First();
                    }
                }

                //check for committee
                ii = Ls.IndexOf("committee") + 1;
                if (ii == 0)
                {
                    MessageBox.Show("There is no committee Column !!");
                    goto finish;
                }
                Committee committee = new Committee();
                {

                    string temp;
                    if (MySheet.Cells[index, ii].Value2 == null)
                    {
                        MessageBox.Show("Error: Missing Committee name @ row =" + index.ToString()); goto finish;
                    }
                    else { temp = MySheet.Cells[index, ii].Value2.ToString(); }
                    IEnumerable<object> o = null;
                    if (Global.committees != null && Global.committees.Count != 0 && ((Committee)Global.committees[0]).id != "") o = Global.committees.Where(cl => ((Committee)cl).name.ToLower() == temp.ToLower() && ((Committee)cl).company.name == Global.company.name);
                    if (o == null || o.Count() == 0)
                    {
                        App.Current.Dispatcher.Invoke(() =>
                        {
                            InputDialogSample inputDialog = new InputDialogSample(translate.trans("'" + temp + "' is not stored in the DataBase. \n Do you want to Store it as new ?"));
                            if (inputDialog.ShowDialog() == true)
                            {
                                committee.name = temp;
                                committee.company = Global.company;
                                committee.add(new object(), new RoutedEventArgs());
                            }
                            else
                            {
                                thr.Abort();
                                MyBook.Close(0);
                                MyApp.Quit();
                                ld.Close();
                                //Marshal.ReleaseComObject(MyBook);
                                int ProId4;
                                GetWindowThreadProcessId(MyApp.Hwnd, out ProId4);
                                Process[] allProcess4 = Process.GetProcessesByName("excel");
                                foreach (Process exc in allProcess4)
                                {
                                    if (exc.Id == ProId4) { exc.Kill(); }
                                }
                            }
                        });


                    }
                    else
                    {
                        committee = (Committee)o.First();
                    }
                }

                //check for Brands
                ii = Ls.IndexOf("brand") + 1;
                if (ii == 0)
                {
                    MessageBox.Show("There is no brand Column!!");
                    goto finish;
                }
                Brand brand = new Brand();
                {
                    string temp;
                    if (MySheet.Cells[index, ii].Value2 == null)
                    {
                        MessageBox.Show("Error: Missing Brand name @ row =" + index.ToString()); goto finish;
                    }
                    else { temp = MySheet.Cells[index, ii].Value2.ToString(); }
                    IEnumerable<object> o = null;
                    if (Global.brands != null && Global.brands.Count != 0 && ((Brand)Global.brands[0]).id != "") o = Global.brands.Where(cl => ((Brand)cl).name.ToLower() == temp.ToLower() && ((Brand)cl).brandCat.name == brandCat.name);
                    if (o == null || o.Count() == 0)
                    {
                        App.Current.Dispatcher.Invoke(() =>
                        {
                            InputDialogSample inputDialog = new InputDialogSample(translate.trans("'" + temp + "' is not stored in the DataBase. \n Do you want to Store it as new ?"));
                            if (inputDialog.ShowDialog() == true)
                            {
                                brand.name = temp;
                                brand.brandCat = brandCat;
                                brand.committee = committee;
                                try
                                {
                                    brand.supportPercentage = MySheet.Cells[index, Ls.IndexOf("%") + 1].Value2.ToString();
                                }
                                catch (Exception)
                                {
                                    MessageBox.Show(this, "Error:There is no Support Percentage ('%') for this Brand @ row = " + index.ToString() + "!!!");
                                    thr.Abort();
                                    MyBook.Close(0);
                                    MyApp.Quit();
                                    ld.Close();
                                    //Marshal.ReleaseComObject(MyBook);
                                    int ProId5;
                                    GetWindowThreadProcessId(MyApp.Hwnd, out ProId5);
                                    Process[] allProcess5 = Process.GetProcessesByName("excel");
                                    foreach (Process exc in allProcess5)
                                    {
                                        if (exc.Id == ProId5) { exc.Kill(); }
                                    }
                                }
                                brand.add(new object(), new RoutedEventArgs());

                            }
                            else
                            {
                                thr.Abort();
                                MyBook.Close(0);
                                MyApp.Quit();
                                ld.Close();
                                //Marshal.ReleaseComObject(MyBook);
                                int ProId6;
                                GetWindowThreadProcessId(MyApp.Hwnd, out ProId6);
                                Process[] allProcess6 = Process.GetProcessesByName("excel");
                                foreach (Process exc in allProcess6)
                                {
                                    if (exc.Id == ProId6) { exc.Kill(); }
                                }
                            }
                        });

                    }
                    else
                    {
                        brand = (Brand)o.First();
                    }
                }

                //check for Clients
                ii = Ls.IndexOf("client") + 1;
                if (ii == 0)
                {
                    MessageBox.Show("There is no Client Column!!");
                    goto finish;
                }
                Client client = new Client();
                {
                    string temp;
                    if (MySheet.Cells[index, ii].Value2 == null)
                    {
                        MessageBox.Show("Error: Missing Client name @ row =" + index.ToString()); goto finish;
                    }
                    else { temp = MySheet.Cells[index, ii].Value2.ToString(); }
                    IEnumerable<object> o = null;
                    if (Global.clients != null && Global.clients.Count != 0 && ((Client)Global.clients[0]).id != "") o = Global.clients.Where(cl => ((Client)cl).name.ToLower() == temp.ToLower() && ((Client)cl).company.name == Global.company.name);
                    if (o == null || o.Count() == 0)
                    {
                        App.Current.Dispatcher.Invoke(() =>
                        {
                            InputDialogSample inputDialog = new InputDialogSample(translate.trans("'" + temp + "' is not stored in the DataBase. \n Do you want to Store it as new ?"));
                            if (inputDialog.ShowDialog() == true)
                            {
                                client.name = temp;
                                client.company = Global.company;
                                client.country = country;
                                client.fax = " ";
                                client.email = " ";
                                client.phone = " ";
                                client.notes = " ";
                                client.address = " ";
                                client.add(new object(), new RoutedEventArgs());

                            }
                            else
                            {
                                thr.Abort();
                                MyBook.Close(0);
                                MyApp.Quit();
                                ld.Close();
                                //Marshal.ReleaseComObject(MyBook);
                                int ProId7;
                                GetWindowThreadProcessId(MyApp.Hwnd, out ProId7);
                                Process[] allProcess7 = Process.GetProcessesByName("excel");
                                foreach (Process exc in allProcess7)
                                {
                                    if (exc.Id == ProId7) { exc.Kill(); }
                                }
                            }
                        });

                    }
                    else
                    {
                        client = (Client)o.First();
                    }
                }

                // >>>>>>>>>>>>>>>>>>>>>>>>. Here the real Work
                //check for export certificate
                ii = Ls.IndexOf("exportcertificate") + 1;
                if (ii == 0)
                {
                    MessageBox.Show("There is no Export Certificate column!!!");
                    goto finish;
                }
                ExportCertificate exportCertificate = new ExportCertificate();
                {
                    string temp;
                    if (MySheet.Cells[index, ii].Value2 == null)
                    {
                        MessageBox.Show("Error: Missing data @ row =" + index.ToString()); goto finish;
                    }
                    else { temp = MySheet.Cells[index, ii].Value2.ToString(); }
                    IEnumerable<object> o = null;
                    if (exportCertificates != null && exportCertificates.Count != 0) o = exportCertificates.Where(cl => ((ExportCertificate)cl).num.ToLower() == temp.ToLower());
                    if (o == null || o.Count() == 0)
                    {

                        exportCertificate.num = temp;
                        exportCertificate.company = Global.company;
                        exportCertificate.country = country;
                        exportCertificate.port = port;
                        exportCertificate.shippingCompany = shippingCompany;
                        try
                        {
                            exportCertificate.manifesto = (Global.getValue(MySheet, index, Ls.IndexOf("manifesto") + 1) == "ok");
                            exportCertificate.manualWork = (Global.getValue(MySheet, index, Ls.IndexOf("manualwork") + 1) == "ok");
                            exportCertificate.boles = (Global.getValue(MySheet, index, Ls.IndexOf("boles") + 1) == "ok");
                            exportCertificate.dat = (Global.getValue(MySheet, index, Ls.IndexOf("date") + 1));
                            exportCertificate.nolon = (Global.getValue(MySheet, index, Ls.IndexOf("nolon") + 1));
                            exportCertificate.receiptDate = (Global.getValue(MySheet, index, Ls.IndexOf("receiptdate") + 1));
                            exportCertificate.notes = (Global.getValue(MySheet, index, Ls.IndexOf("notes") + 1));
                            exportCertificate.usdToEgp = (Global.getValue(MySheet, index, Ls.IndexOf("usdtoegp") + 1));
                            if (exportCertificate.dat == " " || exportCertificate.usdToEgp == " ")
                            {
                                err = true;
                                DataRow row = errTb.NewRow();
                                row["Id"] = m.ToString(); m++;
                                row["Error"] = "Error : missing data in Row number :" + index.ToString() + "!!! \n please make sure of(manifesto ,manual work , boles,date,nolon,)";
                                errTb.Rows.Add(row);
                            }
                        }
                        catch (Exception)
                        {
                            err = true;
                            DataRow row = errTb.NewRow();
                            row["Id"] = m.ToString(); m++;
                            row["Error"] = "Error : missing data in Row number :" + index.ToString() + "!!! \n please make sure of(manifesto ,manual work , boles,date,nolon,)";
                            errTb.Rows.Add(row);
                            //MessageBox.Show(");
                            //goto finish;
                        }
                        exportCertificates.Add(exportCertificate);

                    }
                    else
                    {
                        exportCertificate = (ExportCertificate)o.First();
                    }
                }

                //check for invoice
                ii = Ls.IndexOf("invoice") + 1;
                if (ii == 0)
                {
                    MessageBox.Show("There is no Invoice Column !!!");
                    goto finish;
                }
                Invoice invoice = new Invoice(exportCertificate);
                {
                    string temp;
                    if (MySheet.Cells[index, ii].Value2 == null)
                    {
                        MessageBox.Show("Error: Missing data @ row =" + index.ToString()); goto finish;
                    }
                    else { temp = MySheet.Cells[index, ii].Value2.ToString(); }

                    IEnumerable<object> o = null;
                    if (invoices != null && invoices.Count != 0 && ((Invoice)invoices[0]).num != "") o = invoices.Where(cl => ((Invoice)cl).num.ToLower() == temp.ToLower());
                    if (o == null || o.Count() == 0)
                    {

                        invoice.num = temp;
                        invoice.client = client;
                        try
                        {
                            invoice.performa = (Global.getValue(MySheet, index, Ls.IndexOf("proformainvoice") + 1));
                            invoice.systemRef = (Global.getValue(MySheet, index, Ls.IndexOf("systemrefno") + 1));
                            invoice.bankReciete = true;

                        }
                        catch (Exception)
                        {
                            err = true;
                            DataRow row = errTb.NewRow();
                            row["Id"] = m.ToString(); m++;
                            row["Error"] = "Error : missing data in Row number :" + index.ToString() + "!!! \n please make sure of(invoice data)";
                            errTb.Rows.Add(row);
                        }
                        invoices.Add(invoice);

                    }
                    else
                    {
                        invoice = (Invoice)o.First();
                    }
                }

                //check for invoiceData
                ii = Ls.IndexOf("invoice") + 1;
                InvoiceData invoiceData = new InvoiceData(invoice);
                {

                    //Global.invoiceDatas = InvoiceData.getTable(invoice.num);
                    IEnumerable<object> o = null;
                    if (invoiceDatas != null && invoiceDatas.Count != 0 && ((InvoiceData)invoiceDatas[0]).id != "") o = invoiceDatas.Where(cl => ((InvoiceData)cl).invoice.num == invoice.num && ((InvoiceData)cl).brand.name == brand.name);
                    if (o == null || o.Count() == 0)
                    {

                        invoiceData.invoice = invoice;
                        invoiceData.brandCat = brandCat;
                        invoiceData.brand = brand;
                        try
                        {
                            invoiceData.usdVal = (Global.getValue(MySheet, index, Ls.IndexOf("us$") + 1));
                            invoiceData.supportPercentage = (Global.getValue(MySheet, index, Ls.IndexOf("%") + 1));

                        }
                        catch (Exception)
                        {
                        }
                        invoiceDatas.Add(invoiceData);

                    }
                    else
                    {
                        invoiceData = (InvoiceData)o.First();
                    }
                }


                //check for bank receipt
                ii = Ls.IndexOf("bankreceipt") + 1;
                if (ii == 0) { goto noCheque; }
                BankReceipt bankReceipt = new BankReceipt();
                {
                    string temp;
                    if (MySheet.Cells[index, ii].Value2 == null)
                    {
                        //MessageBox.Show("Error: Missing bank Receipt num @ row =" + index.ToString()); ///
                        goto noCheque;
                        //goto finish;
                    }
                    else { temp = MySheet.Cells[index, ii].Value2.ToString(); }
                    IEnumerable<object> o = null;
                    if (bankReceipts != null && bankReceipts.Count != 0 && ((BankReceipt)bankReceipts[0]).id != "") o = bankReceipts.Where(cl => ((BankReceipt)cl).num.ToLower() == temp.ToLower());
                    if (o == null || o.Count() == 0)
                    {

                        bankReceipt.num = temp;
                        bankReceipt.country = country;
                        bankReceipt.company = Global.company;

                        try
                        {
                            bankReceipt.dat = (MySheet.Cells[index, Ls.IndexOf("bankreceiptdate") + 1].Value2.ToString());
                            bankReceipt.usd = (MySheet.Cells[index, Ls.IndexOf("bankreceiptusd") + 1].Value2.ToString());
                        }
                        catch (Exception)
                        {
                            err = true;
                            DataRow row = errTb.NewRow();
                            row["Id"] = m.ToString(); m++;
                            row["Error"] = "Error : missing data in Row number :" + index.ToString() + "!!! \n please make sure of(bank receipt usd ,bank receipt date )!!";
                            errTb.Rows.Add(row);
                            //MessageBox.Show("Error : missing data in Row number :" + index.ToString() + "!!! \n please make sure of(bank receipt usd ,bank receipt date )!!");
                            //goto finish;
                        }
                        bankReceipts.Add(bankReceipt);

                    }
                    else
                    {
                        bankReceipt = (BankReceipt)o.First();
                    }
                }

                //check for bank receipt datas haaaaant
                ii = Ls.IndexOf("bankreceipt") + 1;
                BankReceiptData bankReceiptData = new BankReceiptData(bankReceipt);
                {
                    //Global.bankReceiptDatas = BankReceiptData.getTable(bankReceipt);
                    IEnumerable<object> o = null;
                    if (bankReceiptDatas != null && bankReceiptDatas.Count != 0 && ((BankReceiptData)bankReceiptDatas[0]).id != "") o = bankReceiptDatas.Where(cl => ((BankReceiptData)cl).bankReceipt.num == bankReceipt.num && ((BankReceiptData)cl).exportCertificate.num == exportCertificate.num);
                    if (o == null || o.Count() == 0)
                    {

                        bankReceiptData.bankReceipt = bankReceipt;
                        bankReceiptData.exportCertificate = exportCertificate;
                        bankReceiptDatas.Add(bankReceiptData);

                    }
                    else
                    {
                        bankReceiptData = (BankReceiptData)o.First();
                    }
                }


                //check for File No
                ii = Ls.IndexOf("filenumber") + 1;
                if (ii == 0) { goto noCheque; }
                FileNo fileNo = new FileNo();
                {
                    string temp;
                    if (MySheet.Cells[index, ii].Value2 == null)
                    {
                        //MessageBox.Show("Error: Missing data @ row =" + index.ToString()); goto finish;
                        goto noCheque;
                    }
                    else { temp = MySheet.Cells[index, ii].Value2.ToString(); }
                    IEnumerable<object> o = null;
                    if (fileNos != null && fileNos.Count != 0) o = fileNos.Where(cl => ((FileNo)cl).num.ToLower() == temp.ToLower());
                    if (o == null || o.Count() == 0)
                    {

                        fileNo.num = temp;
                        fileNo.committee = committee;
                        fileNo.company = Global.company;
                        try
                        {
                            fileNo.dat = (MySheet.Cells[index, Ls.IndexOf("submitdate") + 1].Value2.ToString());
                        }
                        catch (Exception)
                        {
                            err = true;
                            DataRow row = errTb.NewRow();
                            row["Id"] = m.ToString(); m++;
                            row["Error"] = "Error : missing data in Row number :" + index.ToString() + "!!! \n please make sure of(submit date )!!";
                            errTb.Rows.Add(row);
                        }
                        fileNos.Add(fileNo);

                    }
                    else
                    {
                        fileNo = (FileNo)o.First();
                    }
                }


                FileNoData fileNoData = new FileNoData();
                {

                    IEnumerable<object> o = null;
                    if (fileNoDatas != null && fileNoDatas.Count != 0 && ((FileNoData)fileNoDatas[0]).id != "") o = fileNoDatas.Where(cl => ((FileNoData)cl).fileNo.num == fileNo.num && ((FileNoData)cl).exportCertificate == exportCertificate);
                    if (o == null || o.Count() == 0)
                    {

                        fileNoData.fileNo = fileNo;
                        fileNoData.exportCertificate = exportCertificate;
                        fileNoDatas.Add(fileNoData);

                    }
                    else
                    {
                        fileNoData = (FileNoData)o.First();

                    }
                }


                //check for bank receipt
                ii = Ls.IndexOf("chequenumber") + 1;
                Cheque cheque = new Cheque();
                {
                    if (ii == 0)
                    {
                        goto noCheque;
                    }
                    string temp;
                    if (MySheet.Cells[index, ii].Value2 == null)
                    {
                        //MessageBox.Show("Error: Missing data @ row =" + index.ToString()); goto finish;
                        goto noCheque;
                    }
                    else { temp = MySheet.Cells[index, ii].Value2.ToString(); }
                    IEnumerable<object> o = null;
                    if (cheques != null && cheques.Count != 0) o = cheques.Where(cl => ((Cheque)cl).num.ToLower() == temp.ToLower());
                    if (o == null || o.Count() == 0)
                    {

                        cheque.num = temp;
                        cheque.company = Global.company;
                        cheque.copy = null;
                        try
                        {
                            cheque.valueEgp = (Global.getValue(MySheet, index, Ls.IndexOf("chequedate") + 1));
                            cheque.dat = (Global.getValue(MySheet, index, Ls.IndexOf("chequeegp") + 1));
                        }
                        catch (Exception)
                        {
                            MessageBox.Show("Error : missing data in Row number :" + index.ToString() + "!!! \n please make sure of(Cheque Date ,Cheque EGP )!!");
                            goto finish;
                        }
                        cheques.Add(cheque);

                    }
                    else
                    {
                        cheque = (Cheque)o.First();

                    }
                }

                //check for cheque datas haaaaant
                ii = Ls.IndexOf("chequenumber") + 1;
                ChequeData chequeData = new ChequeData();
                {
                    string temp;
                    if (MySheet.Cells[index, ii].Value2 == null)
                    {
                        MessageBox.Show("Error: Missing data @ row =" + index.ToString()); goto finish;
                    }
                    else { temp = MySheet.Cells[index, ii].Value2.ToString(); }
                    //Global.chequeDatas = ChequeData.getTable(cheque);
                    IEnumerable<object> o = null;
                    if (chequeDatas != null && chequeDatas.Count != 0 && ((ChequeData)chequeDatas[0]).id != "") o = chequeDatas.Where(cl => ((ChequeData)cl).cheque.num == temp.ToLower() && ((ChequeData)cl).fileNo.num == fileNo.num);
                    if (o == null || o.Count() == 0)
                    {

                        chequeData.cheque = cheque;
                        chequeData.fileNo = fileNo;
                        chequeDatas.Add(chequeData);

                    }
                    else
                    {
                        chequeData = (ChequeData)o.First();
                    }
                }
            noCheque:
                ;
            }
            /// >> Checking for Dublications
            /// checking for export certificates
            /// 

            foreach (ExportCertificate ex in exportCertificates)
            {
                IEnumerable<object> o = Global.exportCertificates.Where(ee => ((ExportCertificate)ee).num == ex.num);
                if (o != null && o.Count() != 0)
                {
                    err = true;
                    DataRow row = errTb.NewRow();
                    row["Id"] = m.ToString(); m++;
                    row["Error"] = "This Export Certificate (" + ex.num + ") Existed in the DB !!!";
                    errTb.Rows.Add(row);
                }
            }

            // for fileNos
            foreach (FileNo ex in fileNos)
            {
                IEnumerable<object> o = Global.fileNos.Where(ee => ((FileNo)ee).num == ex.num);
                if (o != null && o.Count() != 0)
                {
                    err = true;
                    DataRow row = errTb.NewRow();
                    row["Id"] = m.ToString(); m++;
                    row["Error"] = "This File Number (" + ex.num + ") Existed in the DB !!!";
                    errTb.Rows.Add(row);
                }
            }
            // Bank receipt
            foreach (BankReceipt ex in bankReceipts)
            {
                IEnumerable<object> o = Global.bankReceipts.Where(ee => ((BankReceipt)ee).num == ex.num);
                if (o != null && o.Count() != 0)
                {
                    err = true;
                    DataRow row = errTb.NewRow();
                    row["Id"] = m.ToString(); m++;
                    row["Error"] = "This Bank Receipt Number (" + ex.num + ") Existed in the DB !!!";
                    errTb.Rows.Add(row);
                }
            }
            // Cheque
            foreach (Cheque ex in cheques)
            {
                IEnumerable<object> o = Global.cheques.Where(ee => ((Cheque)ee).num == ex.num);
                if (o != null && o.Count() != 0)
                {
                    err = true;
                    DataRow row = errTb.NewRow();
                    row["Id"] = m.ToString(); m++;
                    row["Error"] = "This Cheque Number (" + ex.num + ") Existed in the DB !!!";
                    errTb.Rows.Add(row);
                }
            }

            //>> if there is err
            if (err)
            {
                App.Current.Dispatcher.Invoke(() =>
                {
                    ReportBuilder rb = new ReportBuilder("Unilever", Global.company.name, translate.trans("Errors in Excel File To be resolved !!"), errTb, "", new Col("Portrait"));
                    rb.genReport();
                });

            }
            else
            {
                foreach (ExportCertificate ex in exportCertificates)
                {
                    ex.add(new object(), new RoutedEventArgs());
                }
                foreach (Invoice ex in invoices)
                {
                    ex.add(new object(), new RoutedEventArgs());
                }
                foreach (InvoiceData ex in invoiceDatas)
                {
                    ex.add(new object(), new RoutedEventArgs());
                }
                foreach (BankReceipt ex in bankReceipts)
                {
                    ex.add(new object(), new RoutedEventArgs());
                }
                foreach (BankReceiptData ex in bankReceiptDatas)
                {
                    ex.add(new object(), new RoutedEventArgs());
                }
                foreach (FileNo ex in fileNos)
                {
                    ex.add(new object(), new RoutedEventArgs());
                }
                foreach (FileNoData ex in fileNoDatas)
                {
                    ex.add(new object(), new RoutedEventArgs());
                }
                foreach (Cheque ex in cheques)
                {
                    ex.add(new object(), new RoutedEventArgs());
                }
                foreach (ChequeData ex in chequeDatas)
                {
                    ex.add(new object(), new RoutedEventArgs());
                }

            }



        finish:
            MyBook.Close(0);
            MyApp.Quit();

            int ProId;
            GetWindowThreadProcessId(MyApp.Hwnd, out ProId);
            Process[] allProcess = Process.GetProcessesByName("excel");
            foreach (Process exc in allProcess)
            {
                if (exc.Id == ProId) { exc.Kill(); }
            }

        }
        public void openReports()
        {
            ReportsWindow rw = new ReportsWindow();
            rw.Show();
            
        }
    }
}


