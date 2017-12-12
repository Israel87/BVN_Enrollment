using Oracle.DataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BVN_Enrollment.Admin
{
    public partial class users : System.Web.UI.Page
    {
        EnrolWebService ws = new EnrolWebService();
        DataTable _displayEnrolled = new DataTable();
     
        protected void Page_Load(object sender, EventArgs e)
        {
            _displayEnrolled = ws.Admin_GetEnrolledList();

            string html = ""; int count = 1;
            if (_displayEnrolled != null && _displayEnrolled.Rows.Count > 0)
            {
                foreach (DataRow item in _displayEnrolled.Rows)
                {
                    countDisplay.Text = count++.ToString();

                    html += "<td>" + item["SURNAME"] + "</td><td>" + item["FIRSTNAME"] + "</td><td>" + item["CUSTOMERID"] + "</td><td>" + item["ANMFINCN"] + "</td><td>" + item["TITLE"] + "</td><td>" + item["MARITALSTATUS"] + "</td><td>" + item["GENDER"] + "</td><td>" + item["DOB"] + "</td><td>" + item["LGA"] + "</td><td>" + item["SOO"] + "</td><td>" + item["NATIONALITY"] + "</td><td>" + item["RESIDENTIALADDRESS"] + "</td><td>" + item["LGARESIDENCE"] + "</td><td>" + item["STATERESIDENCE"] + "</td><td>" + item["PHONENUMBER1"] + "</td><td>" + item["EMAILADDRESS"] + "</td><td>" + item["TICKETID"] + "</td><td>" + item["DATECREATED"] + "</td><td>" + item["FORMSTATUS"] + "</td><td>" + item["CAPTUREDBY"] + "</td><td>" + item["SOC"] + "</td><td>" + item["LOC"] + "</td><td>" + item["ORGANIZATIONID"] + "</td><td>" + item["AGENTID"] + "</td></tr>";

                    t_body.InnerHtml = html;
                }
               
            }
        }
    }
}