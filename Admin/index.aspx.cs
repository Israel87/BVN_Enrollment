using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Oracle.DataAccess.Client;
using System.Configuration;

namespace BVN_Enrollment.Admin
{
    public partial class index : System.Web.UI.Page
    {
        DataTable _formstatusValue = new DataTable();
        DataTable _agentIDs = new DataTable();
        Util utilities = new Util();
        string cs = ConfigurationManager.ConnectionStrings["admin"].ConnectionString;
        //string _formstats = "";


        protected void Page_Load(object sender, EventArgs e)
        {
            OracleConnection conn = new OracleConnection(cs);
            conn.Open();

            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (Session["Admin"] == null)
            {
                Response.Redirect("Adminlogin.aspx");
                //LabelSessionName.Text = Session["UserName"].ToString();
            }


            if (!IsPostBack)
            {
               // _formstats = formstats.Text;

                OracleDataAdapter da;
                OracleCommand cmd = new OracleCommand("GETFORMSTATUS", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("CUR", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
                da = new OracleDataAdapter(cmd);
                da.Fill(_formstatusValue);

                formStatus.DataSource = _formstatusValue;
               // _formstats = formStatus.DataTextField;
                formStatus.DataBind();

                formStatus.Items.Insert(0, new ListItem("Select Form Status", ""));

                //formStatus.Items.Insert(0, new ListItem(String.Empty, String.Empty));
                //formStatus.SelectedIndex = 0;

            }

            if (!IsPostBack)
            {
                OracleDataAdapter dat;
                OracleCommand cmd = new OracleCommand("GETORGLIST", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("CUR", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
                dat = new OracleDataAdapter(cmd);
                dat.Fill(_agentIDs);

                orgID.DataSource = _agentIDs;
               // orgs.Text = orgID.DataTextField;
                orgID.DataBind();

                orgID.Items.Insert(0, new ListItem("Select Organization Name", ""));

            }

        }

        protected void getCount_Click(object sender, EventArgs e)
        {
            int _status = Convert.ToInt32(formStatus.Value);
            int _organizationname = Convert.ToInt32(orgID.Value);

            OracleConnection conn = new OracleConnection(cs);
            conn.Open();

            try
            {
                string query = "Select Count(*) from ENROLLMENT WHERE FORMSTATUS = " + _status + " AND ORGANIZATIONID = " + _organizationname + "";
                OracleCommand cmd = new OracleCommand(query, conn);
                cmd.CommandType = CommandType.Text;
                int count = Convert.ToInt32(cmd.ExecuteScalar());


                if (count > 0)
                {
                    countDisplay.Text = Convert.ToString(count.ToString());
                }
                else
                {
                    countDisplay.Text = "NO RECORD.";
                }

            }
            catch (Exception ex)
            {

            }
            


        }
    }

}