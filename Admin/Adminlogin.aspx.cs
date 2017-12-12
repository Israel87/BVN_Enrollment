using System;
using System.Configuration;
using System.Data;
using Oracle.DataAccess.Client;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BVN_Enrollment.Admin
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void RefreshFields()
        {
            username.Text = "";
            password.Text = "";
            username.Focus();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string cs = ConfigurationManager.ConnectionStrings["admin"].ConnectionString;
                using (OracleConnection conn = new OracleConnection(cs))
                {
                    OracleDataAdapter da = new OracleDataAdapter("Select count(*) from ADMINLOGIN WHERE \"USERNAME\" ='" + username.Text + "' and \"PASSWORD\" ='" + password.Text + "' ", conn);

                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows[0][0].ToString() == "1")
                    {
                     
                        Session["Admin"] = username.Text;
                        Response.Redirect("index.aspx");
                    }
                    else
                    {
                        
                        errlbl.Text = "Wrong Login Credentials";
                        RefreshFields();
                    }
                }
            }
            catch (OracleException ex)
            {

            }
            
        }
    }
}