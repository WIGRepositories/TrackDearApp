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

namespace TrackDearApp.Controllers
{
    public class LoginController : ApiController
    {
        //[HttpPost]
        //[Route("api/Login/ValidateCredentials")]
        //public DataTable ValidateCredentials(Model u)
        //{
        //    DataTable Tbl = new DataTable();

        //    string username = u.Mobilenumber;
        //    string pwd = u.Password;

        //    SqlConnection conn = new SqlConnection();

        //    conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TDA"].ToString();

        //    SqlCommand cmd = new SqlCommand();
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.CommandText = "dbo.ValidateCredentials";

        //    cmd.Connection = conn;

        //    SqlParameter lUserName = new SqlParameter("@Mobilenumber", SqlDbType.VarChar, 20);
        //    lUserName.Value = username;
        //    lUserName.Direction = ParameterDirection.Input;
        //    cmd.Parameters.Add(lUserName);


        //    SqlParameter lPassword = new SqlParameter("@Password", SqlDbType.VarChar, 50);
        //    lPassword.Value = pwd;
        //    lPassword.Direction = ParameterDirection.Input;
        //    cmd.Parameters.Add(lPassword);
        //    SqlDataAdapter da = new SqlDataAdapter(cmd);
        //    da.Fill(Tbl);

        //    return Tbl;

        //}

        [HttpPost]
        [Route("api/Login/ValidateCredentialsFinal")]
        public DataTable ValidateCredentialsFinal(UserLogin u)
        {
            DataTable Tbl = new DataTable();

            string username = u.LoginInfo;
            string pwd = u.Passkey;

            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TDA"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "LoginValidateCredentialsFinal";

            cmd.Connection = conn;

            SqlParameter lUserName = new SqlParameter("@LoginInfo", SqlDbType.VarChar, 50);
            lUserName.Value = username;
            lUserName.Direction = ParameterDirection.Input;
            cmd.Parameters.Add(lUserName);


            SqlParameter lPassword = new SqlParameter("@PassKey", SqlDbType.VarChar, 50);
            lPassword.Value = pwd;
            lPassword.Direction = ParameterDirection.Input;
            cmd.Parameters.Add(lPassword);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(Tbl);

            return Tbl;

        }

       
    }
}
