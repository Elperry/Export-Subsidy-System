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

namespace test
{
    
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
            //Global.removeWindow(window); window.Close();
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
            //Global.removeWindow(window); window.Close();
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
           // Global.removeWindow(window); window.Close();
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
            //Global.removeWindow(window); window.Close();
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
            //Global.removeWindow(window); window.Close();
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
           // Global.removeWindow(window); window.Close();
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
           // Global.removeWindow(window); window.Close();
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
   
    public class TestReport
    {
        public string title { get; set; }
        public string date { get; set; }
        public DataTable dt { get; set; } 
        
    }
}
