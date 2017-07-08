using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using TrackDearApp;

namespace TrackDearApp.Controllers
{
    public class AddUsersController : ApiController
    {
        [HttpPost]
        [Route("api/AddUsers/AddUser")]
        public int AddUser(AddingNewUser ocr)
        {

            int status = 0;
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TDA"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsUpdAddingUser";

            cmd.Connection = conn;

            SqlParameter f = new SqlParameter("@flag", SqlDbType.VarChar);
            f.Value = ocr.flag;
            cmd.Parameters.Add(f);

            SqlParameter c = new SqlParameter("@Username", SqlDbType.VarChar, 50);
            c.Value = ocr.Username;
            cmd.Parameters.Add(c);

            SqlParameter cm = new SqlParameter("@Mobilenumber", SqlDbType.VarChar, 20);
            cm.Value = ocr.Mobilenumber;
            cmd.Parameters.Add(cm);

            SqlParameter ce = new SqlParameter("@Email", SqlDbType.VarChar, 50);
            ce.Value = ocr.Email;
            cmd.Parameters.Add(ce);

            SqlParameter lat = new SqlParameter("@Latitude", SqlDbType.Float);
            lat.Value = ocr.latitude;
            cmd.Parameters.Add(lat);

            SqlParameter lng = new SqlParameter("@Longitude", SqlDbType.Float);
            lng.Value = ocr.longitude;
            cmd.Parameters.Add(lng);

            SqlParameter oid = new SqlParameter("OwnerId", SqlDbType.Int);
            oid.Value = ocr.OwnerId;
            cmd.Parameters.Add(oid);


            DataTable dt = new DataTable();
            SqlDataAdapter ds = new SqlDataAdapter(cmd);
            ds.Fill(dt);

                        
            #region email opt

            string eotp = dt.Rows[0]["Mobileotp"].ToString();
            if (eotp != null)
            {
                try
                {
                    MailMessage mail = new MailMessage();
                    string emailserver = System.Configuration.ConfigurationManager.AppSettings["emailserver"].ToString();

                    string username = System.Configuration.ConfigurationManager.AppSettings["username"].ToString();
                    string pwd = System.Configuration.ConfigurationManager.AppSettings["password"].ToString();
                    string fromaddress = System.Configuration.ConfigurationManager.AppSettings["fromaddress"].ToString();
                    string port = System.Configuration.ConfigurationManager.AppSettings["port"].ToString();

                    SmtpClient SmtpServer = new SmtpClient(emailserver);

                    mail.From = new MailAddress(fromaddress);
                    mail.To.Add(ocr.Email);
                    mail.Subject = "User registration - Email OTP";
                    mail.IsBodyHtml = true;

                    string verifcodeMail = @"<table>
                                                        <tr>
                                                            <td>
                                                                <h2>Thank you for registering with Track Dear APP</h2>
                                                                <table width=\""760\"" align=\""center\"">
                                                                    <tbody style='background-color:#F0F8FF;'>
                                                                        <tr>
                                                                            <td style=\""font-family:'Zurich BT',Arial,Helvetica,sans-serif;font-size:15px;text-align:left;line-height:normal;background-color:#F0F8FF;\"" >
<div style='padding:10px;border:#0000FF solid 2px;'>    <br /><br />
                                                                             
                                                       Your email OTP is:<h3>" + eotp + @" </h3>

                                                        If you didn't make this request, <a href='http://154.120.237.198:52800'>click here</a> to cancel.

                                                                                <br/>
                                                                                <br/>             
                                                                       
                                                                                Warm regards,<br>
                                                                                Track Dear Customer Service Team<br/><br />
</div>
                                                                            </td>
                                                                        </tr>

                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>

                                                    </table>";


                    mail.Body = verifcodeMail;
                    //SmtpServer.Port = 465;
                    //SmtpServer.Port = 587;
                    SmtpServer.Port = Convert.ToInt32(port);
                    SmtpServer.UseDefaultCredentials = false;

                    SmtpServer.Credentials = new System.Net.NetworkCredential(username, pwd);
                    SmtpServer.EnableSsl = true;
                    //SmtpServer.TargetName = "STARTTLS/smtp.gmail.com";
                    SmtpServer.Send(mail);

                }
            
            
                catch (Exception ex)
                {
                    status = 0;
                    //throw ex;
                }

            }
            //send mobile otp

            // return dt;

            #endregion email otp

            //send mobile otp as SMS
            #region Mobile OTP
            string motp = dt.Rows[0]["Mobileotp"].ToString();
            if (motp != null)
            {
                try
                {
                    MailMessage mail = new MailMessage();
                    string emailserver = System.Configuration.ConfigurationManager.AppSettings["emailserver"].ToString();

                    string username = System.Configuration.ConfigurationManager.AppSettings["username"].ToString();
                    string pwd = System.Configuration.ConfigurationManager.AppSettings["password"].ToString();
                    string fromaddress = System.Configuration.ConfigurationManager.AppSettings["fromaddress"].ToString();
                    string port = System.Configuration.ConfigurationManager.AppSettings["port"].ToString();

                    SmtpClient SmtpServer = new SmtpClient(emailserver);

                    mail.From = new MailAddress(fromaddress);
                    mail.To.Add(ocr.Email);
                    mail.Subject = "User registration - Mobile OTP";
                    mail.IsBodyHtml = true;

                    string verifcodeMail = @"<table>
                                                        <tr>
                                                            <td>
                                                                <h2>Thank you for registering with Track Dear APP</h2>
                                                                <table width=\""760\"" align=\""center\"">
                                                                    <tbody style='background-color:#F0F8FF;'>
                                                                        <tr>
                                                                            <td style=\""font-family:'Zurich BT',Arial,Helvetica,sans-serif;font-size:15px;text-align:left;line-height:normal;background-color:#F0F8FF;\"" >
<div style='padding:10px;border:#0000FF solid 2px;'>    <br /><br />
                                                                             
                                                       Your Mobile OTP is:<h3>" + motp + @" </h3>

                                                        If you didn't make this request, <a href='http://154.120.237.198:52800'>click here</a> to cancel.

                                                                                <br/>
                                                                                <br/>             
                                                                       
                                                                                Warm regards,<br>
                                                                                Track Dear Customer Service Team<br/><br />
</div>
                                                                            </td>
                                                                        </tr>

                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>

                                                    </table>";


                    mail.Body = verifcodeMail;
                    //SmtpServer.Port = 465;
                    //SmtpServer.Port = 587;
                    SmtpServer.Port = Convert.ToInt32(port);
                    SmtpServer.UseDefaultCredentials = false;

                    SmtpServer.Credentials = new System.Net.NetworkCredential(username, pwd);
                    SmtpServer.EnableSsl = true;
                    //SmtpServer.TargetName = "STARTTLS/smtp.gmail.com";
                    SmtpServer.Send(mail);

                }
                catch (Exception ex)
                {
                    status = 0;
                    //throw ex;
                }
            }
            #endregion Mobile OTP
            status = 1;
            return status;
        }

        [HttpPost]
        [Route("api/AddUsers/MOTPverificationforAddingUser")]
        public int MOTPverificationforAddingUser(AddingNewUser ocr)
        {
            int status = 0;
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TDA"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "MOTPverificationforAddUsers";

            cmd.Connection = conn;

            SqlParameter q1 = new SqlParameter("@Mobilenumber", SqlDbType.VarChar, 20);
            q1.Value = ocr.Mobilenumber;
            cmd.Parameters.Add(q1);

            SqlParameter e = new SqlParameter("@Mobileotp", SqlDbType.VarChar, 10);
            e.Value = ocr.Mobileotp;
            cmd.Parameters.Add(e);

            try
            {
                conn.Open();
                object userstat = cmd.ExecuteScalar();
                conn.Close();

                if (userstat != null)
                {
                    if (conn.State == ConnectionState.Open)
                    {
                        conn.Close();
                    }
                    return Convert.ToInt32(userstat);
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
            return status;
        }

        [HttpPost]
        [Route("api/AddUsers/EOTPVerificationforAddingUser")]
        public int EOTPVerificationforAddingUser(AddingNewUser ocr)
        {
            int status = 0;
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TDA"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "EOTPverificationforAddUsers";

            cmd.Connection = conn;

            SqlParameter q1 = new SqlParameter("@Email", SqlDbType.VarChar, 50);
            q1.Value = ocr.Email;
            cmd.Parameters.Add(q1);

            SqlParameter e = new SqlParameter("@Emailotp", SqlDbType.VarChar, 10);
            e.Value = ocr.Emailotp;
            cmd.Parameters.Add(e);

            try
            {
                conn.Open();
                object userstat = cmd.ExecuteScalar();
                conn.Close();

                if (userstat != null)
                {
                    if (conn.State == ConnectionState.Open)
                    {
                        conn.Close();
                    }
                    return Convert.ToInt32(userstat);
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
            return status;
        }

        [HttpGet]
        [Route("api/AddUsers/GetUsers")]
        public DataTable GetUsers(Model ocr)
        {
            DataTable Tbl = new DataTable();
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TDA"].ToString(); ;

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;

            cmd.CommandText = "DisplayUsers";
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(Tbl);

            return Tbl;
        }

//Added on 22/06/17
        [HttpGet]
        [Route("api/AddUsers/GetAppUsers")]
        public DataTable GetAppUsers(Model ocr)
        {
            DataTable Tbl = new DataTable();
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TDA"].ToString(); ;

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;

            cmd.CommandText = "DisplayAppUsers";
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(Tbl);

            return Tbl;
        }
//added on 16/06/17

        [HttpGet]
        [Route("api/AddUsers/Supervisor")]
        public DataTable Supervisor(Model ocr)
        {
            DataTable Tbl = new DataTable();
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TDA"].ToString(); ;

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;

            cmd.CommandText = "GetSupervisor";
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(Tbl);

            return Tbl;
        }
    }
}


