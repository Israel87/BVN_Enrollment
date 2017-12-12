using System;
using System.Web.UI;
using System.Configuration;
using System.Data;
using Oracle.DataAccess.Client;
using System.Web.UI.WebControls;

namespace BVN_Enrollment
{
    public partial class bvnForm : System.Web.UI.Page
    {
        EnrolWebService form = new EnrolWebService();
        string cs = ConfigurationManager.ConnectionStrings["admin"].ConnectionString;
        DataTable _formstatusValue = new DataTable();
        DataTable _agentIDs = new DataTable();
        Util utilities = new Util();

        protected void Page_Load(object sender, EventArgs e)
        {

            //getDropValue();
            OracleConnection conn = new OracleConnection(cs);
            conn.Open();

            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (Session["UserName"] != null)
            {
                LabelSessionName.Text = Session["UserName"].ToString();
                

                //string orgName = GetOrganization.getActiveOrgName(Convert.ToInt32(Session["Organization"]));
                //LabelOrgName.Text = orgName;
            }
            else
            {
                Response.Redirect("login.aspx");
            }
            getDropValue();

            // populate form status from the database

            if (!IsPostBack)
            {
                OracleDataAdapter da;
                OracleCommand cmd = new OracleCommand("GETFORMSTATUS", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("CUR", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
                da = new OracleDataAdapter(cmd);
                da.Fill(_formstatusValue);

                formStatus.DataSource = _formstatusValue;
                formStatus.DataBind();

                formStatus.Items.Insert(0, new ListItem("Select Form Status", ""));

                //formStatus.Items.Insert(0, new ListItem(String.Empty, String.Empty));
                //formStatus.SelectedIndex = 0;

            }

            if (!IsPostBack)
            {
                OracleDataAdapter dat;
                OracleCommand cmd = new OracleCommand("GETAGENTID", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("CUR", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
                dat = new OracleDataAdapter(cmd);
                dat.Fill(_agentIDs);

                agentID.DataSource = _agentIDs;
                agentID.DataBind();

                agentID.Items.Insert(0, new ListItem("Select Agent ID", ""));

            }

        }


        public void ResetFields()
        {

            txtSurname.Text = "";
            txtFirstName.Text = "";
            txtMiddlename.Text = "";
            customerID.Text = "";
            AnmfinCN.Text = "";
            txtTitle.SelectedIndex = -1;
            maritalStatusID.Text = "";
            txtGender.Text = "";
            txtDate.Text = "";
            lgaOrigin.Text = "";
            stateoforigin.Text = "";
            nationality.Text = "";
         
            stateofCapture.Text = "";
            lgaofCapture.Text = "";
            address.Text = "";
            lgaofResidence.Text = "";
            stateofResidence.Text = "";
            phonenumber1.Text = "";
            phonenumber2.Text = "";
            emailAddress.Text = "";
            agentID.Value = "";
            formStatus.Value = "";
            enrolticketID.Text = "";
            //bvnID.Text = "";
        }

        protected void btnSubmit(object sender, EventArgs e)
        {

            if (Session["UserName"] == null) Response.Redirect("logout.aspx");
            String username = Session["UserName"].ToString();
            String orgid = Session["Organization"].ToString();
            String userid = Session["UserID"].ToString();

            // boolean option for Oracle DB while int for MySql 
            bool ret = form.BVNDetails(txtTitle.Value, txtFirstName.Text, txtMiddlename.Text, txtSurname.Text, maritalStatusID.Text, txtGender.Text, txtDate.Text, nationality.Text, stateoforigin.Text, lgaOrigin.Text, customerID.Text, AnmfinCN.Text, stateofCapture.Text, lgaofCapture.Text, address.Text, stateofResidence.Text, lgaofResidence.Text, phonenumber1.Text, phonenumber2.Text, emailAddress.Text, Convert.ToInt32(agentID.Value), Convert.ToInt32(formStatus.Value), enrolticketID.Text, userid, orgid);

            if (ret)
            {
                try
                {
                    if (FileUpload1.HasFile)
                    {
                        FileUpload1.PostedFile.SaveAs(Server.MapPath("~/PDFFiles/") + FileUpload1.FileName);
                        lblMessage.Text = "Successful";
                        Response.Write("<script>alert('Successful...');</script>");
                    }
                }
                catch
                {
                    Response.Write("<script>alert('Error saving pdf!!!');</script>");
                    lblMessage.Text = "Error Occurred...";
                }

                lblMessage.Text = utilities.ShowSuccess("Data Inserted Successfully.");
                ResetFields();
            }
            else
            {
                
                lblMessage.Text = utilities.ShowError("Error Occured.");
            }

        }


        protected void Logout(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("login.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
       
        private void UpdateForm(string TicketID)
        {
            
            try
            {
                DataTable dt = new DataTable();
               
                OracleConnection conn = new OracleConnection(cs);
                conn.Open();
                OracleCommand OrclCmd = new OracleCommand("SELECT * from ENROLLMENT WHERE TicketID = '" + TicketID + "'", conn);
                OracleDataAdapter OrclDa = new OracleDataAdapter(OrclCmd);

                OrclDa.Fill(dt);
                if (dt.Rows.Count > 0)
                {

                    txtTitle.Value = dt.Rows[0]["Title"].ToString(); 
                    txtFirstName.Text = dt.Rows[0]["FirstName"].ToString();
                    txtMiddlename.Text = dt.Rows[0]["MiddleName"].ToString();
                    txtSurname.Text = dt.Rows[0]["Surname"].ToString();
                    maritalStatusID.Text = dt.Rows[0]["MaritalStatus"].ToString();
                    txtGender.Text = dt.Rows[0]["Gender"].ToString();
                    txtDate.Text = Convert.ToDateTime(dt.Rows[0]["DOB"]).ToString("dd/MM/yyyy");
                    nationality.Text = dt.Rows[0]["Nationality"].ToString();
                    stateoforigin.Text = dt.Rows[0]["SOO"].ToString();
                    lgaOrigin.Text = dt.Rows[0]["LGA"].ToString();
                    customerID.Text = dt.Rows[0]["CustomerID"].ToString();
                    AnmfinCN.Text = dt.Rows[0]["AnmfinCN"].ToString();
                   
                    stateofCapture.Text = dt.Rows[0]["Soc"].ToString();
                    lgaofCapture.Text = dt.Rows[0]["Loc"].ToString();
                    address.Text = dt.Rows[0]["ResidentialAddress"].ToString();
                    stateofResidence.Text = dt.Rows[0]["StateResidence"].ToString();
                    lgaofResidence.Text = dt.Rows[0]["LGAResidence"].ToString();
                    phonenumber1.Text = dt.Rows[0]["PhoneNumber1"].ToString();
                    phonenumber2.Text = dt.Rows[0]["PhoneNumber2"].ToString();
                    emailAddress.Text = dt.Rows[0]["EmailAddress"].ToString();
                    formStatus.Value = dt.Rows[0]["FormStatus"].ToString();
                    enrolticketID.Text = dt.Rows[0]["TicketID"].ToString();
                    //bvnID.Text = dt.Rows[0]["BVNNumber"].ToString();

                }
                else
                {
                    Response.Write("<script>alert('No Data Record Found.');</script>");
                    conn.Close();
                }
              



            }
            catch (Exception ex)
            {

            }
        }


        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(enrolticketID.Text))
                {
                   
                    LabelError.Text = "Please type in an Enrol Ticket ID";
                    return;
                }

            } catch (OracleException ex)
            {

            }
          

            UpdateForm(enrolticketID.Text);
                   
        }

        protected void btnUpdateDetails(object sender, EventArgs e)
        {
            try
            {
                if (Session["UserName"] == null) Response.Redirect("logout.aspx");
                String username = Session["UserName"].ToString();

                if (Session["UserId"] == null) Response.Redirect("logout.aspx");
                string userid = Session["UserId"].ToString();
                
                String orgid = Session["Organization"].ToString();

                // boolean option for Oracle DB while int for MySql 
                bool ret = form.UpdateDetails(txtTitle.Value, txtFirstName.Text, txtMiddlename.Text, txtSurname.Text, maritalStatusID.Text, txtGender.Text, txtDate.Text, nationality.Text, stateoforigin.Text, lgaOrigin.Text, customerID.Text, AnmfinCN.Text, stateofCapture.Text, lgaofCapture.Text, address.Text, stateofResidence.Text, lgaofResidence.Text, phonenumber1.Text, phonenumber2.Text, emailAddress.Text, Convert.ToInt32(agentID.Value), Convert.ToInt32(formStatus.Value), enrolticketID.Text, userid, orgid);

                if (ret)
                {
                    //try
                    //{
                    //    if (FileUpload1.HasFile)
                    //    {
                    //        FileUpload1.PostedFile.SaveAs(Server.MapPath("~/PDFFiles/") + FileUpload1.FileName);
                    //        lblMessage.Text = "Successful";
                    //        Response.Write("<script>alert('Successful...');</script>");
                    //    }
                    //}
                    //catch
                    //{
                    //    Response.Write("<script>alert('Error saving pdf!!!');</script>");
                    //    lblMessage.Text = "Error Occurred...";
                    //}

                    lblMessage.Text = utilities.ShowSuccess("Update Successful");
                    ResetFields();
                }
                else
                {
                    //Response.Write("<script>alert('Error!!!');</script>");
                    lblMessage.Text = utilities.ShowError("Error Occurred...");
                }


            }
            catch (Exception eu)
            {
                
                throw eu;
            }

        }

        protected void getDropValue()
        {
            string orgID = Session["Organization"].ToString();
            string cs = ConfigurationManager.ConnectionStrings["admin"].ConnectionString;
            using (OracleConnection conn = new OracleConnection(cs))
            {
                OracleDataAdapter da = new OracleDataAdapter("select ORGANIZATIONNAME FROM ORGANIZATION WHERE ID =" + orgID, conn);

                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt != null && dt.Rows.Count > 0)
                {
                    LabelOrgName.Text = dt.Rows[0][0].ToString();
                }
            }
        }            
    }
}