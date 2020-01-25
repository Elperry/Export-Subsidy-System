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
using System.IO;
using System.Globalization;


namespace test
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    /// 
    public sealed class BooleanToVisibilityConverter : IValueConverter
    {
        /// <summary>
        /// Convert bool or Nullable bool to Visibility
        /// </summary>
        /// <param name="value">bool or Nullable bool</param>
        /// <param name="targetType">Visibility</param>
        /// <param name="parameter">null</param>
        /// <param name="culture">null</param>
        /// <returns>Visible or Collapsed</returns>
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            bool bValue = false;
            if (value is bool)
            {
                bValue = (bool)value;
            }
            else if (value is Nullable<bool>)
            {
                Nullable<bool> tmp = (Nullable<bool>)value;
                bValue = tmp.HasValue ? tmp.Value : false;
            }
            return (bValue) ? Visibility.Visible : Visibility.Collapsed;
        }

        /// <summary>
        /// Convert Visibility to boolean
        /// </summary>
        /// <param name="value"></param>
        /// <param name="targetType"></param>
        /// <param name="parameter"></param>
        /// <param name="culture"></param>
        /// <returns></returns>
        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is Visibility)
            {
                return (Visibility)value == Visibility.Visible;
            }
            else
            {
                return false;
            }
        }
    }

    public class FileNo
        {
            private string _id;
            private string _name;
            public string id
            {
                get { return _id; }
                set
                {
                    _id = value;
                }
            }
            public string name
            {
                get { return _name; }
                set
                {
                    _name = value;
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
        public ObservableCollection<Field> Fields { get; set; }
        public LoadingWait ld;
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

            
            Fields = new ObservableCollection<Field>();
            Fields.Add(new Field() { Name = "Username", Length = 100, Required = true });
            Fields.Add(new Field() { Name = "Password", Length = 80, Required = true });
            Fields.Add(new Field() { Name = "City", Length = 100, Required = false });
            Fields.Add(new Field() { Name = "State", Length = 40, Required = false });
            Fields.Add(new Field() { Name = "Zipcode", Length = 60, Required = false });

            fieldsListBox.ItemsSource = Fields;
            ld = new LoadingWait();
            grd1.Children.Add(ld);
            
            //grd1.Children.Remove(ld);
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            ld.Start();
        }
    }

    public class Field
    {
        public string Name { get; set; }
        public int Length { get; set; }
        public bool Required { get; set; }
    }
}   