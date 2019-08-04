using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Windows;
using System.Data;


namespace Memo
{
    public class User 
    {
        public string id { get; set; }
        public string name { get; set; }
        public string email { get; set; }
        public string password { get; set; }
        public lang lang
        {
            get { return Global.Lang; }
            set { Global.Lang = value; }
        }
        public List<lang> langs
        {
            get { return Global.langs; }
            set { Global.langs = value; }
        }
        public int prev { get; set; }
        public Window window { get; set; }
        public User(Window W = null)
        {
            window = W;
        }
        public void login(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            if(Global.usr.email == string.Empty || Global.usr.email == null) { MessageBox.Show("PLease Enter a Vakid Email !!!");return; }
            if (Global.usr.password == string.Empty || Global.usr.password == null) { MessageBox.Show("PLease Enter your PassWord!!!");return; }
            if (Global.usr.lang ==  null) { MessageBox.Show("PLease Choose your Language !!!");return; }
            string q = "SELECT * from users where `Email`='"+ Global.usr.email +"' and `password`='"+ Global.usr.password +"';";
            if(sql.Select(q).Rows.Count > 0)
            {
                // login success
                MessageBox.Show("Login Successfull");
                main m = new main();
                m.Show();
                ((Window)window).Hide();
                Global.removeWindow(window);

            }
            else
            {
                //fail
                MessageBox.Show("Wrong Email Or PassWord !!! /n Please Enter Correct ones.");
                
            }
        }
        public void exit(object sender, RoutedEventArgs e)
        {
            System.Windows.Application.Current.Shutdown();
        }

    }
    public class Company
    {
        public string id { get; set; }
        public string name { get; set; }
    }
    public class Client
    {
        public string id { get; set; }
        public string name { get; set; }
        public string email { get; set; }
        public string phone { get; set; }
        public string fax { get; set; }
        public Country country { get; set; }
        public string address { get; set; }
        public string note { get; set; }
        public Window window { get; set; }
        public Client(Window w = null)
        {
            window = w;
        }
        public void add(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `clients ` ";
            DataTable dt = sql.Select(q);
        }
        public void edit(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `clients ` ";
            DataTable dt = sql.Select(q);
        }
        public void del(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `clients ` ";
            DataTable dt = sql.Select(q);
        }
        public void close(object sender, RoutedEventArgs e)
        {
            window.Close();
        }
        public static ObservableCollection<object> getTable()
        {
            ObservableCollection<object> c = new ObservableCollection<object>();
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `clients ` ";
            DataTable dt = sql.Select(q);
            if (dt.Rows.Count == 0)
            {
                return c;
            }
            foreach (DataRow r in dt.Rows)
            {
                Client temp = new Client();
                temp.id = r["id"].ToString();
                temp.name = r["name"].ToString();
                temp.email = r["email"].ToString();
                temp.fax = r["fax"].ToString();
                temp.phone = r["phone"].ToString();
                temp.country = new Country(r["country"].ToString()) ;
                temp.address = r["address"].ToString();
                temp.note = r["manifest"].ToString();
                c.Add(temp);
            }

            return c;
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
    public class Country
    {
        public string id { get; set; }
        public string nameEn { get; set; }
        public string nameAr { get; set; }
        public bool nolon { get; set; }
        public bool manifest { get; set; }
        private Window window { get; set; }
        public Country(Window W = null)
        {
            window = W;
        }
        public Country(string id)
        {
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `countries` ";
            DataTable dt = sql.Select(q);
            DataRow r = dt.Rows[0];
            this.id = r["id"].ToString();
            this.nameEn = r["nameEn"].ToString();
            this.nameAr = r["nameAr"].ToString();
            this.nolon = Convert.ToBoolean(r["nolon"]);
            this.manifest = Convert.ToBoolean(r["manifest"].ToString());
        }
        public void add(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string n = (nolon) ? "1" : "0";
            string m = (manifest) ? "1" : "0";
            
            string q = "INSERT INTO `countries` (`id`, `nameEn`, `nameAr`, `nolon`, `manifest`) VALUES (NULL, '"+nameEn+"', '"+nameAr+"', '"+n+"', '"+m+"');";
           
            sql.Select(q); id = (sql.nextAutoIncrement("countries") - 1).ToString();
            Global.countries.Add(this);
        }
        public void edit(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string n = (nolon) ? "1" : "0";
            string m = (manifest) ? "1" : "0";
            string q = "UPDATE `countries` SET `nameEn` = '"+nameEn+"', `nameAr` = '"+nameAr+"', `nolon` = '"+n+"', `manifest` = '"+m+"' WHERE `countries`.`id` = "+id+";";
            DataTable dt = sql.Select(q);
        }
        public void del(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "DELETE FROM `countries` WHERE `countries`.`id` = "+id;
            sql.Select(q);
            Global.countries.Remove(this);
        }
        public void close(object sender, RoutedEventArgs e)
        {
            Global.windows.Remove(window);
            window.Close();
        }
        public static ObservableCollection<object> getTable()
        {
            ObservableCollection<object> c = new ObservableCollection<object>();
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `countries` ";
            DataTable dt = sql.Select(q);
            if (dt.Rows.Count == 0)
            {
                return c;
            }
            foreach(DataRow r in dt.Rows)
            {
                Country temp = new Country();
                temp.id = r["id"].ToString();
                temp.nameEn = r["nameEn"].ToString();
                temp.nameAr = r["nameAr"].ToString();
                temp.nolon = Convert.ToBoolean(r["nolon"].ToString());
                temp.manifest = Convert.ToBoolean(r["manifest"].ToString());
                c.Add(temp);
            }

            return c;
        }
    }
    public class Port
    {
        public string id { get; set; }
        public string name { get; set; }
    }
    public class ShippingCompany
    {
        public string id { get; set; }
        public string name { get; set; }
        public string email { get; set; }
        public string phone { get; set; }
        public string fax { get; set; }
        public string address { get; set; }
        public string note { get; set; }
        public int rating { get; set; }
        private Window window { get; set; }
        public ShippingCompany(Window w = null)
        {
            window = w;
        }
        public void add(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "INSERT INTO `shippingcompanies` (`id`, `name`, `email`, `phone`, `fax`, `address`, `notes`) VALUES (NULL, '"+name+"', '"+email+"', '"+phone+"', '"+fax+"', '"+address+"', '"+note+"');";
            DataTable dt = sql.Select(q);
        }
        public void edit(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `countries` ";
            DataTable dt = sql.Select(q);
        }
        public void del(object sender, RoutedEventArgs e)
        {
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `countries` ";
            DataTable dt = sql.Select(q);
        }
        public void close(object sender, RoutedEventArgs e)
        {
            window.Close();
        }
        public static ObservableCollection<object> getTable()
        {
            ObservableCollection<object> c = new ObservableCollection<object>();
            Mysqldb sql = new Mysqldb();
            string q = "SELECT * FROM `shippingcompanies`  ";
            DataTable dt = sql.Select(q);
            if (dt.Rows.Count == 0)
            {
                return c;
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
                temp.note = r["note"].ToString();

                c.Add(temp);
            }

            return c;
        }
    }
    public class Brand
    {
        public string id { get; set; }
        public string name { get; set; }
        public Cat entity { get; set; }
        public double supportPercentage { get; set; }
        
    }
    public class Cat
    {
        public string id { get; set; }
        public string name { get; set; }
    }

    public class record
    {

    }

    /*
    public class MenuItem
    {
        public string name { get; set; }
        public List<MenuItem> children { get; set; }
        public RoutedEventHandler RoutedEHandler;

        

        

        public MenuItem(string Name = "name" , List<MenuItem> Children = null , RoutedEventHandler REH = null)
        {
            name = Name;
            children = Children;
            RoutedEHandler = REH;
        }

    }

    */
}
