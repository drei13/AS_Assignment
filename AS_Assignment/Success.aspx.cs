using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Drawing;
using System.IO;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;


namespace AS_Assignment
{
    public partial class Success : System.Web.UI.Page
    {
        string MYDBConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MYDBConnection"].ConnectionString;
        byte[] Key;
        byte[] IV;
        byte[] cc = null;
        byte[] ed = null;
        byte[] cvv = null;
        string userID = null;

        //protected void Logout_Click(object sender, EventArgs e)
        //{
        //    Session.Clear();
        //    Session.Abandon();
        //    Session.RemoveAll();

        //    Response.Redirect("Login.aspx", false);

        //    if (Request.Cookies["ASP.NET_SessionID"] != null)
        //    {
        //        Response.Cookies["ASP.NET_SessionId"].Value = string.Empty;
        //        Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddMonths(-20);
        //    }

        //    if (Request.Cookies["AuthToken"] != null)
        //    {
        //        Response.Cookies["AuthToken"].Value = string.Empty;
        //        Response.Cookies["Authtoken"].Expires = DateTime.Now.AddMonths(-20);
        //    }
        //}

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null && Session["AuthToken"] != null && Request.Cookies["AuthToken"] != null)
            {
                if (!Session["AuthToken"].ToString().Equals(Request.Cookies["AuthToken"].Value))
                {
                    Response.Redirect("Login.aspx", false);
                }
                else
                {
                    userID = (string)Session["userID"];

                    displayUserProfile(userID);
                }
            }
            else
            {
                Response.Redirect("Login.aspx", false);
            }
           
            
            //{
            //    userID = (string)Session["userID"];

            //    displayUserProfile(userID);
            //}
        }

        protected string decryptData(byte[] cipherText)
        {
            string plainText = null;
            try
            {
                RijndaelManaged cipher = new RijndaelManaged();
                cipher.IV = IV;
                cipher.Key = Key;

                // Create a decryptor to perform the stream transform.
                ICryptoTransform decryptTransform = cipher.CreateDecryptor();

                // Create the streams used for decryption.
                using (MemoryStream msDecrypt = new MemoryStream(cipherText))
                {
                    using (CryptoStream csDecrypt = new CryptoStream(msDecrypt, decryptTransform, CryptoStreamMode.Read))
                    {
                        using (StreamReader srDecrypt = new StreamReader(csDecrypt))
                        {
                            // Read the decrpyted bytes from the decrpyting stream and place them in a string.
                            plainText = srDecrypt.ReadToEnd();
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally { }
            return plainText;
        }

        protected void displayUserProfile(string userid)
        {
            SqlConnection connection = new SqlConnection(MYDBConnectionString);
            string sql = "SELECT * FROM Account WHERE Email=@userId";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@userId", userid);
            try
            {
                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        if (reader["Email"] != DBNull.Value)
                        {
                            lbl_userID.Text = reader["Email"].ToString();
                        }

                        if (reader["CardNumber"] != DBNull.Value)
                        {
                            // Convert base64 in db to byte [].
                            cc = Convert.FromBase64String(reader["CardNumber"].ToString());
                        }

                        if (reader["ExpirationDate"] != DBNull.Value)
                        {
                            // Convert base64 in db to byte [].
                            ed = Convert.FromBase64String(reader["ExpirationDate"].ToString());
                        }

                        if (reader["CVV"] != DBNull.Value)
                        {
                            // Convert base64 in db to byte [].
                            cvv = Convert.FromBase64String(reader["CVV"].ToString());
                        }

                        if (reader["IV"] != DBNull.Value)
                        {
                            IV = Convert.FromBase64String(reader["IV"].ToString());
                        }

                        if (reader["Key"] != DBNull.Value)
                        {
                            Key = Convert.FromBase64String(reader["Key"].ToString());
                        }
                    }
                    lbl_cc.Text = decryptData(cc);
                    lbl_ed.Text = decryptData(ed);
                    lbl_cvv.Text = decryptData(cvv);
                }
            }//try
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                connection.Close();
            }
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Session.RemoveAll();

            Response.Redirect("Login.aspx", false);

            if (Request.Cookies["ASP.NET_SessionID"] != null)
            {
                Response.Cookies["ASP.NET_SessionId"].Value = string.Empty;
                Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddMonths(-20);
            }

            if (Request.Cookies["AuthToken"] != null)
            {
                Response.Cookies["AuthToken"].Value = string.Empty;
                Response.Cookies["Authtoken"].Expires = DateTime.Now.AddMonths(-20);
            }
        }
    }
}