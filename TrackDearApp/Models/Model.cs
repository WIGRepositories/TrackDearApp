using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TrackDearApp
{

    public class Appusers
    {
        public string flag { get; set; }

        public int id { get; set; }


        public string Username { get; set; }

        public string Email { get; set; }

        public string Mobilenumber { get; set; }

        public string Password { get; set; }

        public string Mobileotp { get; set; }

        public string Emailotp { get; set; }

        public string Passwordotp { get; set; }

        public int Status { get; set; }

        public string Createdon { get; set; }

        public string Mobileotpsenton { get; set; }

        public string Emailotpsenton { get; set; }

        public string noofattempts { get; set; }
    }

    public class UserAccount
    {

        public string flag { get; set; }
        public int id { get; set; }
        public string Username { get; set; }

        public string Email { get; set; }
        public string Mobilenumber { get; set; }
        public string Password { get; set; }
        public String EVerificationCode { get; set; }
        public DateTime EVerifiedOn { get; set; }
        public int IsEmailVerified { get; set; }
        public String MVerificationCode { get; set; }
        public string Passwordotp { get; set; }
        public DateTime MVerifiedOn { get; set; }
        public int IsMobileVerified { get; set; }

        public DateTime CreatedOn { get; set; }
        public int ENoOfAttempts { get; set; }
        public int MNoOfAttempts { get; set; }
        public string Firstname { get; set; }
        public string lastname { get; set; }
        public int AuthTypeId { get; set; }
        public string AltPhonenumber { get; set; }
        public string Altemail { get; set; }
        public string AccountNo { get; set; }

        public string FCMId { get; set; }
        public string GroupId { get; set; }
        public string NewPassword { get; set; }
        public object Mobileotp { get; set; }

        public object Emailotp { get; set; }
    }














    //-------------------------------------------------------//

    public class Model
    {
        public int Id { get; set; }

        public string flag { get; set; }
        public string Username { get; set; }
        public string Firstname { get; set; }
        public string lastname { get; set; }
        public string AuthTypeId { get; set; }
        public string AltPhonenumber { get; set; }
        public string Altemail { get; set; }
        public string AccountNo { get; set; }
        public string Email { get; set; }
        public string Mobilenumber { get; set; }
        public string Password { get; set; }
        public string Mobileotp { get; set; }
        public string Emailotp { get; set; }
        public string Passwordotp { get; set; }
        public int Status { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime Mobileotpsenton { get; set; }
        public DateTime emailotpsenton { get; set; }
        public int noofattempts { get; set; }

    }

    public class Location
    {
        public string flag { get; set; }
        public int Id { get; set; }
        public float latitude { get; set; }
        public float longitude { get; set; }
    }
    public class AddingNewUser
    {
        public string flag { get; set; }
        public string Username { get; set; }
        public string Mobilenumber { get; set; }
        public string Email { get; set; }
        public string Emailotp { get; set; }
        public string Mobileotp { get; set; }
        
        public string eotp { get; set; }
        public float latitude { get; set; }
        public float longitude { get; set; }
        public int OwnerId { get; set; }
       
    }

    public class Status
    {
        public string Mobilenumber { get; set; }
        public float latitude { get; set; }
        public float longitude { get; set; }
        public string flag { get; set; }
        public int status { get; set; }
    }

    


}