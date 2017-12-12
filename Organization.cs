using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using Oracle.DataAccess.Client;

namespace BVN_Enrollment
{
    public class GetOrganization
    {
        public static string getActiveOrgName(int orgid)
        {
            switch(orgid)
            {
                case 1:
                    return "ANMFIN";
                case 2:
                    return "CBN";
                case 3:
                    return "NIMC";
            }
            return "";
        }


        //public static string GetConnection()
        //{
        //    string cs = ConfigurationManager.ConnectionStrings["admin"].ConnectionString;
        //    OracleConnection conn = new OracleConnection(cs);
        //    return "";
        //}
    }
    
}