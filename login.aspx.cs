using Oracle.DataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BVN_Enrollment
{
    public partial class login : System.Web.UI.Page
    {
        //string DAAB = GetOrganization.GetConnection();
        DataTable dt_org = new DataTable();
        string cs = ConfigurationManager.ConnectionStrings["admin"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
         

            if (!IsPostBack)
            {
  
                OracleConnection conn = new OracleConnection(cs);
                conn.Open();

                OracleDataAdapter da;

                //try
                //{
                OracleCommand cmd = new OracleCommand("GETORGLIST", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("CUR", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
                da = new OracleDataAdapter(cmd);
                da.Fill(dt_org);


                organization.DataSource = dt_org;
                organization.DataBind();

            }
                
              
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //string cs = ConfigurationManager.ConnectionStrings["admin"].ConnectionString;
            using (OracleConnection conn = new OracleConnection(cs))
            {
                OracleDataAdapter da = new OracleDataAdapter("Select * from LOGINS WHERE USERNAME ='" + textUsername.Text + "' and PASSWORD ='" + textPassword.Text + "' ", conn);

                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    Session["UserName"] = textUsername.Text;
                    Session["Organization"] = organization.Value;
                    Session["UserId"] = dt.Rows[0]["UserID"].ToString();
                    
                    Response.Redirect("bvnForm.aspx");
                }
                else
                {
                    //Response.Write("<script>sweetAlert('Hello');</script>");
                    errlbl.Text = "Wrong Login Credentials";
                    
                }
                RefreshFields();
        }
    }

        public void RefreshFields()
        {
            textUsername.Text = "";
            textPassword.Text = "";
            organization.Value = "";
            textUsername.Focus();
        }
    }
}