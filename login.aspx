<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="BVN_Enrollment.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BVN Enrolment Login</title>

     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />

            <!-- Optional theme -->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css" />
            <%--<link href="sweetalert.css" rel="stylesheet" />--%>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>   
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
             <%--<link href="Site.css" rel="stylesheet" />--%>


            <!-- jQuery CDN for Datepicker -->
            <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
            <link rel="stylesheet" href="/resources/demos/style.css" />
            <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
            <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>
    <div class="container">
   <form class="form-horizontal" runat="server">
                     <div class="container">
                                <%--<img  src="Content/images/logo.jpeg" class="img-logo"/>--%>
                                
                            </div><br /><br /><br /><br /><br />
                          <%--<hr />--%>

       
       <%--<div class="col-md-12 col-md-offset-md-3" >--%>
           <h4 class="text-center"><b>Login to BVN Enrollment Form</b></h4> <br />
           <div class="col-md-6 col-md-offset-3">
                                <%--<div class="login-panel panel panel-default" id="_header" style="padding:10px 10px 0 10px; margin-top: 10px; width: 400px;">
                                    <div class="panel-body" style="padding-bottom:0">--%>
                                        <fieldset>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                    <asp:TextBox ID="textUsername" type="text" CssClass="form-control" runat="server" placeholder="Username"></asp:TextBox>
                                               
                                                </div><br />
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                                     <asp:TextBox ID="textPassword" type="password" CssClass="form-control" runat="server" placeholder="password"></asp:TextBox>
                                             
                                                </div>

                                        <br />
                                            <div class="input-group">

                                                 <span class="input-group-addon"><i class="glyphicon glyphicon-cloud"></i></span>
                                                          
                                                            <select class="form-control" id="organization" name="organization" DataTextField="ORGANIZATIONNAME" datavaluefield="ID"  runat ="server" required="required">
                                                               
                                                            </select><br/> 
                                                        </div>
                                                  <br />
                                           
                                            <%--<asp:CheckBox ID="chkBox" Text="Remember Me"  runat="server"/><br />--%>
                                             <%--<asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-block btn-warning" runat="server" Text="Cancel" /><br />--%>  
                                             
                                            <asp:Button ID="btnLogin" OnClick="btnLogin_Click" CssClass="btn btn-block btn-primary" runat="server" Text="Login" /><br />
                                             <%--<a class="text-center" href="ChangePassword.aspx" style="text-decoration:none"><b>Change Password</b></a> <br /> <br />--%>
                                        </fieldset>                                    
                                <%--    </div>
                                </div>--%><br />
                                        <asp:Label ID="errlbl" CssClass="" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label><br />
                                <%--<p id="error_lbl" style="color:red" runat="server"></p>--%>

           </div>
                             </form></div>
        <%--</div>--%>

        <div class="footer" style="margin-top:40px;">
      
        <div class="container text-center">
            <%--<center>--%>
                <p id="footer">&copy; 2017 - Powered by Chams Plc  <img src="chams.jpg" style="margin-bottom: 2px" /></p>
            <%--</center>--%>
        </div><br /><br />
    </div>
  

        
    <script src="Scripts/bootstrap.js"></script>
    <%--<script src="sweetalert.min.js"></script>--%>
</body>
</html>
