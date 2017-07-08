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
    public class TrackingController : ApiController
    {

        //Updated on 02nd June
        [HttpPost]
        [Route("api/Tracking/TrackingStatus")]
        public int TrackingStatus(Status ocr)
        {
            int status = 0;
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TDA"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "CheckStatus";

            cmd.Connection = conn;
            conn.Open();

            SqlParameter q1 = new SqlParameter("@Mobilenumber", SqlDbType.VarChar, 50);
            q1.Value = ocr.Mobilenumber;
            cmd.Parameters.Add(q1);

            SqlParameter q2 = new SqlParameter("@Status", SqlDbType.VarChar, 50);
            q2.Value = ocr.status;
            cmd.Parameters.Add(q2);

            try
            {
                //conn.Open();
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
            //DataTable dt = new DataTable();
            //SqlDataAdapter da = new SqlDataAdapter(cmd);
            //da.Fill(dt);

            //return (dt);
            //Verify Emailotp
        }

       


        [HttpPost]
        [Route("api/Tracking/PostLatLng")]

        public int postLatLng(Status l)
        {
            int status=1;
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = ConfigurationManager.ConnectionStrings["TDA"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Sp_GetLocIns";

            cmd.Connection = conn;
            conn.Open();

            SqlParameter MobileNumber = new SqlParameter("@Mobilenumber", SqlDbType.VarChar,50);
            MobileNumber.Value = l.Mobilenumber;
            cmd.Parameters.Add(MobileNumber);

            SqlParameter Lat=new SqlParameter("@Latitude", SqlDbType.Float);
            Lat.Value = l.latitude;
            cmd.Parameters.Add(Lat);

            SqlParameter Lng = new SqlParameter("@Longitude", SqlDbType.Float);
            Lng.Value = l.longitude;
            cmd.Parameters.Add(Lng);

            SqlParameter flag = new SqlParameter("@flag", SqlDbType.VarChar);
            flag.Value = l.flag;
            cmd.Parameters.Add(flag);

            //DataTable dt = new DataTable();
            //SqlDataAdapter da = new SqlDataAdapter(cmd);
            //da.Fill(dt);
            try
            {
                //conn.Open();
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
            //return (dt);
        }

        [HttpGet]
        [Route("api/Tracking/GetUserLoc")]
        public DataTable GetUserLoc(string mobileno)
        {
            DataTable Tbl = new DataTable();
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TDA"].ToString(); ;

            SqlCommand cmd = new SqlCommand();
            

            cmd.CommandText = "DisplayLoc";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Mobilenumber", SqlDbType.Text).Value = mobileno;
            cmd.Connection = conn;

            //cmd.CommandType = CommandType.StoredProcedure;



            //SqlParameter m = new SqlParameter("@Mobilenumber", SqlDbType.VarChar, 50);
            //m.Value = ocr.Mobilenumber;
            //cmd.Parameters.Add(m);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(Tbl);

            return Tbl;
        }

        [HttpPost]
        [Route("api/Tracking/TrackingStatusEnable")]
        public DataTable TrackingStatusEnable(Status ocr)
        {
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TDA"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "CheckStatusEnable";

            cmd.Connection = conn;

            SqlParameter q1 = new SqlParameter("@Mobilenumber", SqlDbType.VarChar, 50);
            q1.Value = ocr.Mobilenumber;
            cmd.Parameters.Add(q1);


            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            return (dt);
            //Verify Emailotp
        }


        [HttpPost]
        [Route("api/Tracking/TrackingStatusDisable")]
        public DataTable TrackingStatusDisable(Status ocr)
        {
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TDA"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "CheckStatusDisable";

            cmd.Connection = conn;

            SqlParameter q1 = new SqlParameter("@Mobilenumber", SqlDbType.VarChar, 50);
            q1.Value = ocr.Mobilenumber;
            cmd.Parameters.Add(q1);


            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            return (dt);
            //Verify Emailotp
        }
    }
}
