using System;
using System.Collections.Generic;
using System.Linq;
using MySql.Data.MySqlClient;
using System.IO;
using System.Data;
using System.Windows;

public static class connString
{

    public static string host { get; set; }
    public static string port { get; set; }
    public static string database { get; set; }
    public static string uid { get; set; }
    public static string password { get; set; }
    public static string charset { get; set; }
    public static bool isNull()
    {
        if (String.IsNullOrEmpty(host) || string.IsNullOrEmpty(port) || string.IsNullOrEmpty(database) || string.IsNullOrEmpty(uid) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(charset))
        {
            return true;
        }
        else { return false; }
    }
    public static void Init()
    {
        try
        {
            string filename = "serv";
            charset = "utf8";
            if (System.IO.File.Exists(filename) == true)
            {
                System.IO.StreamReader reader;
                reader = new StreamReader(filename);
                do
                {
                    string txt = reader.ReadLine();
                    string[] s = txt.Split(':');
                    if (s[0] == "host") { host = s[1]; }
                    else if (s[0] == "port") { port = s[1]; }
                    else if (s[0] == "uid") { uid = s[1]; }
                    else if (s[0] == "pwd") { password = s[1]; }
                    else if (s[0] == "db") { database = s[1]; }
                    else if (s[0] == "charset") { charset = s[1]; }

                } while (reader.Peek() != -1);
            }
            //string []text = File.re
        }
        catch (Exception)
        {
            //MessageBox.Show("خطأ فى ملف التوصبل أو قاعدة البيانات" + ex.ToString());
            //throw;
        }

    }

}

public class Mysqldb
{
    private MySqlConnection connection;
    private string server;
    private string database;
    private string uid;
    string charset;
    private string password;
    //private string path = "MessageBox.Show/MysqlErr.txt";

    //Constructor
    public Mysqldb()
    {
        Initialize();
    }

    //Initialize values
    private void Initialize()
    {
        try
        {
            connString.host = "127.0.0.1";
            connString.port = "3306";
            connString.database = "uniexport";
            connString.charset = "utf8";
            connString.uid = "root";
            connString.password = "";
            //if (connString.isNull()) { connString.Init(); }
            server = connString.host;
            database = connString.database;
            uid = connString.uid;
            password = "";//connString.password;
            charset = connString.charset;
            string connectionString;
            connectionString = "SERVER=" + server + ";" + "port=" + connString.port + ";" + "DATABASE=" +
            database + ";" + "UID=" + uid + ";" + "PASSWORD=" + password + "; charset=" + charset + ";Convert Zero Datetime=True;SslMode=none;";

            connection = new MySqlConnection(connectionString);
        }
        catch (Exception ex)
        {
            
            MessageBox.Show(ex.ToString());
            throw;
        }
    }

    //open connection to database
    public bool OpenConnection()
    {
        try
        {
            if (connection.State.ToString() == "Open")
            {

            }
            else
            {
                connection.Open();
            }

            return true;
        }
        catch (MySqlException ex)
        {
            /* switch (ex.Number)
             {
                 case 0:
                     MessageBox.Show("Cannot connect to server.  Contact administrator");
                     //MessageBox.Show("Cannot connect to server.  Contact administrator");
                     break;

                 case 1045:
                     MessageBox.Show("Invalid username/password, please try again");
                     //MessageBox.Show("Invalid username/password, please try again");
                     break;
                 default:
                     MessageBox.Show(ex.ToString());
                     break;
             }*/
            string Error = ex.ToString();
            MessageBox.Show(Error);
            return false;
        }
    }

    //Close connection
    public bool CloseConnection()
    {
        try
        {
            connection.Close();
            return true;
        }
        catch (MySqlException ex)
        {
            MessageBox.Show(ex.ToString());
            //(ex.Message);
            return false;
        }
    }

    //Insert statement

    public int nextAutoIncrement(string tableName)
    {
        string connectionString;
        connectionString = "SERVER=" + server + ";" + "UID=" + uid + ";" + "PASSWORD=" + password + "; charset=" + charset + ";Convert Zero Datetime=True;SslMode=none;";

        connection = new MySqlConnection(connectionString);

        string query = "SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA = '" + database + "' AND TABLE_NAME = '" + tableName + "'";
        DataTable dt = new DataTable(); ;
        if (this.OpenConnection() == true)
        {
            //Create Command
            MySqlCommand cmd = new MySqlCommand(query, connection);
            //Create a data reader and Execute the command

            using (MySqlDataAdapter dataAd = new MySqlDataAdapter(cmd))
            {
                dataAd.Fill(dt);
            }

            //close Connection
            this.CloseConnection();

            //return list to be displayed
            int i = 0;
            if (!Int32.TryParse(dt.Rows[0][0].ToString(), out i))
            {
                i = -1;
            }
            return i;
        }
        return 0;
    }
    public void Insert(string table, string values)
    {
        string query = "INSERT INTO " + table + " VALUES(" + values + ")";

        //open connection
        if (this.OpenConnection() == true)
        {
            //create command and assign the query and connection from the constructor
            MySqlCommand cmd = new MySqlCommand(query, connection);

            //Execute command
            cmd.ExecuteNonQuery();

            //close connection
            this.CloseConnection();
        }
    }

    //Update statement
    public void Update(string table, string newV, string condition)
    {
        string query = "UPDATE " + table + " SET " + newV + " WHERE " + condition;

        //Open connection
        if (this.OpenConnection() == true)
        {
            //create mysql command
            MySqlCommand cmd = new MySqlCommand();
            //Assign the query using CommandText
            cmd.CommandText = query;
            //Assign the connection using Connection
            cmd.Connection = connection;

            //Execute query
            cmd.ExecuteNonQuery();

            //close connection
            this.CloseConnection();
        }
    }

    public void Update(string query)
    {
        //Open connection
        if (this.OpenConnection() == true)
        {
            //create mysql command
            MySqlCommand cmd = new MySqlCommand();
            //Assign the query using CommandText
            cmd.CommandText = query;
            //Assign the connection using Connection
            cmd.Connection = connection;

            //Execute query
            cmd.ExecuteNonQuery();

            //close connection
            this.CloseConnection();
        }
    }

    //Delete statement
    public void Delete(string table, string cond)
    {
        string query = "DELETE FROM " + table + " WHERE " + cond;

        if (this.OpenConnection() == true)
        {
            MySqlCommand cmd = new MySqlCommand(query, connection);
            cmd.ExecuteNonQuery();
            this.CloseConnection();
        }
    }

    //Select statement
    public DataTable Select(List<string> fields, string table, string cond, int Limit)
    {
        try
        {
            int n = fields.Count();
            string f = fields[0];
            for (int i = 0; i < fields.Count(); i++)
            {
                f = "," + f;
            }
            string query = "SELECT " + f + " FROM " + table + " WHERE " + cond + " LIMIT " + Limit;

            //Create a list to store the result
            List<List<string>> list = new List<List<string>>();

            DataTable dt = new DataTable();
            //Open connection
            if (this.OpenConnection() == true)
            {
                //Create Command
                MySqlCommand cmd = new MySqlCommand(query, connection);
                //Create a data reader and Execute the command
                using (MySqlDataAdapter dataAd = new MySqlDataAdapter(cmd))
                {
                    dataAd.Fill(dt);
                }
                // MySqlDataReader dataReader = 

                //Read the data and store them in the list

                //close Data Reader

                //close Connection
                this.CloseConnection();

                //return list to be displayed
                return dt;
            }
            else
            {
                return dt;
            }
        }
        catch (Exception)
        {

            throw;
        }

    }
    public DataTable Select(string fields, string table, string cond, int Limit)
    {

        string query = "SELECT " + fields + " FROM " + table + "  WHERE " + cond + " LIMIT " + Limit;

        //Create a list to store the result
        DataTable dt = new DataTable();
        //Open connection
        if (this.OpenConnection() == true)
        {
            //Create Command
            MySqlCommand cmd = new MySqlCommand(query, connection);
            //Create a data reader and Execute the command
            using (MySqlDataAdapter dataAd = new MySqlDataAdapter(cmd))
            {
                dataAd.Fill(dt);
            }

            //close Connection
            this.CloseConnection();

            //return list to be displayed
            return dt;
        }
        else
        {
            return dt;
        }
    }
    public DataTable Select(string sql)
    {

        try
        {
            string query = sql;

            //Create a list to store the result
            DataTable dt = new DataTable();
            //Open connection
            if (this.OpenConnection() == true)
            {
                //Create Command
                MySqlCommand cmd = new MySqlCommand(query, connection);
                //Create a data reader and Execute the command

                using (MySqlDataAdapter dataAd = new MySqlDataAdapter(cmd))
                {
                    dataAd.Fill(dt);
                }

                //close Connection
                this.CloseConnection();

                //return list to be displayed
                return dt;
            }
            else
            {
                return dt;
            }
        }
        catch (Exception ex)
        {
            MessageBox.Show(ex.ToString());
            return null;
        }
    }

    //Count statement
    public int Count(string table, string cond)
    {
        string query = "SELECT Count(*) FROM `" + table + "` WHERE " + cond;
        int Count = -1;

        //Open Connection
        if (this.OpenConnection() == true)
        {
            //Create Mysql Command
            MySqlCommand cmd = new MySqlCommand(query, connection);

            //ExecuteScalar will return one value
            Count = int.Parse(cmd.ExecuteScalar() + "");

            //close Connection
            this.CloseConnection();

            return Count;
        }
        else
        {
            return Count;
        }
    }


}