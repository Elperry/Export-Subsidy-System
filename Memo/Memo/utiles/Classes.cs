using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Windows;
using System.Data;
using System.Windows.Controls;
using System.Windows.Input;
using System.ComponentModel;

namespace Memo
{
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
            Mysqldb sql = new Mysqldb();
            if(Global.usr.email == string.Empty || Global.usr.email == null) { MessageBox.Show(translate.trans("PLease Enter a Valid Email !!!"));return; }
            if (Global.usr.password == string.Empty || Global.usr.password == null) { MessageBox.Show(translate.trans("PLease Enter your PassWord!!!"));return; }
            if (Global.usr.lang ==  null) { MessageBox.Show(translate.trans("PLease Choose your Language !!!"));return; }
            string q = "SELECT * from user where `email`='"+ Global.usr.email +"' and `pass`='"+ Global.usr.password +"';";
            DataTable dt = sql.Select(q);
            if (dt.Rows.Count > 0)
            {
                // login success
                MessageBox.Show("Login Successfull");
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
        public void exit(object sender, RoutedEventArgs e)
        {
            System.Windows.Application.Current.Shutdown();
        }

    }
    public class lang
    {
        public string id { get; set; }
        public string name { get; set; }
        public lang(string title , string n)
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
            get { return _name; }
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
            Mysqldb sql = new Mysqldb();
            string q = "INSERT INTO `brandcat` (`id`,`name`) VALUES ( NULL,'" + name + "');";
            sql.Select(q);
            id = (sql.nextAutoIncrement("brandcat") - 1).ToString();
            Global.brandCats.Add(clone()); clear();
        }
        public void edit(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "UPDATE `brandcat` SET `id` = '" + id + "' ,`name` = '" + name + "' WHERE `BrandCat`.`id` = id;";
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
        public void del(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "DELETE FROM `brandcat` WHERE `brandcat`.`id` = " + id;
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
            _id = null;
            _name = null;
        }
        public static ObservableCollection<object> getTable()
        {
            ObservableCollection<object> c = new ObservableCollection<object>();
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `brandcat` "; DataTable dt = sql.Select(q);
            if (dt.Rows.Count == 0)
            {
                BrandCat tmp = new BrandCat(); c.Add(tmp); return c;
            }
            foreach (DataRow r in dt.Rows)
            {
                BrandCat temp = new BrandCat();
                temp.id = r["id"].ToString();
                temp.name = r["name"].ToString();
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
            get { return _name; }
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
            string q = "SELECT * FROM `brand` Where id = " + ID;
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
            Mysqldb sql = new Mysqldb();
            string q = "INSERT INTO `brand` (`id`,`name`,`brandCat`,`supportPercentage`) VALUES ( NULL,'" + name + "','" + brandCat.id + "','" + supportPercentage + "');";
            sql.Select(q);
            id = (sql.nextAutoIncrement("brand") - 1).ToString();
            Global.brands.Add(clone()); clear();
        }
        public void edit(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "UPDATE `brand` SET `id` = '" + id + "' ,`name` = '" + name + "' ,`brandCat` = '" + brandCat + "' ,`supportPercentage` = '" + supportPercentage + "' WHERE `Brand`.`id` = id;";
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
            string q = "DELETE FROM `brand` WHERE `brand`.`id` = " + id;
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
            _id = null;
            _name = null;
            _brandCat = null;
            _supportPercentage = null;
        }
        public static ObservableCollection<object> getTable()
        {
            ObservableCollection<object> c = new ObservableCollection<object>();
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `brand` "; DataTable dt = sql.Select(q);
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
            string q = "SELECT * FROM `country` Where id = " + ID;
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
            Mysqldb sql = new Mysqldb();
            string q = "INSERT INTO `country` (`id`,`name`,`nolon`,`manifest`) VALUES ( NULL,'" + name + "','" + ((nolon) ? "1" : "0") + "','" + ((manifest) ? "1" : "0") + "');";
            sql.Select(q);
            id = (sql.nextAutoIncrement("country") - 1).ToString();
            Global.countrys.Add(clone()); clear();
        }
        public void edit(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "UPDATE `country` SET `id` = '" + id + "' ,`name` = '" + name + "' ,`nolon` = '" + ((nolon) ? "1" : "0") + "' ,`manifest` = '" + ((manifest) ? "1" : "0") + "' WHERE `Country`.`id` = id;";
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
            string q = "DELETE FROM `country` WHERE `country`.`id` = " + id;
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
            _id = null;
            _name = null;
            _nolon = false;
            _manifest = false;
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
            string q = "SELECT * FROM `port` Where id = " + ID;
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
            Mysqldb sql = new Mysqldb();
            string q = "INSERT INTO `port` (`id`,`name`,`notes`) VALUES ( NULL,'" + name + "','" + notes + "');";
            sql.Select(q);
            id = (sql.nextAutoIncrement("port") - 1).ToString();
            Global.ports.Add(clone()); clear();
        }
        public void edit(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "UPDATE `port` SET `id` = '" + id + "' ,`name` = '" + name + "' ,`notes` = '" + notes + "' WHERE `Port`.`id` = id;";
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
            string q = "DELETE FROM `port` WHERE `port`.`id` = " + id;
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
            _id = null;
            _name = null;
            _notes = null;
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
            string q = "SELECT * FROM `shippingCompany` Where id = " + ID;
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
            Mysqldb sql = new Mysqldb();
            string q = "INSERT INTO `shippingcompany` (`id`,`name`,`email`,`phone`,`fax`,`address`,`notes`) VALUES ( NULL,'" + name + "','" + email + "','" + phone + "','" + fax + "','" + address + "','" + notes + "');";
            sql.Select(q);
            id = (sql.nextAutoIncrement("shippingcompany") - 1).ToString();
            Global.shippingCompanys.Add(clone()); clear();
        }
        public void edit(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "UPDATE `shippingcompany` SET `id` = '" + id + "' ,`name` = '" + name + "' ,`email` = '" + email + "' ,`phone` = '" + phone + "' ,`fax` = '" + fax + "' ,`address` = '" + address + "' ,`notes` = '" + notes + "' WHERE `ShippingCompany`.`id` = id;";
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
            string q = "DELETE FROM `shippingcompany` WHERE `shippingcompany`.`id` = " + id;
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
            _id = null;
            _name = null;
            _email = null;
            _phone = null;
            _fax = null;
            _address = null;
            _notes = null;
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
            Mysqldb sql = new Mysqldb();
            string q = "INSERT INTO `company` (`id`,`name`,`email`,`phone`,`fax`,`address`,`notes`) VALUES ( NULL,'" + name + "','" + email + "','" + phone + "','" + fax + "','" + address + "','" + notes + "');";
            sql.Select(q);
            id = (sql.nextAutoIncrement("company") - 1).ToString();
            Global.companys.Add(clone()); clear();
        }
        public void edit(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "UPDATE `company` SET `id` = '" + id + "' ,`name` = '" + name + "' ,`email` = '" + email + "' ,`phone` = '" + phone + "' ,`fax` = '" + fax + "' ,`address` = '" + address + "' ,`notes` = '" + notes + "' WHERE `Company`.`id` = id;";
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
            string q = "DELETE FROM `company` WHERE `company`.`id` = " + id;
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
            _id = null;
            _name = null;
            _email = null;
            _phone = null;
            _fax = null;
            _address = null;
            _notes = null;
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
            return temp;
        }
        public void selectItem(object sender, MouseButtonEventArgs e)
        {
            this.id = ((Users)((ListViewItem)sender).Content).id;
            this.name = ((Users)((ListViewItem)sender).Content).name;
            this.email = ((Users)((ListViewItem)sender).Content).email;
            this.pass = ((Users)((ListViewItem)sender).Content).pass;
            this.admin = ((Users)((ListViewItem)sender).Content).admin;
            this.company = (Company)Global.companys.Where(x=>((Company)x).name == ((Users)((ListViewItem)sender).Content).company.name).First();
        }
        public void add(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "INSERT INTO `user` (`id`,`name`,`email`,`pass`,`company`,`admin`) VALUES ( NULL,'" + name + "','" + email + "','" + pass + "','" + company.id + "','"+((admin)?"1":"0")+"');";
            sql.Select(q);
            id = (sql.nextAutoIncrement("user") - 1).ToString();
            Global.users.Add(clone()); clear();
        }
        public void edit(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "UPDATE `user` SET `name` = '" + name + "' ,`email` = '" + email + "' ,`pass` = '" + pass + "' ,`company` = '" + company + "' `admin`, = '" + ((admin) ? "1" : "0") + "' WHERE `User`.`id` = "+id+" ; ";
            sql.Select(q);
            foreach (User c in Global.users)
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
            Mysqldb sql = new Mysqldb();
            string q = "DELETE FROM `user` WHERE `user`.`id` = " + id;
            sql.Select(q);
            foreach (User temp in Global.users)
            {
                if (temp.id == _id)
                {
                    Global.users.Remove(temp); return;
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
            _id = null;
            _name = null;
            _email = null;
            _pass = null;
            _company = null;
            _admin = false;
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
            temp.country = this._country.clone();
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
            Mysqldb sql = new Mysqldb();
            string q = "INSERT INTO `client` (`id`,`name`,`email`,`fax`,`phone`,`country`,`address`,`notes`) VALUES ( NULL,'" + name + "','" + email + "','" + fax + "','" + phone + "','" + country.id + "','" + address + "','" + notes + "');";
            sql.Select(q);
            id = (sql.nextAutoIncrement("client") - 1).ToString();
            Global.clients.Add(clone()); clear();
        }
        public void edit(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "UPDATE `client` SET `id` = '" + id + "' ,`name` = '" + name + "' ,`email` = '" + email + "' ,`fax` = '" + fax + "' ,`phone` = '" + phone + "' ,`country` = '" + country + "' ,`address` = '" + address + "' ,`notes` = '" + notes + "' WHERE `Client`.`id` = id;";
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
            string q = "DELETE FROM `client` WHERE `client`.`id` = " + id;
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
            _id = null;
            _name = null;
            _email = null;
            _fax = null;
            _phone = null;
            _country = null;
            _address = null;
            _notes = null;
        }
        public static ObservableCollection<object> getTable()
        {
            ObservableCollection<object> c = new ObservableCollection<object>();
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `client` "; DataTable dt = sql.Select(q);
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
        private bool _bankReciete;
        private bool _nolon;
        private bool _manifesto;
        private bool _estifa;
        
        private string _usdToEgp;
        private string _usdVal = "0";
        private string _egpVal = "0";
        private string _PTREgp = "0";
        private string _totalEgp = "0";
        private string _submitDate;
        private string _accrualDate;
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
        public bool estifa
        {
            get { return _estifa; }
            set
            {
                _estifa = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("estifa"));
            }
        }
        public string usdToEgp
        {
            get { return _usdToEgp; }
            set
            {
                _usdToEgp = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("usdToEgp"));
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
            get { return _ptr_nolon_man; }
            set
            {
                _ptr_nolon_man = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("ptr_nolon_man"));
            }
        }
        public string totalEgp
        {
            get { return _totalEgp; }
            set
            {
                _totalEgp = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("totalEgp"));
            }
        }
        public string submitDate
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
            this.num = r["id"].ToString();
            this.num = r["num"].ToString();
            this.company = new Company(r["company"].ToString());
            this.dat = r["dat"].ToString();
            this.country = new Country(r["country"].ToString());
            this.port = new Port(r["port"].ToString());
            this.shippingCompany = new ShippingCompany(r["shippingCompany"].ToString());
            //this.ptr_nolon_man = r["ptr_nolon_man"].ToString();
            this.boles = Convert.ToBoolean(r["boles"]);
            this.bankReciete = Convert.ToBoolean(r["bankReciete"]);
            this.estifa = Convert.ToBoolean(r["estifa"]);
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
            this.bankReciete = Convert.ToBoolean(r["bankReciete"]);
            this.estifa = Convert.ToBoolean(r["estifa"]);
            this.usdToEgp = r["usdToEgp"].ToString();
            this.usdVal = r["usdVal"].ToString();
            this.egpVal = r["egpVal"].ToString();
            this.PTREgp = r["PTREgp"].ToString();
            this.totalEgp = r["totalEgp"].ToString();
            this.submitDate = r["submitDate"].ToString();
            this.accrualDate = r["accrualDate"].ToString();
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
            temp.ptr_nolon_man = this._ptr_nolon_man;
            temp.boles = this._boles;
            temp.bankReciete = this._bankReciete;
            temp.estifa = this._estifa;
            temp.usdToEgp = this._usdToEgp;
            temp.usdVal = this._usdVal;
            temp.egpVal = this._egpVal;
            temp.PTREgp = this._PTREgp;
            temp.totalEgp = this._totalEgp;
            temp.submitDate = this._submitDate;
            temp.accrualDate = this._accrualDate;
            return temp;
        }
        public void selectItem(object sender, MouseButtonEventArgs e)
        {
            this.id = ((ExportCertificate)((ListViewItem)sender).Content).id;
            this.num = ((ExportCertificate)((ListViewItem)sender).Content).num;
            //this.company = ((ExportCertificate)((ListViewItem)sender).Content).company;
            this.dat = ((ExportCertificate)((ListViewItem)sender).Content).dat;
            this.country = (Country)Global.countrys.Where(x => ((Country)x).name == ((ExportCertificate)((ListViewItem)sender).Content).country.name).First();
            this.port = (Port)Global.ports.Where(x=>((Port)x).name == ((ExportCertificate)((ListViewItem)sender).Content).port.name).First();
            this.shippingCompany = (ShippingCompany)Global.shippingCompanys.Where(x=>((ShippingCompany)x).name == ((ExportCertificate)((ListViewItem)sender).Content).shippingCompany.name).First();
            this.boles = ((ExportCertificate)((ListViewItem)sender).Content).boles;
            this.bankReciete = ((ExportCertificate)((ListViewItem)sender).Content).bankReciete;
            this.nolon = ((ExportCertificate)((ListViewItem)sender).Content).nolon;
            this.manifesto = ((ExportCertificate)((ListViewItem)sender).Content).manifesto;
            this.estifa = ((ExportCertificate)((ListViewItem)sender).Content).estifa;
            this.usdToEgp = ((ExportCertificate)((ListViewItem)sender).Content).usdToEgp;          
            this.submitDate = ((ExportCertificate)((ListViewItem)sender).Content).submitDate;
            this.accrualDate = ((ExportCertificate)((ListViewItem)sender).Content).accrualDate;
            this._rowSelected = true;
            // needs Edits
            this.ptr_nolon_man = ((ExportCertificate)((ListViewItem)sender).Content).ptr_nolon_man;
            this.usdVal = ((ExportCertificate)((ListViewItem)sender).Content).usdVal;
            this.egpVal = ((ExportCertificate)((ListViewItem)sender).Content).egpVal;
            this.PTREgp = ((ExportCertificate)((ListViewItem)sender).Content).PTREgp;
            this.totalEgp = ((ExportCertificate)((ListViewItem)sender).Content).totalEgp;
        }
        public void add(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "INSERT INTO `exportcertificate` (`num`,`company`,`dat`,`country`,`port`,`shippingCompany`,`boles`,`bankReciete`,`nolon`,`manifesto`,`usdToEgp`,`submitDate`,`accrualDate`) VALUES " +
                "('" + num + "','" + Global.company.id + "'," + Global.dateFormate(dat) + ",'" + country.id + "','" + port.id + "','" + shippingCompany.id + "','" + ((boles) ? "1" : "0") + "','" + ((bankReciete) ? "1" : "0") + "','" + ((nolon) ? "1" : "0") + "','" + ((manifesto) ? "1" : "0") + "','" + usdToEgp + "'," + Global.dateFormate(submitDate) + "," + Global.dateFormate(accrualDate) + ");";
            sql.Select(q);
            num = (sql.nextAutoIncrement("exportcertificate") - 1).ToString();
            Global.exportCertificates.Add(clone()); clear();
        }
        public void edit(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "UPDATE `exportcertificate` SET `num` = '" + num + "' ,`company` = '" + Global.company.id + "' ,`dat` = " + Global.dateFormate(dat) + " ,`country` = '" + country.id + "' ,`port` = '" + port.id + "' ,`shippingCompany` = '" + shippingCompany.id + "' ,`boles` = '" + ((boles) ? "1" : "0") + "' ,`bankReciete` = '" + ((bankReciete) ? "1" : "0") + "' ,`nolon` = '" + ((nolon) ? "1" : "0") + "' ,`manifesto` = '" + ((manifesto) ? "1" : "0") + "'  ,`usdToEgp` = '" + usdToEgp + "' ,`submitDate` = " + Global.dateFormate(submitDate) + " ,`accrualDate` = " + Global.dateFormate(accrualDate) + " WHERE `ExportCertificate`.`id` = "+id+";";
            sql.Select(q);
            foreach (ExportCertificate c in Global.exportCertificates)
            {
                if (c.num == _num)
                {
                    Global.exportCertificates[Global.exportCertificates.IndexOf(c)] = clone(); return;
                }
            }
            clear();
        }
        public void del(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "DELETE FROM `exportcertificate` WHERE `exportcertificate`.`num` = " + num;
            sql.Select(q);
            foreach (ExportCertificate temp in Global.exportCertificates)
            {
                if (temp.num == _num)
                {
                    Global.exportCertificates.Remove(temp); return;
                }
            }
            clear();
        }
        public void openInvoice(object sender, RoutedEventArgs e)
        {
            if (!_rowSelected)
            {
                MessageBox.Show(translate.trans("Please Select Row from Below Table !!!"));return;
            }
            foreach (Window w in Global.windows)
            {
                if (w.Name == translate.trans("Invoices"))
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
            if (Global.invoices == null || Global.invoices.Count == 0)
            {
                Global.invoices = Invoice.getTable(this.id);
                Global.clients = Client.getTable();
            }
            t.template1(W, ref invoice, translate.trans("Invoices"), new List<string>() { "num","client", "performa", "systemRef", "add", "edit", "del", "openInvoiceData", "close" }, Global.invoices, 0, 0, false);
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
        public void clear()
        {
            _num = null;
            _dat = null;
            _country = null;
            _port = null;
            _shippingCompany = null;
            _ptr_nolon_man = null;
            _boles = false;
            _bankReciete = false;
            _estifa = false;
            _usdToEgp = null;
            _usdVal = null;
            _egpVal = null;
            _PTREgp = null;
            _totalEgp = null;
            _submitDate = null;
            _accrualDate = null;
            _rowSelected = false;
        }
        
        public static ObservableCollection<object> getTable()
        {
            ObservableCollection<object> c = new ObservableCollection<object>();
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `exportcertificate` where `company`= "+Global.company.id; DataTable dt = sql.Select(q);
            if (dt.Rows.Count == 0)
            {
                ExportCertificate tmp = new ExportCertificate(); c.Add(tmp); return c;
            }
            foreach (DataRow r in dt.Rows)
            {
                ExportCertificate temp = new ExportCertificate();
                temp.id = r["id"].ToString();
                temp.num = r["num"].ToString();
                temp.company = new Company(r["company"].ToString());
                temp.dat = r["dat"].ToString();
                temp.country = new Country(r["country"].ToString());
                temp.port = new Port(r["port"].ToString());
                temp.shippingCompany = new ShippingCompany(r["shippingCompany"].ToString());
                //temp.ptr_nolon_man = r["ptr_nolon_man"].ToString();
                temp.boles = Convert.ToBoolean(r["boles"].ToString());
                temp.bankReciete = Convert.ToBoolean(r["bankReciete"].ToString());
                temp.estifa = Convert.ToBoolean(r["estifa"].ToString());
                temp.usdToEgp = r["usdToEgp"].ToString();
                //temp.usdVal = r["usdVal"].ToString();
                //temp.egpVal = r["egpVal"].ToString();
                //temp.PTREgp = r["PTREgp"].ToString();
                //temp.totalEgp = r["totalEgp"].ToString();
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
        public Invoice(ExportCertificate ex ,Window W = null)
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
            this.exportCertificate = new ExportCertificate(r["exportCertificate"].ToString());
            this.performa = r["performa"].ToString();
            this.systemRef = r["systemRef"].ToString();
            
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
            _rowSelected = true;
        }
        public void add(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "INSERT INTO `invoice` (`num`,`client`,`exportCertificate`,`performa`,`systemRef`) VALUES ( '" + num+ "','" + client.id + "','" + exportCertificate.num + "','" + performa + "','" + systemRef + "');";
            sql.Select(q);
            id = (sql.nextAutoIncrement("invoice") - 1).ToString();
            Global.invoices.Add(clone()); clear();
        }
        public void edit(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "UPDATE `invoice` SET `num` = '" + num + "' ,`client` = '"+client.id+"' ,`exportCertificate` = '" + exportCertificate.id + "' ,`performa` = '" + performa + "' ,`systemRef` = '" + systemRef + "' WHERE `Invoice`.`id` = "+id+" ;";
            sql.Select(q);
            foreach (Invoice c in Global.invoices)
            {
                if (c.id == id)
                {
                    Global.invoices[Global.invoices.IndexOf(c)] = this.clone(); break; ;
                }
            }
            clear();
        }
        public void del(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "DELETE FROM `invoice` WHERE `invoice`.`id` = " + id;
            sql.Select(q);
            foreach (Invoice temp in Global.invoices)
            {
                if (temp.id == id)
                {
                    Global.invoices.Remove(temp); return;
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
            _num = null;
            id = "";
            _performa = null;
            _systemRef = null;
            _rowSelected = false;
        }
        public void openInvoiceData(object sender, RoutedEventArgs e)
        {
            if (!_rowSelected)
            {
                MessageBox.Show(translate.trans("Please Select Row from Below Table !!!")); return;
            }
            foreach (Window w in Global.windows)
            {
                if (w.Name == translate.trans("InvoicesData"))
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
                new Property("brandCat","cmb"),
                new Property("brand"),
                new Property("usdVal","num",_action:"calc"),
                new Property("egpVal","num","",true),
                new Property("PTREgp","num","",true)
            };
            if (Global.invoiceDatas == null || Global.invoiceDatas.Count == 0)
            {
                Global.invoiceDatas = InvoiceData.getTable(id);
                Global.brandCats = BrandCat.getTable();
                Global.brands = Brand.getTable();
            }
            t.Moderntemplate(W, ref invoiceData, translate.trans("InvoicesData"), p,new List<string>() { "add", "edit", "del", "openInvoice", "close" }, Global.invoiceDatas, 0, 0, false);
            Global.addWindow((Window)W);

            if (((InvoiceData)Global.invoiceDatas[0]).id == string.Empty || ((InvoiceData)Global.invoiceDatas[0]).id == "" || ((InvoiceData)Global.invoiceDatas[0]).id == null)
            {
                Global.invoiceDatas.RemoveAt(0);
            }
            ((Window)W).Show();
        }
        public static ObservableCollection<object> getTable(string cerNum)
        {
            ObservableCollection<object> c = new ObservableCollection<object>();
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `invoice` where `exportCertificate` = " + cerNum; DataTable dt = sql.Select(q);
            if (dt.Rows.Count == 0)
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
        public InvoiceData(Invoice i,Window W = null)
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
            InvoiceData temp = new InvoiceData(invoice.clone());
            temp.id = this._id;
            temp.invoice = this._invoice.clone();
            temp.brand = this._brand.clone();
            temp.usdVal = this._usdVal;
            temp.egpVal = this._egpVal;
            temp.PTREgp = this._PTREgp;
            return temp;
        }
        public void selectItem(object sender, MouseButtonEventArgs e)
        {
            this.id = ((InvoiceData)((ListViewItem)sender).Content).id;
            this.invoice = ((InvoiceData)((ListViewItem)sender).Content).invoice;
            this.brand = ((InvoiceData)((ListViewItem)sender).Content).brand;
            this.usdVal = ((InvoiceData)((ListViewItem)sender).Content).usdVal;
            this.egpVal = ((InvoiceData)((ListViewItem)sender).Content).egpVal;
            this.PTREgp = ((InvoiceData)((ListViewItem)sender).Content).PTREgp;
            this.brandCat = this.brand.brandCat;
        }
        public void add(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "INSERT INTO `invoicedata` (`id`,`invoice`,`brand`,`usdVal`,`egpVal`,`PTREgp`) VALUES ( NULL,'" + invoice.id + "','" + brand.id + "','" + usdVal + "','" + egpVal + "','" + PTREgp + "');";
            sql.Select(q);
            id = (sql.nextAutoIncrement("invoicedata") - 1).ToString();
            Global.invoiceDatas.Add(clone()); clear();
        }
        public void edit(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "UPDATE `invoicedata` SET `invoice` = '" + invoice.id + "' ,`brand` = '" + brand.id + "' ,`usdVal` = '" + usdVal + "' ,`egpVal` = '" + egpVal + "' ,`PTREgp` = '" + PTREgp + "' WHERE `InvoiceData`.`id` ="+id+" ;";
            sql.Select(q);
            foreach (InvoiceData c in Global.invoiceDatas)
            {
                if (c.id == _id)
                {
                    Global.invoiceDatas[Global.invoiceDatas.IndexOf(c)] = clone(); return;
                }
            }
            clear();
        }
        public void del(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "DELETE FROM `invoicedata` WHERE `invoicedata`.`id` = " + id;
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
            // calculate
            egpVal = (Convert.ToDouble(usdVal)*Convert.ToDouble(invoice.exportCertificate.usdToEgp)).ToString();
            PTREgp = (Convert.ToDouble(egpVal)*Convert.ToDouble(brand.supportPercentage)).ToString();
        }
        public void close(object sender, RoutedEventArgs e)
        {
            Global.removeWindow(window); window.Close();
        }
        public void clear()
        {
            _id = null;
            _brand = null;
            _usdVal = null;
            _egpVal = null;
            _PTREgp = null;
        }
        public static ObservableCollection<object> getTable(string inv)
        {
            ObservableCollection<object> c = new ObservableCollection<object>();
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `invoicedata` where `invoice` = "+inv; DataTable dt = sql.Select(q);
            if (dt.Rows.Count == 0)
            {
                InvoiceData tmp = new InvoiceData(new Invoice(new ExportCertificate()) ); c.Add(tmp); return c;
            }
            foreach (DataRow r in dt.Rows)
            {
                InvoiceData temp = new InvoiceData(new Invoice(new ExportCertificate()));
                temp.id = r["id"].ToString();
                temp.invoice = new Invoice(r["invoice"].ToString());
                temp.brand = new Brand(r["brand"].ToString());
                temp.usdVal = r["usdVal"].ToString();
                temp.egpVal = r["egpVal"].ToString();
                temp.PTREgp = r["PTREgp"].ToString();
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
            this.exportCertificate = (ExportCertificate)Global.exportCertificates.Where(x => ((ExportCertificate)x).num == ((FileNo)((ListViewItem)sender).Content).num).First();
        }
        public void add(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "INSERT INTO `fileno` (`id`,`num`,`dat`,`exportCertificate`) VALUES ( NULL ,'" + num + "','" + Global.dateFormate(dat) + "','" + exportCertificate.id + "');";
            sql.Select(q);
            id = (sql.nextAutoIncrement("fileno") - 1).ToString();
            Global.fileNos.Add(clone()); clear();
        }
        public void edit(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "UPDATE `fileno` SET `num` = '" + num + "' ,`dat` = '" + dat + "',`exportCertificate` = '" + exportCertificate.id + "'  WHERE `FileNo`.`id` = id;";
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
            string q = "DELETE FROM `fileno` WHERE `fileno`.`id` = " + id;
            sql.Select(q);
            foreach (FileNo temp in Global.fileNos)
            {
                if (temp.id == _id)
                {
                    Global.fileNos.Remove(temp); return;
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
            _id = null;
            _dat = null;
        }
        public static ObservableCollection<object> getTable()
        {
            ObservableCollection<object> c = new ObservableCollection<object>();
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `fileno` "; DataTable dt = sql.Select(q);
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
                temp.exportCertificate = new ExportCertificate(r["id"].ToString());
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

}
