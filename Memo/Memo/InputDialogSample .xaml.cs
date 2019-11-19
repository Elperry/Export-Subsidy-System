using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Memo
{
    /// <summary>
    /// Interaction logic for InputDialogSample.xaml
    /// </summary>
    public partial class InputDialogSample : Window
    {
        ObservableCollection<object> lst = null;
        public InputDialogSample(string question, string defaultAnswer = "")
        {
            InitializeComponent();
            lblQuestion.Content = question;
            txtAnswer.Text = defaultAnswer;
            cmb.Visibility = Visibility.Hidden;
            txtAnswer.Visibility = Visibility.Visible;

        }
        public InputDialogSample(string question)
        {
            InitializeComponent();
            lblQuestion.Content = question;
            //txtAnswer.Text = defaultAnswer;
            cmb.Visibility = Visibility.Hidden;
            txtAnswer.Visibility = Visibility.Hidden;
            btnDialogOk.Content = "YES";
            

        }
        public InputDialogSample(string question, ObservableCollection<object> lst, string path = "name")
        {
            InitializeComponent();
            lblQuestion.Content = question;
            cmb.Visibility = Visibility.Visible;
            cmb.ItemsSource = lst;
            cmb.DisplayMemberPath = path;
            txtAnswer.Visibility = Visibility.Hidden;
        }

        private void btnDialogOk_Click(object sender, RoutedEventArgs e)
        {
            this.DialogResult = true;
        }

        private void Window_ContentRendered(object sender, EventArgs e)
        {
            txtAnswer.SelectAll();
            txtAnswer.Focus();
        }
        public object Answer
        {
            get
            {
                if (lst == null)
                {
                    return cmb.SelectedItem;
                }
                else
                {
                    return txtAnswer.Text;
                }
            }
        }
    }
}
