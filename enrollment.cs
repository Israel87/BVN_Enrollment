using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BVN_Enrollment
{
    public class enrollment
    {

        public int EnrolFormID { get; set; }
        public string Title { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string Surname { get; set; }
        public string MaritalStatus { get; set; }
        public string Gender { get; set; }
        public string DOB { get; set; }
        public string Nationality { get; set; }
        public string SOO { get; set; }
        public string LGA { get; set; }
        //public string Date { get; set; }
        public string CustomerID { get; set; }
        public string AnmfinCNID { get; set; }
        
        public string SOC { get; set; }
        public string LOC { get; set; }
     
        public string ResAddress { get; set; }
        public string StateResidence { get; set; }
        public string LGAResidence { get; set; }
        
        //public string LandMarks { get; set; }
        public string PhoneNumber1 { get; set; }
        public string PhoneNumber2 { get; set; }
        public string EmailAddress { get; set; }
        //public string CollectionLocation { get; set; }
        //public string Explain { get; set; }
        public string statusID { get; set; }
        public string TicketID { get; set; }
        //public string BVNNumber { get; set; }
        
       
    }

    public class createOrg
    {
        public int OrganizationID { get; set; }
        public string OrganizationName { get; set; }
    }
}