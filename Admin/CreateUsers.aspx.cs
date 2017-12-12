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
    public partial class CreateUsers : System.Web.UI.Page
    {
        EnrolWebService ws = new EnrolWebService();
        string cs = ConfigurationManager.ConnectionStrings["admin"].ConnectionString;
        Util utilities = new Util();
        DataTable _userList = new DataTable();
        DataTable _displayUsers = new DataTable();



        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                OracleDataAdapter dt;
                OracleConnection conn = new OracleConnection(cs);

                OracleCommand cmd = new OracleCommand("SELECT \"UserID\", EMAIL FROM LOGINS WHERE STATUS = 1", conn);
                cmd.CommandType = CommandType.Text;
                dt = new OracleDataAdapter(cmd);
                dt.Fill(_userList);

         

                userList.DataSource = _userList;
                userList.DataBind();

                userList.Items.Insert(0, new ListItem("Select User Email",""));


            }
        
            // display the list of users that enrols
            _displayUsers = ws.getEnrollingUsers();

            if (_displayUsers != null && _displayUsers.Rows.Count > 0)
            {
                string html = ""; int count = 1;

                foreach (DataRow item in _displayUsers.Rows)
                {
                    countDisplay.Text = count++.ToString();
                 
                    html += "<td>" + item["UserID"] + "</td><td>" + item["USERNAME"] + "</td><td>" + item["EMAIL"] + "</td><td>" + item["PASSWORD"] + "</td><td>" + item["FIRSTNAME"] + "</td><td>" + item["LASTNAME"] + "</td><td>" + item["STATUS"] + "</td></tr>";
                    t_body.InnerHtml = html;
                   
                }
                
            }
            




        }

        protected void createAgent_Click(object sender, EventArgs e)
        {
            string _password = password.Value;
            string _passwordII = passwordI.Value;

            // check to confirm the right password

            if (_password == _passwordII)
            {
                bool saveUser = insertUser(firstname.Value, lastname.Value, username.Value, password.Value, email.Value);

                if (saveUser == true)
                {
                    notificationAlerts.Text = utilities.ShowSuccess("User Created Successfully.");
                }
                else
                {
                    notificationAlerts.Text = utilities.ShowError("User Not Created Successfully.");
                }
                
            }
            else
            {
                // alert the admin to check the password again.
                notificationAlerts.Text = utilities.ShowError("Passwords do not match.");
            }

        }

        public bool insertUser (string _firstname, string _lastname, string _username, string _password, string _email)
        {
            bool _insertUser = false;

            try
            {
                OracleConnection conn = new OracleConnection(cs);
                conn.Open();

                OracleCommand cmd = new OracleCommand("INSERTUSER", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("V_FIRSTNAME", OracleDbType.Varchar2, _firstname, ParameterDirection.Input);
                cmd.Parameters.Add("V_LASTNAME", OracleDbType.Varchar2, _lastname, ParameterDirection.Input);
                cmd.Parameters.Add("V_USERNAME", OracleDbType.Varchar2, _username, ParameterDirection.Input);
                cmd.Parameters.Add("V_PASSWORD", OracleDbType.Varchar2, _password, ParameterDirection.Input);
                cmd.Parameters.Add("V_EMAIL", OracleDbType.Varchar2, _email, ParameterDirection.Input);

                try
                {
                    cmd.ExecuteNonQuery();
                    _insertUser = true;

                }
                catch (Exception ex)
                {

                }

            }
            catch (Exception ex)
            {

            }
            return _insertUser;
        }

        protected void deleteUser_Click(object sender, EventArgs e)
        {

            deleteUsers(Convert.ToInt32(userList.Value));


        }




        private void deleteUsers(int userid)
        {
            try
            {
                DataTable dt = new DataTable();
                OracleConnection conn = new OracleConnection(cs);
                conn.Open();

                OracleCommand cmd = new OracleCommand("DELUSER", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new OracleParameter("V_USERID", OracleDbType.Int32, Convert.ToInt32(userid), ParameterDirection.Input));
                OracleDataAdapter OrclDa = new OracleDataAdapter(cmd);

                OrclDa.Fill(dt);
                if (dt.Rows.Count < 1)
                {
                    notificationAlerts.Text = utilities.ShowSuccess("User Successfully Deleted");
                }
                else
                    notificationAlerts.Text = utilities.ShowError("Error Occurred.");
                conn.Close();

            }
            catch (Exception ex)
            {

            }
        }














    }
}