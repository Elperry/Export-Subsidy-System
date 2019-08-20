using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.ObjectModel;
using System.Windows;
using System.Windows.Input;
using System.Windows.Controls;
using System.Globalization;

namespace test
{
    public static class Global
    {
        public static double tempsum { get; set; }
        public static List<Window> windows { get; set; }
        public static lang Lang { get; set; }
        public static Company company { get; set; }
        public static List<lang> langs = new List<lang>()
        {
            new lang("EN","English"),
            new lang("AR","Arabic")
        };
        public static ObservableCollection<object> countrys{ get; set; }
        public static ObservableCollection<object> brandCats { get; set; }
        public static ObservableCollection<object> brands { get; set; }
        public static ObservableCollection<object> ports { get; set; }
        public static ObservableCollection<object> shippingCompanys { get; set; }
        public static ObservableCollection<object> companys { get; set; }  
        public static ObservableCollection<object> clients { get; set; }
        public static ObservableCollection<object> invoices { get; set; }
        public static ObservableCollection<object> invoiceDatas { get; set; }
        public static ObservableCollection<object> fileNos { get; set; }
        public static ObservableCollection<object> users { get; set; }
        public static ObservableCollection<object> bankReceipts { get; set; }
        public static ObservableCollection<object> bankReceiptDatas { get; set; }
        public static ObservableCollection<object> cheques { get; set; }
        public static ObservableCollection<object> bookeds { get; set; }
        public static ObservableCollection<object> chequeDatas { get; set; }
        public static ObservableCollection<object> exportCertificates { get; set; }
        public static string dateFormate(string s)
        {

            DateTime theDate;
            if(s.Length < 10)
            {
                return "NULL";
            }
            if (DateTime.TryParseExact(s.Substring(0,10), "dd/MM/yyyy",
                    CultureInfo.InvariantCulture, DateTimeStyles.None, out theDate))
            {
                // the string was successfully parsed into theDate  2019-08-11
                return "'"+theDate.ToString("yyyy-MM-dd")+"'";
            }
            else
            {
                // the parsing failed, return some sensible default value
                return "NULL";
            }
        }
      
    }
}
