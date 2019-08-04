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
using System.Reflection;

namespace Memo
{
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
            new dic("usr.City" , "المدينة" , "City")
        };
        public static string trans(string str)
        {
            foreach (dic d in lst)
            {
                if (lang == "EN")
                {
                    if (d.from == str)
                    {
                        return d.to2;
                    }
                }
                else if (lang == "AR")
                {
                    if (d.from == str)
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
                t.SetBinding(TextBox.TextProperty, name);
                //t.TextChanged += T_TextChanged;
                //MessageBox.Show("mainObj." + name);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }

            return t;
        }

        private void T_TextChanged(object sender, TextChangedEventArgs e)
        {
            MessageBox.Show("lol");
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
        
        public StackPanel tableView (ref ObservableCollection<object> dt, int startPos)
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
            l.ItemContainerStyle = style;
            l.ItemsSource = dt;
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
                        if (p.Name.ToString() == "name" || p.Name.ToString() == "value")
                        {
                            grdvc.Header = translate.trans(prop.Name.ToString());
                            grdvc.DisplayMemberBinding = new Binding(prop.Name.ToString()+"."+p.Name.ToString());
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
            Binding b = new Binding(path: "MainMenuItems");
            menu.SetBinding(Menu.ItemsSourceProperty, b);
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

        public void template1(object form,object obj ,string header="",List<string>memberLst = null ,ObservableCollection<object> table = null, int width = 0,int height = 0,bool parent = true)
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
                ((Window)form).Name = translate.trans(obj.GetType().Name);
            }
            else
            {
                ((Window)form).Name = translate.trans(header);
            }
            //MessageBox.Show(translate.trans(form.GetType().Name));
            StackPanel S = new StackPanel();
            S.HorizontalAlignment = HorizontalAlignment.Center;
            S.Margin = new Thickness(10);
            if (header != "") {
                Label h = new Label();
                h.Content = translate.trans(header);
                h.FontSize = 24;
                h.Foreground = fColor;
                h.Background = transparent;
                h.HorizontalAlignment = HorizontalAlignment.Center;
                h.Margin = new Thickness(20);
                S.Children.Add(h);
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
                stk.Children.Add(tableView(ref table, (height / 2) + 40));
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
            
            
             
            
            //StackPanel b = vStack(false);
            //((Window)form).Content = b;
            //b.Children.Add(miniHeader(width));

            ((Window)form).Content = dock;

        }

    }
}
