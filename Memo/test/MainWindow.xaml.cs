using System;
using System.Collections.Generic;
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
    public partial class MainWindow : Window, INotifyPropertyChanged
    {
        public string S { get; set; }
        public event PropertyChangedEventHandler PropertyChanged;
        private int clicks;
        private string _myString;
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
            /* Binding b = new Binding
             { Source = this,
               Path = new PropertyPath("S") ,
               Mode = BindingMode.TwoWay,
               UpdateSourceTrigger = UpdateSourceTrigger.PropertyChanged,
               
            };
            textBox.SetBinding(TextBox.TextProperty, b);
            //ref string x = ref textBox.Text.ToString();
            Binding x = new Binding
            {
                Path = new PropertyPath("s"),
                Mode = BindingMode.TwoWay,
                UpdateSourceTrigger = UpdateSourceTrigger.PropertyChanged,
            };
            textBlock.SetBinding(TextBlock.TextProperty, x);
            Binding n = new Binding
            {
                //Source = this,
                ElementName = "textBox",
                Path = new PropertyPath("Text"),
                Mode = BindingMode.TwoWay,
                UpdateSourceTrigger = UpdateSourceTrigger.PropertyChanged,
            };
            textBox1.SetBinding(TextBox.TextProperty, n);*/
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
    }
}
