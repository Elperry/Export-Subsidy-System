using System;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace test
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    /// 

    public class FileNo : INotifyPropertyChanged
    {
        private string _id;
        private string _name;
        public event PropertyChangedEventHandler PropertyChanged;
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
        public FileNo(string x)
        {
            id = x;
            name = x;
        }
       
        
    }
    public partial class MainWindow : Window, INotifyPropertyChanged
    {
        private FileNo _f;
        public FileNo f
        {
            get { return _f; }
            set
            {
                _f = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("f"));
            }
        }
        public ObservableCollection<FileNo> lst;
        public string S { get; set; }
        public event PropertyChangedEventHandler PropertyChanged;
        private int clicks;
        private string _myString;
        private bool _V;
        public bool V
        {
            get { return _V; }
            set
            {

                this._V = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("V"));
            }
        }
        public string MyString
        {
            get
            {
                return this._myString;
            }
            set
            {
                this._myString = value;
                if (this.PropertyChanged != null)
                    this.PropertyChanged(this, new PropertyChangedEventArgs("MyString"));
            }
        }
        public MainWindow()
        {
           InitializeComponent();
            this.DataContext = this;
            lst = new ObservableCollection<FileNo>()
            {
                new FileNo("1"),
                new FileNo("2"),
                new FileNo("3"),
                new FileNo("4")
            };
            ComboBox cmb = new ComboBox();
            cmb.ItemsSource = lst;
            Binding b = new Binding { Path = new PropertyPath("f"), Source = this, Mode = BindingMode.TwoWay, UpdateSourceTrigger = UpdateSourceTrigger.PropertyChanged };
            cmb.SetBinding(ComboBox.SelectedItemProperty, b);
            cmb.DisplayMemberPath=".name";
            stk.Children.Add(cmb);

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            clicks++;
            this.MyString = string.Format("I've clicked {0} times", clicks);
            S = "Hello";
            //textBlock.Text = S;
        }

        private void Button1_Click(object sender, RoutedEventArgs e)
        {
            //textBlock.Text = S;
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            V = !V;
            Random r = new Random();
            int num = r.Next(3);
            f = lst[num];
        }

        private void TextBox_KeyDown(object sender, KeyEventArgs e)
        {

        }
    }
}
