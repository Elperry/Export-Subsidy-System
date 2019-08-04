using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Management;
using System.Windows;
using System.IO;
using System.Security.Cryptography;
using Microsoft.Win32;

namespace EasyAccessWinApp
{
    static class activation
    {
        public static string id = string.Empty;
        public static bool isActivated = false;
        

        public static string getCpuId()
        {
            string cpuInfo = string.Empty;
            ManagementClass mc = new ManagementClass("win32_processor");
            ManagementObjectCollection moc = mc.GetInstances();

            foreach (ManagementObject mo in moc)
            {
                if (cpuInfo == "")
                {
                    //Get only the first CPU's ID
                    cpuInfo = mo.Properties["processorID"].Value.ToString();
                    break;
                }
            }
            return cpuInfo;
        }

        public static string getVolumeSerial(string drive="c")
        {
            ManagementObject dsk = new ManagementObject(@"win32_logicaldisk.deviceid=""" + drive + @":""");
            dsk.Get();
            string volumeSerial = dsk["VolumeSerialNumber"].ToString();
            return volumeSerial;
        }

        public static string getMotherBoardId()
        {
            ManagementObjectSearcher mos = new ManagementObjectSearcher("SELECT * FROM Win32_BaseBoard");
            ManagementObjectCollection moc = mos.Get();
            string serial = "";
            foreach (ManagementObject mo in moc)
            {
                serial = (string)mo["SerialNumber"];
            }
            return serial;
        }

        public static string getUniqId()
        {
            string uId = string.Empty;
            // do some math here
            uId=getCpuId()+getVolumeSerial()+ getMotherBoardId();
            uId = getSHA1HashData(getMD5HashData(uId)).Substring(0,32)+ getMD5HashData(getSHA1HashData(uId));
            uId = uId.Substring(0, 40);
            id = uId;
            //MessageBox.Show(getCpuId()+"  &  " + getVolumeSerial() +"  &   "+ getMotherBoardId());
            return uId;
        }

        public static string getMD5HashData(string data)
        {
            //create new instance of md5
            MD5 md5 = MD5.Create();

            //convert the input text to array of bytes
            byte[] hashData = md5.ComputeHash(Encoding.Default.GetBytes(data));

            //create new instance of StringBuilder to save hashed data
            string encoded = BitConverter.ToString(hashData).Replace("-", string.Empty).ToLower();

            // return hexadecimal string
            return encoded;

        }

        public static string getSHA1HashData(string data)
        {
            //create new instance of md5
            SHA1 sha1 = SHA1.Create();

            //convert the input text to array of bytes
            byte[] hashData = sha1.ComputeHash(Encoding.Default.GetBytes(data));

            string encoded = BitConverter.ToString(hashData).Replace("-", string.Empty).ToLower();

            // return hexadecimal string
            return encoded;
        }

        public static string getKey(string uid)
        {
            string key = uid;

            for(int i = 0; i< 100; i++)
            {
                key = getMD5HashData(key) + getSHA1HashData(key);
            }


            return key.Substring(0,32);
        }

        public static bool check()
        {
            try
            {
                using (RegistryKey key = Registry.LocalMachine.OpenSubKey("Software\\Wow6432Node\\EasyAccess"))
                {
                    if (key != null)
                    {
                        Object o = key.GetValue("key");
                        if (o != null)
                        {
                           // MessageBox.Show(o.ToString());  //"as" because it's REG_SZ...otherwise ToString() might be safe(r)
                            if (o.ToString() == getKey(getUniqId()))
                            {
                                return true;
                            }
                            else
                            {
                                return false;
                            }//do what you like with version
                        }
                        else
                        {
                            return false;
                        }
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            catch (Exception ex)  //just for demonstration...it's always best to handle specific exceptions
            {
                MessageBox.Show(ex.ToString());
                return false;
                //react appropriately
            }
        }

        public static bool Reg(string k)
        {
            if(k == getKey(getUniqId())) {
                try
                {
                   
                    RegistryKey key= Registry.LocalMachine.CreateSubKey("Software\\Wow6432Node\\EasyAccess");
                    key.SetValue("key", k);
                    key.Close();
                    return true;
                }
                catch (Exception ex)  //just for demonstration...it's always best to handle specific exceptions
                {
                    MessageBox.Show(ex.ToString());
                    return false;
                    //react appropriately
                }

            }
            else
            {
                return false;
            }
        }

    }
}
