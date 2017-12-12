<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageAgents.aspx.cs" Inherits="BVN_Enrollment.Admin.Manage_Agents" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin | Create / Delete Organization</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    
    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>

      <%-- jQuery Datatable inclusion--%>
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
                  //$( function() {
                  //    $("#datepickerID").datepicker();

                  //    $("#datepickerIDB").datepicker();
                  // });


              $(document).ready(function () {
                  $('#datatable').DataTable({
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




    <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <!-- styles -->
    <link href="css/styles.css" rel="stylesheet">
    <%--<link href="css/style2.css" rel="stylesheet" />--%>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <div class="header">
        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <!-- Logo -->
                    <div class="logo">
                        <br />
                        <h5><a href="#" style="text-decoration: none"><strong style="color: #fff">BVN Enrolment Admin </strong></a></h5>
                        <br />
                    </div>
                </div>
                <div class="col-md-5">
                    <%-- <div class="row">
	              

                        <div class="clearfix">
                         
                      
	                    </div>
	               
	              </div>--%>
                </div>
                <div class="col-md-2">
                    <div class="navbar navbar-inverse" role="banner">
                        <nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
                            <br />
                            <div class="active">
                                <a id="LinkButton1" href="Adminlogout.aspx">
                                    <img src="../logout.png" style="width: 30px" /></a>
                            </div>
                            <br />
                        </nav>
                    </div>
                    <br />
                </div>
            </div>
        </div>
    </div>

    <br />
    <br />

    <div class="page-content">

       
            <div class="row">
                <div class="col-md-3">
                    <div class="sidebar content-box" style="display: block;">
                        <ul class="nav" style="font-family:Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif">
                               <!-- Main menu -->
                        <li><a href="index.aspx"><i class="glyphicon glyphicon-home"></i>DASHBOARD</a></li>
                        <li><a href="Users.aspx"><i class="glyphicon glyphicon-user"></i>VIEW ENROLLED</a></li>
                        <li><a href="Report.aspx"><i class="glyphicon glyphicon-stats"></i>GENERATE REPORT</a></li>
                         <li><a href="CreateUsers.aspx"><i class="glyphicon glyphicon-chevron-right"></i>MANAGE USERS</a></li>
                        <li><a href="CreateOrganizations.aspx"><i class="glyphicon glyphicon-chevron-right"></i>MANAGE ORGANIZATION</a></li>
                        <li class="current"><a href="#"><i class="glyphicon glyphicon-random"></i>MANAGE AGENTS</a></li>
                            <!--  <li><a href="tables.html"><i class="glyphicon glyphicon-list"></i> Tables</a></li>
                    <li><a href="buttons.html"><i class="glyphicon glyphicon-record"></i> Buttons</a></li>
                    <li><a href="editors.html"><i class="glyphicon glyphicon-pencil"></i> Editors</a></li>
                    <li><a href="forms.html"><i class="glyphicon glyphicon-tasks"></i> Forms</a></li> -->
                            <%--   <li class="submenu">
                         <a href="#">
                            <i class="glyphicon glyphicon-list"></i> Pages
                            <span class="caret pull-right"></span>
                         </a>--%>
                            <!-- Sub menu -->
                            <%--      <ul>
                            <li><a href="login.html">Login</a></li>
                            <li><a href="signup.html">Signup</a></li>
                        </ul>
                    </li>--%>
                        </ul>
                    </div>
                </div>



                <div class="col-md-9">
                     <form runat="server">
                    <div class="row container text-center">
                        <br />
                        <asp:Label ID="notificationAlerts" runat="server">
                <br />  <br />
                        </asp:Label>
                        <div class="form-group col-lg-12">
                            <div class="col-md-6 container">

                                <div class="content-box-header panel-heading ">
                                    <div class="panel-title "></div>
                                    <br />
                                    <br />
                                    <div class="form-group ">
                                        <h5 style="font-family: Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif"><b>Add an Agent</b> </h5>
                                        <br />
                                        <asp:LinkButton CssClass="btn btn-block btn-success" ID="LinkButton2" Width="300px" runat="server" data-toggle="modal" data-target="#myModal"><strong>CREATE</strong></asp:LinkButton>

                                    </div>
                                    <br />
                                    <br />
                                    <br />


                                </div>



                                <br />



                            </div>
                            <div class="col-sm-6 container">

                                <div class="content-box-header panel-heading ">
                                    <div class="panel-title "></div>
                                    <br />
                                    <br />
                                    <div class="form-group">
                                        <h5 style="font-family: Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif"><b>Select and Delete an Agent</b></h5>
                                        <select class="form-control container" id="disAgentList" name="organization" datatextfield="EMAIL" datavaluefield="AGENTID" runat="server" style="width: 300px"></select>
                                        <br />
                                        <asp:LinkButton CssClass="btn btn-block btn-danger" ID="disableAgents" Width="300px" runat="server" OnClick="disableAgents_Click"><strong>DELETE</strong></asp:LinkButton>
                                    </div>
                                    <br />
                                    <br />

                                </div>

                                 <br /><br /><br />
                            </div>

                            

                        </div>
                       

                        <%--table for enrolled agents --%>
                        <h5><b>COUNT: </b>
                            <asp:Label ID="countDisplay" runat="server" ForeColor="Green" Font-Bold="true"></asp:Label>
                        </h5>
                        
                        <table id="datatable" class="table table-responsive table-hover">
                            <thead>
                                <tr style="width: 700px">             
                                    <th>AGENT ID</th>
                                    <th>FIRST NAME</th>
                                    <th> MIDDLE NAME</th>
                                    <th> LAST NAME</th>
                                    <th> PHONE NUMBER</th>
                                    <th> EMAIL</th>
                                    <th> STATUS</th>
                                    <th>ORGANIZATION ID</th>
                                </tr>
                            </thead>
                            <tbody id ="t_body" runat="server">
                            </tbody>
                        </table>













                        <%--   open Modal--%>
                        <div class="modal fade" id="myModal" role="dialog">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content modal-header">
                                    <div class="">
                                        <br />
                                        <br />
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title" style="font-family: Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif">Fill in Agent's Details</h4>

                                        <hr />

                                    </div>
                                    <div class="modal-body">

                                        <div class="form-group">
                                            <label class="col-lg-3">Agent ID </label>
                                            <input id="agentID" type="text" name="firstname" class="form-control col-lg-9" runat="server" style="width: 320px; border-radius: 0px" /><br />
                                            <br />
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-3">First Name</label>
                                            <input id="firstname" type="text" name="firstname" class="form-control col-lg-9" runat="server" style="width: 320px; border-radius: 0px" /><br />
                                            <br />
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-3">Middle Name</label>
                                            <input id="middlename" type="text" name="middlename" class="form-control col-lg-9" runat="server" style="width: 320px; border-radius: 0px" /><br />
                                            <br />
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-3">Last Name</label>
                                            <input id="lastname" type="text" name="lastname" class="form-control col-lg-9" runat="server" style="width: 320px; border-radius: 0px" /><br />
                                            <br />
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-3">Phone Number</label>
                                            <input id="phonenumber" type="text" name="phonenumber" class="form-control col-lg-9" runat="server" style="width: 320px; border-radius: 0px" /><br />
                                            <br />
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-3">Email </label>
                                            <input id="email" type="text" name="email" class="form-control col-lg-9" runat="server" style="width: 320px; border-radius: 0px" /><br />
                                            <br />
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-3">Add Organization </label>
                                            <select id="organizationID" class="form-control col-lg-9" name="formstatus" runat="server" datavaluefield="ID" datatextfield="ORGANIZATIONNAME" required="required" style="width: 320px; height: 40px; border-radius: 0px"></select>
                                            <br />
                                            <br />
                                        </div>
                                        <br />
                                        <br />

                                        <asp:Button ID="createAgent" runat="server" Text="CREATE" CssClass="btn btn-primary" Style="width: 420px; border-radius: 0px" Font-Bold="true" OnClick="createAgent_Click" />


                                        <br />
                                        <br />



                                    </div>




                                    <div class="modal-footer">
                                        <br />
                                        <br />
                                        <button type="button" class="btn btn-danger" data-dismiss="modal" style="border-radius: 0px">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>














                    </div>
                    </form>
                </div>




















            </div>
            <br />
            <br />



            <div class="container text-center">


                <p id="footer">
                    &copy; 2017 - Powered by Chams Plc 
                    <img src="../chams.jpg" style="margin-bottom: 2px" />
                </p>


            </div>
            <br />
            <br />


    </div>



    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <%-- <script src="https://code.jquery.com/jquery.js"></script>--%>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="../App_Js/index.js"></script>

</body>
</html>
