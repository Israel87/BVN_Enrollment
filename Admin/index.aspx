<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="BVN_Enrollment.Admin.index" %>

<!DOCTYPE html>
<html>
<head>
    <title>BVN Enrolment | Home Page</title>
    
    <script type="text/javascript">
           function preventBack() { window.history.forward(); }
           setTimeout("preventBack()", 0);
           window.onunload = function () { null };
    </script>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            <div class="col-md-3">
                <div class="sidebar content-box" style="display: block;">
                    <ul class="nav" style="font-family:Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif">
                        <!-- Main menu -->
                        <li class="current"><a href="#"><i class="glyphicon glyphicon-home"></i>DASHBOARD</a></li>
                        <li><a href="Users.aspx"><i class="glyphicon glyphicon-user"></i>VIEW ENROLLED</a></li>
                        <li><a href="Report.aspx"><i class="glyphicon glyphicon-stats"></i>GENERATE REPORT</a></li>
                         <li><a href="CreateUsers.aspx"><i class="glyphicon glyphicon-chevron-right"></i>MANAGE USERS</a></li>
                        <li><a href="CreateOrganizations.aspx"><i class="glyphicon glyphicon-chevron-right"></i>MANAGE ORGANIZATION</a></li>
                        <li><a href="ManageAgents.aspx"><i class="glyphicon glyphicon-random"></i>MANAGE AGENTS</a></li>
                        

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


        <form runat="server">
            <div class="col-md-9">

                <div class="row">
                    <div class="col-md-12 container">

                        <div class="content-box-header panel-heading">
                            <div class="panel-title pull-right">
                                <h4 style="font-family: Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif"><b>Overview of Total Report Generated.</b></h4>
                            </div>
                        </div>
                        <div class="content-box-large box-with-header">

                            <div class="row text-center">
                                <%--<h4 style="font-family: Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif"> Overview of Total Report Generated.</h4>
             <br/>--%>

                               

                                <div class="col-xs-4 col-md-2 col-lg-2 no-padding">
                                    <%--<div class="panel panel-teal panel-widget border-right">--%>
                                    <h4 style="color: #17a589"><b>ENROLLED</b></h4>
                                    <div class="row no-padding">
                                        <em class="fa fa-xl fa-registered color-blue"></em>
                                        <h3 class="large"><span id="totalenrolled">0</span></h3>
                                        <br />

                                    </div>
                                    <%--</div>--%>
                                </div>
                                <div class="col-xs-4 col-md-2 col-lg-2 no-padding">
                                    <h4 style="color: #289f52"><b>APPROVED</b></h4>
                                    <%--<div class="panel panel-blue panel-widget border-right">--%>
                                    <div class="row no-padding">
                                        <em class="fa fa-xl fa-check-square-o  color-orange"></em>
                                        <h3 class="large"><span id="totalapproved">0</span></h3>
                                        <br />

                                    </div>
                                    <%--</div>--%>
                                </div>
                                <div class="col-xs-4 col-md-2 col-lg-2 no-padding">
                                    <h4 style="color: #3498db"><b>SOFT-REJECTED</b></h4>
                                    <%--<div class="panel panel-orange panel-widget border-right">--%>
                                    <div class="row no-padding">
                                        <em class="fa fa-xl fa-reply color-teal"></em>
                                        <h3 class="large"><span id="totalsoftrejected">0</span></h3>
                                        <br />

                                    </div>
                                    <%--</div>--%>
                                </div>
                                <div class="col-xs-4 col-md-2 col-lg-2 no-padding">
                                    <h4 style="color: #de322a"><b>REJECTED</b></h4>
                                    <div class="row no-padding">
                                        <em class="fa fa-xl fa-times color-red"></em>
                                        <h3 class="large"><span id="totalrejected">0</span></h3>
                                        <br />

                                    </div>
                                </div>

                                <div class="col-xs-4 col-md-2 col-lg-2 no-padding">
                                    <h4 style="color: #17a589"><b>UNTREATED</b></h4>
                                    <div class="row no-padding">
                                        <em class="fa fa-xl fa-minus-circle color-blue"></em>
                                        <h3 class="large"><span id="totaluntreated">0</span></h3>
                                        <br />

                                    </div>
                                </div>

                            <%--     <div class="col-xs-4 col-md-2 col-lg-2 no-padding">
                                    <div class="row no-padding">

                                        <img src="../../Admin/images/info.png" style="width: 220px; height: 120px; border-radius: 5px; padding-left: 10px" />


                                    </div>
                                </div>--%>


                            </div>
                            <br />





                            <br />
                        </div>


                    </div>



                </div>


                <div class="row">
                    <div class="col-lg-12 container">
                        <div class="content-box-header panel-heading">
                            <div class="panel-title pull-right">
                                <h4 style="font-family: Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif"><b>Select by Form Status and Organization.</b></h4>
                            </div>
                        </div>
                        <div class="content-box-large box-with-header">
                            <div class="row">
                                <div class="col-lg-7">

                                    <div class="form-group">
                                        <label for="formstatus" class="col-lg-2 control-label" style="font-size: small; color: #4990bf">Form Status </label>
                                        <div class="col-lg-10">
                                            <select id="formStatus" class="form-control" name="formstatus" runat="server" datavaluefield="FORMSTATUSID" datatextfield="FORMSTATUS" required="required" style="width: 320px; height: 40px">
                                            </select>
                                        </div>
                                    </div>
                                    <br />
                                    <br />

                                    <div class="form-group">
                                        <label for="formstatus" class="col-lg-2 control-label" style="font-size: small; color: #4990bf">Organization </label>
                                        <div class="col-lg-10">
                                            <select id="orgID" class="form-control" name="formstatus" runat="server" datavaluefield="ID" datatextfield="ORGANIZATIONNAME" required="required" style="width: 320px; height: 40px">
                                            </select><br />
                                            <asp:Button ID="getCount" runat="server" Text="GET COUNT" Font-Bold="true" CssClass="btn btn-warning" style="width: 320px; border-radius:0px" OnClick="getCount_Click"
                                                />
                                        </div>
                                          
                                    <br /> <br />
                                    </div>
                                    <br />
                                    
                                   

                                </div>



                                <div class="col-lg-5">
                                    <h5 style="font-family: Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif"> <b>Display for Selected Options.</b></h5>
                                    <asp:Label ID="countDisplay" runat="server" Font-Bold="true" Font-Size="50px" ForeColor="Green" style="font-family: Trebuchet MS, Lucida Sans Unicode, Lucida Grande, Lucida Sans, Arial, sans-serif"></asp:Label>
                                </div>

                            </div>
                            <br /><br />
                        </div>


                    </div>

                </div>






            </div>
        </form>
            
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



    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="../App_Js/index.js"></script>

</body>
</html>
