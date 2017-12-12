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
    public partial class CreateOrganizations : System.Web.UI.Page
    {

        EnrolWebService orgInsert = new EnrolWebService();
        string cs = ConfigurationManager.ConnectionStrings["admin"].ConnectionString;
        Util utilities = new Util();
        DataTable displayOrg = null;


        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt_delOrg = new DataTable();
            if (!IsPostBack)
            {


                //string cs = ConfigurationManager.ConnectionStrings["admin"].ConnectionString;
                OracleConnection conn = new OracleConnection(cs);
                conn.Open();

                OracleDataAdapter da;
                
                OracleCommand cmd = new OracleCommand("GETORGLIST", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("CUR", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
                da = new OracleDataAdapter(cmd);
                da.Fill(dt_delOrg);


                delOrg.DataSource = dt_delOrg;
                delOrg.DataBind();
                delOrg.Items.Insert(0, new ListItem("Select Organization", ""));

            }

            // on page load display the organization table.
           
            displayOrg = orgInsert.getOrganization();

            if (displayOrg != null && displayOrg.Rows.Count > 0)
            {
                string html = ""; int count = 1;

                foreach (DataRow item in displayOrg.Rows)
                {
                    countDisplay.Text = count++.ToString();
                    html += "<td>" + item["ID"] + "</td><td>" + item["ORGANIZATIONNAME"] + "</td><td>" + item["STATUS"] + "</td></tr>";
                    t_body.InnerHtml = html;

                }

            }





        }

        protected void btnCreate(object sender, EventArgs e)
        {
            bool insertOrg = orgInsert.insertOrganization(orgNameCreate.Text);

            if (insertOrg == true)
            {
                notificationAlerts.Text = utilities.ShowSuccess("Organization Successfully Created.");
            }
            else
            {
                notificationAlerts.Text = utilities.ShowError("Error Occurred.");
            }
        }


        private void deleteOrg(string OrgName)
        {
            try
            {
                DataTable dt = new DataTable();
                OracleConnection conn = new OracleConnection(cs);
                conn.Open();
              
                OracleCommand cmd = new OracleCommand("DELORG", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new OracleParameter("V_ID", OracleDbType.Varchar2, OrgName, ParameterDirection.Input));
                OracleDataAdapter OrclDa = new OracleDataAdapter(cmd);

                OrclDa.Fill(dt);
                if (dt.Rows.Count < 1) 
                {
                    notificationAlerts.Text = utilities.ShowSuccess("Organization Successfully Deleted.");
                }
                else
                    notificationAlerts.Text = utilities.ShowError("Error Occurred.");
                conn.Close();

            }
            catch(Exception ex)
            {

            }
        }

        protected void delOrgID_Click(object sender, EventArgs e)
        {
            deleteOrg(delOrg.Value);
        }
    }
}