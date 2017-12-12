using System;
using System.Collections.Generic;
using System.Configuration;
using System.Web.Script.Serialization;
using System.Linq;
using System.Web;
using BVN_Enrollment.Admin;
using System.Web.Services;
using System.Data;
using Oracle.DataAccess.Client;
using Newtonsoft.Json;
using System.Web.Script.Services;

namespace BVN_Enrollment
{
    /// <summary>
    /// Summary description for EnrolWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]



    public class EnrolWebService : System.Web.Services.WebService
    {
        string cs = ConfigurationManager.ConnectionStrings["admin"].ConnectionString;


        [WebMethod]
        internal bool BVNDetails(string Title, string FirstName, string MiddleName, string Surname, string MaritalStatus, string Gender, string DOB, string Nationality, string SOO, string LGA, string CustomerID, string AnmfinCNID, string SOC, string LOC, string ResidentialAddress, string StateResidence, string LGAResidence, string PhoneNumber1, string PhoneNumber2, string EmailAddress, int agentID, int statusID, string TicketID, string userid, string orgid)
        {
            bool retRecord = false;
           


            try
            {
                
               // string cs = ConfigurationManager.ConnectionStrings["admin"].ConnectionString;
                using (OracleConnection conn = new OracleConnection(cs))
                {
                    using (OracleCommand cmd = new OracleCommand("INSERTDETAILS", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.Add(new OracleParameter("V_Title", OracleDbType.Varchar2, Title, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_firstname", OracleDbType.Varchar2, FirstName, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_middlename", OracleDbType.Varchar2, MiddleName, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_Surname", OracleDbType.Varchar2,Surname, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_MaritalStatus", OracleDbType.Varchar2, MaritalStatus, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_Gender", OracleDbType.Varchar2, Gender, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_DOB", OracleDbType.Varchar2, DOB, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_Nationality", OracleDbType.Varchar2, Nationality, ParameterDirection.Input));

                        cmd.Parameters.Add(new OracleParameter("V_SOO", OracleDbType.Varchar2, SOO, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_LGA", OracleDbType.Varchar2, LGA, ParameterDirection.Input));

                        cmd.Parameters.Add(new OracleParameter("V_customerID", OracleDbType.Varchar2, CustomerID, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_AnmfinCNID", OracleDbType.Varchar2, AnmfinCNID, ParameterDirection.Input));
                       

                        cmd.Parameters.Add(new OracleParameter("V_ResidentialAddress ", OracleDbType.Varchar2, ResidentialAddress, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_StateResidence", OracleDbType.Varchar2, StateResidence, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_LGAResidence", OracleDbType.Varchar2, LGAResidence, ParameterDirection.Input));
                        
                        //cmd.Parameters.Add(new OracleParameter("V_LandMarks", OracleDbType.Varchar2, LandMarks, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_PhoneNumber1", OracleDbType.Varchar2, PhoneNumber1, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_PhoneNumber2", OracleDbType.Varchar2, PhoneNumber2, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_EmailAddress", OracleDbType.Varchar2, EmailAddress, ParameterDirection.Input));
                        //cmd.Parameters.Add(new OracleParameter("V_LocationCollection", OracleDbType.Varchar2, CollectionLocation, ParameterDirection.Input));

                        cmd.Parameters.Add(new OracleParameter("V_Agent", OracleDbType.Int32, Convert.ToInt32(agentID), ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_FormStatus", OracleDbType.Int32, Convert.ToInt32(statusID), ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_TicketID", OracleDbType.Varchar2, TicketID, ParameterDirection.Input));

                       
                        cmd.Parameters.Add(new OracleParameter("V_Soc", OracleDbType.Varchar2, SOC, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_Loc", OracleDbType.Varchar2, LOC, ParameterDirection.Input));

                        cmd.Parameters.Add(new OracleParameter("V_CapturedBy", OracleDbType.Varchar2, userid, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_OrgID", OracleDbType.Int32, Convert.ToInt32(orgid), ParameterDirection.Input));
                        //cmd.Parameters.Add(new OracleParameter("V_BVN", OracleDbType.Varchar2, BVNNumber, ParameterDirection.Input));
                        //cmd.Parameters.Add(new OracleParameter("V_BVNNumber", OracleDbType.Varchar2, BVNNumber, ParameterDirection.Input));


                        if (conn.State != ConnectionState.Open)
                        {
                            conn.Open();
                        }
                        try
                        {
                            
                            cmd.ExecuteNonQuery();
                            retRecord = true;
                        }
                        catch(Exception ex)
                        {
                            //Response.Write("<script>alert('Successful');</script>");
                        }
                        conn.Close();
                    }                    
                }         

            }
             catch (Exception ex){
                 
             } 
            return retRecord;
        }

        //internal bool InsertOrganization(string OrganizationName)
        //{
        //    bool retRecord = false;

        //}


        [WebMethod]
        internal bool UpdateDetails(string Title, string FirstName, string MiddleName, string Surname, string MaritalStatus, string Gender, string DOB, string Nationality, string SOO, string LGA, string CustomerID, string AnmfinCNID, string SOC, string LOC, string ResidentialAddress, string StateResidence, string LGAResidence, string PhoneNumber1, string PhoneNumber2, string EmailAddress, int agentID, int statusID, string TicketID, string username, string orgid)
        {
            
            bool retRecord = false;

            try
            {

               // string cs = ConfigurationManager.ConnectionStrings["admin"].ConnectionString;
                using (OracleConnection conn = new OracleConnection(cs))
                {
                    using (OracleCommand cmd = new OracleCommand("UPDATEDETAILS", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        DateTime _dob = DateTime.ParseExact(DOB, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);

                        cmd.Parameters.Add(new OracleParameter("V_Title", OracleDbType.Varchar2, Title, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_firstname", OracleDbType.Varchar2, FirstName, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_middlename", OracleDbType.Varchar2, MiddleName, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_Surname", OracleDbType.Varchar2, Surname, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_MaritalStatus", OracleDbType.Varchar2, MaritalStatus, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_Gender", OracleDbType.Varchar2, Gender, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_DOB", OracleDbType.Date, _dob, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_Nationality", OracleDbType.Varchar2, Nationality, ParameterDirection.Input));

                        cmd.Parameters.Add(new OracleParameter("V_SOO", OracleDbType.Varchar2, SOO, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_LGA", OracleDbType.Varchar2, LGA, ParameterDirection.Input));

                        cmd.Parameters.Add(new OracleParameter("V_customerID", OracleDbType.Varchar2, CustomerID, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_AnmfinCNID", OracleDbType.Varchar2, AnmfinCNID, ParameterDirection.Input));


                        cmd.Parameters.Add(new OracleParameter("V_ResidentialAddress ", OracleDbType.Varchar2, ResidentialAddress, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_StateResidence", OracleDbType.Varchar2, StateResidence, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_LGAResidence", OracleDbType.Varchar2, LGAResidence, ParameterDirection.Input));

                        //cmd.Parameters.Add(new OracleParameter("V_LandMarks", OracleDbType.Varchar2, LandMarks, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_PhoneNumber1", OracleDbType.Varchar2, PhoneNumber1, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_PhoneNumber2", OracleDbType.Varchar2, PhoneNumber2, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_EmailAddress", OracleDbType.Varchar2, EmailAddress, ParameterDirection.Input));
                        //cmd.Parameters.Add(new OracleParameter("V_LocationCollection", OracleDbType.Varchar2, CollectionLocation, ParameterDirection.Input));

                        cmd.Parameters.Add(new OracleParameter("V_Agent", OracleDbType.Int32, Convert.ToInt32(agentID), ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_FormStatus", OracleDbType.Int32, Convert.ToInt32(statusID), ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_TicketID", OracleDbType.Varchar2, TicketID, ParameterDirection.Input));


                        cmd.Parameters.Add(new OracleParameter("V_Soc", OracleDbType.Varchar2, SOC, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_Loc", OracleDbType.Varchar2, LOC, ParameterDirection.Input));

                        cmd.Parameters.Add(new OracleParameter("V_CapturedBy", OracleDbType.Varchar2, username, ParameterDirection.Input));
                        cmd.Parameters.Add(new OracleParameter("V_OrgID", OracleDbType.Varchar2, orgid, ParameterDirection.Input));
                        //cmd.Parameters.Add(new OracleParameter("V_BVN", OracleDbType.Varchar2, BVNNumber, ParameterDirection.Input));
                        //cmd.Parameters.Add(new OracleParameter("V_BVNNumber", OracleDbType.Varchar2, BVNNumber, ParameterDirection.Input));


                        if (conn.State != ConnectionState.Open)
                        {
                            conn.Open();
                        }
                        try
                        {
                            cmd.ExecuteNonQuery();
                            retRecord = true;
                        }
                        catch (Exception ex)
                        {
                            //Response.Write("<script>alert('Successful');</script>");
                        }
                        conn.Close();
                    }
                }

            }
            catch (Exception ex)
            {

            }
            return retRecord;
        }

        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string Admin_GetEnrolled()
        {
            DataTable dt = new DataTable();
           // string cs = ConfigurationManager.ConnectionStrings["admin"].ConnectionString;
            OracleConnection conn = new OracleConnection(cs);
            conn.Open();

            OracleDataAdapter da;

            //try
            //{
                OracleCommand cmd = new OracleCommand("GETTOTALENROLLED", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("CUR", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
                da = new OracleDataAdapter(cmd);
                da.Fill(dt);
            //}
            //catch
            //{
            //    throw new Exception();
            //}

            if (dt != null && dt.Rows.Count > 0)
            {
                string json = JsonConvert.SerializeObject(dt);
                return json;
            }
            else {
               conn.Close();
                return "";

            }
            


        }


        // getting the list of organizations
        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public DataTable getOrganization()
        {
            DataTable dt = new DataTable();
           
            OracleConnection conn = new OracleConnection(cs);
            conn.Open();

            OracleDataAdapter da;

            OracleCommand cmd = new OracleCommand("SELECT * FROM ORGANIZATION WHERE STATUS = 1 ", conn);
            cmd.CommandType = CommandType.Text;
        
            da = new OracleDataAdapter(cmd);
            da.Fill(dt);

            return dt;
          

            //if (dt != null && dt.Rows.Count > 0)
            //{
            //    string json = JsonConvert.SerializeObject(dt);
            //    return json;
            //}
            //else {
            //    conn.Close();
            //    return "";
            //}


        }


        // get the list of enrolling agents.
        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public DataTable getAgents()
        {
            DataTable dt = new DataTable();

            OracleConnection conn = new OracleConnection(cs);
            conn.Open();

            OracleDataAdapter da;

            OracleCommand cmd = new OracleCommand("SELECT * FROM ENROLLMENT_AGENTS WHERE STATUS = 1 ", conn);
            cmd.CommandType = CommandType.Text;

            da = new OracleDataAdapter(cmd);
            da.Fill(dt);

            return dt;


            //if (dt != null && dt.Rows.Count > 0)
            //{
            //    string json = JsonConvert.SerializeObject(dt);
            //    return json;
            //}
            //else {
            //    conn.Close();
            //    return "";
            //}


        }

        // get the list of created users that enroll

        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public DataTable getEnrollingUsers()
        {
            DataTable dt = new DataTable();

            OracleConnection conn = new OracleConnection(cs);
            conn.Open();

            OracleDataAdapter da;

            OracleCommand cmd = new OracleCommand("SELECT * FROM LOGINS WHERE STATUS = 1", conn);
            cmd.CommandType = CommandType.Text;

            da = new OracleDataAdapter(cmd);
            da.Fill(dt);

            return dt;


            //if (dt != null && dt.Rows.Count > 0)
            //{
            //    string json = JsonConvert.SerializeObject(dt);
            //    return json;
            //}
            //else {
            //    conn.Close();
            //    return "";
            //}


        }



        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public DataTable Admin_GetEnrolledList()
        {
            DataTable dt = new DataTable();
            OracleConnection conn = new OracleConnection(cs);
            conn.Open();

            OracleDataAdapter da;
            OracleCommand cmd = new OracleCommand("ADMIN_GETENROLLEDLIST", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("CUR", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            da = new OracleDataAdapter(cmd);
            da.Fill(dt);

            return dt;

            //if (dt != null && dt.Rows.Count > 0)
            //{
            //    string json = JsonConvert.SerializeObject(dt);
            //    return json;
            //}
            //else {
            //    conn.Close();
            //    return "";
            //}


        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public DataTable GetReportByDate(string StartDate, string Enddate, int organizationID)
        {
            //try
            //{
                DataTable dt = new DataTable();
              //  string cs = ConfigurationManager.ConnectionStrings["admin"].ConnectionString;
                OracleConnection conn = new OracleConnection(cs);
                conn.Open();

                OracleDataAdapter da;
                OracleCommand cmd = new OracleCommand("get_date_report", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new OracleParameter("v_date1", OracleDbType.Varchar2, StartDate + " 00:00:00", ParameterDirection.Input));
                cmd.Parameters.Add(new OracleParameter("v_date2", OracleDbType.Varchar2, Enddate + " 23:59:59", ParameterDirection.Input));
                cmd.Parameters.Add(new OracleParameter("v_orgid", OracleDbType.Int32, organizationID, ParameterDirection.Input));
                cmd.Parameters.Add("CUR", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
           
                da = new OracleDataAdapter(cmd);
                da.Fill(dt);

                return dt;
          

        }


        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string Admin_GetApproved()
        {
            DataTable dt = new DataTable();
           // string cs = ConfigurationManager.ConnectionStrings["admin"].ConnectionString;
            OracleConnection conn = new OracleConnection(cs);
            conn.Open();

            OracleDataAdapter da;

            //try
            //{
            OracleCommand cmd = new OracleCommand("GETTOTALAPPROVED", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("CUR", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            da = new OracleDataAdapter(cmd);
            da.Fill(dt);
            //}
            //catch
            //{
            //    throw new Exception();
            //}

            if (dt != null && dt.Rows.Count > 0)
            {
                string json = JsonConvert.SerializeObject(dt);
                return json;
            }
            else {
                conn.Close();
                return "";
            }


        }

        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string Admin_SoftRejected()
        {
            DataTable dt = new DataTable();
         //   string cs = ConfigurationManager.ConnectionStrings["admin"].ConnectionString;
            OracleConnection conn = new OracleConnection(cs);
            conn.Open();

            OracleDataAdapter da;

            //try
            //{
            OracleCommand cmd = new OracleCommand("GETTOTALSOFTREJECTED", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("CUR", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            da = new OracleDataAdapter(cmd);
            da.Fill(dt);
            //}
            //catch
            //{
            //    throw new Exception();
            //}

            if (dt != null && dt.Rows.Count > 0)
            {
                string json = JsonConvert.SerializeObject(dt);
                return json;
            }
            else {
                conn.Close();
                return "";
            }


        }


        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string Admin_Rejected()
        {
            DataTable dt = new DataTable();
          //  string cs = ConfigurationManager.ConnectionStrings["admin"].ConnectionString;
            OracleConnection conn = new OracleConnection(cs);
            conn.Open();

            OracleDataAdapter da;

            //try
            //{
            OracleCommand cmd = new OracleCommand("GETTOTALREJECTED", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("CUR", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            da = new OracleDataAdapter(cmd);
            da.Fill(dt);
            //}
            //catch
            //{
            //    throw new Exception();
            //}

            if (dt != null && dt.Rows.Count > 0)
            {
                string json = JsonConvert.SerializeObject(dt);
                return json;
            }
            else {
                conn.Close();
                return "";
            }


        }

        [WebMethod()]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string Admin_Untreated()
        {
            DataTable dt = new DataTable();
           
            OracleConnection conn = new OracleConnection(cs);
            conn.Open();

            OracleDataAdapter da;

            //try
            //{
            OracleCommand cmd = new OracleCommand("GETTOTALUNTREATED", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("CUR", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            da = new OracleDataAdapter(cmd);
            da.Fill(dt);
            //}
            //catch
            //{
            //    throw new Exception();
            //}

            if (dt != null && dt.Rows.Count > 0)
            {
                string json = JsonConvert.SerializeObject(dt);
                return json;
            }
            else {
                conn.Close();
                return "";
            }


        }

        [WebMethod]
        public bool insertOrganization(string OrganizationName)
        {
            bool orgExists = false;

            try
            {

               // string cs = ConfigurationManager.ConnectionStrings["admin"].ConnectionString;
                using (OracleConnection conn = new OracleConnection(cs))
                {
                    using (OracleCommand cmd = new OracleCommand("INSERTORG", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.Add(new OracleParameter("V_ORGNAME", OracleDbType.Varchar2, OrganizationName, ParameterDirection.Input));

                        if (conn.State != ConnectionState.Open)
                        {
                            conn.Open();
                        }
                        try
                        {
                            cmd.ExecuteNonQuery();
                            orgExists = true;
                        }
                        catch (Exception ex)
                        {
                            //Response.Write("<script>alert('Successful');</script>");
                        }
                    }
                }

            }
            catch (Exception ex)
            {

            }
            return orgExists;
        }

        //[WebMethod]
        //public bool deleteOrganization(string OrganizationName)
        //{

        //}
    }
}
