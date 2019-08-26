using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Shapes;
using System.Collections.ObjectModel;
using System.Windows.Media;
using System.Data;
using System.Windows.Data;
using System.Windows.Input;
using System.Text.RegularExpressions;
using System.Reflection;
using System.ComponentModel;
using System.Windows.Media.Imaging;

namespace Memo
{
    public class Property
    {
        public string name { get; set; }
        public string type { get; set; }
        public string visiblityBind { get; set; }
        public bool readOnly { get; set; }
        public string action { get; set; }
        public string displayPath { get; set; }
        public Property(string _name , string _type = "auto" , string _visiblityBind = "" , bool _readOnly = false,string _action="" , string _displayPath="")
        {
            name = _name;
            type = _type;
            visiblityBind = _visiblityBind;
            readOnly = _readOnly;
            action = _action;
            displayPath = _displayPath;
        }
    }
    public class TableCol
    {
        public string name { get; set; }
        public string path { get; set; }
        public Property prop { get; set; }
        public TableCol(string _name = "name" , string _path = "path" , Property _prop = null)
        {
            name = _name;
            path = _path;
            prop = _prop;
        }
    }
    public class BoolToVis : IValueConverter
    {

        public object Convert(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            //...
            return null;
        }

        public object ConvertBack(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            //...
            return null;
        }
    }
    public struct dic
    {
        public string from, to1, to2;
        public dic(string f, string t1, string t2)
        {
            from = f;
            to1 = t1;
            to2 = t2;
        }
    }
    public static class translate
    {
        public static string lang = (Global.Lang == null)?"EN": Global.Lang.id;
        public static List<dic> lst = new List<dic>() {
            new dic("id","م","Id"),
            new dic("name","الإسم","Name"),
            new dic("country","الدولة","Country"),
            new dic("gov","المحافظة","Governoment"),
            new dic("city","المدينة","City"),
            new dic("address","العنوان","Address"),
            new dic("email","البريد الإلكترونى","Email"),
            new dic("balance","الرصيد","Balance"),
            new dic("balanceLimit","حد المديونية","Balance Limit"),
            new dic("type","النوع","Type"),
            new dic("notes","ملاحظات","Notes"),
            new dic("canceled","ملغى","Canceled"),
            new dic("fax","فاكس","FAX"),
            new dic("rate","التقييم","Rating"),
            new dic("priceBracket","شريحة السعر","Price Bracket"),
            new dic("balanceDate","تاريخ ","Date"),
            new dic("logo","الشعار","Logo"),
            new dic("usr.City" , "المدينة" , "City"),
            new dic("nolon" , "نولون", "Nolon" ),
            new dic("shippingcompany" , "شركة الشحن" , "Shipping Company"),
            new dic("manifest" , "Manifesto", "Manifesto" ),
            new dic("manifesto" , "Manifesto", "Manifesto" ),
            new dic("usdval" , "السعر بالدولار", "Price (USD)" ),
            new dic("egpval" , "السعر بالجنيه", "Price (EGP)" ),
            new dic("port" , "الميناء", "Port" ),
            new dic("ptregp" , "الدعم بالجنيه", "Support (EGP)" ),
            new dic("brandcat" , "تصنيف", "Entity" ),
            new dic("brand" , "براند", "Brand" ),
            new dic("invoices" , "الفواتير", "Invoices" ),
            new dic("invoice" , "الفاتورة", "Invoice" ),
            new dic("exportcertificate" , "شهادة الصادر", "Export Certificate" ),
            new dic("dat" , "التاريخ", "Date" ),
            new dic("submitdate" , "تاريخ التقديم", "Submit Date" ),
            new dic("accrualdate" , "تاريخ الإستحقاق", "Accrual Date" ),
            new dic("totalegp" , "إجمالى الدعم بالجنيه", "Total PTR()" ),
            new dic("client" , "العميل", "Client" ),
            new dic("clients" , "العملاء", "Clients" ),
            new dic("countries" , "الدول", "Countries" ),
            new dic("admin" , "صلاحيات المدير", "Administrator Privileges" ),
            new dic("password" , "كلمة المرور", "Password" ),
            new dic("add" , "إضافة جديد", "Add New" ),
            new dic("edit" , "تعديل", "Edit" ),
            new dic("delete" , "حذف", "Delete" ),
            new dic("del" , "حذف", "Delete" ),
            new dic("close" , "إغلاق", "Close" ),
            new dic("openinvoice" , "فتح الفواتيرفى هذه الشهادة", "Open Invoices in this Certificate" ),
            new dic("openinvoicedata" , "البراندات فى هذه الفاتورة", "Open Brands in this Invoice" ),
            new dic("fileno" , "رقم الملف", "File Number" ),
            new dic("estiva" , "إستيفا", "Estiva" ),
            new dic("Activateapp" , "تفعيل البرنامج", "Activate The App" ),
            new dic("hwkey" , "الرقم المميز","Product Id" ),
            new dic("serial" , "كود التفعيل", "License" ),
            new dic("lang" , "اللغة", "Language" ),
            new dic("boles" , "بوليصة الشحن", "Shipping Policy" ),
            new dic("bankreciete" , "إصال البنك", "Bank Receipt" ),
            new dic("ptrnolon_man" , "النولون + المانيفستو", "Nolon + Manifesto" ),
            new dic("ptr_nolon_man" , "النولون + المانيفستو", "Nolon + Manifesto" ),
            new dic("txtbankReceipt" , "إصال البنك", "Bank Receipt Number" ),
            new dic("usd" , "القيمة بالدولار", "USD $" ),
            new dic("txtbankreceipt" , "رقم الإشعار البنكى", "Bank Receipt Num" ),
            new dic("openchequedata" , "تتبع هذا الشيك", "Track This Cheque" ),
            new dic("chequedatas" , "الملفات المربوطة بالشيك", "fles binded with this Chequq" ),
            new dic("cheque" , "شيك بنكى", "Cheque" ),
            new dic("chequerecieved" , "وصل شيك بنكى", "Cheque Recieved" ),
        };
        public static string trans(string str)
        {
            foreach (dic d in lst)
            {
                if (lang == "EN")
                {
                    if (d.from == str.ToLower())
                    {
                        return d.to2;
                    }
                }
                else if (lang == "AR")
                {
                    if (d.from == str.ToLower())
                    {
                        return d.to1;
                    }
                }
            }

            return str;
        }
    }
    public static class sizes
    {
        //col-md-4 col-sm-6 col-xs-12
        /*
         extra small ==>1      < 768
         small ==> 2          >= 768 && < 992
         medium ==> 3           >= 992 && < 1200
         larg == > 4            >= 1200
             */
        private static int APPWidth=0;
        private static int APPHeight=0;
        public static int screenWidth = Convert.ToInt32(System.Windows.SystemParameters.PrimaryScreenWidth);
        public static int screenHeight = Convert.ToInt32(System.Windows.SystemParameters.PrimaryScreenHeight);
        public static int appWidth {
            get { if (APPWidth == 0) { return Convert.ToInt32(System.Windows.SystemParameters.PrimaryScreenWidth); }
                  else { return APPWidth; } }
            set { APPWidth = value; }
        }
        public static int appHeight
        {
            get { if(APPHeight == 0) { return Convert.ToInt32(System.Windows.SystemParameters.PrimaryScreenHeight); }
                else { return APPHeight; }
            }
            set
            {
                APPHeight = value;
            }
        }

        public static int getScreenSize(int s = 0)
        {
            if (s == 0) { s = screenWidth; }
            if (s < 768)
            {
                return 1;
            }
            else if (s < 992)
            {
                return 2;
            }
            else if (s < 1300)
            {
                return 3;
            }
            else
            {
                //MessageBox.Show(screenWidth.ToString());
                return 4;
            }
        }
        public static int colWidth()
        {
            return Convert.ToInt32(screenWidth / 12);
        }

        public static int fieldWidth()
        {
            int s = getScreenSize();
            switch (s)
            {
                case 1:
                    return Convert.ToInt32((screenWidth - 80));

                case 2:
                    return Convert.ToInt32((screenWidth - 100) / 2);
                case 3:
                    return Convert.ToInt32((screenWidth - 120) / 3);
                default:
                    return Convert.ToInt32((screenWidth - 140) / 4);
            }
        }
        public static int fieldWidth(int s)
        {
            int i = getScreenSize(s);
            switch (i)
            {
                case 1:
                    return Convert.ToInt32((s - 100));

                case 2:
                    return Convert.ToInt32((s - 120) / 2);
                case 3:
                    return Convert.ToInt32((s - 120) / 3);
                default:
                    return Convert.ToInt32((s - 140) / 4);
            }
        }
    }
    public class MenuItemViewModel 
    {
        private  ICommand _command;
        public MenuItemViewModel()
        {
            _command = new CommandViewModel(Execute);
        }

        public string Header { get; set; }
        public ObservableCollection<MenuItemViewModel> MenuItems { get; set; }
        
        public ICommand Command
        {
            get
            {
                return _command;
            }
            set
            {
                _command = value;
            }
        }

        private void Execute()
        {
            //MessageBox.Show("Clicked at " + Header);
        }

    }
    public class CommandViewModel : ICommand
    {
        private readonly Action _action;

        public CommandViewModel(Action action)
        {
            _action = action;
        }

        public void Execute(object o)
        {
            _action();
        }

        public bool CanExecute(object o)
        {
            return true;
        }

        public event EventHandler CanExecuteChanged;
    }
    public class template
    {

        public SolidColorBrush bgColor = (SolidColorBrush)(new BrushConverter().ConvertFrom("#FF303030")); // black-Brawnish
        public SolidColorBrush fColor = (SolidColorBrush)(new BrushConverter().ConvertFrom("#FFF0F8FF")); // white
        public SolidColorBrush borderColor = (SolidColorBrush)(new BrushConverter().ConvertFrom("#696969")); //black
        public SolidColorBrush bgColor2 = (SolidColorBrush)(new BrushConverter().ConvertFrom("#FFF0F8FF"));// white
        public SolidColorBrush fColor2 = (SolidColorBrush)(new BrushConverter().ConvertFrom("#696969")); // black
        public SolidColorBrush transparent = (SolidColorBrush)(new BrushConverter().ConvertFrom("#00FFFFFF")); // transparent
        public SolidColorBrush gray = ((SolidColorBrush)new BrushConverter().ConvertFrom("#FFA2A2A2"));// gray
        public SolidColorBrush whiteSmoke = ((SolidColorBrush)new BrushConverter().ConvertFrom("#FFF5F5F5"));//white smoke
        public int fontSize = 13;
        public FontWeight fontWeight = FontWeights.Bold;
        //public int formHeight;
        //public int formWidth;
        public Label lbl(string c)
        {
            Label l = new Label();
            try
            {

                l.Content = c + " :";
                l.Background = transparent;
                l.Foreground = fColor;
                l.FontSize = 13;
                l.FontWeight = fontWeight;
                
                if(translate.lang == "EN") { l.FlowDirection = FlowDirection.LeftToRight;l.HorizontalAlignment = HorizontalAlignment.Left; }
                else { l.FlowDirection = FlowDirection.RightToLeft; l.HorizontalAlignment = HorizontalAlignment.Right; }

                //l.Margin = new Thickness(5, 0, 5, 0);

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
            return l;
        }
        public Label lbl(ref object obj,Property p)
        {
            Label l = new Label();
            try
            {

                l.Content = translate.trans(p.name) + " :";
                l.Background = transparent;
                l.Foreground = fColor;
                l.FontSize = 13;
                l.FontWeight = fontWeight;
                if (p.visiblityBind != "")
                {
                    Binding b2 = new Binding { Path = new PropertyPath(p.visiblityBind), Source = obj, Mode = BindingMode.TwoWay, UpdateSourceTrigger = UpdateSourceTrigger.PropertyChanged };
                    l.SetBinding(Label.VisibilityProperty, b2);
                }
                if (translate.lang == "EN") { l.FlowDirection = FlowDirection.LeftToRight; l.HorizontalAlignment = HorizontalAlignment.Left; }
                else { l.FlowDirection = FlowDirection.RightToLeft; l.HorizontalAlignment = HorizontalAlignment.Right; }

                //l.Margin = new Thickness(5, 0, 5, 0);

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
            return l;
        }
        public TextBox txt(ref object obj,string name,int width)
        {
            TextBox t = new TextBox();
            try
            {
                t.DataContext = obj;
                t.Background = bgColor2;
                t.Foreground = fColor2;
                t.BorderBrush = borderColor;
                t.Width = width;
                if (translate.lang == "EN") {
                    t.FlowDirection = FlowDirection.LeftToRight;
                    t.HorizontalAlignment = HorizontalAlignment.Left;
                }
                else
                {
                    t.FlowDirection = FlowDirection.RightToLeft;
                    t.HorizontalAlignment = HorizontalAlignment.Right;
                }
                    
                t.Margin = new Thickness(5, 0, 5, 5);
                Binding b = new Binding {Path = new PropertyPath(name), Source=obj, Mode = BindingMode.TwoWay , UpdateSourceTrigger = UpdateSourceTrigger.PropertyChanged };
                t.IsReadOnly = false;
                t.SetBinding(TextBox.TextProperty, b);
                //t.TextChanged += T_TextChanged;
                //MessageBox.Show("mainObj." + name);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }

            return t;
        }
        public TextBox txt(ref object obj, Property P, int width)
        {
            TextBox t = new TextBox();
            try
            {
                t.DataContext = obj;
                t.Background = bgColor2;
                t.Foreground = fColor2;
                t.BorderBrush = borderColor;
                t.Width = width;
                if (translate.lang == "EN")
                {
                    t.FlowDirection = FlowDirection.LeftToRight;
                    t.HorizontalAlignment = HorizontalAlignment.Left;
                }
                else
                {
                    t.FlowDirection = FlowDirection.RightToLeft;
                    t.HorizontalAlignment = HorizontalAlignment.Right;
                }

                t.Margin = new Thickness(5, 0, 5, 5);
                Binding b = new Binding { Path = new PropertyPath(P.name), Source = obj, Mode = BindingMode.TwoWay, UpdateSourceTrigger = UpdateSourceTrigger.PropertyChanged };
                t.IsReadOnly = P.readOnly;
                //t.IsEnabled = !P.readOnly;
                if (P.readOnly)
                {
                    t.Background = gray;
                }
                t.SetBinding(TextBox.TextProperty, b);
                if(P.visiblityBind != "")
                {
                    Binding b2 = new Binding { Path = new PropertyPath(P.visiblityBind), Source = obj, Mode = BindingMode.TwoWay, UpdateSourceTrigger = UpdateSourceTrigger.PropertyChanged };
                    t.SetBinding(TextBox.VisibilityProperty, b2);
                }
                if(P.type == "num")
                {
                    t.PreviewTextInput += NumberTextBox;
                }
                if(P.action != "")
                {
                    KeyEventHandler e = (KeyEventHandler)Delegate.CreateDelegate(
                    typeof(KeyEventHandler), obj, obj.GetType().GetMethod(P.action));
                    t.KeyDown += e;
                    //t.CommandBindings.Add();
                }
                //t.TextChanged += T_TextChanged;
                //MessageBox.Show("mainObj." + name);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }

            return t;
        }
        private void NumberTextBox(object sender, TextCompositionEventArgs e)
        {
            //Regex regex = new Regex("^[0-9]*\\.?[0-9]*");
            try
            {
                string s = e.Text;
                //MessageBox.Show((e.Text == ".").ToString() + " &&  "+((TextBox)sender).Text.IndexOf('.').ToString());
                if(e.Text == "." && ((TextBox)sender).Text.IndexOf('.') == -1){

                    e.Handled = false;
                    return;
                }
                if(s == "0" && ((TextBox)sender).Text.Length > 0)
                {
                    e.Handled = false;
                    return;
                }
               double i = Convert.ToDouble(s);
                e.Handled = !(i > 0);
            }
            catch (Exception)
            {
                e.Handled = true;
                //throw;
            }
            // = regex.IsMatch(e.Text);
        }
        public ComboBox cmb(ref object obj,string name, int width)
        {
            ComboBox t = new ComboBox();
            try
            {
                t.Background = bgColor2;
                t.Foreground = fColor2;
                t.BorderBrush = borderColor;
                t.DataContext = obj;
                t.Width = width;
                t.SetBinding(ComboBox.ItemsSourceProperty,name+"s");
                t.SetBinding(ComboBox.SelectedItemProperty, name);
                t.DisplayMemberPath = "name";
                t.SelectedValuePath = "id";
                t.IsEditable = true;
                if (translate.lang == "EN")
                {
                    t.HorizontalAlignment = HorizontalAlignment.Left;
                    t.FlowDirection = FlowDirection.LeftToRight;
                }
                else
                {
                    t.HorizontalAlignment = HorizontalAlignment.Right;
                    t.FlowDirection = FlowDirection.RightToLeft;
                }

                t.Margin = new Thickness(5, 0, 5, 5);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }

            return t;
        }
        public ComboBox cmb(ref object obj, Property p, int width)
        {
            ComboBox t = new ComboBox();
            try
            {
                t.Background = bgColor2;
                t.Foreground = fColor2;
                t.BorderBrush = borderColor;
                if (translate.lang == "EN")
                {
                    t.HorizontalAlignment = HorizontalAlignment.Left;
                    t.FlowDirection = FlowDirection.LeftToRight;
                }
                else
                {
                    t.HorizontalAlignment = HorizontalAlignment.Right;
                    t.FlowDirection = FlowDirection.RightToLeft;
                }

                t.DataContext = obj;
                t.Width = width;
                t.SetBinding(ComboBox.ItemsSourceProperty, p.name + "s");
                Binding b = new Binding { Path = new PropertyPath(p.name), Source = obj, Mode = BindingMode.TwoWay, UpdateSourceTrigger = UpdateSourceTrigger.PropertyChanged };
                t.SetBinding(ComboBox.SelectedItemProperty, b);
                t.IsReadOnly = p.readOnly;
                if (p.visiblityBind != "")
                {
                    Binding b2 = new Binding { Path = new PropertyPath(p.visiblityBind), Source = obj, Mode = BindingMode.TwoWay, UpdateSourceTrigger = UpdateSourceTrigger.PropertyChanged };
                    t.SetBinding(ComboBox.VisibilityProperty, b2);
                }
                if(p.displayPath == "")
                {
                    t.DisplayMemberPath = ".name";
                    t.SelectedValuePath = ".id";
                }
                else
                {
                    t.DisplayMemberPath = p.displayPath;
                    //t.SelectedValuePath = ".id";
                }
                if(p.action != "")
                {

                    SelectionChangedEventHandler e = (SelectionChangedEventHandler)Delegate.CreateDelegate(
                    typeof(SelectionChangedEventHandler), obj, obj.GetType().GetMethod(p.action));
                    t.SelectionChanged += e;
                }
                t.IsEditable = true;

                t.Margin = new Thickness(5, 0, 5, 5);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }

            return t;
        }
        public Button btn ( string name , int width)
        {
            Button b = new Button();
            b.Content = translate.trans(name);
            //b.Click += method;
            b.Width = width;
            b.Height = 30;
            b.Margin = new Thickness(5);

            return b;
        }
        public CheckBox chb(ref object obj,string name)
        {
            CheckBox c = new CheckBox();
            c.DataContext = obj;
            c.SetBinding(CheckBox.IsCheckedProperty, name);
            c.Margin = new Thickness(5);
            return c;
        }
        public CheckBox chb(ref object obj, Property p)
        {
            CheckBox c = new CheckBox();
            c.DataContext = obj;
            c.SetBinding(CheckBox.IsCheckedProperty, p.name);
            c.IsEnabled = !(p.readOnly);
            if (p.visiblityBind != "")
            {
                Binding b2 = new Binding { Path = new PropertyPath(p.visiblityBind), Source = obj, Mode = BindingMode.TwoWay,Converter= new BooleanToVisibilityConverter() };
                c.SetBinding(CheckBox.VisibilityProperty, b2);
            }
            if (p.action != "")
            {
                RoutedEventHandler e = (RoutedEventHandler)Delegate.CreateDelegate(
                typeof(RoutedEventHandler), obj, obj.GetType().GetMethod(p.action));
                c.Click += e;
                //t.CommandBindings.Add();
            }
            //if (p.action)
            c.Margin = new Thickness(5);
            return c;
        }
        public ListView lstView(string name, DataTable dt, List<string> lstHeaders, List<Int32> lstWidths)
        {
            ListView l = new ListView();
            GridView gd = new GridView();
            l.DataContext = dt;
            l.Name = name;
            int i = 0;
            foreach (DataColumn dc in dt.Columns)
            {
                GridViewColumn c = new GridViewColumn();
                c.DisplayMemberBinding = new Binding(dc.ColumnName);
                c.Header = lstHeaders[i];
                c.Width = lstWidths[i];
                i++;
                gd.Columns.Add(c);
            }

            l.View = gd;
            return l;
        }
        public DatePicker datePicker(ref object obj, string name , int width)
        {
            DatePicker d = new DatePicker();
            d.Width = width;
            d.DataContext = obj;
            Binding b = new Binding { Path = new PropertyPath(name), Source = obj, Mode = BindingMode.TwoWay, UpdateSourceTrigger = UpdateSourceTrigger.PropertyChanged };
            d.SetBinding(DatePicker.TextProperty, b);
           
            return d;
        }
        public DatePicker datePicker(ref object obj, Property p, int width)
        {
            DatePicker d = new DatePicker();
            d.Width = width;
            d.DataContext = obj;
            Binding b = new Binding { Path = new PropertyPath(p.name), Source = obj, Mode = BindingMode.TwoWay, UpdateSourceTrigger = UpdateSourceTrigger.PropertyChanged };
            d.SetBinding(DatePicker.TextProperty, b);
            if (p.visiblityBind != "")
            {
                Binding b2 = new Binding { Path = new PropertyPath(p.visiblityBind), Source = obj, Mode = BindingMode.TwoWay, UpdateSourceTrigger = UpdateSourceTrigger.PropertyChanged };
                d.SetBinding(DatePicker.VisibilityProperty, b2);
            }

            return d;
        }
        public StackPanel hStack(bool center= false)
        {
            StackPanel s = new StackPanel();
            s.Orientation = Orientation.Horizontal;
            if(translate.lang == "EN")
            {
                s.FlowDirection = FlowDirection.LeftToRight;
                s.HorizontalAlignment = (center)?HorizontalAlignment.Center:HorizontalAlignment.Left;
            }
            else
            {
                s.FlowDirection = FlowDirection.RightToLeft;
                s.HorizontalAlignment = (center) ? HorizontalAlignment.Center : HorizontalAlignment.Right;
            }
            

            return s;
        }
        public StackPanel vStack(bool center = true)
        {
            StackPanel s = new StackPanel();
            if (translate.lang == "EN")
            {
                s.FlowDirection = FlowDirection.LeftToRight;
                s.HorizontalAlignment = (center) ? HorizontalAlignment.Center : HorizontalAlignment.Left;
            }
            else
            {
                s.FlowDirection = FlowDirection.RightToLeft;
                s.HorizontalAlignment = (center) ? HorizontalAlignment.Center : HorizontalAlignment.Right;
            }
            return s;
        }
        public ScrollViewer scroller(bool center = true , int width=0 , int height=0)
        {
            ScrollViewer s = new ScrollViewer();
            if (translate.lang == "EN")
            {
                s.FlowDirection = FlowDirection.LeftToRight;
                s.HorizontalAlignment = (center) ? HorizontalAlignment.Center : HorizontalAlignment.Left;
            }
            else
            {
                s.FlowDirection = FlowDirection.RightToLeft;
                s.HorizontalAlignment = (center) ? HorizontalAlignment.Center : HorizontalAlignment.Right;
            }
            s.CanContentScroll = true;
            s.HorizontalScrollBarVisibility = ScrollBarVisibility.Auto;
            s.VerticalScrollBarVisibility = ScrollBarVisibility.Auto;
            if(height != 0) { s.Height = height; }
            if (width != 0) { s.Width = width; } 
            return s;
        }
        
        public StackPanel tableView (ref object obj, ref ObservableCollection<object> dt , int startPos)
        {
            StackPanel stp = vStack(true);
            if (dt.Count == 0)
            {
                Label h = new Label();
                h.Content = translate.trans("There Is no Records !!");
                h.FontSize = 24;
                h.Foreground = fColor;
                h.Background = transparent;
                h.HorizontalAlignment = HorizontalAlignment.Center;
                h.Margin = new Thickness(20);
                stp.Children.Add(h);
                return stp;
            }
            
            ScrollViewer s = scroller();
            //stp.Children.Add(s);
            s.Height = sizes.appHeight - startPos-30;
            stp.Children.Add(s);
            // try1
            ListView l = new ListView(); // need to be a fun
            Style style = new Style(typeof(ListViewItem));
            style.Setters.Add(new Setter(ListViewItem.HorizontalContentAlignmentProperty, HorizontalAlignment.Stretch));
            style.Setters.Add(new EventSetter {Event = ListViewItem.PreviewMouseLeftButtonDownEvent , Handler = (MouseButtonEventHandler)Delegate.CreateDelegate(
                typeof(MouseButtonEventHandler),obj, obj.GetType().GetMethod("selectItem"))
            });
            l.ItemContainerStyle = style;
            l.ItemsSource = dt;
            /*Binding b = new Binding
            {
                Path = new PropertyPath("Global.countries"),
                Mode = BindingMode.TwoWay,
                UpdateSourceTrigger = UpdateSourceTrigger.PropertyChanged
            };*/
            //l.SetBinding(ListView.ItemsSourceProperty, b);
            s.Content = l;

            GridView grdV = new GridView(); // needed to be a func later
            foreach(var prop in dt[0].GetType().GetProperties())
            {
                GridViewColumn grdvc = new GridViewColumn();
                
                if (prop.PropertyType.ToString() == "System.Int32" ||
                    prop.PropertyType.ToString() == "System.Double" ||
                    prop.PropertyType.ToString() == "System.String" ||
                    prop.PropertyType.ToString() == "System.Boolean")
                {
                    grdvc.Header = translate.trans(prop.Name.ToString());
                    grdvc.DisplayMemberBinding = new Binding(prop.Name.ToString());
                    //MessageBox.Show(prop.Name.ToString());
                }
                else
                {
                    foreach (var p in prop.GetType().GetProperties())
                    {
                        if(prop.PropertyType.Name == "ObservableCollection`1" || prop.Name == "exportCertificate")
                        {
                            grdvc.Header = translate.trans("");
                            grdvc.DisplayMemberBinding = new Binding(prop.Name.ToString() + ".name");
                            grdvc.Width = 0;
                            
                            continue;
                        }

                        if (p.Name.ToString().ToLower() == "name")
                        {
                            grdvc.Header = translate.trans(prop.Name.ToString());
                            grdvc.DisplayMemberBinding = new Binding(prop.Name.ToString()+".name");
                            //MessageBox.Show(prop.Name.ToString());
                            break;
                        }
                    }
                }

                grdV.Columns.Add(grdvc);
            }
            l.View = grdV;
            
            return stp;
        }
        public StackPanel tableView(ref object obj, ref ObservableCollection<object> dt,List<TableCol> lst, int startPos)
        {
            StackPanel stp = vStack(true);
            if (dt.Count == 0)
            {
                Label h = new Label();
                h.Content = translate.trans("There Is no Records !!");
                h.FontSize = 24;
                h.Foreground = fColor;
                h.Background = transparent;
                h.HorizontalAlignment = HorizontalAlignment.Center;
                h.Margin = new Thickness(20);
                stp.Children.Add(h);
                return stp;
            }

            ScrollViewer s = scroller();
            //stp.Children.Add(s);
            s.Height = sizes.appHeight - startPos - 30;
            stp.Children.Add(s);
            // try1
            ListView l = new ListView(); // need to be a fun
            Style style = new Style(typeof(ListViewItem));
            style.Setters.Add(new Setter(ListViewItem.HorizontalContentAlignmentProperty, HorizontalAlignment.Stretch));
            style.Setters.Add(new EventSetter
            {
                Event = ListViewItem.PreviewMouseLeftButtonDownEvent,
                Handler = (MouseButtonEventHandler)Delegate.CreateDelegate(
                typeof(MouseButtonEventHandler), obj, obj.GetType().GetMethod("selectItem"))
            });
            l.ItemContainerStyle = style;
            l.ItemsSource = dt;
            s.Content = l;

            GridView grdV = new GridView(); // needed to be a func later
            foreach (var prop in dt[0].GetType().GetProperties())
            {
                GridViewColumn grdvc = new GridViewColumn();
                TableCol tb = lst.Find(x => x.name == prop.Name);
                if (tb == null)
                {
                    grdvc.Header = translate.trans("");
                    grdvc.Width = 0;
                    continue;
                }
                else
                {
                    if (tb.prop != null)
                    {
                        if (tb.prop.type == "bool")
                        {
                            DataTemplate t = new DataTemplate();
                            FrameworkElementFactory temp = new FrameworkElementFactory(typeof(CheckBox));
                            temp.Name = "chckHeader";
                            t.DataType = typeof(CheckBox);
                            t.VisualTree = temp;
                            grdvc.HeaderTemplate =t;

                            DataTemplate dt2 = new DataTemplate();
                            FrameworkElementFactory ff = new FrameworkElementFactory(typeof(CheckBox));
                            ff.SetBinding(CheckBox.IsCheckedProperty, new Binding(tb.path));
                            if(tb.prop.action != "")
                            {
                                RoutedEventHandler e = (RoutedEventHandler)Delegate.CreateDelegate(
                                typeof(RoutedEventHandler), obj, obj.GetType().GetMethod(tb.prop.action));
                                ff.AddHandler(CheckBox.ClickEvent, e);
                            }
                            dt2.VisualTree = ff;
                            grdvc.CellTemplate = dt2;
                        }

                        //ff.SetValue(TextBlock.ToolTipProperty, "Credit Card Number");
                        
                    }
                    else
                    {
                        grdvc.Header = translate.trans(tb.name);
                        grdvc.DisplayMemberBinding = new Binding(tb.path);
                    }
                    
                }
                

                grdV.Columns.Add(grdvc);
            }
            l.View = grdV;

            return stp;
        }
        public Button headerBtn(string content, string action)
        {
            Button btn = new Button();
            btn.Background = transparent;
            btn.BorderBrush = transparent;
            btn.Foreground = gray;
            btn.FontSize = 15;
            btn.FontWeight = fontWeight;
            btn.VerticalAlignment = VerticalAlignment.Center;
            MaterialDesignThemes.Wpf.PackIcon icon = new MaterialDesignThemes.Wpf.PackIcon();
            icon.Width = 25;
            icon.Height = 25;
            icon.Foreground = gray;

            icon.Kind = MaterialDesignThemes.Wpf.PackIconKind.Power;
            btn.Content = icon;

            return btn;
        }
        
        public Grid miniHeader(List<MenuItem> l)
        {
            Grid gr = new Grid();
            gr.Background = gray;
            gr.Height = 40;
            gr.Width = sizes.appWidth;
            StackPanel stk = hStack(false);
            stk.Margin = new Thickness(20, 0, 0, 0);
            Button close = new Button();


            stk.Children.Add(close);
            gr.Children.Add(stk);
            return gr;
        }
        public Border brdr()
        {
            Border border = new Border();
            border.Background = (SolidColorBrush)(new BrushConverter().ConvertFrom("#FF686868"));
            border.CornerRadius = new CornerRadius(20);
            border.Margin = new Thickness(20);
            return border;
        }
        public Menu ClassicalMenueBar(ObservableCollection<MenuItemViewModel> m)
        {
            Menu menu = new Menu();
            menu.Name = "ClassicMenu";
            //menu.ItemsSource = m;
            //Binding b = new Binding { Path=new PropertyPath("MainMenuItems") , Mode = BindingMode.TwoWay };
            //menu.SetBinding(Menu.ItemsSourceProperty, b);
            menu.ItemsSource = m;
            menu.HorizontalAlignment = (translate.lang == "EN") ? HorizontalAlignment.Left : HorizontalAlignment.Right;
            menu.FlowDirection = (translate.lang == "EN") ? FlowDirection.LeftToRight : FlowDirection.RightToLeft;
            menu.HorizontalContentAlignment = (translate.lang == "EN") ? HorizontalAlignment.Left : HorizontalAlignment.Right;
            menu.VerticalAlignment = VerticalAlignment.Top;
            menu.Background = whiteSmoke;
            menu.Height = 40;
            //menu.Width = 
            Style style = new Style(typeof(MenuItem));
            style.Setters.Add(new Setter(MenuItem.CommandProperty, new Binding("Command")));
            menu.ItemContainerStyle = style;

            HierarchicalDataTemplate hT = new HierarchicalDataTemplate(typeof(MenuItemViewModel));
            hT.ItemsSource = new Binding("MenuItems");
            FrameworkElementFactory tb = new FrameworkElementFactory(typeof(TextBlock));
            tb.SetBinding(TextBlock.TextProperty, new Binding("Header"));
            tb.SetValue(TextBlock.ForegroundProperty, fColor2);
            hT.VisualTree = tb;

            menu.ItemTemplate = hT;
            
            menu.Width = sizes.appWidth;
            menu.Height = 20;
            DockPanel.SetDock(menu, Dock.Top);
            
            return menu;
        }

        public void template1(object form,ref object obj ,string header="",List<string>memberLst = null ,ObservableCollection<object> table = null, int width = 0,int height = 0,bool parent = true)
        {
            if(width == 0) { width = sizes.screenWidth;  }
            if (height == 0)
            {
                height = sizes.screenHeight;
                ((Window)form).Top = 0;
                ((Window)form).Left = 0;
                if (!parent) { ((Window)form).Top = 50; }
            }
            else
            {
                ((Window)form).Top = Convert.ToInt32((sizes.screenHeight - height) / 2);
                ((Window)form).Left = Convert.ToInt32((sizes.screenWidth - width) / 2);
            }
            sizes.appHeight = height;
            sizes.appWidth = width;
            ((Window)form).Width = width;
            ((Window)form).Height = height;
            ((Window)form).Background = bgColor;
            ((Window)form).HorizontalAlignment = HorizontalAlignment.Center;
            ((Window)form).WindowStyle = WindowStyle.None;
            if (translate.lang == "EN") { ((Window)form).FlowDirection = FlowDirection.LeftToRight; }
            else
            {
                ((Window)form).FlowDirection = FlowDirection.RightToLeft;
            }
            // window name
            if(header == "")
            {
                ((Window)form).Title = translate.trans(obj.GetType().Name);
            }
            else
            {
                ((Window)form).Title = translate.trans(header);
            }
            //MessageBox.Show(translate.trans(form.GetType().Name));
            StackPanel S = new StackPanel();
            S.HorizontalAlignment = HorizontalAlignment.Center;
            S.Margin = new Thickness(10);
            if (header != "") {
                Grid grd = new Grid();
                Label h = new Label();
                h.Content = translate.trans(header);
                BitmapImage bImg = new BitmapImage(new Uri("pack://application:,,,/Icons/logo.png"));
                //bImg.UriSource = new Uri("", UriKind.Relative);
                Image logo = new Image
                {
                    Source = bImg
                };

                logo.Width = 50; logo.Height = 50;
                if (translate.lang == "EN")
                {
                    logo.HorizontalAlignment = HorizontalAlignment.Left;
                }
                else
                {
                    logo.HorizontalAlignment = HorizontalAlignment.Right;
                }
                h.FontSize = 24;
                h.Foreground = fColor;
                h.Background = transparent;
                h.HorizontalAlignment = HorizontalAlignment.Center;
                h.Margin = new Thickness(20);
                grd.Children.Add(logo);
                grd.Children.Add(h);
                S.Children.Add(grd);
            }
            int n = sizes.getScreenSize(width);
            int i = 0;
            StackPanel hs = hStack();
            foreach (var prop in obj.GetType().GetProperties())
            {
                if (memberLst != null && !memberLst.Contains(prop.Name)) { continue; }
                StackPanel stp = new StackPanel();
                if (translate.lang == "EN") { stp.FlowDirection = FlowDirection.LeftToRight;stp.HorizontalAlignment = HorizontalAlignment.Left; }
                else
                {
                    stp.FlowDirection = FlowDirection.RightToLeft;
                    stp.HorizontalAlignment = HorizontalAlignment.Right;
                }
                stp.Width = sizes.fieldWidth(width);
                if (prop.PropertyType.ToString() == "System.Int32" ||
                   prop.PropertyType.ToString() == "System.Double" ||
                   prop.PropertyType.ToString() == "System.String")
                {
                    stp.Children.Add(lbl(translate.trans(prop.Name)));
                    stp.Children.Add(txt(ref obj,prop.Name.ToString(), sizes.fieldWidth(width)-10));
                }
                else if (prop.PropertyType.ToString() == "System.Boolean")
                {
                    stp.Children.Add(lbl(translate.trans(prop.Name)));
                    stp.Children.Add(chb(ref obj,prop.Name));
                }
                else
                {
                    //MessageBox.Show(prop.Name + "       " + prop.PropertyType.ToString());
                    stp.Children.Add(lbl(translate.trans(prop.Name)));
                    stp.Children.Add(cmb(ref obj,prop.Name, sizes.fieldWidth(width)-10));
                }
                if (i == n)
                {
                    S.Children.Add(hs);
                    hs = hStack();
                    hs.Children.Add(stp);
                    i = 0;
                }
                else
                {
                    hs.Children.Add(stp);
                }
                i++;
                //MessageBox.Show(prop.PropertyType.ToString());     
            }
            S.Children.Add(hs);
            // generate buttons for methodes
            i = 0;
            hs = hStack();
            foreach (var method in obj.GetType().GetMethods())
            {
                //MessageBox.Show(method.ToString());
                if (memberLst != null && !memberLst.Contains(method.Name)) { continue; }
                Button b = btn(translate.trans(method.Name), sizes.fieldWidth(width));                 
                RoutedEventHandler e = (RoutedEventHandler)Delegate.CreateDelegate(
                typeof(RoutedEventHandler),obj, method);
                b.Click += e;
                if (i == n)
                {
                    S.Children.Add(hs);
                    hs = hStack();
                    hs.Children.Add(b);
                    i = 0;
                }
                else
                {
                    hs.Children.Add(b);
                }
                i++;
                //;
            }
            S.Children.Add(hs);

            Border border = brdr();
            border.Child = S;
           
            StackPanel stk = vStack();
            stk.HorizontalAlignment = HorizontalAlignment.Stretch;
            //stk.Children.Add(miniHeader());
            
            

            if (table != null)
            {
                ScrollViewer Controls = scroller(true, 0, (height / 2) - 50); 
                Controls.Content = border;
                stk.Children.Add(Controls);
                stk.Children.Add(tableView(ref obj ,ref table, (height / 2) + 40));
            }
            else
            {
                stk.Children.Add(border);
            }
            ((Window)form).Content = stk;

        }
        public void Moderntemplate(object form, ref object obj, string header = "",List<Property> inputs = null ,List<string> buttons = null, ObservableCollection<object> table = null,List<TableCol> tableCols = null, int width = 0, int height = 0, bool parent = true)
        {
            if (width == 0) { width = sizes.screenWidth; }
            if (height == 0)
            {
                height = sizes.screenHeight;
                ((Window)form).Top = 0;
                ((Window)form).Left = 0;
                if (!parent) { ((Window)form).Top = 50; }
            }
            else
            {
                ((Window)form).Top = Convert.ToInt32((sizes.screenHeight - height) / 2);
                ((Window)form).Left = Convert.ToInt32((sizes.screenWidth - width) / 2);
            }
            sizes.appHeight = height;
            sizes.appWidth = width;
            ((Window)form).Width = width;
            ((Window)form).Height = height;
            ((Window)form).Background = bgColor;
            ((Window)form).HorizontalAlignment = HorizontalAlignment.Center;
            ((Window)form).WindowStyle = WindowStyle.None;
            if (translate.lang == "EN") { ((Window)form).FlowDirection = FlowDirection.LeftToRight; }
            else
            {
                ((Window)form).FlowDirection = FlowDirection.RightToLeft;
            }
            // window name
            if (header == "")
            {
                ((Window)form).Title = translate.trans(obj.GetType().Name);
            }
            else
            {
                ((Window)form).Title = translate.trans(header);
            }
            //MessageBox.Show(translate.trans(form.GetType().Name));
            StackPanel S = new StackPanel();
            S.HorizontalAlignment = HorizontalAlignment.Center;
            S.Margin = new Thickness(10);
            if (header != "")
            {
                Grid grd = new Grid();
                Label h = new Label();
                h.Content = translate.trans(header);
                BitmapImage bImg = new BitmapImage(new Uri("pack://application:,,,/Icons/logo.png"));
                //bImg.UriSource = new Uri("", UriKind.Relative);
                Image logo = new Image
                {
                    Source = bImg
                };
                
                logo.Width = 50;logo.Height = 50;
                if(translate.lang == "EN")
                {
                    logo.HorizontalAlignment = HorizontalAlignment.Left;
                }
                else
                {
                    logo.HorizontalAlignment = HorizontalAlignment.Right;
                }
                h.FontSize = 24;
                h.Foreground = fColor;
                h.Background = transparent;
                h.HorizontalAlignment = HorizontalAlignment.Center;
                h.Margin = new Thickness(20);
                grd.Children.Add(logo);
                grd.Children.Add(h);
                S.Children.Add(grd);
                
            }
            int n = sizes.getScreenSize(width);
            int i = 0;
            StackPanel hs = hStack();
            foreach (var prop in obj.GetType().GetProperties())
            {
                if(inputs == null) { break; }
                foreach (Property p in inputs)
                {
                    if(p.name == prop.Name)
                    {
                        StackPanel stp = vStack();
                        stp.Width = sizes.fieldWidth(width);
                        if (p.type == "auto")
                        {
                            if (prop.PropertyType.ToString() == "System.Int32" ||
                               prop.PropertyType.ToString() == "System.Double" ||
                               prop.PropertyType.ToString() == "System.String")
                            {
                                stp.Children.Add(lbl(translate.trans(prop.Name)));
                                stp.Children.Add(txt(ref obj, prop.Name.ToString(), sizes.fieldWidth(width) - 10));
                            }
                            else if (prop.PropertyType.ToString() == "System.Boolean")
                            {
                                stp.Children.Add(lbl(translate.trans(prop.Name)));
                                stp.Children.Add(chb(ref obj, prop.Name));
                            }
                            else
                            {
                                //MessageBox.Show(prop.Name + "       " + prop.PropertyType.ToString());
                                stp.Children.Add(lbl(translate.trans(prop.Name)));
                                stp.Children.Add(cmb(ref obj, prop.Name, sizes.fieldWidth(width) - 10));
                            }
                        }
                        else if(p.type == "txt" || p.type == "num")
                        {
                            stp.Children.Add(lbl(ref obj , p));
                            stp.Children.Add(txt(ref obj, p, sizes.fieldWidth(width) - 10));
                        }
                        else if(p.type == "bool")
                        {
                            stp.Children.Add(lbl(ref obj, p));
                            stp.Children.Add(chb(ref obj, p));
                        }
                        else if(p.type == "cmb")
                        {
                            stp.Children.Add(lbl(ref obj, p));
                            stp.Children.Add(cmb(ref obj, p, sizes.fieldWidth(width) - 10));
                        }else if (p.type == "date")
                        {
                            stp.Children.Add(lbl(ref obj, p));
                            stp.Children.Add(datePicker(ref obj, p, sizes.fieldWidth(width) - 10));
                        }
                        if(p.visiblityBind != "")
                        {
                            Binding b2 = new Binding { Path = new PropertyPath(p.visiblityBind), Source = obj, Mode = BindingMode.TwoWay, Converter = new BooleanToVisibilityConverter() };
                            stp.SetBinding(CheckBox.VisibilityProperty, b2);
                        }
                        if (i == n)
                        {
                            S.Children.Add(hs);
                            hs = hStack();
                            hs.Children.Add(stp);
                            i = 0;
                        }
                        else
                        {
                            hs.Children.Add(stp);
                        }
                        i++;

                    }
                }

                
                


                //MessageBox.Show(prop.PropertyType.ToString());     
            }
            S.Children.Add(hs);
            // generate buttons for methodes
            i = 0;
            hs = hStack();
            foreach (var method in obj.GetType().GetMethods())
            {
                //MessageBox.Show(method.ToString());
                if (buttons != null && !buttons.Contains(method.Name)) { continue; }
                Button b = btn(translate.trans(method.Name), sizes.fieldWidth(width));
                RoutedEventHandler e = (RoutedEventHandler)Delegate.CreateDelegate(
                typeof(RoutedEventHandler), obj, method);
                b.Click += e;
                if (i == n)
                {
                    S.Children.Add(hs);
                    hs = hStack();
                    hs.Children.Add(b);
                    i = 0;
                }
                else
                {
                    hs.Children.Add(b);
                }
                i++;
                //;
            }
            S.Children.Add(hs);

            Border border = brdr();
            border.Child = S;

            StackPanel stk = vStack();
            stk.HorizontalAlignment = HorizontalAlignment.Stretch;
            //stk.Children.Add(miniHeader());

            if (table != null)
            {
                ScrollViewer Controls = scroller(true, 0, (height / 2) - 50);
                Controls.Content = border;
                stk.Children.Add(Controls);
                if(tableCols == null)
                {
                    stk.Children.Add(tableView(ref obj, ref table, (height / 2) + 40));
                }
                else
                {
                    stk.Children.Add(tableView(ref obj, ref table, tableCols, (height / 2) + 40));
                }
                
            }
            else
            {
                stk.Children.Add(border);
            }

          ((Window)form).Content = stk;

        }

        public void template2(object form, ref object obj, string header = "", ObservableCollection<MenuItemViewModel> MenueHeader = null, List<string> lst = null, int width = 0, int height = 0,bool parent = true)
        {
            if (width == 0) { width = sizes.screenWidth; }
            if (height == 0) {
                height = sizes.screenHeight;
                ((Window)form).Top = 0;
                ((Window)form).Left = 0;
                if (!parent) { ((Window)form).Top = 50; }
            }
            else
            {
                ((Window)form).Top = Convert.ToInt32((sizes.screenHeight - height) / 2);
                ((Window)form).Left = Convert.ToInt32((sizes.screenWidth - width) / 2);
            }
            sizes.appHeight = height;
            sizes.appWidth = width;
           ((Window)form).Width = width;

            ((Window)form).Height = height;
            ((Window)form).Background = bgColor;
            ((Window)form).HorizontalAlignment = HorizontalAlignment.Center;
            ((Window)form).WindowStyle = WindowStyle.SingleBorderWindow;
            if (translate.lang == "EN") { ((Window)form).FlowDirection = FlowDirection.LeftToRight; }
            else
            {
                ((Window)form).FlowDirection = FlowDirection.RightToLeft;
            }
            DockPanel dock = new DockPanel();
            dock.LastChildFill = true;
            Menu m = ClassicalMenueBar(MenueHeader);
            dock.Children.Add(m);


            Label l = lbl("Hello , this App Created By Eng: Mohammad Al-Berry Email:Mohammedelpry@yahoo.com Phone:01147264224 ");
            DockPanel.SetDock(l, Dock.Bottom);
            dock.Children.Add(l);

            //StackPanel b = vStack(false);
            //((Window)form).Content = b;
            //b.Children.Add(miniHeader(width));

            ((Window)form).Content = dock;

        }
        public void template1(object form, object obj, string header = "", List<string> memberLst = null, ObservableCollection<object> table = null, int width = 0, int height = 0, bool parent = true)
        {
            if (width == 0) { width = sizes.screenWidth; }
            if (height == 0)
            {
                height = sizes.screenHeight;
                ((Window)form).Top = 0;
                ((Window)form).Left = 0;
                if (!parent) { ((Window)form).Top = 50; }
            }
            else
            {
                ((Window)form).Top = Convert.ToInt32((sizes.screenHeight - height) / 2);
                ((Window)form).Left = Convert.ToInt32((sizes.screenWidth - width) / 2);
            }
            sizes.appHeight = height;
            sizes.appWidth = width;
            ((Window)form).Width = width;
            ((Window)form).Height = height;
            ((Window)form).Background = bgColor;
            ((Window)form).HorizontalAlignment = HorizontalAlignment.Center;
            ((Window)form).WindowStyle = WindowStyle.None;
            if (translate.lang == "EN") { ((Window)form).FlowDirection = FlowDirection.LeftToRight; }
            else
            {
                ((Window)form).FlowDirection = FlowDirection.RightToLeft;
            }
            // window name
            if (header == "")
            {
                ((Window)form).Title = translate.trans(obj.GetType().Name);
            }
            else
            {
                ((Window)form).Title = translate.trans(header);
            }
            //MessageBox.Show(translate.trans(form.GetType().Name));
            StackPanel S = new StackPanel();
            S.HorizontalAlignment = HorizontalAlignment.Center;
            S.Margin = new Thickness(10);
            if (header != "")
            {
                Grid grd = new Grid();
                Label h = new Label();
                h.Content = translate.trans(header);
                BitmapImage bImg = new BitmapImage(new Uri("pack://application:,,,/Icons/logo.png"));
                //bImg.UriSource = new Uri("", UriKind.Relative);
                Image logo = new Image
                {
                    Source = bImg
                };

                logo.Width = 50; logo.Height = 50;
                if (translate.lang == "EN")
                {
                    logo.HorizontalAlignment = HorizontalAlignment.Left;
                }
                else
                {
                    logo.HorizontalAlignment = HorizontalAlignment.Right;
                }
                h.FontSize = 24;
                h.Foreground = fColor;
                h.Background = transparent;
                h.HorizontalAlignment = HorizontalAlignment.Center;
                h.Margin = new Thickness(20);
                grd.Children.Add(logo);
                grd.Children.Add(h);
                S.Children.Add(grd);
            }
            int n = sizes.getScreenSize(width);
            int i = 0;
            StackPanel hs = hStack();
            foreach (var prop in obj.GetType().GetProperties())
            {
                if (memberLst != null && !memberLst.Contains(prop.Name)) { continue; }
                StackPanel stp = new StackPanel();
                if (translate.lang == "EN") { stp.FlowDirection = FlowDirection.LeftToRight; stp.HorizontalAlignment = HorizontalAlignment.Left; }
                else
                {
                    stp.FlowDirection = FlowDirection.RightToLeft;
                    stp.HorizontalAlignment = HorizontalAlignment.Right;
                }
                stp.Width = sizes.fieldWidth(width);
                if (prop.PropertyType.ToString() == "System.Int32" ||
                   prop.PropertyType.ToString() == "System.Double" ||
                   prop.PropertyType.ToString() == "System.String")
                {
                    stp.Children.Add(lbl(translate.trans(prop.Name)));
                    stp.Children.Add(txt(ref obj, prop.Name.ToString(), sizes.fieldWidth(width) - 10));
                }
                else if (prop.PropertyType.ToString() == "System.Boolean")
                {
                    stp.Children.Add(lbl(translate.trans(prop.Name)));
                    stp.Children.Add(chb(ref obj, prop.Name));
                }
                else
                {
                    //MessageBox.Show(prop.Name + "       " + prop.PropertyType.ToString());
                    stp.Children.Add(lbl(translate.trans(prop.Name)));
                    stp.Children.Add(cmb(ref obj, prop.Name, sizes.fieldWidth(width) - 10));
                }
                if (i == n)
                {
                    S.Children.Add(hs);
                    hs = hStack();
                    hs.Children.Add(stp);
                    i = 0;
                }
                else
                {
                    hs.Children.Add(stp);
                }
                i++;
                //MessageBox.Show(prop.PropertyType.ToString());     
            }
            S.Children.Add(hs);
            // generate buttons for methodes
            i = 0;
            hs = hStack();
            foreach (var method in obj.GetType().GetMethods())
            {
                //MessageBox.Show(method.ToString());
                if (memberLst != null && !memberLst.Contains(method.Name)) { continue; }
                Button b = btn(translate.trans(method.Name), sizes.fieldWidth(width));
                RoutedEventHandler e = (RoutedEventHandler)Delegate.CreateDelegate(
                typeof(RoutedEventHandler), obj, method);
                b.Click += e;
                if (i == n)
                {
                    S.Children.Add(hs);
                    hs = hStack();
                    hs.Children.Add(b);
                    i = 0;
                }
                else
                {
                    hs.Children.Add(b);
                }
                i++;
                //;
            }
            S.Children.Add(hs);

            Border border = brdr();
            border.Child = S;

            StackPanel stk = vStack();
            stk.HorizontalAlignment = HorizontalAlignment.Stretch;
            //stk.Children.Add(miniHeader());



            if (table != null)
            {
                ScrollViewer Controls = scroller(true, 0, (height / 2) - 50);
                Controls.Content = border;
                stk.Children.Add(Controls);
                stk.Children.Add(tableView(ref obj, ref table, (height / 2) + 40));
            }
            else
            {
                stk.Children.Add(border);
            }
    ((Window)form).Content = stk;

        }
    }
}
