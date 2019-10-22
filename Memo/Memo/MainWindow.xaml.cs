
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Threading;
using System.Windows;

namespace Memo
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public object usr
        {
            get { return Global.usr; }
            set { Global.usr = (User)value; }
        }
        public List<string> lst = new List<string>(){ "email", "password" ,"lang","login" , "exit" };
        public MainWindow()
        { 
            
            InitializeComponent();
            CultureInfo culture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
            culture.DateTimeFormat.ShortDatePattern = "dd/MM/yyyy";
            culture.DateTimeFormat.LongTimePattern = "";
            Thread.CurrentThread.CurrentCulture = culture;
            //Console.Write(DateTime.Now + "");// 
            //MessageBox.Show(DateTime.Now + "");
            if (!activation.check()){
               
                Window w = new Window();
                object A = new Activation(w);
                List<Property> P = new List<Property>()
                {
                    new Property("hwKey" ,"txt",_readOnly:true),
                    new Property("serial"),
                };
                string header = "Hello , this App Created By \nEng: Mohammad Al-Berry \nEmail:Mohammedelpry@yahoo.com\nPhone:01147264224 ";
                template t = new template();
                t.Moderntemplate(w,ref A, header, P, new List<string>() { "ActivateApp", "close" }, null,null ,600, 450);
                w.Show();
                this.Close();
                // open Activation
            }
            Global.windows = new List<Window>();  
            usr = new User(this);
            template temp = new template();
            temp.template1(this, usr, "Login",lst,null,500,450);
            /* Here is seed up open*/
            //((User)usr).email = "admin@admin";
            //((User)usr).password = "123";
            //((User)usr).lang = Global.langs[1];
           //((User)usr).login(this,new RoutedEventArgs());
            //main m = new main();
            //m.Show();
        }
        
        private void openActivation(){
            Activation a = new Activation();
            template temp = new template();
            temp.template1(this, a, "Login",lst,null,500,450);
        }

    }
}
