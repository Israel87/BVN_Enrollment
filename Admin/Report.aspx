<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="BVN_Enrollment.Admin.Report" %>

<!DOCTYPE html>
<html>
  <head>
    <title>BVN Enrolment | Reports</title>

      
    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->

    <%--<script src="js/jquery-1.11.1.min.js"></script>--%>
    

    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- styles -->
    <link href="css/styles.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->


            <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
            <link rel="stylesheet" href="/resources/demos/style.css">
            <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
            <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
            <link href="css/dataTables.bootstrap.min.css" rel="stylesheet" />
            <script src="js/dataTables.bootstrap.min.js"></script>
            <link href="css/jquery.dataTables.min.css" rel="stylesheet" />
            <script src="js/jquery.dataTables.min.js"></script>
            <script src="js/dataTables.buttons.min.js"></script>
            <script src="js/buttons.flash.min.js"></script>
            <script src="js/jszip.min.js"></script>
            <script src="js/pdfmake.min.js"></script>
            <script src="js/vfs_fonts.js"></script>
            <script src="js/buttons.html5.min.js"></script>
            <script src="js/buttons.print.min.js"></script>


          <script>
                  $( function() {
                      $("#datepickerID").datepicker();

                      $("#datepickerIDB").datepicker();
                   });


              $(document).ready(function () {
                  $('#getreportDisplay').DataTable({
                      "dom": 'Bfrtip',
                      "buttons": [
                          {
                              extend: 'excel',
                              text: 'Download Excel'
                          },
                        
                       ],
                      "paging": true,
                      "ordering": true,
                      "info": false,
                     // "buttons": true,

                  });
              });

        </script>

  </head>
  <body>

  	<div class="header">
	     <div class="container">
	        <div class="row">
	           <div class="col-md-5">
	              <!-- Logo -->
	              <div class="logo"><br />
	                 <h5 ><a href="index.aspx" style="text-decoration:none"><strong style="color:#fff"> BVN Enrolment Admin </strong> </a></h5><br />
	              </div>
	           </div>
	           <div class="col-md-5">
	           
	           </div>
	           <div class="col-md-2">
	              <div class="navbar navbar-inverse" role="banner">
	                  <nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation"><br />
	                <div class="active"><a id="LinkButton1" href="Adminlogout.aspx"><img src="../logout.png" style="width:30px" /></a></div> <br />
	                  </nav>
	              </div>
                   <br />
	           </div>
	        </div>
	     </div>
	</div>

      <br /><br />

      <form id="form2" runat="server">
  <div class="page-content">
   
          <div class="row">
           <div>
                <div class="col-md-2">
		  	<div class="sidebar content-box" style="display: block;">
                <ul class="nav" style="font-family:Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif">
                      <!-- Main menu -->
                        <li><a href="index.aspx"><i class="glyphicon glyphicon-home"></i>DASHBOARD</a></li>
                        <li><a href="Users.aspx"><i class="glyphicon glyphicon-user"></i>VIEW ENROLLED</a></li>
                        <li class="current"><a href="#"><i class="glyphicon glyphicon-stats"></i>GENERATE REPORT</a></li>
                         <li><a href="CreateUsers.aspx"><i class="glyphicon glyphicon-chevron-right"></i>MANAGE USERS</a></li>
                        <li><a href="CreateOrganizations.aspx"><i class="glyphicon glyphicon-chevron-right"></i>MANAGE ORGANIZATION</a></li>
                        <li><a href="ManageAgents.aspx"><i class="glyphicon glyphicon-random"></i>MANAGE AGENTS</a></li>
                        
                   
                </ul>
             </div>
		  </div>

 
          <div class="col-md-10">
              
              <div class="content-box-large"><br />
		  				<div class="panel-heading">
							<div class="panel-title"><b>Search by Date </b></div>
							
							<div class="panel-options">
							
							</div>
						</div>
		  				<div class="panel-body">
                              <div class="row">
                                
                              <div class="col-md-4">
                                  <div class="form-group">
                                               <label for="surname" class="col-lg-3 control-label" style="font-size:medium; color:#4990bf"> FROM </label>
                                                  <div class="col-lg-7">
                                                      <asp:TextBox ID="datepickerID" CssClass="form-control" runat="server" placeholder="Select Date From" style="width:250px"></asp:TextBox>
                                                      <asp:RequiredFieldValidator ID="datepickerI" runat="server" ErrorMessage="* Please Select a Start Date" ControlToValidate="datepickerID" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
                                                  <br />
                                                      <asp:Button ID="btn_generate" CssClass="btn btn-success btn-block" runat="server" OnClick="btn_generate_Click" Text="Generate" Font-Bold="true" />
                        </div>
                                     </div>

                              </div>
                                  <div class="col-md-4">
                                       <div class="form-group">
                                          <label for="surname" class="col-lg-2 control-label" style="font-size:medium; color:#4990bf"> TO </label>
                                                <div class="col-lg-10">

                                                    <asp:TextBox ID="datepickerIDB" CssClass="form-control" runat="server" placeholder="Select Date to" style="width:250px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="datePickerII" runat="server" ErrorMessage="* RequiredFieldValidator" ControlToValidate="datepickerIDB" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>  
                                                
                                                    <br />
                                                <br /><br />
                                                </div>
                                  </div>
                              </div>
                                  <div class="col-md-4">
                                       <label for="surname" class="col-lg-4 control-label" style="font-size:medium; color:#4990bf"> ORGANIZATION </label>
                                      <div class="col-lg-8">
                                           <select class="form-control" id="organization" name="organization" DataTextField="ORGANIZATIONNAME" datavaluefield="ID" runat="server" required="required" ></select><br />

                                                        <h5><b> COUNT: </b>
                                                            <asp:Label ID="countDisplay" runat="server" ForeColor="Green" Font-Bold="true"></asp:Label>
                                                        </h5>
                                 
                                      </div>
                                                

                                  </div>
                    </div>

              </div>

          </div>


              <br /><br />

               <table class="table table-condensed table-responsive table-hover"  id="getreportDisplay">
                          <thead>
                              <tr>                          
                                  <th>Surname</th>
                                  <th>First Name</th>
                                  <th>BVN Number</th>
                                  <th>ANMFINCN</th>
                                  <th>Marital Status</th>
                                  <th>Gender</th>
                                  <th>Date of Birth</th>
                                  <th>LGA</th>

                                  <th>State of Origin</th>
                                  <th>Residential Address</th>
                                  <th>LGA Residence</th>

                                  <th>Phone Number</th>
                                  <th>Email Address</th>
                                  <th>TicketID</th>
                                  <th>Form Status</th>
                                  <th>State of Capture</th>
                                  <th>LG of Capture</th>
                                  <th>Captured By</th>
                              </tr>
                          </thead>
                          <tbody id ="t_body" runat="server">
                          </tbody>
                      </table>


              <br />
           </div>

          <div>
                  <div class="col-md-2"></div>
                  <div class="col-md-10">
                     
                 </div>
              <br /><br />

              </div><br />    
        </div>
     </div>

    </div></form>


      <br /><br /><br />

        <div class="container text-center">
                <p id="footer">&copy; 2017 - Powered by Chams Plc  <img src="../chams.jpg" style="margin-bottom: 2px" /></p>
        </div><br /><br />

           <%--<script src="http://tablesorter.com/addons/pager/jquery.tablesorter.pager.js"></script>--%>
        <%--jQuery to Excel plugin--%>
           <%-- <script src="http://cdn.rawgit.com/rainabba/jquery-table2excel/1.1.0/dist/jquery.table2excel.min.js"></script>--%>
            <script type="text/javascript">
                    //$('#btn').click(function () {
                    //    $('.table').table2excel({
                    //        name: "Report",
                    //        filename: "ReportByDate"
                    //    });
                    //});

                    //$('#paging')
                    //    .tablesorter({ widthFixed: true, widgets: ['zebra'] })
                    //    .tablesorterPager({
                    //        container: $("#pager")

                    //    }); 

                

   
            </script>
</body>
</html>
