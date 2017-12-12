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
    public partial class Manage_Agents : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["admin"].ConnectionString;
        EnrolWebService ws = new EnrolWebService();
        Util utilities = new Util();
        DataTable _agentIDs = new DataTable();
        DataTable _agentLists = new DataTable();
        DataTable _displayAgents = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            OracleConnection conn = new OracleConnection(cs);
            conn.Open();

            if (!IsPostBack)
            {
                OracleDataAdapter dat;
                OracleCommand cmd = new OracleCommand("GETORGLIST", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("CUR", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
                dat = new OracleDataAdapter(cmd);
                dat.Fill(_agentIDs);

                organizationID.DataSource = _agentIDs;
                // orgs.Text = orgID.DataTextField;
                organizationID.DataBind();

                organizationID.Items.Insert(0, new ListItem("Select Organization Name", ""));


                // populate the agent drop down 
                OracleCommand cmd2 = new OracleCommand("Select AGENTID, EMAIL FROM ENROLLMENT_AGENTS WHERE STATUS = 1", conn);
                cmd2.CommandType = CommandType.Text;
                dat = new OracleDataAdapter(cmd2);
                dat.Fill(_agentLists);

                disAgentList.DataSource = _agentLists;
                disAgentList.DataBind();

                disAgentList.Items.Insert(0, new ListItem("Select Agent Email", ""));


            }
            // on page load display the list of agents
            _displayAgents = ws.getAgents();

            if (_displayAgents != null && _displayAgents.Rows.Count > 0)
            {
                string html = ""; int count = 1;

                foreach (DataRow item in _displayAgents.Rows)
                {
                    countDisplay.Text = count++.ToString();

                    html += "<td>" + item["AGENTID"] + "</td><td>" + item["FIRSTNAME"] + "</td><td>" + item["MIDDLENAME"] + "</td><td>" + item["LASTNAME"] + "</td><td>" + item["PHONENUMBER"] + "</td><td>" + item["EMAIL"] + "</td><td>" + item["STATUS"] + "</td><td>" + item["ORGANIZATIONID"] + "</td></tr>";
                    t_body.InnerHtml = html;

                }


            }



        }

        protected void createAgent_Click(object sender, EventArgs e)
        {

            bool insertData = insertAgentData(Convert.ToInt32(agentID.Value), firstname.Value, middlename.Value, lastname.Value, phonenumber.Value, email.Value, Convert.ToInt32(organizationID.Value));

            if (insertData == true)
            {
                notificationAlerts.Text = utilities.ShowSuccess("Agent Created Successfully.");
            }
            else
            {
                notificationAlerts.Text = utilities.ShowError("Error Occurred.");
            }

        }

        // the method to insert the agent into the database.
        public bool insertAgentData(int _agentid, string _firstname, string _middlename, string _lastname, string _phonenumber, string _email, int _organizationID)
        {
            bool retAgent = false;

            try
            {
                // insert to the database begins here.
                OracleConnection conn = new OracleConnection(cs);
                conn.Open();

                OracleCommand cmd = new OracleCommand("INSERTAGENT", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new OracleParameter("V_AGENTID", OracleDbType.Int32, Convert.ToInt32(_agentid), ParameterDirection.Input));
                cmd.Parameters.Add(new OracleParameter("V_FIRSTNAME", OracleDbType.Varchar2, _firstname, ParameterDirection.Input));
                cmd.Parameters.Add(new OracleParameter("V_MIDDLENAME", OracleDbType.Varchar2, _middlename, ParameterDirection.Input));
                cmd.Parameters.Add(new OracleParameter("V_LASTNAME", OracleDbType.Varchar2, _lastname, ParameterDirection.Input));
                cmd.Parameters.Add(new OracleParameter("V_PHONENUMBER", OracleDbType.Varchar2, _phonenumber, ParameterDirection.Input));
                cmd.Parameters.Add(new OracleParameter("V_EMAIL", OracleDbType.Varchar2, _email, ParameterDirection.Input));
                cmd.Parameters.Add(new OracleParameter("V_ORGID", OracleDbType.Int32, Convert.ToInt32(_organizationID), ParameterDirection.Input));

                // check for exceptions.
                try
                {
                    cmd.ExecuteNonQuery();
                    retAgent = true;
                }
                catch (Exception ex)
                {

                }
            }
            catch (Exception ex)
            {

            }
            return retAgent;
        }


        // method to delete agents



        private void delAgents(int _delAgents)
        {
            try
            {
                DataTable dt = new DataTable();
                OracleConnection conn = new OracleConnection(cs);
                conn.Open();

                OracleCommand cmd = new OracleCommand("DELAGENTS", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new OracleParameter("V_AGENTID", OracleDbType.Int32, Convert.ToInt32(_delAgents), ParameterDirection.Input));
                OracleDataAdapter OrclDa = new OracleDataAdapter(cmd);

                OrclDa.Fill(dt);
                if (dt.Rows.Count < 1)
                {
                    notificationAlerts.Text = utilities.ShowSuccess("Agents Successfully Deleted.");
                }
                else
                    notificationAlerts.Text = utilities.ShowError("Error Occurred.");
                conn.Close();

            }
            catch (Exception ex)
            {

            }
        }

        protected void disableAgents_Click(object sender, EventArgs e)
        {
            delAgents(Convert.ToInt32(disAgentList.Value));
        }
    }
}