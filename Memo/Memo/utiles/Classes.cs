using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;


namespace Memo
{
    public class Sol
    {
        public List<int> lst;
        public double distance;
        public Sol(List<int> l, double d)
        {
            lst = l; distance = d;
        }
    }
    public class User
    {
        public string id { get; set; }
        public string name { get; set; }
        public string email { get; set; }
        public string password { get; set; }
        public bool admin { get; set; }
        public lang lang
        {
            get { return Global.Lang; }
            set { Global.Lang = value; }
        }
        public Company company
        {
            get { return Global.company; }
            set { Global.company = value; }
        }
        public List<lang> langs
        {
            get { return Global.langs; }
            set { Global.langs = value; }
        }
        public Window window { get; set; }
        public User(Window W = null)
        {
            window = W;
        }

        public void login(object sender, RoutedEventArgs e)
        {
            try
            {
                Mysqldb sql = new Mysqldb();
                if (Global.usr.email == string.Empty || Global.usr.email == null) { MessageBox.Show(translate.trans("PLease Enter a Valid Email !!!")); return; }
                if (Global.usr.password == string.Empty || Global.usr.password == null) { MessageBox.Show(translate.trans("PLease Enter your PassWord!!!")); return; }
                if (Global.usr.lang == null) { MessageBox.Show(translate.trans("PLease Choose your Language !!!")); return; }
                string q = "SELECT * from user where `email`='" + Global.usr.email + "' and `pass`='" + Global.usr.password + "';";
                DataTable dt = sql.Select(q);
                if (dt.Rows.Count > 0)
                {
                    // login success
                    //MessageBox.Show("Login Successfull");
                    DataRow r = dt.Rows[0];
                    this.id = r["id"].ToString();
                    this.name = r["name"].ToString();
                    this.email = r["email"].ToString();
                    this.password = r["pass"].ToString();
                    this.admin = Convert.ToBoolean(r["admin"].ToString());
                    this.company = new Company(r["company"].ToString());
                    main m = new main();
                    m.Show();
                    ((Window)window).Hide();
                    Global.removeWindow(window);

                }
                else
                {
                    //fail
                    MessageBox.Show(translate.trans("Wrong Email Or PassWord !!! /n Please Enter Correct ones."));

                }
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.ToString());
            }
        }
        public void exit(object sender, RoutedEventArgs e)
        {
            System.Windows.Application.Current.Shutdown();
        }

    }
    public class lang
    {
        public string id { get; set; }
        public string name { get; set; }
        public lang(string title, string n)
        {
            id = title;
            name = n;
        }
    }
    public class BrandCat : INotifyPropertyChanged
    {
        private string _id;
        private string _name;
        public event PropertyChangedEventHandler PropertyChanged;
        private Window window { get; set; }
        public string id
        {
            get { return _id; }
            set
            {
                _id = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("id"));
            }
        }
        public string name
        {
            get
            {
                if (_name != "") return _name;
                else { return " "; }
            }
            set
            {
                _name = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("name"));
            }
        }
        public BrandCat(Window W = null)
        {
            window = W;
        }
        public BrandCat(string ID, Window W = null)
        {
            window = W;
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `brandCat` Where id = " + ID;
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.name = r["name"].ToString();
        }
        public void complete(string ID)
        {
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `brandcat` Where id = " + ID;
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.name = r["name"].ToString();
        }
        public BrandCat clone()
        {
            BrandCat temp = new BrandCat();
            temp.id = this._id;
            temp.name = this._name;
            return temp;
        }
        public void selectItem(object sender, MouseButtonEventArgs e)
        {
            this.id = ((BrandCat)((ListViewItem)sender).Content).id;
            this.name = ((BrandCat)((ListViewItem)sender).Content).name;
        }
        public void add(object sender, RoutedEventArgs e)
        {
            try
            {
                if (name == string.Empty)
                {
                    MessageBox.Show(translate.trans("Please Enter A Valid DAta !!!"));
                }
                Mysqldb sql = new Mysqldb();
                string q = "INSERT INTO  uniexport.`brandcat` (`id`,`name`,`company`) VALUES ( NULL,'" + name + "','" + Global.company.id + "');";
                id = (sql.nextAutoIncrement("brandcat")).ToString();

                if (sql.Select(q) != null)
                {
                    Global.brandCats.Add(clone());
                    clear();
                }

            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.ToString());
            }
        }
        public void edit(object sender, RoutedEventArgs e)
        {
            try
            {
                if (name == string.Empty)
                {
                    MessageBox.Show(translate.trans("Please Enter A Valid DAta !!!"));
                }
                Mysqldb sql = new Mysqldb();
                string q = "UPDATE uniexport.`brandcat` SET   `name` = '" + name + "' WHERE `BrandCat`.`id` = " + this.id;
                sql.Select(q);
                foreach (BrandCat c in Global.brandCats)
                {
                    if (c.id == _id)
                    {
                        Global.brandCats[Global.brandCats.IndexOf(c)] = clone(); return;
                    }
                }
                clear();
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.ToString());
            }
        }
        public void del(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "DELETE FROM  uniexport.`brandcat` WHERE `brandcat`.`id` = " + id;
            sql.Select(q);
            foreach (BrandCat temp in Global.brandCats)
            {
                if (temp.id == _id)
                {
                    Global.brandCats.Remove(temp); return;
                }
            }
            clear();
        }
        public void close(object sender, RoutedEventArgs e)
        {
            Global.removeWindow(window); window.Close();
        }
        public void clear()
        {
            id = null;
            name = null;
        }
        public static ObservableCollection<object> getTable()
        {
            ObservableCollection<object> c = new ObservableCollection<object>();
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `brandcat` where company =" + Global.company.id;
            DataTable dt = sql.Select(q);
            if (dt.Rows.Count == 0)
            {
                BrandCat tmp = new BrandCat(); c.Add(tmp); return c;
            }
            foreach (DataRow r in dt.Rows)
            {
                BrandCat temp = new BrandCat();
                temp.id = r["id"].ToString();
                temp.name = r["name"].ToString();
                //MessageBox.Show(temp.name);
                c.Add(temp);
            }
            return c;
        }
    }
    public class Brand : INotifyPropertyChanged
    {
        private string _id;
        private string _name;
        private BrandCat _brandCat;
        private string _supportPercentage;
        public event PropertyChangedEventHandler PropertyChanged;
        private Window window { get; set; }
        public string id
        {
            get { return _id; }
            set
            {
                _id = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("id"));
            }
        }
        public string name
        {
            get
            {
                if (_name != "") return _name;
                else { return " "; }
            }
            set
            {
                _name = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("name"));
            }
        }
        public BrandCat brandCat
        {
            get { return _brandCat; }
            set
            {
                _brandCat = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("brandCat"));
            }
        }
        public ObservableCollection<object> brandCats
        {
            get { return Global.brandCats; }
            set
            {
                Global.brandCats = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("brandCats"));
            }
        }
        public string supportPercentage
        {
            get { return _supportPercentage; }
            set
            {
                _supportPercentage = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("supportPercentage"));
            }
        }
        public Brand(Window W = null)
        {
            window = W;
        }
        public Brand(string ID, Window W = null)
        {
            window = W;
            Mysqldb sql = new Mysqldb();
            string q;
            try
            {
                string x = Convert.ToInt32(ID).ToString();
                q = "SELECT * FROM `brand` Where id = " + ID;
            }
            catch (Exception)
            {

                q = "SELECT * FROM `brand` Where name = '" + ID + "'";
            }
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.name = r["name"].ToString();
            this.brandCat = new BrandCat(r["brandCat"].ToString());
            this.supportPercentage = r["supportPercentage"].ToString();
        }
        public void complete(string ID)
        {
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `brand` Where id = " + ID;
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.name = r["name"].ToString();
            this.brandCat = new BrandCat(r["brandCat"].ToString());
            this.supportPercentage = r["supportPercentage"].ToString();
        }
        public Brand clone()
        {
            Brand temp = new Brand();
            temp.id = this._id;
            temp.name = this._name;
            temp.brandCat = this._brandCat.clone();
            temp.supportPercentage = this._supportPercentage;
            return temp;
        }
        public void selectItem(object sender, MouseButtonEventArgs e)
        {
            this.id = ((Brand)((ListViewItem)sender).Content).id;
            this.name = ((Brand)((ListViewItem)sender).Content).name;
            //this.brandCat = ((Brand)((ListViewItem)sender).Content).brandCat.clone();
            this.brandCat = (BrandCat)Global.brandCats.Where(x => ((BrandCat)x).name == ((Brand)((ListViewItem)sender).Content).brandCat.name).First();
            this.supportPercentage = ((Brand)((ListViewItem)sender).Content).supportPercentage;
        }
        public void add(object sender, RoutedEventArgs e)
        {
            try
            {
                if (name == string.Empty || brandCat == null || !Global.isNum(supportPercentage))
                {
                    MessageBox.Show(translate.trans("Please Enter A Valid DAta !!!"));
                }
                Mysqldb sql = new Mysqldb();
                string q = "INSERT INTO  uniexport.`brand` (`id`,`name`,`brandCat`,`supportPercentage`) VALUES ( NULL,'" + name + "','" + brandCat.id + "','" + supportPercentage + "');";
                id = (sql.nextAutoIncrement("brand")).ToString();
                ;
                if (sql.Select(q) != null) { Global.brands.Add(clone()); clear(); }
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.ToString());
            }

        }
        public void edit(object sender, RoutedEventArgs e)
        {
            if (name == string.Empty || brandCat == null || !Global.isNum(supportPercentage))
            {
                MessageBox.Show(translate.trans("Please Enter A Valid DAta !!!"));
            }
            Mysqldb sql = new Mysqldb();
            string q = "UPDATE uniexport.`brand` SET   `name` = '" + name + "' ,`brandCat` = '" + brandCat.id + "' ,`supportPercentage` = '" + supportPercentage + "' WHERE `Brand`.`id` = " + this.id;
            sql.Select(q);
            foreach (Brand c in Global.brands)
            {
                if (c.id == _id)
                {
                    Global.brands[Global.brands.IndexOf(c)] = clone(); return;
                }
            }
            clear();
        }
        public void del(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "DELETE FROM  uniexport.`brand` WHERE `brand`.`id` = " + id;
            sql.Select(q);
            foreach (Brand temp in Global.brands)
            {
                if (temp.id == _id)
                {
                    Global.brands.Remove(temp); return;
                }
            }
            clear();
        }
        public void close(object sender, RoutedEventArgs e)
        {
            //this.brandCat = (BrandCat)Global.brandCats[0];
            Global.removeWindow(window); window.Close();
        }
        public void clear()
        {
            id = null;
            name = null;
            brandCat = null;
            supportPercentage = null;
        }
        public static ObservableCollection<object> getTable(BrandCat bc = null)
        {
            ObservableCollection<object> c = new ObservableCollection<object>();
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * from brand INNER JOIN brandcat as bc on (bc.id = brand.brandCat)WHERE bc.company = " + Global.company.id;
            if (bc != null)
            {
                q = "SELECT * FROM `brand` where brandCat = " + bc.id;
            }
            DataTable dt = sql.Select(q);
            if (dt.Rows.Count == 0)
            {
                Brand tmp = new Brand(); c.Add(tmp); return c;
            }
            foreach (DataRow r in dt.Rows)
            {
                Brand temp = new Brand();
                temp.id = r["id"].ToString();
                temp.name = r["name"].ToString();
                temp.brandCat = new BrandCat(r["brandCat"].ToString());
                temp.supportPercentage = r["supportPercentage"].ToString();
                c.Add(temp);
            }
            return c;
        }
    }
    public class Country : INotifyPropertyChanged
    {
        private string _id;
        private string _name;
        private bool _nolon;
        private bool _manifest;
        public event PropertyChangedEventHandler PropertyChanged;
        private Window window { get; set; }
        public string id
        {
            get { return _id; }
            set
            {
                _id = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("id"));
            }
        }
        public string name
        {
            get { return _name; }
            set
            {
                _name = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("name"));
            }
        }
        public bool nolon
        {
            get { return _nolon; }
            set
            {
                _nolon = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("nolon"));
            }
        }
        public bool manifest
        {
            get { return _manifest; }
            set
            {
                _manifest = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("manifest"));
            }
        }
        public Country(Window W = null)
        {
            window = W;
        }
        public Country(string ID, Window W = null)
        {
            window = W;
            Mysqldb sql = new Mysqldb();

            string q;
            try
            {
                string x = Convert.ToInt32(ID).ToString();
                q = "SELECT * FROM `country` Where id = " + ID;
            }
            catch (Exception)
            {

                q = "SELECT * FROM `country` Where name = '" + ID + "'";
            }
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.name = r["name"].ToString();
            this.nolon = Convert.ToBoolean(r["nolon"]);
            this.manifest = Convert.ToBoolean(r["manifest"]);
        }
        public void complete(string ID)
        {
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `country` Where id = " + ID;
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.name = r["name"].ToString();
            this.nolon = Convert.ToBoolean(r["nolon"]);
            this.manifest = Convert.ToBoolean(r["manifest"]);
        }
        public Country clone()
        {
            Country temp = new Country();
            temp.id = this._id;
            temp.name = this._name;
            temp.nolon = this._nolon;
            temp.manifest = this._manifest;
            return temp;
        }
        public void selectItem(object sender, MouseButtonEventArgs e)
        {
            this.id = ((Country)((ListViewItem)sender).Content).id;
            this.name = ((Country)((ListViewItem)sender).Content).name;
            this.nolon = ((Country)((ListViewItem)sender).Content).nolon;
            this.manifest = ((Country)((ListViewItem)sender).Content).manifest;
        }
        public void add(object sender, RoutedEventArgs e)
        {
            try
            {
                if (name == string.Empty)
                {
                    MessageBox.Show(translate.trans("Please Enter A Valid DAta !!!"));
                }
                Mysqldb sql = new Mysqldb();
                string q = "INSERT INTO  uniexport.`country` (`id`,`name`,`nolon`,`manifest`) VALUES ( NULL,'" + name + "','" + ((nolon) ? "1" : "0") + "','" + ((manifest) ? "1" : "0") + "');";
                id = (sql.nextAutoIncrement("country")).ToString();

                if (sql.Select(q) != null) { Global.countrys.Add(clone()); clear(); }

            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.ToString());
            }
        }
        public void edit(object sender, RoutedEventArgs e)
        {
            if (name == string.Empty)
            {
                MessageBox.Show(translate.trans("Please Enter A Valid DAta !!!"));
            }
            Mysqldb sql = new Mysqldb();
            string q = "UPDATE uniexport.`country` SET   `name` = '" + name + "' ,`nolon` = '" + ((nolon) ? "1" : "0") + "' ,`manifest` = '" + ((manifest) ? "1" : "0") + "' WHERE `Country`.`id` = " + this.id;
            sql.Select(q);
            foreach (Country c in Global.countrys)
            {
                if (c.id == _id)
                {
                    Global.countrys[Global.countrys.IndexOf(c)] = clone(); return;
                }
            }
            clear();
        }
        public void del(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "DELETE FROM  uniexport.`country` WHERE `country`.`id` = " + id;
            sql.Select(q);
            foreach (Country temp in Global.countrys)
            {
                if (temp.id == _id)
                {
                    Global.countrys.Remove(temp); return;
                }
            }
            clear();
        }
        public void close(object sender, RoutedEventArgs e)
        {
            Global.removeWindow(window); window.Close();
        }
        public void clear()
        {
            id = null;
            name = null;
            nolon = false;
            manifest = false;
        }
        public static ObservableCollection<object> getTable()
        {
            ObservableCollection<object> c = new ObservableCollection<object>();
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `country` "; DataTable dt = sql.Select(q);
            if (dt.Rows.Count == 0)
            {
                Country tmp = new Country(); c.Add(tmp); return c;
            }
            foreach (DataRow r in dt.Rows)
            {
                Country temp = new Country();
                temp.id = r["id"].ToString();
                temp.name = r["name"].ToString();
                temp.nolon = Convert.ToBoolean(r["nolon"].ToString());
                temp.manifest = Convert.ToBoolean(r["manifest"].ToString());
                c.Add(temp);
            }
            return c;
        }
    }
    public class Port : INotifyPropertyChanged
    {
        private string _id;
        private string _name;
        private string _notes;
        public event PropertyChangedEventHandler PropertyChanged;
        private Window window { get; set; }
        public string id
        {
            get { return _id; }
            set
            {
                _id = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("id"));
            }
        }
        public string name
        {
            get { return _name; }
            set
            {
                _name = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("name"));
            }
        }
        public string notes
        {
            get { return _notes; }
            set
            {
                _notes = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("notes"));
            }
        }
        public Port(Window W = null)
        {
            window = W;
        }
        public Port(string ID, Window W = null)
        {
            window = W;
            Mysqldb sql = new Mysqldb();
            string q;
            try
            {
                string x = Convert.ToInt32(ID).ToString();
                q = "SELECT * FROM `port` Where id = " + ID;
            }
            catch (Exception)
            {

                q = "SELECT * FROM `port` Where name = '" + ID + "'";
            }
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.name = r["name"].ToString();
            this.notes = r["notes"].ToString();
        }
        public void complete(string ID)
        {
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `port` Where id = " + ID;
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.name = r["name"].ToString();
            this.notes = r["notes"].ToString();
        }
        public Port clone()
        {
            Port temp = new Port();
            temp.id = this._id;
            temp.name = this._name;
            temp.notes = this._notes;
            return temp;
        }
        public void selectItem(object sender, MouseButtonEventArgs e)
        {
            this.id = ((Port)((ListViewItem)sender).Content).id;
            this.name = ((Port)((ListViewItem)sender).Content).name;
            this.notes = ((Port)((ListViewItem)sender).Content).notes;
        }
        public void add(object sender, RoutedEventArgs e)
        {
            try
            {
                if (name == string.Empty)
                {
                    MessageBox.Show(translate.trans("Please Enter A Valid DAta !!!"));
                }
                Mysqldb sql = new Mysqldb();
                string q = "INSERT INTO  uniexport.`port` (`id`,`name`,`notes`) VALUES ( NULL,'" + name + "','" + notes + "');";
                id = (sql.nextAutoIncrement("port")).ToString();
                if (sql.Select(q) != null) { Global.ports.Add(clone()); clear(); }

            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.ToString());
            }
        }
        public void edit(object sender, RoutedEventArgs e)
        {
            if (name == string.Empty)
            {
                MessageBox.Show(translate.trans("Please Enter A Valid DAta !!!"));
            }
            Mysqldb sql = new Mysqldb();
            string q = "UPDATE uniexport.`port` SET   `name` = '" + name + "' ,`notes` = '" + notes + "' WHERE `Port`.`id` = " + this.id;
            sql.Select(q);
            foreach (Port c in Global.ports)
            {
                if (c.id == _id)
                {
                    Global.ports[Global.ports.IndexOf(c)] = clone(); return;
                }
            }
            clear();
        }
        public void del(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "DELETE FROM  uniexport.`port` WHERE `port`.`id` = " + id;
            sql.Select(q);
            foreach (Port temp in Global.ports)
            {
                if (temp.id == _id)
                {
                    Global.ports.Remove(temp); return;
                }
            }
            clear();
        }
        public void close(object sender, RoutedEventArgs e)
        {
            Global.removeWindow(window); window.Close();
        }
        public void clear()
        {
            id = null;
            name = null;
            notes = null;
        }
        public static ObservableCollection<object> getTable()
        {
            ObservableCollection<object> c = new ObservableCollection<object>();
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `port` "; DataTable dt = sql.Select(q);
            if (dt.Rows.Count == 0)
            {
                Port tmp = new Port(); c.Add(tmp); return c;
            }
            foreach (DataRow r in dt.Rows)
            {
                Port temp = new Port();
                temp.id = r["id"].ToString();
                temp.name = r["name"].ToString();
                temp.notes = r["notes"].ToString();
                c.Add(temp);
            }
            return c;
        }
    }
    public class ShippingCompany : INotifyPropertyChanged
    {
        private string _id;
        private string _name;
        private string _email;
        private string _phone;
        private string _fax;
        private string _address;
        private string _notes;
        public event PropertyChangedEventHandler PropertyChanged;
        private Window window { get; set; }
        public string id
        {
            get { return _id; }
            set
            {
                _id = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("id"));
            }
        }
        public string name
        {
            get { return _name; }
            set
            {
                _name = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("name"));
            }
        }
        public string email
        {
            get { return _email; }
            set
            {
                _email = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("email"));
            }
        }
        public string phone
        {
            get { return _phone; }
            set
            {
                _phone = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("phone"));
            }
        }
        public string fax
        {
            get { return _fax; }
            set
            {
                _fax = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("fax"));
            }
        }
        public string address
        {
            get { return _address; }
            set
            {
                _address = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("address"));
            }
        }
        public string notes
        {
            get { return _notes; }
            set
            {
                _notes = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("notes"));
            }
        }
        public ShippingCompany(Window W = null)
        {
            window = W;
        }
        public ShippingCompany(string ID, Window W = null)
        {
            window = W;
            Mysqldb sql = new Mysqldb();
            string q;
            try
            {
                string x = Convert.ToInt32(ID).ToString();
                q = "SELECT * FROM `shippingCompany` Where id = " + ID;
            }
            catch (Exception)
            {

                q = "SELECT * FROM `shippingCompany` Where name = '" + ID + "'";
            }
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.name = r["name"].ToString();
            this.email = r["email"].ToString();
            this.phone = r["phone"].ToString();
            this.fax = r["fax"].ToString();
            this.address = r["address"].ToString();
            this.notes = r["notes"].ToString();
        }
        public void complete(string ID)
        {
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `shippingcompany` Where id = " + ID;
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.name = r["name"].ToString();
            this.email = r["email"].ToString();
            this.phone = r["phone"].ToString();
            this.fax = r["fax"].ToString();
            this.address = r["address"].ToString();
            this.notes = r["notes"].ToString();
        }
        public ShippingCompany clone()
        {
            ShippingCompany temp = new ShippingCompany();
            temp.id = this._id;
            temp.name = this._name;
            temp.email = this._email;
            temp.phone = this._phone;
            temp.fax = this._fax;
            temp.address = this._address;
            temp.notes = this._notes;
            return temp;
        }
        public void selectItem(object sender, MouseButtonEventArgs e)
        {
            this.id = ((ShippingCompany)((ListViewItem)sender).Content).id;
            this.name = ((ShippingCompany)((ListViewItem)sender).Content).name;
            this.email = ((ShippingCompany)((ListViewItem)sender).Content).email;
            this.phone = ((ShippingCompany)((ListViewItem)sender).Content).phone;
            this.fax = ((ShippingCompany)((ListViewItem)sender).Content).fax;
            this.address = ((ShippingCompany)((ListViewItem)sender).Content).address;
            this.notes = ((ShippingCompany)((ListViewItem)sender).Content).notes;
        }
        public void add(object sender, RoutedEventArgs e)
        {
            try
            {
                if (name == string.Empty)
                {
                    MessageBox.Show(translate.trans("Please Enter A Valid DAta !!!"));
                }
                Mysqldb sql = new Mysqldb();
                string q = "INSERT INTO  uniexport.`shippingcompany` (`id`,`name`,`email`,`phone`,`fax`,`address`,`notes`) VALUES ( NULL,'" + name + "','" + email + "','" + phone + "','" + fax + "','" + address + "','" + notes + "');";
                id = (sql.nextAutoIncrement("shippingcompany")).ToString();

                if (sql.Select(q) != null) { Global.shippingCompanys.Add(clone()); clear(); }

            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.ToString());
            }
        }
        public void edit(object sender, RoutedEventArgs e)
        {
            if (name == string.Empty)
            {
                MessageBox.Show(translate.trans("Please Enter A Valid DAta !!!"));
            }
            Mysqldb sql = new Mysqldb();
            string q = "UPDATE uniexport.`shippingcompany` SET   `name` = '" + name + "' ,`email` = '" + email + "' ,`phone` = '" + phone + "' ,`fax` = '" + fax + "' ,`address` = '" + address + "' ,`notes` = '" + notes + "' WHERE `ShippingCompany`.`id` = " + this.id;
            sql.Select(q);
            foreach (ShippingCompany c in Global.shippingCompanys)
            {
                if (c.id == _id)
                {
                    Global.shippingCompanys[Global.shippingCompanys.IndexOf(c)] = clone(); return;
                }
            }
            clear();
        }
        public void del(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "DELETE FROM  uniexport.`shippingcompany` WHERE `shippingcompany`.`id` = " + id;
            sql.Select(q);
            foreach (ShippingCompany temp in Global.shippingCompanys)
            {
                if (temp.id == _id)
                {
                    Global.shippingCompanys.Remove(temp); return;
                }
            }
            clear();
        }
        public void close(object sender, RoutedEventArgs e)
        {
            Global.removeWindow(window); window.Close();
        }
        public void clear()
        {
            id = null;
            name = null;
            email = null;
            phone = null;
            fax = null;
            address = null;
            notes = null;
        }
        public static ObservableCollection<object> getTable()
        {
            ObservableCollection<object> c = new ObservableCollection<object>();
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `shippingcompany` "; DataTable dt = sql.Select(q);
            if (dt.Rows.Count == 0)
            {
                ShippingCompany tmp = new ShippingCompany(); c.Add(tmp); return c;
            }
            foreach (DataRow r in dt.Rows)
            {
                ShippingCompany temp = new ShippingCompany();
                temp.id = r["id"].ToString();
                temp.name = r["name"].ToString();
                temp.email = r["email"].ToString();
                temp.phone = r["phone"].ToString();
                temp.fax = r["fax"].ToString();
                temp.address = r["address"].ToString();
                temp.notes = r["notes"].ToString();
                c.Add(temp);
            }
            return c;
        }
    }
    public class Company : INotifyPropertyChanged
    {
        private string _id;
        private string _name;
        private string _email;
        private string _phone;
        private string _fax;
        private string _address;
        private string _notes;
        public event PropertyChangedEventHandler PropertyChanged;
        private Window window { get; set; }
        public string id
        {
            get { return _id; }
            set
            {
                _id = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("id"));
            }
        }
        public string name
        {
            get { return _name; }
            set
            {
                _name = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("name"));
            }
        }
        public string email
        {
            get { return _email; }
            set
            {
                _email = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("email"));
            }
        }
        public string phone
        {
            get { return _phone; }
            set
            {
                _phone = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("phone"));
            }
        }
        public string fax
        {
            get { return _fax; }
            set
            {
                _fax = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("fax"));
            }
        }
        public string address
        {
            get { return _address; }
            set
            {
                _address = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("address"));
            }
        }
        public string notes
        {
            get { return _notes; }
            set
            {
                _notes = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("notes"));
            }
        }
        public Company(Window W = null)
        {
            window = W;
        }
        public Company(string ID, Window W = null)
        {
            window = W;
            if (ID == "0")
            {
                this.id = "0";
                this.name = "All";
                return;
            }
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `company` Where id = " + ID;
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.name = r["name"].ToString();
            this.email = r["email"].ToString();
            this.phone = r["phone"].ToString();
            this.fax = r["fax"].ToString();
            this.address = r["address"].ToString();
            this.notes = r["notes"].ToString();
        }
        public void complete(string ID)
        {
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `company` Where id = " + ID;
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.name = r["name"].ToString();
            this.email = r["email"].ToString();
            this.phone = r["phone"].ToString();
            this.fax = r["fax"].ToString();
            this.address = r["address"].ToString();
            this.notes = r["notes"].ToString();
        }
        public Company clone()
        {
            Company temp = new Company();
            temp.id = this._id;
            temp.name = this._name;
            temp.email = this._email;
            temp.phone = this._phone;
            temp.fax = this._fax;
            temp.address = this._address;
            temp.notes = this._notes;
            return temp;
        }
        public void selectItem(object sender, MouseButtonEventArgs e)
        {
            this.id = ((Company)((ListViewItem)sender).Content).id;
            this.name = ((Company)((ListViewItem)sender).Content).name;
            this.email = ((Company)((ListViewItem)sender).Content).email;
            this.phone = ((Company)((ListViewItem)sender).Content).phone;
            this.fax = ((Company)((ListViewItem)sender).Content).fax;
            this.address = ((Company)((ListViewItem)sender).Content).address;
            this.notes = ((Company)((ListViewItem)sender).Content).notes;
        }
        public void add(object sender, RoutedEventArgs e)
        {
            try
            {
                if (name == string.Empty)
                {
                    MessageBox.Show(translate.trans("Please Enter A Valid DAta !!!"));
                }
                Mysqldb sql = new Mysqldb();
                string q = "INSERT INTO  uniexport.`company` (`id`,`name`,`email`,`phone`,`fax`,`address`,`notes`) VALUES ( NULL,'" + name + "','" + email + "','" + phone + "','" + fax + "','" + address + "','" + notes + "');";
                id = (sql.nextAutoIncrement("company")).ToString();
                if (sql.Select(q) != null) { Global.companys.Add(clone()); clear(); }

            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.ToString());
            }
        }
        public void edit(object sender, RoutedEventArgs e)
        {
            if (name == string.Empty)
            {
                MessageBox.Show(translate.trans("Please Enter A Valid DAta !!!"));
            }
            Mysqldb sql = new Mysqldb();
            string q = "UPDATE uniexport.`company` SET   `name` = '" + name + "' ,`email` = '" + email + "' ,`phone` = '" + phone + "' ,`fax` = '" + fax + "' ,`address` = '" + address + "' ,`notes` = '" + notes + "' WHERE `Company`.`id` = " + this.id;
            sql.Select(q);
            foreach (Company c in Global.companys)
            {
                if (c.id == _id)
                {
                    Global.companys[Global.companys.IndexOf(c)] = clone(); return;
                }
            }
            clear();
        }
        public void del(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "DELETE FROM  uniexport.`company` WHERE `company`.`id` = " + id;
            sql.Select(q);
            foreach (Company temp in Global.companys)
            {
                if (temp.id == _id)
                {
                    Global.companys.Remove(temp); return;
                }
            }
            clear();
        }
        public void close(object sender, RoutedEventArgs e)
        {
            Global.removeWindow(window); window.Close();
        }
        public void clear()
        {
            id = null;
            name = null;
            email = null;
            phone = null;
            fax = null;
            address = null;
            notes = null;
        }
        public static ObservableCollection<object> getTable()
        {
            ObservableCollection<object> c = new ObservableCollection<object>();
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `company` "; DataTable dt = sql.Select(q);
            if (dt.Rows.Count == 0)
            {
                Company tmp = new Company(); c.Add(tmp); return c;
            }
            foreach (DataRow r in dt.Rows)
            {
                Company temp = new Company();
                temp.id = r["id"].ToString();
                temp.name = r["name"].ToString();
                temp.email = r["email"].ToString();
                temp.phone = r["phone"].ToString();
                temp.fax = r["fax"].ToString();
                temp.address = r["address"].ToString();
                temp.notes = r["notes"].ToString();
                c.Add(temp);
            }
            return c;
        }
    }
    public class Users : INotifyPropertyChanged
    {
        private string _id;
        private string _name;
        private string _email;
        private string _pass;
        private Company _company;
        private bool _admin;
        public event PropertyChangedEventHandler PropertyChanged;
        private Window window { get; set; }
        public string id
        {
            get { return _id; }
            set
            {
                _id = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("id"));
            }
        }
        public string name
        {
            get { return _name; }
            set
            {
                _name = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("name"));
            }
        }
        public string email
        {
            get { return _email; }
            set
            {
                _email = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("email"));
            }
        }
        public string pass
        {
            get { return _pass; }
            set
            {
                _pass = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("pass"));
            }
        }
        public bool admin
        {
            get { return _admin; }
            set
            {
                _admin = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("admin"));
            }
        }
        public Company company
        {
            get { return _company; }
            set
            {
                _company = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("company"));
            }
        }
        public ObservableCollection<object> companys
        {
            get { return Global.companys; }
            set
            {
                Global.companys = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("companys"));
            }
        }
        public Users(Window W = null)
        {
            window = W;
        }
        public Users(string ID, Window W = null)
        {
            window = W;
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `user` Where id = " + ID;
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.name = r["name"].ToString();
            this.email = r["email"].ToString();
            this.pass = r["pass"].ToString();
            this.admin = Convert.ToBoolean(r["admin"].ToString());
            this.company = new Company(r["company"].ToString());
        }
        public void complete(string ID)
        {
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `user` Where id = " + ID;
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.name = r["name"].ToString();
            this.email = r["email"].ToString();
            this.pass = r["pass"].ToString();
            this.company = new Company(r["company"].ToString());
        }
        public Users clone()
        {
            Users temp = new Users();
            temp.id = this._id;
            temp.name = this._name;
            temp.email = this._email;
            temp.pass = this._pass;
            temp.company = this._company.clone();
            temp.admin = this.admin;
            return temp;
        }
        public void selectItem(object sender, MouseButtonEventArgs e)
        {
            this.id = ((Users)((ListViewItem)sender).Content).id;
            this.name = ((Users)((ListViewItem)sender).Content).name;
            this.email = ((Users)((ListViewItem)sender).Content).email;
            this.pass = ((Users)((ListViewItem)sender).Content).pass;
            this.admin = ((Users)((ListViewItem)sender).Content).admin;
            if (this.admin == true)
            {
                try
                {
                    int i = Global.companys.IndexOf(Global.companys.Where(x => ((Company)x).name == "All").First());
                    this.company = (Company)Global.companys[i];
                }
                catch (Exception)
                {
                    Company c2 = new Company(); c2.name = "All"; c2.id = "0";
                    Global.companys.Add(c2);
                    this.company = c2;
                    //throw;
                }


            }
            else
            {
                try
                {
                    int i = Global.companys.IndexOf(Global.companys.Where(x => ((Company)x).name == "All").First());
                    Global.companys.RemoveAt(i);
                    i = Global.companys.IndexOf(Global.companys.Where(x => ((Company)x).name == ((Users)((ListViewItem)sender).Content).company.name).First());
                    this.company = (Company)Global.companys[i];
                }
                catch (Exception)
                {

                    int i = Global.companys.IndexOf(Global.companys.Where(x => ((Company)x).name == ((Users)((ListViewItem)sender).Content).company.name).First());
                    this.company = (Company)Global.companys[i];
                }
            }
        }
        public void add(object sender, RoutedEventArgs e)
        {
            try
            {
                if (company == null || name == string.Empty || email == string.Empty || pass == string.Empty)
                {
                    MessageBox.Show(translate.trans("Please Enter Valid Data"));
                    return;
                }
                Mysqldb sql = new Mysqldb();
                string q = "INSERT INTO uniexport.`user` (`id`,`name`,`email`,`pass`,`company`,`admin`) VALUES ( NULL,'" + name + "','" + email + "','" + pass + "','" + company.id + "','" + ((admin) ? "1" : "0") + "');";
                id = (sql.nextAutoIncrement("user")).ToString();

                if (sql.Select(q) != null) { Global.users.Add(clone()); clear(); }

            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.ToString());
            }

        }
        public void edit(object sender, RoutedEventArgs e)
        {
            if (company == null || name == string.Empty || email == string.Empty || pass == string.Empty)
            {
                MessageBox.Show(translate.trans("Please Enter Valid Data"));
                return;
            }
            Mysqldb sql = new Mysqldb();
            string q = "UPDATE uniexport.`user` SET `name` = '" + name + "' ,`email` = '" + email + "' ,`pass` = '" + pass + "' ,`company` = '" + company.id + "', `admin` = " + ((admin) ? "1" : "0") + "    WHERE `User`.`id` = '" + id + "' ; ";
            string s = q;
            sql.Select(q);
            foreach (Users c in Global.users)
            {
                if (c.id == _id)
                {
                    Global.users[Global.users.IndexOf(c)] = clone(); return;
                }
            }
            clear();
        }
        public void del(object sender, RoutedEventArgs e)
        {
            try
            {
                Mysqldb sql = new Mysqldb();
                string q = "DELETE FROM  uniexport.`user` WHERE `user`.`id` = " + id;
                sql.Select(q);
                foreach (Users temp in Global.users)
                {
                    if (temp.id == _id)
                    {
                        Global.users.Remove(temp); clear(); return;
                    }
                }
                clear();
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.ToString());
            }
        }
        public void close(object sender, RoutedEventArgs e)
        {
            Global.removeWindow(window); window.Close();
        }
        public void chckClicked(object sender, RoutedEventArgs e)
        {
            CheckBox c = (CheckBox)sender;
            if (c.IsChecked == true)
            {
                Company c2 = new Company(); c2.name = "All"; c2.id = "0";
                Global.companys.Add(c2);
                this.company = c2;

            }
            else
            {
                try
                {
                    int i = Global.companys.IndexOf(Global.companys.Where(x => ((Company)x).name == "All").First());
                    Global.companys.RemoveAt(i);
                    this.company = null;
                }
                catch (Exception)
                {

                    //throw;
                }
            }

        }
        public void clear()
        {
            id = null;
            name = null;
            email = null;
            pass = null;
            company = null;
            admin = false;
        }
        public static ObservableCollection<object> getTable()
        {
            ObservableCollection<object> c = new ObservableCollection<object>();
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `user` "; DataTable dt = sql.Select(q);
            if (dt.Rows.Count == 0)
            {
                User tmp = new User(); c.Add(tmp); return c;
            }
            foreach (DataRow r in dt.Rows)
            {
                Users temp = new Users();
                temp.id = r["id"].ToString();
                temp.name = r["name"].ToString();
                temp.email = r["email"].ToString();
                temp.pass = r["pass"].ToString();
                temp.company = new Company(r["company"].ToString());
                temp.admin = Convert.ToBoolean(r["admin"].ToString());
                c.Add(temp);
            }
            return c;
        }
    }
    public class Client : INotifyPropertyChanged
    {
        private string _id;
        private string _name;
        private string _email;
        private string _fax;
        private string _phone;
        private Country _country;

        private string _address;
        private string _notes;
        public event PropertyChangedEventHandler PropertyChanged;
        private Window window { get; set; }
        public string id
        {
            get { return _id; }
            set
            {
                _id = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("id"));
            }
        }
        public string name
        {
            get { return _name; }
            set
            {
                _name = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("name"));
            }
        }
        public string email
        {
            get { return _email; }
            set
            {
                _email = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("email"));
            }
        }
        public string fax
        {
            get { return _fax; }
            set
            {
                _fax = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("fax"));
            }
        }
        public string phone
        {
            get { return _phone; }
            set
            {
                _phone = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("phone"));
            }
        }
        public Country country
        {
            get { return _country; }
            set
            {
                _country = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("country"));
            }
        }
        public ObservableCollection<object> countrys
        {
            get { return Global.countrys; }
            set
            {
                Global.countrys = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("countrys"));
            }
        }
        public string address
        {
            get { return _address; }
            set
            {
                _address = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("address"));
            }
        }
        public string notes
        {
            get { return _notes; }
            set
            {
                _notes = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("notes"));
            }
        }
        public Client(Window W = null)
        {
            window = W;
        }
        public Client(string ID, Window W = null)
        {
            window = W;
            Mysqldb sql = new Mysqldb();
            string q;
            try
            {
                string x = Convert.ToInt32(ID).ToString();
                q = "SELECT * FROM `client` Where id = " + ID;
            }
            catch (Exception)
            {

                q = "SELECT * FROM `client` Where name = '" + ID + "'";
            }
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.name = r["name"].ToString();
            this.email = r["email"].ToString();
            this.fax = r["fax"].ToString();
            this.phone = r["phone"].ToString();
            this.country = new Country(r["country"].ToString());
            this.address = r["address"].ToString();
            this.notes = r["notes"].ToString();
        }
        public void complete(string ID)
        {
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `client` Where id = " + ID;
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.name = r["name"].ToString();
            this.email = r["email"].ToString();
            this.fax = r["fax"].ToString();
            this.phone = r["phone"].ToString();
            this.country = new Country(r["country"].ToString());
            this.address = r["address"].ToString();
            this.notes = r["notes"].ToString();
        }
        public Client clone()
        {
            Client temp = new Client();
            temp.id = this._id;
            temp.name = this._name;
            temp.email = this._email;
            temp.fax = this._fax;
            temp.phone = this._phone;
            temp.country = this._country;
            temp.address = this._address;
            temp.notes = this._notes;
            return temp;
        }
        public void selectItem(object sender, MouseButtonEventArgs e)
        {
            this.id = ((Client)((ListViewItem)sender).Content).id;
            this.name = ((Client)((ListViewItem)sender).Content).name;
            this.email = ((Client)((ListViewItem)sender).Content).email;
            this.fax = ((Client)((ListViewItem)sender).Content).fax;
            this.phone = ((Client)((ListViewItem)sender).Content).phone;
            this.country = (Country)Global.countrys.Where(x => ((Country)x).name == ((Client)((ListViewItem)sender).Content).country.name).First();
            this.address = ((Client)((ListViewItem)sender).Content).address;
            this.notes = ((Client)((ListViewItem)sender).Content).notes;
        }
        public void add(object sender, RoutedEventArgs e)
        {
            try
            {
                if (name == string.Empty)
                {
                    MessageBox.Show(translate.trans("Please Enter A Valid DAta !!!"));
                }
                Mysqldb sql = new Mysqldb();
                string q = "INSERT INTO  uniexport.`client` (`id`,`company`,`name`,`email`,`fax`,`phone`,`country`,`address`,`notes`) VALUES ( NULL,'" + Global.company.id + "','" + name + "','" + email + "','" + fax + "','" + phone + "','" + country.id + "','" + address + "','" + notes + "');";
                id = (sql.nextAutoIncrement("client")).ToString();

                if (sql.Select(q) != null) { Global.clients.Add(clone()); clear(); }

            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.ToString());
            }
        }
        public void edit(object sender, RoutedEventArgs e)
        {
            if (name == string.Empty)
            {
                MessageBox.Show(translate.trans("Please Enter A Valid DAta !!!"));
            }
            Mysqldb sql = new Mysqldb();
            string q = "UPDATE uniexport.`client` SET `name` = '" + name + "' ,`email` = '" + email + "' ,`fax` = '" + fax + "' ,`phone` = '" + phone + "' ,`country` = '" + country.id + "' ,`address` = '" + address + "' ,`notes` = '" + notes + "' WHERE `Client`.`id` = " + this.id;
            sql.Select(q);
            foreach (Client c in Global.clients)
            {
                if (c.id == _id)
                {
                    Global.clients[Global.clients.IndexOf(c)] = clone(); return;
                }
            }
            clear();
        }
        public void del(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "DELETE FROM  uniexport.`client` WHERE `client`.`id` = " + id;
            sql.Select(q);
            foreach (Client temp in Global.clients)
            {
                if (temp.id == _id)
                {
                    Global.clients.Remove(temp); return;
                }
            }
            clear();
        }
        public void close(object sender, RoutedEventArgs e)
        {
            Global.removeWindow(window); window.Close();
        }
        public void clear()
        {
            id = null;
            name = null;
            email = null;
            fax = null;
            phone = null;
            country = null;
            address = null;
            notes = null;
        }
        public static ObservableCollection<object> getTable(Country country = null)
        {
            ObservableCollection<object> c = new ObservableCollection<object>();
            Mysqldb sql = new Mysqldb(); string q;
            if (country != null) { q = "SELECT * FROM `client` where country = " + country.id + " and company = " + Global.company.id; }
            else { q = "SELECT * FROM `client` where company = " + Global.company.id; }
            DataTable dt = sql.Select(q);
            if (dt.Rows.Count == 0)
            {
                Client tmp = new Client(); c.Add(tmp); return c;
            }
            foreach (DataRow r in dt.Rows)
            {
                Client temp = new Client();
                temp.id = r["id"].ToString();
                temp.name = r["name"].ToString();
                temp.email = r["email"].ToString();
                temp.fax = r["fax"].ToString();
                temp.phone = r["phone"].ToString();
                temp.country = new Country(r["country"].ToString());
                temp.address = r["address"].ToString();
                temp.notes = r["notes"].ToString();
                c.Add(temp);
            }
            return c;
        }
    }
    public class ExportCertificate : INotifyPropertyChanged
    {
        public string id { get; set; }
        private bool _rowSelected = false;
        private string _num;
        private string _dat;
        private Company _company;
        private Country _country;
        private Port _port;
        private ShippingCompany _shippingCompany;
        private string _ptr_nolon_man = "0";
        private bool _boles;
        private string _nolon = "0";
        private bool _manifesto;
        private string _usdToEgp = "0";
        private string _usdVal = "0";
        private string _PTREgp = "0";
        private string _totalEgp = "0";
        private string _manifestoSupport = "0";
        private string _submitDate;
        private string _accrualDate;
        private string _notes;
        public event PropertyChangedEventHandler PropertyChanged;
        private Window window { get; set; }
        public string num
        {
            get { return _num; }
            set
            {
                _num = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("num"));
            }
        }
        public Company company
        {
            get { return _company; }
            set
            {
                _company = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("company"));
            }
        }
        public ObservableCollection<object> companys
        {
            get { return Global.companys; }
            set
            {
                Global.companys = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("companys"));
            }
        }
        public string dat
        {
            get { return _dat; }
            set
            {
                _dat = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("dat"));
            }
        }
        public Country country
        {
            get { return _country; }
            set
            {
                _country = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("country"));
            }
        }
        public ObservableCollection<object> countrys
        {
            get { return Global.countrys; }
            set
            {
                Global.countrys = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("countrys"));
            }
        }
        public Port port
        {
            get { return _port; }
            set
            {
                _port = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("port"));
            }
        }
        public ObservableCollection<object> ports
        {
            get { return Global.ports; }
            set
            {
                Global.ports = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("ports"));
            }
        }
        public ShippingCompany shippingCompany
        {
            get { return _shippingCompany; }
            set
            {
                _shippingCompany = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("shippingCompany"));
            }
        }
        public ObservableCollection<object> shippingCompanys
        {
            get { return Global.shippingCompanys; }
            set
            {
                Global.shippingCompanys = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("shippingCompanys"));
            }
        }
        public bool boles
        {
            get { return _boles; }
            set
            {
                _boles = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("boles"));
            }
        }

        public string nolon
        {
            get
            {
                try
                {
                    if (country.nolon)
                    {
                        return _nolon;
                    }
                    return "0";
                }
                catch (Exception)
                {

                    return "0";
                }
            }
            set
            {
                _nolon = value;
                if (this.PropertyChanged != null)
                {
                    this.PropertyChanged(this, new PropertyChangedEventArgs("nolon"));
                    this.PropertyChanged(this, new PropertyChangedEventArgs("nolonSupport"));
                    this.PropertyChanged(this, new PropertyChangedEventArgs("ptr_nolon_man"));
                }


            }
        }
        public string nolonSupport
        {
            get
            {
                try
                {
                    if (country.nolon)
                    {
                        return (Global.ToDouble(nolon) * Global.ToDouble(usdToEgp) * 0.5).ToString();
                    }
                    return "0";
                }
                catch (Exception)
                {

                    return "0";
                }

            }
            set
            {
                //_manifestoSupport = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("nolonSupport"));
            }
        }
        public bool manifesto
        {
            get { return _manifesto; }
            set
            {
                _manifesto = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("manifesto"));
            }
        }
        public string manifestoSupport
        {
            get
            {

                try
                {
                    if (manifesto && this.country.manifest)
                    {
                        return _manifestoSupport;
                    }
                    return "0";
                }
                catch (Exception)
                {

                    return "0";
                }

            }
            set
            {
                _manifestoSupport = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("manifestoSupport"));
            }
        }
        public string usdToEgp
        {
            get { return _usdToEgp; }
            set
            {
                _usdToEgp = value;
                if (this.PropertyChanged != null)
                {
                    this.PropertyChanged(this, new PropertyChangedEventArgs("usdToEgp"));
                    this.PropertyChanged(this, new PropertyChangedEventArgs("PTREgp"));
                    this.PropertyChanged(this, new PropertyChangedEventArgs("nolonSupport"));
                }

            }
        }
        public string usdVal
        {
            get { return _usdVal; }
            set
            {
                _usdVal = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("usdVal"));
            }
        }
        public string PTREgp
        {
            get { return _PTREgp; }
            set
            {
                _PTREgp = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("PTREgp"));
            }
        }
        public string ptr_nolon_man
        {
            get
            {
                return (Global.ToDouble(nolonSupport) + Global.ToDouble(manifestoSupport)).ToString();
            }
            set
            {

                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("ptr_nolon_man"));
            }
        }
        public string totalEgp
        {
            get { return (Global.ToDouble(ptr_nolon_man) + Global.ToDouble(PTREgp)).ToString(); }
            set
            {
                _totalEgp = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("totalEgp"));
            }
        }
        private string submitDate
        {
            get { return _submitDate; }
            set
            {
                _submitDate = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("submitDate"));
            }
        }
        public string accrualDate
        {
            get { return _accrualDate; }
            set
            {
                _accrualDate = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("accrualDate"));
            }
        }
        public string notes
        {
            get { return _notes; }
            set
            {
                _notes = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("notes"));
            }
        }
        public ExportCertificate(Window W = null)
        {
            window = W;
        }
        public ExportCertificate(string ID, Window W = null)
        {
            window = W;
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `exportCertificate` Where id = " + ID;
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.num = r["num"].ToString();
            this.company = new Company(r["company"].ToString());
            this.dat = r["dat"].ToString();
            this.country = new Country(r["country"].ToString());
            this.port = new Port(r["port"].ToString());
            this.shippingCompany = new ShippingCompany(r["shippingCompany"].ToString());
            //this.ptr_nolon_man = r["ptr_nolon_man"].ToString();
            this.boles = Convert.ToBoolean(r["boles"]);
            this.usdToEgp = r["usdToEgp"].ToString();
            //this.usdVal = r["usdVal"].ToString();
            //this.egpVal = r["egpVal"].ToString();
            //this.PTREgp = r["PTREgp"].ToString();
            //this.totalEgp = r["totalEgp"].ToString();
            this.submitDate = r["submitDate"].ToString();
            this.accrualDate = r["accrualDate"].ToString();
        }
        public void complete(string ID)
        {
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `exportcertificate` Where num = " + ID;
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.num = r["num"].ToString();
            this.company = new Company(r["company"].ToString());
            this.dat = r["dat"].ToString();
            this.country = new Country(r["country"].ToString());
            this.port = new Port(r["port"].ToString());
            this.shippingCompany = new ShippingCompany(r["shippingCompany"].ToString());
            this.ptr_nolon_man = r["ptr_nolon_man"].ToString();
            this.boles = Convert.ToBoolean(r["boles"]);

            this.usdToEgp = r["usdToEgp"].ToString();
            this.PTREgp = r["PTREgp"].ToString();
            this.totalEgp = r["totalEgp"].ToString();
            this.submitDate = r["submitDate"].ToString();
            this.accrualDate = r["accrualDate"].ToString();
            this.notes = r["notes"].ToString();
        }
        public ExportCertificate clone()
        {
            ExportCertificate temp = new ExportCertificate();
            temp.id = this.id;
            temp.num = this._num;
            temp.company = Global.company.clone();
            temp.dat = this._dat;
            temp.country = this._country.clone();
            temp.port = this._port.clone();
            temp.shippingCompany = this._shippingCompany.clone();
            temp.manifesto = this.manifesto;
            temp.manifestoSupport = this.manifestoSupport;
            temp.boles = this._boles;
            temp.nolon = this.nolon;
            temp.nolonSupport = this.nolonSupport;
            temp.usdVal = this.usdVal;
            temp.usdToEgp = this._usdToEgp;
            temp.ptr_nolon_man = this.ptr_nolon_man;
            temp.PTREgp = this._PTREgp;
            temp.totalEgp = this._totalEgp;
            temp.submitDate = this._submitDate;
            temp.accrualDate = this._accrualDate;
            temp.notes = this.notes;
            return temp;
        }
        public void selectItem(object sender, MouseButtonEventArgs e)
        {
            this.id = ((ExportCertificate)((ListViewItem)sender).Content).id;
            this.num = ((ExportCertificate)((ListViewItem)sender).Content).num;
            this.dat = ((ExportCertificate)((ListViewItem)sender).Content).dat;
            this.country = (Country)Global.countrys.Where(x => ((Country)x).name == ((ExportCertificate)((ListViewItem)sender).Content).country.name).First();
            this.port = (Port)Global.ports.Where(x => ((Port)x).name == ((ExportCertificate)((ListViewItem)sender).Content).port.name).First();
            this.shippingCompany = (ShippingCompany)Global.shippingCompanys.Where(x => ((ShippingCompany)x).name == ((ExportCertificate)((ListViewItem)sender).Content).shippingCompany.name).First();
            this.boles = ((ExportCertificate)((ListViewItem)sender).Content).boles;
            this.nolon = ((ExportCertificate)((ListViewItem)sender).Content).nolon;
            this.manifesto = ((ExportCertificate)((ListViewItem)sender).Content).manifesto;
            this.usdToEgp = ((ExportCertificate)((ListViewItem)sender).Content).usdToEgp;
            this.submitDate = ((ExportCertificate)((ListViewItem)sender).Content).submitDate;
            this.accrualDate = ((ExportCertificate)((ListViewItem)sender).Content).accrualDate;
            this._rowSelected = true;
            // needs Edits
            this.ptr_nolon_man = ((ExportCertificate)((ListViewItem)sender).Content).ptr_nolon_man;
            this.PTREgp = ((ExportCertificate)((ListViewItem)sender).Content).PTREgp;
            this.totalEgp = ((ExportCertificate)((ListViewItem)sender).Content).totalEgp;
            this.notes = ((ExportCertificate)((ListViewItem)sender).Content).notes;
        }
        public void add(object sender, RoutedEventArgs e)
        {
            try
            {
                if (nolon == null || nolon == string.Empty)
                {
                    nolon = "0";
                }
                if (num == string.Empty || num == null || dat == string.Empty || country == null || port == null || shippingCompany == null || usdToEgp == "0")
                {
                    MessageBox.Show("Please enter correct data ");
                    return;
                }
                Mysqldb sql = new Mysqldb();
                string q = "INSERT INTO  uniexport.`exportcertificate` (`num`,`company`,`dat`,`country`,`port`,`shippingCompany`,`boles`,`nolon`,`manifesto`,`usdToEgp`,`submitDate`,`accrualDate`,`notes`) VALUES " +
                    "('" + num + "','" + Global.company.id + "'," + Global.dateFormate(dat) + ",'" + country.id + "','" + port.id + "','" + shippingCompany.id + "','" + ((boles) ? "1" : "0") + "','" + nolon + "','" + ((manifesto) ? "1" : "0") + "','" + usdToEgp + "'," + Global.dateFormate(submitDate) + "," + Global.dateFormate(accrualDate) + ",'" + notes + "' );";
                id = (sql.nextAutoIncrement("exportcertificate")).ToString();
                if (sql.Select(q) != null)
                {
                    Global.exportCertificates.Add(clone());
                    clear(sender, e);
                }
                else
                {
                    MessageBox.Show(sql.Select(q).ToString());
                }

            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.ToString());
            }
        }
        public void edit(object sender, RoutedEventArgs e)
        {
            string query = "select country from client inner join invoice on (invoice.client = client.id )where invoice.`exportCertificate` = " + id;
            Mysqldb sql = new Mysqldb();
            DataTable dt = sql.Select(query);
            if (dt != null && dt.Rows.Count > 0 && dt.Rows[0][0].ToString() != country.id)
            {
                MessageBox.Show(translate.trans("errcountry"));
            }
            string q = "UPDATE uniexport.`exportcertificate` SET `num` = '" + num + "' ,`company` = '" + Global.company.id + "' ,`dat` = " + Global.dateFormate(dat) + " ,`country` = '" + country.id + "' ,`port` = '" + port.id + "' ,`shippingCompany` = '" + shippingCompany.id + "' ,`boles` = '" + ((boles) ? "1" : "0") + "' ,`nolon` = '" + ((nolon)) + "' ,`manifesto` = '" + ((manifesto) ? "1" : "0") + "'  ,`usdToEgp` = '" + usdToEgp + "' ,`submitDate` = " + Global.dateFormate(submitDate) + " ,`accrualDate` = " + Global.dateFormate(accrualDate) + ",`notes` = '" + notes + "' WHERE `ExportCertificate`.`id` = " + id + ";";
            sql.Select(q);

            this.manifestoSupport = (Global.ToDouble(PTREgp) * 0.5).ToString();
            //this.ptr_nolon_man = (Global.ToDouble(nolonSupport)+ Global.ToDouble(manifestoSupport)).ToString();
            foreach (ExportCertificate c in Global.exportCertificates)
            {
                if (c.num == _num)
                {
                    Global.exportCertificates[Global.exportCertificates.IndexOf(c)] = clone(); return;
                }
            }
            clear(sender, e);
        }
        public void del(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "DELETE FROM  uniexport.`exportcertificate` WHERE `exportcertificate`.`id` = " + id;
            sql.Select(q);
            q = "DELETE FROM  `invoice` WHERE `exportCertificate` = " + id;
            sql.Select(q);
            foreach (ExportCertificate temp in Global.exportCertificates)
            {
                if (temp.num == _num)
                {
                    Global.exportCertificates.Remove(temp); clear(sender, e); return;
                }
            }

        }
        public void openInvoice(object sender, RoutedEventArgs e)
        {
            if (!_rowSelected)
            {
                MessageBox.Show(translate.trans("Please Select Row from Below Table !!!")); return;
            }
            foreach (Window w in Global.windows)
            {
                if (w.Title == translate.trans("Invoices"))
                {
                    if (MessageBox.Show(translate.trans("Another Invoices Window Already Opened. \n do you want to close it and open Another One? \n if you Click No Another Invoices Window Will be Opened."), translate.trans("Question"), MessageBoxButton.YesNo, MessageBoxImage.Warning) == MessageBoxResult.No)
                    {
                        //do something
                        Global.removeWindow(w);
                    }
                    else
                    {
                        //do something else
                    }
                    //w.Activate(); return;
                }
            }
            template t = new template();
            object W = new Window();
            object invoice = new Invoice(this, (Window)W);

            Global.invoices = Invoice.getTable(this);
            Global.clients = Client.getTable(country);
            t.template1(W, ref invoice, translate.trans("Invoices"), new List<string>() { "num", "client", "performa", "systemRef", "add", "edit", "del", "openInvoiceData", "clear", "close" }, Global.invoices, 0, 0, false);
            Global.addWindow((Window)W);

            if (((Invoice)Global.invoices[0]).id == string.Empty || ((Invoice)Global.invoices[0]).id == "" || ((Invoice)Global.invoices[0]).id == null)
            {
                Global.invoices.RemoveAt(0);
            }
            ((Window)W).Show();
        }
        public void close(object sender, RoutedEventArgs e)
        {
            Global.removeWindow(window); window.Close();
        }
        public void clear(object sender, RoutedEventArgs e)
        {
            num = "";
            dat = DateTime.Today.ToString();
            country = null;
            port = null;
            shippingCompany = null;
            ptr_nolon_man = "0.0";
            boles = false;
            usdToEgp = "0";
            PTREgp = "0";
            totalEgp = "0";
            submitDate = null;
            accrualDate = null;
            notes = "";
            _rowSelected = false;
        }

        public static ObservableCollection<object> getTable()
        {
            ObservableCollection<object> c = new ObservableCollection<object>();
            Mysqldb sql = new Mysqldb();
            string q = "SELECT `id`,`export`,`usdToEgp`,`shippingCompany`,`boles`,`PORT`,`exportDate`,`submitDate`,`accrualDate`,`nolon`,`manifesto`,`Invoice`,`performa`,`systemRef`,`CLIENT`,`country`,`Cnolon`,`Cmanifest`,`company`,`brand`,`entity`,sum(`usdVal`)as 'usdVal',sum(`PTR`) as 'PTR',`nolonSupport`,sum(`manifestoSupport`) as 'manifestoSupport' ,`notes`  FROM `alldetailed` where company = '" + Global.company.name + "' GROUP BY export";
            DataTable dt = sql.Select(q);
            if (dt.Rows.Count == 0)
            {
                ExportCertificate tmp = new ExportCertificate(); c.Add(tmp); return c;
            }
            foreach (DataRow r in dt.Rows)
            {
                ExportCertificate temp = new ExportCertificate();
                temp.id = r["id"].ToString();
                temp.num = r["export"].ToString();
                temp.company = (Company)Global.company.clone();
                temp.dat = r["exportDate"].ToString();
                temp.country = new Country(r["country"].ToString());
                temp.port = new Port(r["port"].ToString());
                temp.shippingCompany = new ShippingCompany(r["shippingCompany"].ToString());
                temp.ptr_nolon_man = (Global.ToDouble(r["nolonSupport"].ToString()) + Global.ToDouble(r["manifestoSupport"].ToString())).ToString();
                temp.boles = Convert.ToBoolean(r["boles"].ToString());
                temp.nolon = (r["nolon"].ToString());
                temp.nolonSupport = r["nolonSupport"].ToString();
                temp.usdToEgp = r["usdToEgp"].ToString();
                temp.manifesto = Convert.ToBoolean(r["manifesto"].ToString());
                temp.manifestoSupport = r["manifestoSupport"].ToString();
                temp.usdVal = r["usdVal"].ToString();
                temp.notes = r["notes"].ToString();
                try
                {
                    temp.usdVal = (Convert.ToDouble(temp.usdVal)).ToString();
                }
                catch (Exception)
                {

                    temp.usdVal = "0";
                }
                //temp.egpVal = r["egpVal"].ToString();
                temp.PTREgp = r["PTR"].ToString();
                temp.totalEgp = (Global.ToDouble(temp.PTREgp) + Global.ToDouble(temp.ptr_nolon_man)).ToString();
                temp.submitDate = r["submitDate"].ToString();
                temp.accrualDate = r["accrualDate"].ToString();
                c.Add(temp);
            }
            return c;
        }
    }
    public class Invoice : INotifyPropertyChanged
    {
        private string _num;
        public string id { get; set; }
        private Client _client;
        private bool _rowSelected;
        private ExportCertificate _exportCertificate;
        private string _performa;
        private string _systemRef;
        private bool _bankReciete;
        public event PropertyChangedEventHandler PropertyChanged;
        private Window window { get; set; }
        public string num
        {
            get { return _num; }
            set
            {
                _num = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("num"));
            }
        }
        public Client client
        {
            get { return _client; }
            set
            {
                _client = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("client"));
            }
        }
        public ObservableCollection<object> clients
        {
            get { return Global.clients; }
            set
            {
                Global.clients = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("clients"));
            }
        }
        public ExportCertificate exportCertificate
        {
            get { return _exportCertificate; }
            set
            {
                _exportCertificate = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("exportCertificate"));
            }
        }
        public ObservableCollection<object> exportCertificates
        {
            get { return Global.exportCertificates; }
            set
            {
                Global.exportCertificates = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("exportCertificates"));
            }
        }
        public string performa
        {
            get { return _performa; }
            set
            {
                _performa = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("performa"));
            }
        }
        public string systemRef
        {
            get { return _systemRef; }
            set
            {
                _systemRef = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("systemRef"));
            }
        }
        public bool bankReciete
        {
            get { return _bankReciete; }
            set
            {
                _bankReciete = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("bankReciete"));
            }
        }
        public Invoice(ExportCertificate ex, Window W = null)
        {
            window = W;
            this.exportCertificate = ex;
        }
        public Invoice(string ID, Window W = null)
        {
            window = W;
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `invoice` Where id = " + ID;
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.num = r["num"].ToString();
            this.exportCertificate = new ExportCertificate(r["exportCertificate"].ToString());
            this.performa = r["performa"].ToString();
            this.systemRef = r["systemRef"].ToString();
            this.bankReciete = Convert.ToBoolean(r["bankReciete"].ToString());

        }
        public void complete(string ID)
        {
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `invoice` Where id = " + ID;
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.exportCertificate = new ExportCertificate(r["exportCertificate"].ToString());
            this.performa = r["performa"].ToString();
            this.systemRef = r["systemRef"].ToString();
            this.bankReciete = Convert.ToBoolean(r["bankReciete"].ToString());
        }
        public Invoice clone()
        {
            Invoice temp = new Invoice(_exportCertificate.clone());
            temp.num = this._num;
            temp.id = this.id;
            temp.exportCertificate = this._exportCertificate.clone();
            temp.client = this.client.clone();
            temp.performa = this._performa;
            temp.systemRef = this._systemRef;
            temp.bankReciete = this.bankReciete;
            return temp;
        }
        public void selectItem(object sender, MouseButtonEventArgs e)
        {
            this.id = ((Invoice)((ListViewItem)sender).Content).id;
            this.num = ((Invoice)((ListViewItem)sender).Content).num;
            this.client = (Client)Global.clients.Where(x => ((Client)x).name == ((Invoice)((ListViewItem)sender).Content).client.name).First();
            this.exportCertificate = ((Invoice)((ListViewItem)sender).Content).exportCertificate;
            this.performa = ((Invoice)((ListViewItem)sender).Content).performa;
            this.systemRef = ((Invoice)((ListViewItem)sender).Content).systemRef;
            this.bankReciete = ((Invoice)((ListViewItem)sender).Content).bankReciete;
            _rowSelected = true;
        }
        public void countrySelected(object sender, MouseButtonEventArgs e)
        {
            this.id = ((Invoice)((ListViewItem)sender).Content).id;
            this.num = ((Invoice)((ListViewItem)sender).Content).num;
            this.client = (Client)Global.clients.Where(x => ((Client)x).name == ((Invoice)((ListViewItem)sender).Content).client.name).First();
            this.exportCertificate = ((Invoice)((ListViewItem)sender).Content).exportCertificate;
            this.performa = ((Invoice)((ListViewItem)sender).Content).performa;
            this.systemRef = ((Invoice)((ListViewItem)sender).Content).systemRef;
            this.bankReciete = ((Invoice)((ListViewItem)sender).Content).bankReciete;
            _rowSelected = true;
        }
        public void add(object sender, RoutedEventArgs e)
        {
            try
            {
                Mysqldb sql = new Mysqldb();
                string q = "INSERT INTO  uniexport.`invoice` (`num`,`client`,`exportCertificate`,`performa`,`systemRef`,`bankReciete`) VALUES ( '" + num + "','" + client.id + "','" + exportCertificate.id + "','" + performa + "','" + systemRef + "','" + ((bankReciete) ? "1" : "0") + "');";
                id = (sql.nextAutoIncrement("invoice")).ToString();

                if (sql.Select(q) != null) { Global.invoices.Add(clone()); clear(sender, e); }

            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.ToString());
            }

        }
        public void edit(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "UPDATE uniexport.`invoice` SET `num` = '" + num + "' ,`client` = '" + client.id + "' ,`exportCertificate` = '" + exportCertificate.id + "' ,`performa` = '" + performa + "' ,`systemRef` = '" + systemRef + "' ,`bankReciete` = '" + ((bankReciete) ? "1" : "0") + "' WHERE `Invoice`.`id` = " + id + " ;";
            sql.Select(q);
            foreach (Invoice c in Global.invoices)
            {
                if (c.id == id)
                {
                    Global.invoices[Global.invoices.IndexOf(c)] = this.clone(); break; ;
                }
            }
            clear(sender, e);
        }
        public void del(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "DELETE FROM  uniexport.`invoice` WHERE `invoice`.`id` = " + id;
            sql.Select(q);
            q = "DELETE FROM  uniexport.`invoicedata` WHERE `invoice` = " + id;
            sql.Select(q);
            foreach (Invoice temp in Global.invoices)
            {
                if (temp.id == id)
                {
                    Global.invoices.Remove(temp); clear(sender, e); return;
                }
            }

        }
        public void close(object sender, RoutedEventArgs e)
        {
            Global.exportCertificates = ExportCertificate.getTable();
            Global.removeWindow(window); window.Close();

        }
        public void clear(object sender, RoutedEventArgs e)
        {
            num = null;
            id = "";
            performa = null;
            systemRef = null;
            _rowSelected = false;
            bankReciete = false;
        }
        public void openInvoiceData(object sender, RoutedEventArgs e)
        {
            if (!_rowSelected)
            {
                MessageBox.Show(translate.trans("Please Select Row from Below Table !!!")); return;
            }
            foreach (Window w in Global.windows)
            {
                if (w.Title == translate.trans("InvoicesData"))
                {
                    if (MessageBox.Show(translate.trans("Another  Window Already Opened. \n do you want to close it and open Another One? \n if you Click No Another Window Will be Opened."), translate.trans("Question"), MessageBoxButton.YesNo, MessageBoxImage.Warning) == MessageBoxResult.No)
                    {
                        //do something
                        Global.removeWindow(w);
                    }
                    else
                    {
                        //do something else
                    }
                }
            }
            template t = new template();
            object W = new Window();
            object invoiceData = new InvoiceData(this, (Window)W);
            List<Property> p = new List<Property>()
            {
                new Property("brandCat","cmb" , _action:"onBrandCatChange"),
                new Property("brand", "cmb", _action:"onBrandChange"),
                new Property("usdVal","num",_action:"calc"),
                new Property("egpVal","num","",true),
                new Property("supportPercentage","num","",true),
                new Property("PTREgp","num","",true)
            };
            Global.invoiceDatas = InvoiceData.getTable(id);
            Global.brandCats = BrandCat.getTable();
            //Global.brands = Brand.getTable();
            t.Moderntemplate(W, ref invoiceData, translate.trans("InvoicesData"), p, new List<string>() { "add", "edit", "del", "openInvoice", "close" }, Global.invoiceDatas, null, 0, 0, false);
            Global.addWindow((Window)W);

            if (((InvoiceData)Global.invoiceDatas[0]).id == string.Empty || ((InvoiceData)Global.invoiceDatas[0]).id == "" || ((InvoiceData)Global.invoiceDatas[0]).id == null)
            {
                Global.invoiceDatas.RemoveAt(0);
            }
            ((Window)W).Show();
        }
        public static ObservableCollection<object> getTable(ExportCertificate e)
        {
            ObservableCollection<object> c = new ObservableCollection<object>();
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `invoice` inner join `exportCertificate` as e on (e.id = invoice.`exportCertificate`) where e.company = " + Global.company.id + "  and `exportCertificate` = " + e.id;
            DataTable dt = sql.Select(q);
            if (dt == null || dt.Rows.Count == 0)
            {
                Invoice tmp = new Invoice(new ExportCertificate()); c.Add(tmp); return c;
            }
            foreach (DataRow r in dt.Rows)
            {
                Invoice temp = new Invoice(new ExportCertificate());
                temp.id = r["id"].ToString();
                temp.num = r["num"].ToString();
                temp.exportCertificate = new ExportCertificate(r["exportCertificate"].ToString());
                temp.client = new Client(r["client"].ToString());
                temp.performa = r["performa"].ToString();
                temp.systemRef = r["systemRef"].ToString();
                temp.bankReciete = Convert.ToBoolean(r["bankReciete"].ToString());
                c.Add(temp);
            }
            return c;
        }
        public static ObservableCollection<object> getTable(string query)
        {
            ObservableCollection<object> c = new ObservableCollection<object>();
            Mysqldb sql = new Mysqldb();
            string q = query;
            DataTable dt = sql.Select(q);
            if (dt == null || dt.Rows.Count == 0)
            {
                Invoice tmp = new Invoice(new ExportCertificate()); c.Add(tmp); return c;
            }
            foreach (DataRow r in dt.Rows)
            {
                Invoice temp = new Invoice(new ExportCertificate());
                temp.id = r["id"].ToString();
                temp.num = r["num"].ToString();
                temp.exportCertificate = new ExportCertificate(r["exportCertificate"].ToString());
                temp.client = new Client(r["client"].ToString());
                temp.performa = r["performa"].ToString();
                temp.systemRef = r["systemRef"].ToString();
                //temp.bankReciete = Convert.ToBoolean(r["bankReciete"].ToString());
                c.Add(temp);
            }
            return c;
        }
    }
    public class InvoiceData : INotifyPropertyChanged
    {
        private string _id;
        private Invoice _invoice;
        private BrandCat _brandCat;
        private Brand _brand;
        private string _usdVal;
        private string _egpVal;
        private string _PTREgp;
        private string _supportPercentage;
        public event PropertyChangedEventHandler PropertyChanged;
        private Window window { get; set; }
        public string id
        {
            get { return _id; }
            set
            {
                _id = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("id"));
            }
        }
        private Invoice invoice
        {
            get { return _invoice; }
            set
            {
                _invoice = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("invoice"));
            }
        }
        public ObservableCollection<object> invoices
        {
            get { return Global.invoices; }
            set
            {
                Global.invoices = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("invoices"));
            }
        }
        public BrandCat brandCat
        {
            get { return _brandCat; }
            set
            {
                _brandCat = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("brandCat"));
            }
        }
        public Brand brand
        {
            get { return _brand; }
            set
            {
                _brand = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("brand"));
            }
        }
        public ObservableCollection<object> brands
        {
            get { return Global.brands; }
            set
            {
                Global.brands = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("brands"));
            }
        }
        public ObservableCollection<object> brandCats
        {
            get { return Global.brandCats; }
            set
            {
                Global.brandCats = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("brandCats"));
            }
        }
        public string usdVal
        {
            get { return _usdVal; }
            set
            {
                _usdVal = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("usdVal"));
            }
        }
        public string egpVal
        {
            get { return _egpVal; }
            set
            {
                _egpVal = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("egpVal"));
            }
        }
        public string supportPercentage
        {
            get { return _supportPercentage; }
            set
            {
                _supportPercentage = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("supportPercentage"));
            }
        }
        public string PTREgp
        {
            get { return _PTREgp; }
            set
            {
                _PTREgp = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("PTREgp"));
            }
        }
        public InvoiceData(Invoice i, Window W = null)
        {
            window = W;
            this.invoice = i;
        }
        public InvoiceData(string ID, Window W = null)
        {
            window = W;
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `invoiceData` Where id = " + ID;
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.invoice = new Invoice(r["invoice"].ToString());
            this.brand = new Brand(r["brand"].ToString());
            this.usdVal = r["usdVal"].ToString();
            this.egpVal = r["egpVal"].ToString();
            this.PTREgp = r["PTREgp"].ToString();
        }
        public void complete(string ID)
        {
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `invoicedata` Where id = " + ID;
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.invoice = new Invoice(r["invoice"].ToString());
            this.brand = new Brand(r["brand"].ToString());
            this.usdVal = r["usdVal"].ToString();
            this.egpVal = r["egpVal"].ToString();
            this.PTREgp = r["PTREgp"].ToString();
        }
        public InvoiceData clone()
        {
            InvoiceData temp = new InvoiceData(invoice);
            temp.id = this._id;
            temp.invoice = this._invoice;
            temp.brand = this._brand.clone();
            temp.usdVal = this._usdVal;
            temp.egpVal = this._egpVal;
            temp.PTREgp = this._PTREgp;
            temp.supportPercentage = this.supportPercentage;
            return temp;
        }
        public void selectItem(object sender, MouseButtonEventArgs e)
        {
            try
            {
                this.id = ((InvoiceData)((ListViewItem)sender).Content).id;
                this.invoice = ((InvoiceData)((ListViewItem)sender).Content).invoice;
                //this.brand 

                Global.brands = Brand.getTable(this.brandCat);
                Brand b = (Brand)(((InvoiceData)((ListViewItem)sender).Content).brand);
                this.brandCat = (BrandCat)Global.brandCats.Where(x => ((BrandCat)x).name == b.brandCat.name).First();
                this.brand = (Brand)Global.brands.Where(x => ((Brand)x).name == ((InvoiceData)((ListViewItem)sender).Content).brand.name).First();
                this.usdVal = ((InvoiceData)((ListViewItem)sender).Content).usdVal;
                this.egpVal = ((InvoiceData)((ListViewItem)sender).Content).egpVal;
                this.PTREgp = ((InvoiceData)((ListViewItem)sender).Content).PTREgp;
                this.supportPercentage = ((InvoiceData)((ListViewItem)sender).Content).supportPercentage;
            }
            catch (Exception)
            {

                //throw;
            }

        }
        public void add(object sender, RoutedEventArgs e)
        {
            try
            {
                Mysqldb sql = new Mysqldb();
                string q = "INSERT INTO  uniexport.`invoicedata` (`id`,`invoice`,`brand`,`usdVal`,`supportPercentage`) VALUES ( NULL,'" + invoice.id + "','" + brand.id + "','" + usdVal + "','" + supportPercentage + "');";
                id = (sql.nextAutoIncrement("invoicedata")).ToString();
                if (sql.Select(q) != null) { Global.invoiceDatas.Add(clone()); clear(); }
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.ToString());
            }
        }
        public void edit(object sender, RoutedEventArgs e)
        {
            try
            {
                Mysqldb sql = new Mysqldb();
                string q = "UPDATE uniexport.`invoicedata` SET  `brand` = '" + brand.id + "' ,`usdVal` = '" + usdVal + "' ,`supportPercentage` = '" + supportPercentage + "'  WHERE `InvoiceData`.`id` =" + id + " ;";
                sql.Select(q);
                foreach (InvoiceData c in Global.invoiceDatas)
                {
                    if (c.id == _id)
                    {
                        Global.invoiceDatas[Global.invoiceDatas.IndexOf(c)] = clone(); clear(); return;
                    }
                }
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.ToString());
            }

        }
        public void del(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "DELETE FROM  uniexport.`invoicedata` WHERE `invoicedata`.`id` = " + id;
            sql.Select(q);
            foreach (InvoiceData temp in Global.invoiceDatas)
            {
                if (temp.id == _id)
                {
                    Global.invoiceDatas.Remove(temp); return;
                }
            }
            clear();
        }
        public void calc(object sender, KeyEventArgs e)
        {
            try
            {
                // calculate
                egpVal = (Global.ToDouble(usdVal) * Global.ToDouble(invoice.exportCertificate.usdToEgp)).ToString();
                PTREgp = (Global.ToDouble(egpVal) * Global.ToDouble(brand.supportPercentage)).ToString();
            }
            catch (Exception)
            {

                //throw;
            }
        }
        public void close(object sender, RoutedEventArgs e)
        {
            Global.removeWindow(window); window.Close();
        }
        public void clear()
        {
            id = null;
            brandCat = null;
            brand = null;
            usdVal = null;
            egpVal = null;
            PTREgp = null;
        }
        public void onBrandCatChange(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                this.brands = Brand.getTable(this.brandCat);
            }
            catch (Exception)
            {

                MessageBox.Show("Wrong Selection");
                //throw;
            }
        }
        public void onBrandChange(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                supportPercentage = brand.supportPercentage;
            }
            catch (Exception)
            {

                //throw;
            }

        }
        public static ObservableCollection<object> getTable(string inv)
        {
            ObservableCollection<object> c = new ObservableCollection<object>();
            Mysqldb sql = new Mysqldb();
            string q = @"SELECT invoiceData.id ,	invoice ,brand ,usdVal ,supportPercentage ,(usdVal * e.usdToEgp) as egpVal,
                        (usdVal * e.usdToEgp) * supportPercentage as PTREgp  
                        FROM `invoicedata` INNER join invoice on(invoice.id = invoicedata.invoice) 
                        INNER join exportcertificate as e on(e.id = invoice.exportCertificate) where `invoice` = " + inv;
            DataTable dt = sql.Select(q);
            if (dt.Rows.Count == 0)
            {
                InvoiceData tmp = new InvoiceData(new Invoice(new ExportCertificate())); c.Add(tmp); return c;
            }
            foreach (DataRow r in dt.Rows)
            {
                InvoiceData temp = new InvoiceData(new Invoice(new ExportCertificate()));
                temp.id = r["id"].ToString();
                temp.invoice = new Invoice(r["invoice"].ToString());
                temp.brand = new Brand(r["brand"].ToString());
                temp.brandCat = temp.brand.brandCat;
                temp.usdVal = r["usdVal"].ToString();
                temp.egpVal = r["egpVal"].ToString();//r["egpVal"].ToString();
                temp.PTREgp = r["PTREgp"].ToString();
                temp.supportPercentage = r["supportPercentage"].ToString();
                c.Add(temp);
            }
            return c;
        }
    }
    public class FileNo : INotifyPropertyChanged
    {
        private string _id;
        private string _num;
        private string _dat;
        private ExportCertificate _exportCertificate;
        public event PropertyChangedEventHandler PropertyChanged;
        private Window window { get; set; }
        public string id
        {
            get { return _id; }
            set
            {
                _id = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("id"));
            }
        }
        public string num
        {
            get { return _num; }
            set
            {
                _num = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("num"));
            }
        }
        public string dat
        {
            get { return _dat; }
            set
            {
                _dat = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("dat"));
            }
        }
        public ExportCertificate exportCertificate
        {
            get { return _exportCertificate; }
            set
            {
                _exportCertificate = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("exportCertificate"));
            }
        }
        public ObservableCollection<object> exportCertificates
        {
            get { return Global.exportCertificates; }
            set
            {
                Global.exportCertificates = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("exportCertificate"));
            }
        }

        public FileNo(Window W = null)
        {
            window = W;
        }
        public FileNo(string ID, Window W = null)
        {
            window = W;
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `fileNo` Where id = " + ID;
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.num = r["num"].ToString();
            this.dat = r["dat"].ToString();
            this.exportCertificate = new ExportCertificate(r["exportCertificate"].ToString());
        }
        public void complete(string ID)
        {
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `fileno` Where id = " + ID;
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.dat = r["dat"].ToString();
            this.dat = r["dat"].ToString();
            this.exportCertificate = new ExportCertificate(r["exportCertificate"].ToString());
        }
        public FileNo clone()
        {
            FileNo temp = new FileNo();
            temp.id = this._id;
            temp.num = this._num;
            temp.dat = this._dat;
            temp.exportCertificate = this._exportCertificate.clone();
            return temp;
        }
        public void selectItem(object sender, MouseButtonEventArgs e)
        {
            this.id = ((FileNo)((ListViewItem)sender).Content).id;
            this.num = ((FileNo)((ListViewItem)sender).Content).num;
            this.dat = ((FileNo)((ListViewItem)sender).Content).dat;
            this.exportCertificate = (ExportCertificate)Global.exportCertificates.Where(x => ((ExportCertificate)x).num == ((FileNo)((ListViewItem)sender).Content).exportCertificate.num).First();
        }
        public void add(object sender, RoutedEventArgs e)
        {
            try
            {
                Mysqldb sql = new Mysqldb();
                string q = "INSERT INTO  uniexport.`fileno` (`id`,`num`,`company`,`dat`,`exportCertificate`) VALUES ( NULL ,'" + num + "','" + Global.company.id + "'," + Global.dateFormate(dat) + ",'" + exportCertificate.id + "');";
                id = (sql.nextAutoIncrement("fileno")).ToString();
                if (sql.Select(q) != null) { Global.fileNos.Add(clone()); clear(); }

            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.ToString());
            }
        }
        public void edit(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "UPDATE uniexport.`fileno` SET `num` = '" + num + "' ,`dat` = " + Global.dateFormate(dat) + ",`exportCertificate` = '" + exportCertificate.id + "'  WHERE `FileNo`.`id` = " + id + " ;";
            sql.Select(q);
            foreach (FileNo c in Global.fileNos)
            {
                if (c.id == _id)
                {
                    Global.fileNos[Global.fileNos.IndexOf(c)] = clone(); return;
                }
            }
            clear();
        }
        public void del(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "DELETE FROM  uniexport.`fileno` WHERE `fileno`.`id` = " + id;
            sql.Select(q);
            foreach (FileNo temp in Global.fileNos)
            {
                if (temp.id == _id)
                {
                    Global.fileNos.Remove(temp); clear(); return;
                }
            }

        }
        public void close(object sender, RoutedEventArgs e)
        {
            Global.removeWindow(window); window.Close();
        }
        public void clear()
        {
            id = null;
            dat = null;
        }
        public static ObservableCollection<object> getTable()
        {
            ObservableCollection<object> c = new ObservableCollection<object>();
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `fileno` as f WHERE company = " + Global.company.id; DataTable dt = sql.Select(q);
            if (dt.Rows.Count == 0)
            {
                FileNo tmp = new FileNo(); c.Add(tmp); return c;
            }
            foreach (DataRow r in dt.Rows)
            {
                FileNo temp = new FileNo();
                temp.id = r["id"].ToString();
                temp.num = r["num"].ToString();
                temp.dat = r["dat"].ToString();
                temp.exportCertificate = new ExportCertificate(r["exportCertificate"].ToString());
                c.Add(temp);
            }
            return c;
        }
    }

    public class Activation : INotifyPropertyChanged
    {
        private string _hwKey;
        private string _serial;
        public event PropertyChangedEventHandler PropertyChanged;
        private Window window { get; set; }
        public string hwKey
        {
            get { return activation.getUniqId(); }
            set
            {
                _hwKey = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("hwKey"));
            }
        }
        public string serial
        {
            get { return _serial; }
            set
            {
                _serial = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("serial"));
            }
        }

        public Activation(Window W = null)
        {
            window = W;
        }


        public void ActivateApp(object sender, RoutedEventArgs e)
        {
            if (activation.Reg(serial))
            {
                MessageBox.Show("Activation Success");
                MainWindow m = new MainWindow();
                m.Show();
                window.Close();
            }
            else
            {
                MessageBox.Show("Activation Faild");
            }
        }

        public void close(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }


    }

    public class BankReceipt : INotifyPropertyChanged
    {
        private bool _rowSelected = false;
        private string _id;
        private string _num;
        private Country _country;

        private string _usd;
        private string _dat;
        public event PropertyChangedEventHandler PropertyChanged;
        private Window window { get; set; }
        public string id
        {
            get { return _id; }
            set
            {
                _id = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("id"));
            }
        }
        public string num
        {
            get { return _num; }
            set
            {
                _num = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("num"));
            }
        }
        public Country country
        {
            get { return _country; }
            set
            {
                _country = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("country"));
            }
        }
        public Company company
        {
            get { return Global.company; }
            set
            {
                //_client = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("company"));
            }
        }
        public ObservableCollection<object> countrys
        {
            get { return Global.countrys; }
            set
            {
                Global.countrys = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("countrys"));
            }
        }
        public string usd
        {
            get { return _usd; }
            set
            {
                _usd = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("usd"));
            }
        }
        public string dat
        {
            get { return _dat; }
            set
            {
                _dat = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("dat"));
            }
        }
        public BankReceipt(Window W = null)
        {
            window = W;
        }
        public BankReceipt(string ID, Window W = null)
        {
            try
            {
                window = W;
                Mysqldb sql = new Mysqldb();
                string q = "SELECT * FROM `bankReceipt` Where id = " + ID;
                DataTable dt = sql.Select(q);
                DataRow r = dt.Rows[0];
                this.id = r["id"].ToString();
                this.num = r["num"].ToString();
                this.country = new Country(r["client"].ToString());
                this.usd = r["usd"].ToString();
                this.dat = r["dat"].ToString();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
        public void complete(string ID)
        {
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `bankreceipt` Where id = " + ID;
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.num = r["num"].ToString();
            this.country = new Country(r["client"].ToString());
            this.usd = r["usd"].ToString();
            this.dat = r["dat"].ToString();
        }
        public BankReceipt clone()
        {
            BankReceipt temp = new BankReceipt();
            temp.id = this._id;
            temp.num = this._num;
            temp.country = this.country.clone();
            temp.usd = this._usd;
            temp.dat = this._dat;
            return temp;
        }
        public void selectItem(object sender, MouseButtonEventArgs e)
        {
            this._rowSelected = true;
            this.id = ((BankReceipt)((ListViewItem)sender).Content).id;
            this.num = ((BankReceipt)((ListViewItem)sender).Content).num;
            this.country = (Country)Global.countrys.Where(x => ((Country)x).id == ((BankReceipt)((ListViewItem)sender).Content).country.id).First();
            this.usd = ((BankReceipt)((ListViewItem)sender).Content).usd;
            this.dat = ((BankReceipt)((ListViewItem)sender).Content).dat;
        }
        public void add(object sender, RoutedEventArgs e)
        {
            try
            {
                Mysqldb sql = new Mysqldb();
                string q = "INSERT INTO  uniexport.`bankreceipt` (`id`,`company`,`num`,`country`,`usd`,`dat`) VALUES ( NULL,'" + Global.company.id + "','" + num + "','" + country.id + "','" + usd + "'," + Global.dateFormate(dat) + ");";
                id = (sql.nextAutoIncrement("bankreceipt")).ToString();
                if (sql.Select(q) != null) { Global.bankReceipts.Add(clone()); clear(); }
                else
                {
                    MessageBox.Show(sql.Select(q).ToString());
                }
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.ToString());
            }
        }
        public void edit(object sender, RoutedEventArgs e)
        {
            if (!_rowSelected) { MessageBox.Show(translate.trans("Please Select Record")); return; }

            Mysqldb sql = new Mysqldb();
            string q = "UPDATE uniexport.`bankreceipt` SET `num` = '" + num + "' ,`country` = '" + country.id + "' ,`usd` = '" + usd + "' ,`dat` = " + Global.dateFormate(dat) + " WHERE `BankReceipt`.`id` = " + id + ";";
            sql.Select(q);
            foreach (BankReceipt c in Global.bankReceipts)
            {
                if (c.id == _id)
                {
                    Global.bankReceipts[Global.bankReceipts.IndexOf(c)] = clone(); clear(); return;
                }
            }

        }
        public void del(object sender, RoutedEventArgs e)
        {
            if (!_rowSelected) { MessageBox.Show(translate.trans("Please Select Record")); return; }
            Mysqldb sql = new Mysqldb();
            string q = "DELETE FROM  uniexport.`bankreceipt` WHERE `bankreceipt`.`id` = " + id;
            sql.Select(q);
            q = "DELETE FROM  uniexport.`bankreceiptdata` WHERE `bankreceipt` = " + id;
            sql.Select(q);
            foreach (BankReceipt temp in Global.bankReceipts)
            {
                if (temp.id == _id)
                {
                    Global.bankReceipts.Remove(temp); clear(); return;
                }
            }

        }
        public void close(object sender, RoutedEventArgs e)
        {
            Global.removeWindow(window); window.Close();
        }
        public void openBankReceiptData(object sender, RoutedEventArgs e)
        {
            if (!_rowSelected) { MessageBox.Show(translate.trans("Please Select Record first!!")); return; }
            foreach (Window w in Global.windows)
            {
                if (w.Title == translate.trans("BankReceiptData"))
                {
                    w.Activate(); return;
                }
            }
            template t = new template();
            object W = new Window();
            object bankReceiptData = new BankReceiptData(this, (Window)W);
            Global.bankReceiptDatas = BankReceiptData.getTable(this);
            ((BankReceiptData)bankReceiptData).exportCertificates = new ObservableCollection<object>();
            foreach (BankReceiptData b in Global.bankReceiptDatas)
            {
                ((BankReceiptData)bankReceiptData).exportCertificates.Add(b.exportCertificate);
            }
            List<Property> P = new List<Property>()
            {
                new Property("txtbankReceipt","num" , _readOnly:true),
                new Property("bankUsd","num" , _readOnly:true),
                new Property("sum","num" , _readOnly:true),
                new Property("exportCertificate","cmb",_displayPath:"num" , _action:"select"),
            };
            List<TableCol> tbcs = new List<TableCol>()
            {
                //new TableCol("id","id"),
                new TableCol("exportCertificate","exportCertificate.num"),
                new TableCol("exportUsd","exportUsd"),
                new TableCol("chck","chck",new Property("chck","bool",_action:"chckClicked")),
            };
            t.Moderntemplate(W, ref bankReceiptData, translate.trans("BankReceiptData"), P, new List<string>() { "save", "autoCalc", "close" }, Global.bankReceiptDatas, tbcs, 0, 0, false);
            Global.addWindow((Window)W);

            if (((BankReceiptData)Global.bankReceiptDatas[0]).id == string.Empty || ((BankReceiptData)Global.bankReceiptDatas[0]).id == "" || ((BankReceiptData)Global.bankReceiptDatas[0]).id == null)
            {
                Global.bankReceiptDatas.RemoveAt(0);
            }
            ((Window)W).Show();
        }
        public void clear()
        {
            id = null;
            num = null;
            country = null;
            usd = null;
            dat = null;
            _rowSelected = false;
        }
        public static ObservableCollection<object> getTable()
        {
            ObservableCollection<object> c = new ObservableCollection<object>();
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `bankreceipt` where company = " + Global.company.id; DataTable dt = sql.Select(q);
            if (dt.Rows.Count == 0)
            {
                BankReceipt tmp = new BankReceipt(); c.Add(tmp); return c;
            }
            foreach (DataRow r in dt.Rows)
            {
                BankReceipt temp = new BankReceipt();
                temp.id = r["id"].ToString();
                temp.num = r["num"].ToString();
                temp.country = new Country(r["country"].ToString());
                temp.usd = r["usd"].ToString();
                temp.dat = r["dat"].ToString();
                c.Add(temp);
            }
            return c;
        }
    }
    public class BankReceiptData : INotifyPropertyChanged
    {
        private bool _rowSelected = false;
        private string _id;
        private BankReceipt _bankReceipt;
        private ExportCertificate _exportCertificate;
        private ObservableCollection<object> _exportCertificates;
        private double _usd;
        private bool _chck;
        private DateTime _expDate;
        public event PropertyChangedEventHandler PropertyChanged;
        private Window window { get; set; }
        public string id
        {
            get { return _id; }
            set
            {
                _id = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("id"));
            }
        }
        public BankReceipt bankReceipt
        {
            get { return _bankReceipt; }
            set
            {
                _bankReceipt = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("bankReceipt"));
            }
        }
        public ExportCertificate exportCertificate
        {
            get { return _exportCertificate; }
            set
            {
                _exportCertificate = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("exportCertificate"));
            }
        }
        public string txtbankReceipt
        {
            get { return _bankReceipt.num; }
            set
            {
                //_bankReceipt = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("txtbankReceipt"));
            }
        }
        public string exportUsd
        {
            get { return _usd.ToString(); }
            set
            {
                _usd = Global.ToDouble(value);
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("exportUsd"));
            }
        }
        public string bankUsd
        {
            get { return bankReceipt.usd; }
            set
            {
                //_usd = Global.ToDouble(value);
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("bankUsd"));
            }
        }
        public string sum
        {
            get { return Global.tempsum.ToString(); }
            set
            {
                Global.tempsum = Global.ToDouble(value);
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("sum"));
            }
        }
        public bool chck
        {
            get { return _chck; }
            set
            {
                _chck = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("chck"));
            }
        }
        public DateTime expDate
        {
            get { return _expDate; }
            set
            {
                _expDate = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("expDate"));
            }
        }
        public ObservableCollection<object> bankReceipts
        {
            get { return Global.bankReceipts; }
            set
            {
                Global.bankReceipts = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("bankReceipts"));
            }
        }
        public ObservableCollection<object> exportCertificates
        {
            get { return _exportCertificates; }
            set
            {
                _exportCertificates = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("exportCertificates"));
            }
        }
        public BankReceiptData(Window W = null)
        {
            window = W;
        }
        public BankReceiptData(BankReceipt b, Window W = null)
        {
            this.bankReceipt = b;
            window = W;
        }
        public BankReceiptData(string ID, Window W = null)
        {
            window = W;
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `bankReceiptData` Where id = " + ID;
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.bankReceipt = new BankReceipt(r["bankReceipt"].ToString());
            this.exportCertificate = new ExportCertificate(r["exportCertificate"].ToString());
        }
        public void complete(string ID)
        {
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `bankreceiptdata` Where id = " + ID;
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.bankReceipt = new BankReceipt(r["bankReceipt"].ToString());
            this.exportCertificate = new ExportCertificate(r["exportCertificate"].ToString());
        }
        public BankReceiptData clone()
        {
            BankReceiptData temp = new BankReceiptData();
            temp.id = this._id;
            temp.bankReceipt = this._bankReceipt.clone();
            temp.exportCertificate = this.exportCertificate.clone();
            return temp;
        }
        public void selectItem(object sender, MouseButtonEventArgs e)
        {
            this._rowSelected = true;
            this.id = ((BankReceiptData)((ListViewItem)sender).Content).id;
            this.bankReceipt = (BankReceipt)Global.bankReceipts.Where(x => ((BankReceipt)x).id == ((BankReceiptData)((ListViewItem)sender).Content).bankReceipt.id).First();
            //this.exportCertificate = (ExportCertificate)Global.exportCertificates.Where(x => ((ExportCertificate)x).id == ((BankReceiptData)((ListViewItem)sender).Content).exportCertificate.id).First();
        }
        public void save(object sender, RoutedEventArgs e)
        {
            try
            {
                Mysqldb sql = new Mysqldb();
                string q = "DELETE FROM  uniexport.`bankreceiptdata` WHERE `bankreceiptdata`.`bankReceipt` = " + bankReceipt.id;
                sql.Select(q);
                foreach (object obj in Global.bankReceiptDatas)
                {
                    if (!((BankReceiptData)obj).chck) break;
                    q = "INSERT INTO  uniexport.`bankreceiptdata` (`id`, `bankReceipt`, `exportCertificate`) VALUES (NULL, '" + bankReceipt.id + "', '" + ((BankReceiptData)obj).exportCertificate.id + "');";
                    sql.Select(q);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }


        }
        public void chckClicked(object sender, RoutedEventArgs e)
        {
            CheckBox c = (CheckBox)sender;
            BankReceiptData b = (BankReceiptData)c.DataContext;
            int i = Global.bankReceiptDatas.IndexOf(Global.bankReceiptDatas.Where(x => ((BankReceiptData)x).exportCertificate == b.exportCertificate).First());
            if (c.IsChecked == true)
            {
                this.sum = (Global.tempsum + Global.ToDouble(b.exportUsd)).ToString();
                Global.bankReceiptDatas.Move(i, 0);
            }
            else
            {
                this.sum = (Global.tempsum - Global.ToDouble(b.exportUsd)).ToString();
                Global.bankReceiptDatas.Move(i, Global.bankReceiptDatas.Count - 1);

            }

        }
        public void select(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                string export = ((ComboBox)sender).Text;
                object temp = Global.bankReceiptDatas.Where(x => ((BankReceiptData)x).exportCertificate.num == export).First();
                ((BankReceiptData)temp).chck = true;
                int i = Global.bankReceiptDatas.IndexOf(temp);
                Global.bankReceiptDatas.Move(i, 0);
            }
            else
            {
                return;
            }

        }
        public Sol findElementsOfSum(List<double> lst, double target, int index = 0, Sol sols = null)
        {
            Sol r = new Sol(new List<int>(), Math.Abs(target));
            if (lst.Count == 0) return r;
            for (int i = 0; i < lst.Count; i++)
            {
                if (lst[i] == 0) continue;
                if (lst[i] == target)
                {
                    r.lst.Add(i + index); r.distance = 0;
                    return r;
                }
                else if (lst[i] < target - 3000)
                {
                    r = findElementsOfSum(lst.GetRange(i + 1, lst.Count - i - 1), target - lst[i], i + index + 1);
                    r.lst.Add(i + index);
                    if (sols == null) { sols = r; }
                    else if (sols.distance > r.distance) { sols = r; }
                    else { r = sols; }
                    if (r.distance == 0) return r;

                }
                else if (lst[i] < target + 3000)
                {
                    r = findElementsOfSum(lst.GetRange(i + 1, lst.Count - i - 1), target - lst[i], i + index + 1);
                    r.lst.Add(i + index);
                    if (sols == null) { sols = r; }
                    else if (sols.distance > r.distance) { sols = r; }
                    else { r = sols; }
                    if (r.distance == 0) return r;
                }



            }

            return r;
        }
        public void autoCalc(object sender, RoutedEventArgs e)
        {
            if (bankUsd == "0")
            {
                MessageBox.Show("Please Enter Correct Bank Receipt Value (USD)"); return;
            }
            // need to be calculated
            Mysqldb sql = new Mysqldb();

            if (Global.bankReceiptDatas == null || Global.bankReceiptDatas.Count == 0)
            {
                MessageBox.Show(translate.trans("There is no un Submitted Export Certificates in DataBase")); return;
            }
            foreach (object o in Global.bankReceiptDatas)
            {
                ((BankReceiptData)o).chck = false;
            }
            List<double> lst = new List<double>();//and year(`dat`) = '"+DateTime.Parse(br.dat).Year.ToString()+ "'
            IEnumerable<object> sameYear = Global.bankReceiptDatas.Where(x => (((BankReceiptData)x).expDate).Year.ToString() == DateTime.Parse(bankReceipt.dat).Year.ToString());
            foreach (object r in sameYear)
            {
                lst.Add(Global.ToDouble(((BankReceiptData)r).exportUsd));
            }

            Sol indeces = findElementsOfSum(lst, Global.ToDouble(bankUsd));// indeces of the export certificates
            if (indeces.lst.Count == 0)
            {
                MessageBox.Show(translate.trans("There Is no Set of Export Certificates with this sum !!!"));
                return;
            }
            // here we must select exportCer and invoices inside them  then select them in the table
            indeces.lst.Sort();
            sum = "0";
            foreach (int i in indeces.lst)
            {

                sum = (Global.ToDouble(sum) + lst[i]).ToString();
                int pos = Global.bankReceiptDatas.IndexOf(sameYear.ElementAt(i));
                ((BankReceiptData)Global.bankReceiptDatas[pos]).chck = true;
                Global.bankReceiptDatas.Move(pos, 0);
            }



        }
        public void close(object sender, RoutedEventArgs e)
        {
            Global.removeWindow(window); window.Close();
        }
        public void clear()
        {
            id = null;
            bankReceipt = null;
            exportCertificate = null;
            _rowSelected = false;
        }
        public static ObservableCollection<object> getTable(BankReceipt br)
        {
            ObservableCollection<object> c = new ObservableCollection<object>();
            Mysqldb sql = new Mysqldb();
            string q = "SELECT `id`,`export`,sum(usdVal) as usd , `dat` FROM alldetailed WHERE EXISTS(select * from bankreceiptdata where bankreceiptdata.exportCertificate = alldetailed.id  and bankreceiptdata.bankReceipt = " + br.id + " ) GROUP by(id);";
            DataTable dt = sql.Select(q);

            Global.tempsum = 0;
            foreach (DataRow r in dt.Rows)
            {
                if (r[0].ToString() == "") break;
                BankReceiptData temp = new BankReceiptData();
                temp.id = r["id"].ToString();
                temp.bankReceipt = br;
                temp.exportCertificate = new ExportCertificate(r["id"].ToString());
                temp.exportUsd = r["usd"].ToString();
                Global.tempsum += Global.ToDouble(r["usd"].ToString());
                temp.chck = true;
                temp.expDate = (DateTime)(r["dat"]);
                c.Add(temp);
            }
            q = "SELECT `id`,`export`,sum(usdVal) as usd , `dat`" +
                " FROM alldetailed WHERE  company = '" + Global.company.name + "'  and alldetailed.id not in(select bankreceiptdata.exportCertificate from bankreceiptdata ) GROUP by(id)";
            dt = sql.Select(q);
            foreach (DataRow r in dt.Rows)
            {
                if (r[0].ToString() == "") break;
                BankReceiptData temp = new BankReceiptData();
                temp.id = "null";
                temp.bankReceipt = br;
                temp.exportCertificate = new ExportCertificate(r["id"].ToString());
                temp.exportUsd = r["usd"].ToString();
                temp.chck = false;
                temp.expDate = (DateTime)(r["dat"]);
                c.Add(temp);
            }
            if (c.Count == 0)
            {
                BankReceiptData tmp = new BankReceiptData(); c.Add(tmp);
            }
            return c;
        }
    }

    public class Booked : INotifyPropertyChanged
    {
        private bool _rowSelected = false;
        private string _id;
        private string _valueEgp;
        private string _dat;
        public event PropertyChangedEventHandler PropertyChanged;
        private Window window { get; set; }
        public string id
        {
            get { return _id; }
            set
            {
                _id = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("id"));
            }
        }
        public string valueEgp
        {
            get { return _valueEgp; }
            set
            {
                _valueEgp = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("valueEgp"));
            }
        }
        public string dat
        {
            get { return _dat; }
            set
            {
                _dat = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("dat"));
            }
        }
        public Booked(Window W = null)
        {
            window = W;
        }
        public Booked(string ID, Window W = null)
        {
            window = W;
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `booked` Where id = " + ID;
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.valueEgp = r["valueEgp"].ToString();
            this.dat = r["dat"].ToString();
        }
        public void complete(string ID)
        {
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `booked` Where id = " + ID;
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.valueEgp = r["valueEgp"].ToString();
            this.dat = r["dat"].ToString();
        }
        public Booked clone()
        {
            Booked temp = new Booked();
            temp.id = this._id;
            temp.valueEgp = this._valueEgp;
            temp.dat = this._dat;
            return temp;
        }
        public void selectItem(object sender, MouseButtonEventArgs e)
        {
            this._rowSelected = true;
            this.id = ((Booked)((ListViewItem)sender).Content).id;
            this.valueEgp = ((Booked)((ListViewItem)sender).Content).valueEgp;
            this.dat = ((Booked)((ListViewItem)sender).Content).dat;
        }
        public void add(object sender, RoutedEventArgs e)
        {
            try
            {
                Mysqldb sql = new Mysqldb();
                string q = "INSERT INTO  uniexport.`booked` (`id`, `valueEgp`, `dat`, `company`) VALUES ( NULL,'" + valueEgp + "'," + Global.dateFormate(dat) + " ,"+Global.company.id+");";
                id = (sql.nextAutoIncrement("booked")).ToString();
                if (sql.Select(q) != null) { Global.bookeds.Add(clone()); clear(); }

            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.ToString());
            }
        }
        public void edit(object sender, RoutedEventArgs e)
        {
            if (!_rowSelected) { MessageBox.Show(translate.trans("Please Select Record")); return; }
            Mysqldb sql = new Mysqldb();
            string q = "UPDATE uniexport.`booked` SET `valueEgp` = '" + valueEgp + "' ,`dat` = " + Global.dateFormate(dat) + " WHERE `Booked`.`id` = " + id + ";";
            sql.Select(q);
            foreach (Booked c in Global.bookeds)
            {
                if (c.id == _id)
                {
                    Global.bookeds[Global.bookeds.IndexOf(c)] = clone(); return;
                }
            }
            clear();
        }
        public void del(object sender, RoutedEventArgs e)
        {
            if (!_rowSelected) { MessageBox.Show(translate.trans("Please Select Record")); return; }
            Mysqldb sql = new Mysqldb();
            string q = "DELETE FROM  uniexport.`booked` WHERE `booked`.`id` = " + id;
            sql.Select(q);
            foreach (Booked temp in Global.bookeds)
            {
                if (temp.id == _id)
                {
                    Global.bookeds.Remove(temp); return;
                }
            }
            clear();
        }
        public void close(object sender, RoutedEventArgs e)
        {
            Global.removeWindow(window); window.Close();
        }
        public void clear()
        {
            id = null;
            valueEgp = null;
            dat = null;
            _rowSelected = false;
        }
        public static ObservableCollection<object> getTable()
        {
            ObservableCollection<object> c = new ObservableCollection<object>();
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `booked` "; DataTable dt = sql.Select(q);
            if (dt.Rows.Count == 0)
            {
                Booked tmp = new Booked(); c.Add(tmp); return c;
            }
            foreach (DataRow r in dt.Rows)
            {
                Booked temp = new Booked();
                temp.id = r["id"].ToString();
                temp.valueEgp = r["valueEgp"].ToString();
                temp.dat = r["dat"].ToString();
                c.Add(temp);
            }
            return c;
        }
    }

    public class Cheque : INotifyPropertyChanged
    {
        private bool _rowSelected = false;
        private string _id;
        private string _num;
        private string _valueEgp;
        private string _dat;
        public event PropertyChangedEventHandler PropertyChanged;
        private Window window { get; set; }
        public string id
        {
            get { return _id; }
            set
            {
                _id = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("id"));
            }
        }
        public string num
        {
            get { return _num; }
            set
            {
                _num = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("num"));
            }
        }
        public Company company
        {
            get { return Global.company; }
            set
            {
                //_client = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("company"));
            }
        }
        public string valueEgp
        {
            get { return _valueEgp; }
            set
            {
                _valueEgp = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("valueEgp"));
            }
        }
        public string dat
        {
            get { return _dat; }
            set
            {
                _dat = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("dat"));
            }
        }
        public Cheque(Window W = null)
        {
            window = W;
        }
        public Cheque(string ID, Window W = null)
        {
            try
            {
                window = W;
                Mysqldb sql = new Mysqldb();
                string q = "SELECT * FROM `cheque` Where id = " + ID;
                DataTable dt = sql.Select(q);
                DataRow r = dt.Rows[0];
                this.id = r["id"].ToString();
                this.num = r["num"].ToString();
                this.valueEgp = r["valueEgp"].ToString();
                this.dat = r["dat"].ToString();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
        public void complete(string ID)
        {
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `cheque` Where id = " + ID;
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.num = r["num"].ToString();
            this.valueEgp = r["valueEgp"].ToString();
            this.dat = r["dat"].ToString();
        }
        public Cheque clone()
        {
            Cheque temp = new Cheque();
            temp.id = this._id;
            temp.num = this._num;
            temp.valueEgp = this._valueEgp;
            temp.dat = this._dat;
            return temp;
        }
        public void selectItem(object sender, MouseButtonEventArgs e)
        {
            this._rowSelected = true;
            this.id = ((Cheque)((ListViewItem)sender).Content).id;
            this.num = ((Cheque)((ListViewItem)sender).Content).num;
            this.valueEgp = ((Cheque)((ListViewItem)sender).Content).valueEgp;
            this.dat = ((Cheque)((ListViewItem)sender).Content).dat;
        }
        public void add(object sender, RoutedEventArgs e)
        {
            try
            {
                Mysqldb sql = new Mysqldb();
                string q = "INSERT INTO  uniexport.`cheque` (`id`,`num`,`company`,`valueEgp`,`dat`) VALUES ( NULL,'" + num + "','" + Global.company.id + "','" + valueEgp + "'," + Global.dateFormate(dat) + ");";
                id = (sql.nextAutoIncrement("cheque")).ToString();
                if (sql.Select(q) != null) { Global.cheques.Add(clone()); clear(); }

            }
            catch (Exception)
            {

                throw;
            }
        }
        public void edit(object sender, RoutedEventArgs e)
        {
            if (!_rowSelected) { MessageBox.Show(translate.trans("Please Select Record")); return; }

            Mysqldb sql = new Mysqldb();
            string q = "UPDATE uniexport.`cheque` SET `num` = '" + num + "' ,`valueEgp` = '" + valueEgp + "' ,`dat` = " + Global.dateFormate(dat) + " WHERE `Cheque`.`id` = " + id + ";";
            sql.Select(q);
            foreach (Cheque c in Global.cheques)
            {
                if (c.id == _id)
                {
                    Global.cheques[Global.cheques.IndexOf(c)] = clone(); return;
                }
            }
            clear();
        }
        public void del(object sender, RoutedEventArgs e)
        {
            if (!_rowSelected) { MessageBox.Show(translate.trans("Please Select Record")); return; }
            Mysqldb sql = new Mysqldb();
            string q = "DELETE FROM  uniexport.`cheque` WHERE `cheque`.`id` = " + id;
            sql.Select(q);
            foreach (Cheque temp in Global.cheques)
            {
                if (temp.id == _id)
                {
                    Global.cheques.Remove(temp); return;
                }
            }
            clear();
        }
        public void close(object sender, RoutedEventArgs e)
        {
            Global.removeWindow(window); window.Close();
        }
        public void openChequeData(object sender, RoutedEventArgs e)
        {
            if (!_rowSelected) { MessageBox.Show(translate.trans("Please Select Record first!!")); return; }
            foreach (Window w in Global.windows)
            {
                if (w.Title == translate.trans("ChequeData"))
                {
                    w.Activate(); return;
                }
            }
            template t = new template();
            object W = new Window();
            object chequeData = new ChequeData(this, (Window)W);
            Global.chequeDatas = ChequeData.getTable(this);
            Global.fileNos = FileNo.getTable();
            List<Property> P = new List<Property>()
            {
                new Property("txtcheque","num" , _readOnly:true),
                new Property("bankUsd","num" , _readOnly:true),
                new Property("sum","num" , _readOnly:true),
                new Property("usdToEgp","num" , _readOnly:true),
                new Property("fileNo","cmb",_displayPath:"num" , _action:"select"),
            };
            List<TableCol> tbcs = new List<TableCol>()
            {
                //new TableCol("id","id"),
                new TableCol("fileNo","fileNo.num"),
                new TableCol("totalUsd","totalUsd"),
                new TableCol("chck","chck",new Property("chck","bool",_action:"chckClicked")),
            };
            t.Moderntemplate(W, ref chequeData, translate.trans("ChequeData"), P, new List<string>() { "save", "close" }, Global.chequeDatas, tbcs, 0, 0, false);
            Global.addWindow((Window)W);

            if (((ChequeData)Global.chequeDatas[0]).id == string.Empty || ((ChequeData)Global.chequeDatas[0]).id == "" || ((ChequeData)Global.chequeDatas[0]).id == null)
            {
                Global.chequeDatas.RemoveAt(0);
            }
            ((Window)W).Show();
        }
        public void clear()
        {
            id = null;
            num = null;
            valueEgp = null;
            dat = null;
            _rowSelected = false;
        }
        public static ObservableCollection<object> getTable()
        {
            ObservableCollection<object> c = new ObservableCollection<object>();
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `cheque` where company = " + Global.company.id; DataTable dt = sql.Select(q);
            if (dt.Rows.Count == 0)
            {
                Cheque tmp = new Cheque(); c.Add(tmp); return c;
            }
            foreach (DataRow r in dt.Rows)
            {
                Cheque temp = new Cheque();
                temp.id = r["id"].ToString();
                temp.num = r["num"].ToString();
                temp.valueEgp = r["valueEgp"].ToString();
                temp.dat = r["dat"].ToString();
                c.Add(temp);
            }
            return c;
        }
    }
    public class ChequeData : INotifyPropertyChanged
    {
        private bool _rowSelected;
        private string _id;
        private Cheque _cheque;
        private FileNo _fileNo;
        private string _usdToEgp;
        //private double _sum;
        private double _valueEgp;
        private bool _chck;
        public event PropertyChangedEventHandler PropertyChanged;
        private Window window { get; set; }
        public string id
        {
            get { return _id; }
            set
            {
                _id = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("id"));
            }
        }
        public Cheque cheque
        {
            get { return _cheque; }
            set
            {
                _cheque = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("cheque"));
            }
        }
        public FileNo fileNo
        {
            get { return _fileNo; }
            set
            {
                _fileNo = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("fileNo"));
            }
        }

        public string txtcheque
        {
            get { return _cheque.num; }
            set
            {
                //_cheque = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("txtcheque"));
            }
        }
        public string totalUsd
        {
            get { return _valueEgp.ToString(); }
            set
            {
                _valueEgp = Global.ToDouble(value);
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("totalUsd"));
            }
        }
        public string bankUsd
        {
            get { return cheque.valueEgp; }
            set
            {
                //_valueEgp = Global.ToDouble(value);
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("bankUsd"));
            }
        }
        public string sum
        {
            get { return Global.tempsum2.ToString(); }
            set
            {
                Global.tempsum2 = Global.ToDouble(value);
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("sum"));
            }
        }
        public string usdToEgp
        {
            get { return _usdToEgp; }
            set
            {
                _usdToEgp = (value);
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("usdToEgp"));
            }
        }
        public bool chck
        {
            get { return _chck; }
            set
            {
                _chck = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("chck"));
            }
        }
        public ObservableCollection<object> cheques
        {
            get { return Global.cheques; }
            set
            {
                Global.cheques = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("cheques"));
            }
        }
        public ObservableCollection<object> fileNos
        {
            get { return Global.fileNos; }
            set
            {
                Global.fileNos = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("fileNos"));
            }
        }
        public ChequeData(Window W = null)
        {
            window = W;
        }
        public ChequeData(Cheque b, Window W = null)
        {
            this.cheque = b;
            window = W;
        }
        public ChequeData(string ID, Window W = null)
        {
            window = W;
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `chequeData` Where id = " + ID;
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.cheque = new Cheque(r["cheque"].ToString());
            this.fileNo = new FileNo(r["fileNo"].ToString());
        }
        public void complete(string ID)
        {
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `chequedata` Where id = " + ID;
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.cheque = new Cheque(r["cheque"].ToString());
            this.fileNo = new FileNo(r["fileNo"].ToString());
        }
        public ChequeData clone()
        {
            ChequeData temp = new ChequeData();
            temp.id = this._id;
            temp.cheque = this._cheque.clone();
            temp.fileNo = this._fileNo.clone();
            return temp;
        }
        public void save(object sender, RoutedEventArgs e)
        {
            try
            {
                Mysqldb sql = new Mysqldb();
                string q = "DELETE FROM  uniexport.`chequedata` WHERE `chequedata`.`cheque` = " + cheque.id;
                sql.Select(q);
                foreach (object obj in Global.chequeDatas)
                {
                    if (!((ChequeData)obj).chck) break;
                    q = "INSERT INTO  uniexport.`chequedata` (`id`, `cheque`, `fileNo`) VALUES (NULL, '" + cheque.id + "', '" + ((ChequeData)obj).fileNo.id + "');";
                    sql.Select(q);
                    q = "UPDATE exportcertificate e  INNER JOIN fileno fno on (fno.exportCertificate = e.id) SET e.usdToEgp = "+this.usdToEgp+" WHERE fno.id = '" + ((ChequeData)obj).fileNo.id + "';";
                    sql.Select(q);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }


        }
        public void selectItem(object sender, MouseButtonEventArgs e)
        {
            this._rowSelected = true;
            this.id = ((ChequeData)((ListViewItem)sender).Content).id;
            this.cheque = (Cheque)Global.cheques.Where(x => ((Cheque)x).id == ((ChequeData)((ListViewItem)sender).Content).cheque.id).First();
            //this.exportCertificate = (ExportCertificate)Global.exportCertificates.Where(x => ((ExportCertificate)x).id == ((BankReceiptData)((ListViewItem)sender).Content).exportCertificate.id).First();
        }
        public void chckClicked(object sender, RoutedEventArgs e)
        {
            CheckBox c = (CheckBox)sender;
            ChequeData b = (ChequeData)c.DataContext;
            int i = Global.chequeDatas.IndexOf(Global.chequeDatas.Where(x => ((ChequeData)x).fileNo == b.fileNo).First());
            if (c.IsChecked == true)
            {
                this.sum = (Global.tempsum2 + Global.ToDouble(b.totalUsd)).ToString();
                Global.chequeDatas.Move(i, 0);
            }
            else
            {
                this.sum = (Global.tempsum2 - Global.ToDouble(b.totalUsd)).ToString();
                Global.chequeDatas.Move(i, Global.chequeDatas.Count - 1);

            }
            this.usdToEgp = (Global.tempsum2 / Global.ToDouble(this.bankUsd)).ToString();
        }
        public Sol findElementsOfSum(List<double> lst, double target, int index = 0, Sol sols = null)
        {
            Sol r = new Sol(new List<int>(), Math.Abs(target));
            if (lst.Count == 0) return r;
            for (int i = 0; i < lst.Count; i++)
            {
                if (lst[i] == 0) continue;
                if (lst[i] == target)
                {
                    r.lst.Add(i + index); r.distance = 0;
                    return r;
                }
                else if (lst[i] < target - 3000)
                {
                    r = findElementsOfSum(lst.GetRange(i + 1, lst.Count - i - 1), target - lst[i], i + index + 1);
                    r.lst.Add(i + index);
                    if (sols == null) { sols = r; }
                    else if (sols.distance > r.distance) { sols = r; }
                    else { r = sols; }
                    if (r.distance == 0) return r;

                }
                else if (lst[i] < target + 3000)
                {
                    r = findElementsOfSum(lst.GetRange(i + 1, lst.Count - i - 1), target - lst[i], i + index + 1);
                    r.lst.Add(i + index);
                    if (sols == null) { sols = r; }
                    else if (sols.distance > r.distance) { sols = r; }
                    else { r = sols; }
                    if (r.distance == 0) return r;
                }



            }

            return r;
        }
        public void select(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                string fileNo = ((ComboBox)sender).Text;
                object temp = Global.chequeDatas.Where(x => ((ChequeData)x).fileNo.num == fileNo).First();
                ((ChequeData)temp).chck = true;
                int i = Global.chequeDatas.IndexOf(temp);
                Global.chequeDatas.Move(i, 0);
            }
            else
            {
                return;
            }

        }
        public void autoCalc(object sender, RoutedEventArgs e)
        {
            // need to be calculated
        }
        public void close(object sender, RoutedEventArgs e)
        {
            Global.removeWindow(window); window.Close();
        }
        public void clear(object sender, RoutedEventArgs e)
        {
            id = null;
            cheque = null;
            fileNo = null;
        }
        public static ObservableCollection<object> getTable(Cheque br)
        {
            ObservableCollection<object> c = new ObservableCollection<object>();
            Mysqldb sql = new Mysqldb();
            string q = "select `ch`.`id` AS `cheque`, `e`.`usdToEgp` ,`chdata`.`id` AS `chdataId`,`ch`.`dat` AS `chequeDate`,`fno`.`id` AS `fileNo`,`e`.`id` AS `export`,`e`.`dat` AS `exportDate`,`cr`.`id` AS `country`,`cn`.`id` AS `company`,sum(((`id`.`usdVal` * `id`.`supportPercentage`) )) AS `PTR`,if(`cr`.`nolon`,sum(((`e`.`nolon` ) * 0.05)),0) AS `nolon`,if(`cr`.`manifest`,(sum(((`id`.`usdVal` * `id`.`supportPercentage`) )) * 0.5),0) AS `manifesto` from (((((((`uniexport`.`exportcertificate` `e` left join `uniexport`.`invoice` `i` on((`i`.`exportCertificate` = `e`.`id`))) left join `uniexport`.`invoicedata` `id` on((`id`.`invoice` = `i`.`id`))) join `uniexport`.`country` `cr` on((`e`.`country` = `cr`.`id`))) join `uniexport`.`company` `cn` on((`cn`.`id` = `e`.`company`))) join `uniexport`.`fileno` `fno` on((`fno`.`exportCertificate` = `e`.`id`))) join `uniexport`.`chequedata` `chdata` on((`chdata`.`fileNo` = `fno`.`id`))) join `uniexport`.`cheque` `ch` on((`ch`.`id` = `chdata`.`cheque`))) where ch.id = '" + br.id + "' group by `fno`.`id` order by `e`.`dat`";
            DataTable dt = sql.Select(q);

            Global.tempsum2 = 0;
            foreach (DataRow r in dt.Rows)
            {
                if (r[0].ToString() == "") break;
                ChequeData temp = new ChequeData();
                temp.id = r["chdataId"].ToString();
                temp.cheque = new Cheque(r["cheque"].ToString());
                temp.fileNo = new FileNo(r["fileNo"].ToString());
                temp.usdToEgp = r["usdToEgp"].ToString();
                temp.totalUsd = (Global.ToDouble(r["PTR"].ToString()) + Global.ToDouble(r["nolon"].ToString()) + Global.ToDouble(r["manifesto"].ToString())).ToString();
                Global.tempsum2 += Global.ToDouble(temp.totalUsd);
                temp.chck = true;

                c.Add(temp);
            }
            q = "SELECT `fno`.`id` AS `fileNo` ,`e`.`usdToEgp`,`e`.`id` AS `export`, `e`.`dat` AS `exportDate`,`cr`.`id` AS `country`,`cn`.`id` AS `company`, SUM(((`id`.`usdVal` * `id`.`supportPercentage`) )) AS `PTR`,IF(`cr`.`nolon`, SUM(((`e`.`nolon`) * 0.5)),0) AS `nolon`, IF(`cr`.`manifest`, (SUM(((`id`.`usdVal` * `id`.`supportPercentage`) )) *0.5),0) AS `manifesto` FROM `uniexport`.`exportcertificate` `e` left JOIN `uniexport`.`invoice` `i` ON((`i`.`exportCertificate` = `e`.`id`)) left JOIN `uniexport`.`invoicedata` `id` ON((`id`.`invoice` = `i`.`id`)) JOIN `uniexport`.`country` `cr` ON((`e`.`country` = `cr`.`id`)) JOIN `uniexport`.`company` `cn` ON((`cn`.`id` = `e`.`company`)) JOIN `uniexport`.`fileno` `fno` ON((`fno`.`exportCertificate` = `e`.`id`)) WHERE fno.id NOT in (SELECT fileNo FROM chequeData ) AND fno.company = " + Global.company.id + " GROUP BY `fno`.`id`";
            dt = sql.Select(q);
            foreach (DataRow r in dt.Rows)
            {
                if (r[0].ToString() == "") break;
                ChequeData temp = new ChequeData();
                temp.id = "null";
                temp.cheque = br;
                temp.fileNo = new FileNo(r["fileNo"].ToString());
                temp.usdToEgp = r["usdToEgp"].ToString();
                temp.totalUsd = (Global.ToDouble(r["PTR"].ToString()) + Global.ToDouble(r["nolon"].ToString()) + Global.ToDouble(r["manifesto"].ToString())).ToString();
                temp.chck = false;
                c.Add(temp);
            }
            if (c.Count == 0)
            {
                ChequeData tmp = new ChequeData(); c.Add(tmp);
            }
            return c;
        }
    }

    public class Estiva : INotifyPropertyChanged
    {
        private bool _rowSelected = false;
        private string _id;
        private Company _company;
        private ExportCertificate _exportCertificate;
        private string _dat;
        private string _note;
        public event PropertyChangedEventHandler PropertyChanged;
        private Window window { get; set; }
        public string id
        {
            get { return _id; }
            set
            {
                _id = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("id"));
            }
        }
        public Company company
        {
            get { return Global.company; }
            set
            {
                _company = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("company"));
            }
        }
        public ObservableCollection<object> companys
        {
            get { return Global.companys; }
            set
            {
                Global.companys = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("companys"));
            }
        }
        public ExportCertificate exportCertificate
        {
            get { return _exportCertificate; }
            set
            {
                _exportCertificate = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("exportCertificate"));
            }
        }
        public ObservableCollection<object> exportCertificates
        {
            get { return Global.exportCertificates; }
            set
            {
                Global.exportCertificates = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("exportCertificates"));
            }
        }
        public string dat
        {
            get { return _dat; }
            set
            {
                _dat = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("dat"));
            }
        }
        public string note
        {
            get { return _note; }
            set
            {
                _note = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("note"));
            }
        }
        public Estiva(Window W = null)
        {
            window = W;
        }
        public Estiva(string ID, Window W = null)
        {
            window = W;
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `estiva` Where id = " + ID;
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.company = new Company(r["company"].ToString());
            this.exportCertificate = new ExportCertificate(r["exportCertificate"].ToString());
            this.dat = r["dat"].ToString();
            this.note = r["note"].ToString();
        }
        public void complete(string ID)
        {
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `estiva` Where id = " + ID;
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.company = new Company(r["company"].ToString());
            this.exportCertificate = new ExportCertificate(r["exportCertificate"].ToString());
            this.dat = r["dat"].ToString();
            this.note = r["note"].ToString();
        }
        public Estiva clone()
        {
            Estiva temp = new Estiva();
            temp.id = this._id;
            temp.company = this._company.clone();
            temp.exportCertificate = this._exportCertificate.clone();
            temp.dat = this._dat;
            temp.note = this._note;
            return temp;
        }
        public void selectItem(object sender, MouseButtonEventArgs e)
        {
            this._rowSelected = true;
            this.id = ((Estiva)((ListViewItem)sender).Content).id;
            this.company = (Company)Global.companys.Where(x => ((Company)x).id == ((Estiva)((ListViewItem)sender).Content).company.id).First();
            this.exportCertificate = (ExportCertificate)Global.exportCertificates.Where(x => ((ExportCertificate)x).id == ((Estiva)((ListViewItem)sender).Content).exportCertificate.id).First();
            this.dat = ((Estiva)((ListViewItem)sender).Content).dat;
            this.note = ((Estiva)((ListViewItem)sender).Content).note;
        }
        public void add(object sender, RoutedEventArgs e)
        {
            try
            {
                Mysqldb sql = new Mysqldb();
                string q = "INSERT INTO  uniexport.`estiva` (`id`,`company`,`exportCertificate`,`dat`,`note`) VALUES ( NULL,'" + company.id + "','" + exportCertificate.id + "'," + Global.dateFormate(dat) + ",'" + note + "');";
                id = (sql.nextAutoIncrement("estiva")).ToString();

                if (sql.Select(q) != null) { Global.estivas.Add(clone()); clear(); }

            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.ToString());
            }
        }
        public void edit(object sender, RoutedEventArgs e)
        {
            if (!_rowSelected)
            {
                MessageBox.Show(translate.trans("Please Select Record")); return;
            }
            Mysqldb sql = new Mysqldb();
            string q = "UPDATE uniexport.`estiva` SET `company` = '" + company + "' ,`exportCertificate` = '" + exportCertificate + "' ,`dat` = " + Global.dateFormate(dat) + " ,`note` = '" + note + "' WHERE `Estiva`.`id` = " + id + ";";
            sql.Select(q);
            foreach (Estiva c in Global.estivas)
            {
                if (c.id == _id)
                {
                    Global.estivas[Global.estivas.IndexOf(c)] = clone(); return;
                }
            }
            clear();
        }
        public void del(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "DELETE FROM  uniexport.`estiva` WHERE `estiva`.`id` = " + id;
            sql.Select(q);
            foreach (Estiva temp in Global.estivas)
            {
                if (temp.id == _id)
                {
                    Global.estivas.Remove(temp); return;
                }
            }
            clear();
        }
        public void close(object sender, RoutedEventArgs e)
        {
            Global.removeWindow(window); window.Close();
        }
        public void clear()
        {
            id = null;
            company = null;
            exportCertificate = null;
            dat = null;
            note = null;
        }
        public static ObservableCollection<object> getTable()
        {
            ObservableCollection<object> c = new ObservableCollection<object>();
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `estiva` where company = " + Global.company.id; DataTable dt = sql.Select(q);
            if (dt.Rows.Count == 0)
            {
                Estiva tmp = new Estiva(); c.Add(tmp); return c;
            }
            foreach (DataRow r in dt.Rows)
            {
                Estiva temp = new Estiva();
                temp.id = r["id"].ToString();
                temp.company = new Company(r["company"].ToString());
                temp.exportCertificate = new ExportCertificate(r["exportCertificate"].ToString());
                temp.dat = r["dat"].ToString();
                temp.note = r["note"].ToString();
                c.Add(temp);
            }
            return c;
        }
    }


    public class Col
    {
        public string id { get; set; }
        public string name { get; set; }
        public Col(string n = "")
        {
            id = n;
            name = translate.trans(n);
        }
    }
    public class ReportBuilderPage : INotifyPropertyChanged
    {

        public Col _type;
        public Col _col;
        public bool _condition;
        public Col _op;
        ObservableCollection<object> _types = new ObservableCollection<object>()
        {
            new Col("Have File Number"),
            new Col("Not Have File Number")
        };
        ObservableCollection<object> _cols;
        ObservableCollection<object> _ops;
        public event PropertyChangedEventHandler PropertyChanged;
        private Window window { get; set; }
        public Col type
        {
            get { return _type; }
            set
            {
                _type = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("type"));
            }
        }
        public Col col
        {
            get { return _col; }
            set
            {
                _col = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("col"));
            }
        }
        public Col op
        {
            get { return _op; }
            set
            {
                _op = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("op"));
            }
        }
        public bool condition
        {
            get { return _condition; }
            set
            {
                _condition = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("condition"));
            }
        }

        public ObservableCollection<object> types
        {
            get { return _types; }
            set
            {
                _types = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("types"));
            }
        }
        public ObservableCollection<object> cols
        {
            get { return _cols; }
            set
            {
                _cols = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("cols"));
            }
        }

        public void close(object sender, RoutedEventArgs e)
        {
            Global.removeWindow(window); window.Close();
        }
        public void clear()
        {
            // _id = null;
            // _valueEgp = null;
            // _dat = null;

        }

    }
    public class ReportViewerPage : INotifyPropertyChanged
    {
        private string _subCond1, _subCond2;
        private string _cond = "where ( company ='" + Global.company.name + "' ) ";
        private Col _repoName;
        private Col _col;
        private Col _op;
        private Col _pageSetup;
        private string _value;
        private string _value2;
        private string _date1;
        private string _date2;
        private bool _isDate;
        private bool _isBetween;
        private bool _isBetweenV;
        private ObservableCollection<object> _repoNames;
        private ObservableCollection<object> _cols;
        private ObservableCollection<object> _ops = new ObservableCollection<object>()
        {
            new Col("="),
            new Col(">"),
            new Col("<"),
            new Col("Like"),
            new Col("!="),
            new Col("between")
        };
        public event PropertyChangedEventHandler PropertyChanged;
        private Window window { get; set; }
        public Col repoName
        {
            get { return _repoName; }
            set
            {
                _repoName = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("repoName"));
            }
        }
        public Col col
        {
            get { return _col; }
            set
            {
                _col = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("col"));
            }
        }
        public Col op
        {
            get { return _op; }
            set
            {
                _op = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("op"));
            }
        }
        public string value
        {
            get { return _value; }
            set
            {
                _value = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("value"));
            }
        }
        public string value2
        {
            get { return _value2; }
            set
            {
                _value2 = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("value2"));
            }
        }
        public string date1
        {
            get { return _date1; }
            set
            {
                _date1 = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("date1"));
            }
        }
        public string date2
        {
            get { return _date2; }
            set
            {
                _date2 = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("date2"));
            }
        }
        public Col pageSetup
        {
            get { return _pageSetup; }
            set
            {
                _pageSetup = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("pageSetup"));
            }
        }
        public string cond
        {
            get { return _cond; }
            set
            {
                _cond = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("cond"));
            }
        }
        public bool isDate
        {
            get { return _isDate; }
            set
            {
                _isDate = value;
                if (this.PropertyChanged != null)
                {
                    this.PropertyChanged(this, new PropertyChangedEventArgs("isDate"));
                    this.PropertyChanged(this, new PropertyChangedEventArgs("isText"));
                }

            }
        }
        public bool isBetween
        {
            get { return _isBetween; }
            set
            {
                _isBetween = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("isBetween"));
            }
        }
        public bool isBetweenV
        {
            get { return _isBetweenV; }
            set
            {
                _isBetweenV = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("isBetweenV"));
            }
        }
        public bool isText
        {
            get { return !_isDate; }
            set
            {
                _isDate = !value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("isText"));
            }
        }
        private ObservableCollection<object> _pageSetups = new ObservableCollection<object>()
        {
            new Col("Portrait"),
            new Col("Landscape"),
        };
        public ObservableCollection<object> repoNames
        {
            get { return _repoNames; }
            set
            {
                _repoNames = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("repoNames"));
            }
        }
        public ObservableCollection<object> cols
        {
            get { return _cols; }
            set
            {
                _cols = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("cols"));
            }
        }
        public ObservableCollection<object> ops
        {
            get { return _ops; }
            set
            {
                _ops = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("ops"));
            }
        }
        public ObservableCollection<object> pageSetups
        {
            get { return _pageSetups; }
            set
            {
                _pageSetups = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("pageSetups"));
            }
        }

        public void onReportNameChange(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                clear(sender, new RoutedEventArgs());
                Mysqldb sql = new Mysqldb();
                cols = new ObservableCollection<object>();
                DataTable dt = sql.Select("SELECT COLUMN_NAME FROM information_schema.columns WHERE table_name='" + repoName.id + "'");
                foreach (DataRow r in dt.Rows)
                {
                    cols.Add(new Col(r[0].ToString()));
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
        public ReportViewerPage(Window w = null)
        {
            window = w;
            Mysqldb sql = new Mysqldb();
            DataTable dt = sql.Select("SHOW FULL TABLES WHERE TABLE_TYPE LIKE 'VIEW';");
            repoNames = new ObservableCollection<object>();
            foreach (DataRow r in dt.Rows)
            {
                if(r[0].ToString().Count() > 4 && r[0].ToString().Substring(0,4) == "repo")
                repoNames.Add(new Col(r[0].ToString()));
            }

        }
        public void onColChange(object sender, SelectionChangedEventArgs e)
        {
            if (col.id.ToLower().Contains("dat") || col.name.ToLower().Contains("تاريخ"))
            {
                isDate = true;
                if(op != null && op.id == "between")
                {
                    isBetween = true;
                    isBetweenV = false;
                }
            }
            else
            {
                isDate = false;
                if (op != null && op.id == "between")
                {
                    isBetween = false;
                    isBetweenV = true; ;
                }
            }
        }
        public void onOpChange(object sender, SelectionChangedEventArgs e)
        {
            if (op.id.ToLower() == "between")
            {
                if (isDate)
                {
                    isBetween = true;
                    isBetweenV = false;
                }
                else
                {
                    isBetweenV = true;
                    isBetween = false;
                }
            }
            else
            {
                isBetween = false;
                isBetweenV = false;
            }
        }
        public void addCondition(object sender, RoutedEventArgs e)
        {
            bool isD = false;
            if (col.id.Contains("dat") || col.id.Contains("Dat"))
            {
                isD = true;
            }
            if (repoName.id == "reposubmission")
            {
                if(col.id.ToLower().Contains("dat"))
                {
                    if (op.id == "between")
                    {
                        _subCond1 = _subCond1 + " and (" + col.id + " " + op.id + " '" + date1 + "' and  '" + date2 + "' ) ";
                        _subCond2 = _subCond2 + " and (" + "bookeddata.date" + " " + op.id + " '" + date1 + "' and  '" + date2 + "' ) ";
                    }
                    else
                    {
                        _subCond1 = _subCond1 + " and (" + col.id + " " + op.id + " '" + date1 + "' ) ";
                        _subCond2 = _subCond2 + " and (" + "bookeddata.date" + " " + op.id + " '" + date1 + "' ) ";
                    }
                }
                else
                {
                    if (op.id == "between")
                    {
                        _subCond1 = _subCond1 + " and (" + col.id + " " + op.id + " '" + value + "' and  '" + value2 + "' ) ";
                        //_subCond2 = _subCond2 + " and (" + "bookeddata.date" + " " + op.id + " '" + date1 + "' and  '" + date2 + "' ) ";
                    }
                    else
                    {
                        _subCond1 = _subCond1 + " and (" + col.id + " " + op.id + " '" + value + "' ) ";
                       // _subCond2 = _subCond2 + " and (" + "bookeddata.date" + " " + op.id + " '" + date1 + "' ) ";
                    }
                }
            }
            if (cond == "")
            {
                  
                if (op.id == "between")
                {
                    cond = "Where (" + col.id + " " + op.id + " '" + ((isD)?date1:value) + "' and  '" + ((isD) ? date2 : value2) + "' ) ";                   
                }
                else
                {
                    cond = cond + " and (" + col.id + " " + op.id + " '" + ((isD) ? date1 : value) + "' ) ";
                }
            }
            else
            {
                if (op.id == "between")
                {
                    cond = cond + " and (" + col.id + " " + op.id + " '" + ((isD) ? date1 : value) + "' and  '" + ((isD) ? date2 : value2) + "' ) ";
                }
                else
                {
                    cond = cond + " and (" + col.id + " " + op.id + " '" + ((isD) ? date1 : value) + "' ) ";

                }
            }
        }
        public void showReport(object sender, RoutedEventArgs e)
        {
            try
            {
                string summary = " ";
                if (repoName == null) { MessageBox.Show("Please Select Report"); return; }
                Mysqldb sql = new Mysqldb();
                string strCols = "";
                if (repoName.id == "reposubmission")
                {
                    genSubmissionRepo();return;
                }
                foreach (object o in cols)
                {
                    if (((Col)o).id.ToLower() == "company") continue;                  
                    else if (strCols == "") strCols += "`" + ((Col)o).id + "`";
                    else
                    {
                        strCols += ", `" + ((Col)o).id + "` ";
                    }

                }
                string q = "select " + strCols + " from " + repoName.id + "  " + cond;
                DataTable dt = sql.Select(q);
                int colsCount = dt.Columns.Count;
                for (int i = 0; i < colsCount; i++)
                {
                    DataColumn dtCol = dt.Columns[i];

                    if (dtCol.DataType.ToString() == "System.DateTime")
                    {
                        int ii = dt.Columns.IndexOf(dtCol);
                        string colName = dtCol.ColumnName;
                        dt.Columns.Add(colName + "1", typeof(string));
                        foreach (DataRow dr in dt.Rows)
                        {
                            dr[colName + "1"] = ((DateTime)dr[dtCol.ColumnName]).ToString("d");
                        }
                        dt.Columns.Remove(dtCol);
                        dt.Columns[colsCount - 1].SetOrdinal(ii);
                        dt.Columns[ii].ColumnName = colName.Substring(0, colName.Length);

                        //dtCol.
                    }
                    //MessageBox.Show("done");
                }

                ReportBuilder rb = new ReportBuilder("Unilever", Global.company.name, translate.trans(repoName.id), dt, summary, pageSetup);
                rb.genReport();
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.ToString());
            }
        }
        public void clear(object sender, RoutedEventArgs e)
        {
            col = null;
            op = null;
            value = null;
            value2 = null;
            date1 = null;
            date2 = null;
            cond = "where ( company ='" + Global.company.name + "' ) ";
        }
        public void close(object sender, RoutedEventArgs e)
        {
            Global.removeWindow(window); window.Close();
        }
        public void genSubmissionRepo()
        {
            
            string summary = " ";
            Mysqldb sql = new Mysqldb();
            
            string q = @"SELECT DATE_FORMAT(`dat`, '%Y-%m-00') as dat ,DATE_FORMAT(`dat`, '%M %Y') as `month` ,sum(`PTR`) as 'PTR',sum(`manifestoSupport`) as 'manifestoSupport' ,sum(`nolonSupport`) as 'nolonSupport',reposubmission.`company`,booked 
                        FROM `reposubmission` LEFT JOIN  bookeddata on (DATE_FORMAT(`dat`, '%M %Y') = DATE_FORMAT(bookeddata.date, '%M %Y') and bookeddata.company = reposubmission.company) 
                        WHERE reposubmission.company = '" + Global.company.name + @"' 
                        "+_subCond1+ @"
                        GROUP BY DATE_FORMAT(`dat`, '%M %Y')
                        UNION
                        SELECT DATE_FORMAT(bookeddata.date, '%Y-%m-00') as dat,DATE_FORMAT(bookeddata.date, '%M %Y') as `month`,sum(`PTR`),sum(`manifestoSupport`) as 'manifestoSupport' ,sum(`nolonSupport`) as 'nolonSupport',bookeddata.`company`,booked 
                        FROM `reposubmission` right JOIN  bookeddata on(DATE_FORMAT(`dat`, '%M %Y') = DATE_FORMAT(bookeddata.date, '%M %Y') and bookeddata.company = reposubmission.company) 
                        WHERE bookeddata.company = '" + Global.company.name+ @"'
                        " + _subCond2 + @"
                        GROUP by DATE_FORMAT(bookeddata.date, '%M %Y')
                        ORDER BY dat";
            DataTable dt = sql.Select(q);
            DataTable dtCloned = dt.Clone();
            dtCloned.Columns[0].DataType = typeof(string);
            foreach (DataRow row in dt.Rows)
            {
                dtCloned.ImportRow(row);
            }
            dtCloned.Columns.RemoveAt(5);
            dtCloned.Columns.RemoveAt(0);
            DataRow r = dtCloned.NewRow();
            r[0] = "Total";
            r[1] = dtCloned.Compute("Sum(PTR)", string.Empty).ToString();
            r[2] = dtCloned.Compute("Sum(manifestoSupport)", string.Empty).ToString();
            r[3] = dtCloned.Compute("Sum(nolonSupport)", string.Empty).ToString();
            r[4] = dtCloned.Compute("Sum(booked)", string.Empty).ToString();
            double total = Global.ToDouble(r[1].ToString()) + Global.ToDouble(r[2].ToString()) + Global.ToDouble(r[3].ToString());
            dtCloned.Rows.Add(r);
            dt = dtCloned;
            string sumBooked = r[4].ToString();
            summary = "<TextBlock Text=\"Total Support = " + total.ToString() + "  &#x0a;Total Booked = " + sumBooked + "&#x0a; Net = " + (total - Global.ToDouble(sumBooked)).ToString()+"  \"/> ";
            ReportBuilder rb = new ReportBuilder("Unilever", Global.company.name, translate.trans(repoName.id), dt, summary, pageSetup);
            rb.genReport();
        }

    }
    public class MyReportData
    {
        public string Template { get; set; }
        public DataTable table { get; set; }
    }

    public class ReportBuilder
    {
        public string header { get; set; }
        public string description { get; set; }
        public string title { get; set; }
        public string summary { get; set; }
        public DataTable dt { get; set; }
        private string xml = Global.reportTemplate;


        public ReportBuilder(string Header, string discription, string title, DataTable table, string _summary, Col pageSetup = null)
        {
            header = Header; this.description = discription; this.title = title; dt = table; summary = _summary;
            // 29.7cm _PageHeight   ><  21cm _PageWidth
            if (pageSetup == null || pageSetup.id == "Portrait")
            {
                xml = xml.Replace("_PageHeight", "29.7cm");
                xml = xml.Replace("_PageWidth", "21cm");
            }
            else
            {
                xml = xml.Replace("_PageWidth", "29.7cm");
                xml = xml.Replace("_PageHeight", "21cm");
            }
        }
        public void genReport()
        {
            MyReportData repo = new MyReportData();

            xml = xml.Replace("RHeader", header);
            xml = xml.Replace("RDescription", description);
            xml = xml.Replace("RTitle", title);
            string xmlTable = "", xmlTableHeader = "";
            foreach (DataColumn c in dt.Columns)
            {
                //MessageBox.Show(c.ColumnName);
                xmlTable = xmlTable + @" <TableCell>
                                          <Paragraph TextAlignment=""Center"">
                                                <xrd:InlineTableCellValue PropertyName = """ + c.ColumnName + @"""  AggregateGroup=""" + c.ColumnName + "s" + @"""/>
                                          </Paragraph >
                                         </TableCell > ";
                xmlTableHeader = xmlTableHeader + @"<TableCell>
                                                      <Paragraph TextAlignment=""Center"">
                                                        <Bold>" + translate.trans(c.ColumnName) + @"</Bold>
                                                      </Paragraph>
                                                    </TableCell>";
            }
            xml = xml.Replace("RTableXml", xmlTable);
            xml = xml.Replace("RTableHeaderXml", xmlTableHeader);
            /*
             There are
                    <xrd:InlineAggregateValue AggregateGroup=""ItemCount"" AggregateValueType=""Count"" EmptyValue=""no"" FontWeight=""Bold"" /> item positions with a total of
                    <xrd:InlineAggregateValue AggregateGroup=""ItemCount"" AggregateValueType=""Sum"" EmptyValue=""0"" FontWeight=""Bold"" /> items listed.
             */

            xml = xml.Replace("RSummary", summary);
            dt.TableName = "RTable";
            repo.table = dt;
            repo.Template = xml;
            ReportsWindow rpW = new ReportsWindow(repo);
            rpW.Topmost = false;
            rpW.Show();

        }

    }

    /*
SELECT ch.num as cheque , ch.dat as chequeDate,fno.num as fileNo , br.num as bankreceipt,e.num as export, e.dat as exportDate ,
i.num as Invoice , i.performa , i.systemRef , cr.name as country, cn.name as company, b.name as brand, bc.name as entity ,id.usdVal , 
(id.usdVal * id.supportPercentage) as PTR 
from exportcertificate as e INNER JOIN invoice as i on (i.exportCertificate = e.id) INNER JOIN invoicedata as id on (id.invoice = i.id) 
INNER JOIN country as cr on (e.country = cr.id) INNER JOIN company as cn on (cn.id = e.company) INNER JOIN brand as b on (b.id = id.brand) 
INNER JOIN brandcat as bc on (bc.id = b.brandCat) INNER join client as cl on (cl.id = i.client) 
INNER JOIN bankreceiptdata as brdata on (brdata.invoice = i.id) INNER join bankreceipt as br on (br.id = brdata.bankReceipt) 
INNER JOIN fileno as fno on (fno.exportCertificate = e.id) INNER join chequedata as chdata on (chdata.fileNo = fno.id) 
INNER JOIN cheque as ch on (ch.id = chdata.cheque) ORDER BY e.num 
     
     */



}
