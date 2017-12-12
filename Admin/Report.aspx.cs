using System;
using System.Data;
using BVN_Enrollment;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using Oracle.DataAccess.Client;

namespace BVN_Enrollment.Admin
{
    public partial class Report : System.Web.UI.Page
    {

        EnrolWebService gen = new EnrolWebService();
        DataTable dt_org = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                string cs = ConfigurationManager.ConnectionStrings["admin"].ConnectionString;
                OracleConnection conn = new OracleConnection(cs);
                conn.Open();

                OracleDataAdapter da;

                OracleCommand cmd = new OracleCommand("GETORGLIST", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("CUR", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
                da = new OracleDataAdapter(cmd);
                da.Fill(dt_org);

                organization.DataSource = dt_org;
                organization.DataBind();

                organization.Items.Insert(0, new ListItem("Select Organization", ""));
            }


        }

     

        protected void btn_generate_Click(object sender, EventArgs e)
        {
            string from = datepickerID.Text;
            string to = datepickerIDB.Text;
            int _organizationID = Convert.ToInt32(organization.Value);

            DataTable dt = null;

            dt = gen.GetReportByDate(from, to, _organizationID);

            if (dt != null && dt.Rows.Count > 0)
            {
                string html = ""; int count = 1;
                foreach (DataRow item in dt.Rows)
                {
                    //html += "<tr><td>" + (count++) + "</td><td>" + item["Surname"] + "</td><td>" + item["FirstName"] + "</td><td>" + item["CustomerID"] + "</td><td>" + item["AnmfinCN"] + "</td><td>" + item["MaritalStatus"] + "</td><td>" + item["Gender"] + "</td><td>" + item["DOB"] + "</td><td>" + item["LGA"] + "</td><td>" + item["SOO"] + "</td><td>" + item["ResidentialAddress"] + "</td><td>" + item["LGAResidence"] + "</td><td>" + item["PhoneNumber1"] + "</td><td>" + item["EmailAddress"] + "</td><td>" + item["TicketID"] + "</td><td>" + item["FormStatus"] + "</td><td>" + item["Soc"] + "</td><td>" + item["Loc"] + "</td><td>" + item["CAPTUREDBY"] + "</td></tr>";
                    countDisplay.Text= count++.ToString();

                    html += "<td>" + item["Surname"] + "</td><td>" + item["FirstName"] + "</td><td>" + item["CustomerID"] + "</td><td>" + item["AnmfinCN"] + "</td><td>" + item["MaritalStatus"] + "</td><td>" + item["Gender"] + "</td><td>" + item["DOB"] + "</td><td>" + item["LGA"] + "</td><td>" + item["SOO"] + "</td><td>" + item["ResidentialAddress"] + "</td><td>" + item["LGAResidence"] + "</td><td>" + item["PhoneNumber1"] + "</td><td>" + item["EmailAddress"] + "</td><td>" + item["TicketID"] + "</td><td>" + item["FormStatus"] + "</td><td>" + item["Soc"] + "</td><td>" + item["Loc"] + "</td><td>" + item["CAPTUREDBY"] + "</td></tr>";



                }


                t_body.InnerHtml = html;

                ResetFields();

                //gvData.DataSource = dt;
                //gvData.DataBind();

            }
            else
            {
                Response.Write("<script>alert('No Record Found...');</script>");
            }

            if (datepickerID.Text == null && datepickerIDB == null)
            {
                return;
            }
            else
            {
               // btn.Visible = true;

            }
        }

        public void ResetFields()
        {
            datepickerID.Text = "";
            datepickerIDB.Text = "";
        }
    }
}