<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="users.aspx.cs" Inherits="BVN_Enrollment.Admin.users" %>

<!DOCTYPE html>
<html>
<head>
    <title>BVN Enrolment | Enrolled</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

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
            $('#enrolled').DataTable({
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

    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <!-- styles -->
    <link href="css/styles.css" rel="stylesheet">


    <%--   <!-- Bootstrap -->

    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- styles -->
    <link href="css/styles.css" rel="stylesheet">
     <script src="../Scripts/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" />
    <script type="text/javascript" src="//cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>--%>

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
                        <h5><a href="index.aspx" style="text-decoration: none"><strong style="color: #fff">BVN Enrolment Admin </strong></a></h5>
                        <br />
                    </div>
                </div>
                <div class="col-md-5">
                </div>
                <div class="col-md-2">
                    <div class="navbar navbar-inverse" role="banner">
                        <nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
                            <br />
                            <div class="active"><a id="LinkButton1" href="Adminlogout.aspx">
                                <img src="../logout.png" style="width: 30px" /></a></div>
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
            <div class="col-lg-3 container">
                <div class="sidebar content-box" style="display: block;">
                    <ul class="nav" style="font-family:Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif">
                        <!-- Main menu -->
                        <li><a href="index.aspx"><i class="glyphicon glyphicon-home"></i>DASHBOARD</a></li>
                        <li  class="current"><a href="#"><i class="glyphicon glyphicon-user"></i>VIEW ENROLLED</a></li>
                        <li><a href="Report.aspx"><i class="glyphicon glyphicon-stats"></i>GENERATE REPORT</a></li>
                         <li><a href="CreateUsers.aspx"><i class="glyphicon glyphicon-chevron-right"></i>MANAGE USERS</a></li>
                        <li><a href="CreateOrganizations.aspx"><i class="glyphicon glyphicon-chevron-right"></i>MANAGE ORGANIZATION</a></li>
                        <li><a href="ManageAgents.aspx"><i class="glyphicon glyphicon-random"></i>MANAGE AGENTS</a></li>

                    </ul>
                </div>
            </div>
            <div class="col-lg-9">
                
                <img src="../../Admin/images/chamsbanner.png" />
                <br /><br />
            </div>


            <div class="col-lg-12 container">


                <%--<div class="content-box-large">--%>
                <%--<div class="panel-heading">
							<div class="panel-title"><b></b></div>
							
							<div class="panel-options">
								
							</div>
						</div>--%>
                <%--<div class="panel-body" >--%>
               
                <form id="form1" runat="server">
                    <%--<div id="panel1" runat="server">--%>
                    <h5 class="pull-right"><b>COUNT: </b>
                        <asp:Label ID="countDisplay" runat="server" ForeColor="Green" Font-Bold="true"></asp:Label>
                    </h5>
                    <br />

                    <table id="enrolled" class="table table-condensed table-hover">

                        <thead>
                            <tr>
                                <%--<th>ENROLFORMID</th>--%>
                                <th>SURNAME</th>
                                <th>FIRST NAME</th>
                                <th>BVN NUMBER</th>
                                <th>ANMFINCN</th>
                                <th>TITLE</th>
                                <th>MARITAL STATUS</th>
                                <th>GENDER</th>
                                <th>DOB</th>
                                <th>LGA</th>
                                <th>SOO</th>
                                <th>NATIONALITY</th>
                                <th>RES. ADDRESS</th>
                                <th>LGA RESIDENCE</th>
                                <th>STATE RESIDENCE</th>
                                <th>PHONE NUMBER</th>
                                <th>EMAIL ADDRESS</th>
                                <th>TICKETID</th>
                                <th>DATE CREATED</th>
                                <th>FORM STATUS</th>
                                <th>CAPTURED BY</th>
                                <th>SOC</th>
                                <th>LOC</th>
                                <th>ORGANIZATION ID</th>
                                <th>AGENT ID</th>
                            </tr>
                        </thead>
                            <tbody id ="t_body" runat="server">
                            </tbody>
                    </table>
                    <%-- </div>--%>
                </form>
                <br />
                <br />
               
                <br />
                <br />
                <%--</div>--%>
                <%--</div>--%>
            </div>
        </div>

        <br />
        <br />
        <div class="container text-center">
            <p id="footer">&copy; 2017 - Powered by Chams Plc 
                <img src="../chams.jpg" style="margin-bottom: 2px" /></p>


        </div>
        <br />
        <br />
    </div>





    <%--   script below for Download as excel using --%>
    <script src="http://cdn.rawgit.com/rainabba/jquery-table2excel/1.1.0/dist/jquery.table2excel.min.js"></script>
    <script type="text/javascript">
        $('#print').click(function () {
            $('.table').table2excel({
                name: "Report",
                filename: "EnrolledList"
            });
        });
    </script>

    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="../App_Js/index.js"></script>


</body>
</html>
