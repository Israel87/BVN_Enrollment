<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adminlogin.aspx.cs" Inherits="BVN_Enrollment.Admin.login" %>

<!DOCTYPE html>
<html>
  <head>
    <title>BVN Enrolment Admin Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- styles -->
    <link href="css/styles.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="login-bg">



      <nav class="navbar navbar-fixed-top navbar navbar-inverse" role="navigation">
          <div class="container">
              <div class="navbar-header">
                  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                      <span class="sr-only">Toggle navigation</span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                  </button>
               
                  <a class="navbar-brand" href="#" style="color:#fff"><b>BVN Enrolment Admin </b></a>
              </div>

              <div class="collapse navbar-collapse">
                  <div>
                   
                  </div>
              </div><!--.nav-collapse -->
          </div>
      </nav>



      <br/><br/><br/>

      <form class="form-horizontal" runat="server">
	        <div class="page-content container">
		        <div class="row">
			        <div class="col-md-6 col-md-offset-3">
				        <div class="login-wrapper">
			                <div class="box">
			                    <div class="content-wrap">
			                        <h6>Sign In</h6>
                                    <asp:TextBox ID="username" CssClass="form-control" runat="server" placeholder="Username"></asp:TextBox>
			                        
                                    <asp:TextBox ID="password" CssClass="form-control" type="password" runat="server" placeholder="Password"></asp:TextBox>
			                        <div class="action">
                                        <asp:Button ID="btnLogin" CssClass="btn btn-primary btn-block" runat="server" OnClick="btnLogin_Click" Text ="Login" />
			                           
			                        </div>  <br /><br />
                                    <asp:Label ID="errlbl" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                            
                                    <br />  <br />         
			                    </div>
                                
                                <br />
                                 <p >&copy; 2017 - Powered by Chams Plc  <img src="../chams.jpg" style="margin-bottom: 2px" /></p>
			                </div>
			            </div>
			        </div>
		        </div>
	        </div>

      </form>







    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="js/custom.js"></script>
  </body>
</html>