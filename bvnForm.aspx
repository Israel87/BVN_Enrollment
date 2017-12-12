<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bvnForm.aspx.cs" Inherits="BVN_Enrollment.bvnForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BVN Enrollment</title>

    
    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css" />
    <%--<link href="sweetalert.css" rel="stylesheet" />--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
    <%--<link href="Site.css" rel="stylesheet" />--%>



    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <link rel="stylesheet" href="/resources/demos/style.css" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#datepicker").datepicker({ dateFormat: 'dd-mm-yy' }).val();
            $("#datepicker2").datepicker({ dateFormat: 'dd-mm-yy' }).val();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-fixed-top navbar navbar-inverse" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <br />
                    <a class="navbar-brand" href="#"><b>BVN Enrolment </b></a>
                </div>

                <div class="collapse navbar-collapse">
                    <div>
                        <div class="nav navbar-nav navbar-right">
                            <br />
                            <div class="active"><a id="LinkButton1" href="logout.aspx">
                                <img src="logout.png" style="width: 50px" /></a></div>
                            <br />
                        </div>
                    </div>
                </div>
                <!--.nav-collapse -->
            </div>
        </nav>
        <br />
        <br />
        <div class="container">
            <br />
            <br />
            <h4 class="text-center"><strong style="color: #fff">Enrolment Form</strong> </h4>
            <br />
            <%--<div class="col-md-8 offset-3">--%>

            <%--<div class="text-center">--%>

            <div class="form-group">
                  <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label><br /><br />

                <h3 style="float: left">
                    <b>
                        <asp:Label ID="LabelOrgName" runat="server" Font-Bold="true" ForeColor="#3498db"></asp:Label>
                        Enrolment</b>
                </h3>

                <h4 style="float: right">Welcome
                    <asp:Label ID="LabelSessionName" runat="server" Font-Bold="true" ForeColor="Green"></asp:Label>
                </h4>




              

            </div>
            <br />
            <br />
            <br />
            <br />

            <div class="row">

                <div class="col-md-6">
                    <div class="form-group">
                        <label for="title" class="col-lg-2 control-label" style="font-size: small; color: #4990bf">Title </label>
                        <div class="col-lg-10">
                            <select class="form-control pull-left" id="txtTitle" name="gender" runat="server" required="required" placeholder="Title">
                                <option></option>
                                <option value="MR">Mr</option>
                                <option value="MRS">Mrs</option>
                                <option value="MISS">Miss</option>
                                <option value="MASTER">Master</option>
                            </select>

                        </div>
                    </div>
                </div>
                <div class="col-md-6">

                    <div class="form-group">
                        <label for="firstname" class="col-lg-2 control-label" style="font-size: small; color: #4990bf">First Name  </label>
                        <div class="col-lg-10">
                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control pull-left" placeholder="First Name" required="required"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" runat="server" ErrorMessage="First Name is Required" ForeColor="Red" Font-Bold="true" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>

                        </div>
                    </div>


                </div>
            </div>

            <%--end of one--%>




            <div class="row">
                <div class="col-md-6">

                    <div class="form-group">
                        <label for="middlename" class="col-lg-2 control-label" style="font-size: small; color: #4990bf">Middle Name </label>
                        <div class="col-lg-10">
                            <asp:TextBox ID="txtMiddlename" runat="server" CssClass="form-control pull-left" placeholder="Middle Name" required="required"></asp:TextBox>
                        </div>
                    </div>


                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="surname" class="col-lg-2 control-label" style="font-size: small; color: #4990bf">Surname </label>
                        <div class="col-lg-10">
                            <asp:TextBox ID="txtSurname" runat="server" CssClass="form-control pull-left" placeholder="Surname" required="required"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorSurname" runat="server" ErrorMessage="Surname is Required" ForeColor="Red" Font-Bold="true" ControlToValidate="txtSurname"></asp:RequiredFieldValidator>

                        </div>
                    </div>

                </div>

            </div>

            <%--    end of two --%>
            <%--  <br />--%>
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label for="maritalStatus" class="col-lg-2 control-label" style="font-size: small; color: #4990bf">Marital Status </label>
                        <div class="col-lg-10">
                            <asp:TextBox ID="maritalStatusID" runat="server" CssClass="form-control pull-left" placeholder="Marital Status" required="required"></asp:TextBox>
                            <br />

                        </div>
                    </div>
                </div>

                <div class="col-sm-6">
                    <div class="form-group">
                        <label for="gender" class="col-lg-2 control-label" style="font-size: small; color: #4990bf">Gender</label>
                        <div class="col-lg-10">
                            <asp:TextBox ID="txtGender" runat="server" CssClass="form-control pull-left" placeholder="Gender" required="required"></asp:TextBox>
                            <br />

                        </div>

                    </div>
                    <br />
                </div>


            </div>
            <br />

            <%-- end of third --%>
            <div class="row">
                <div class="col-md-6">

                    <div class="form-group">
                        <label for="dob" class="col-lg-2 control-label" style="font-size: small; color: #4990bf">Date of Birth</label>
                        
                        <div class="col-lg-10">
                            <asp:TextBox ID="txtDate" runat="server" CssClass="form-control pull-left" placeholder="Date of Birth" required="required"></asp:TextBox>
                          
                        </div>
                    </div>


                </div>

                <div class="col-sm-6">

                    <div class="form-group">
                        <label for="nationality" class="col-lg-2 control-label" style="font-size: small; color: #4990bf">Nationality </label>
                        <div class="col-lg-10">
                            <asp:TextBox ID="nationality" runat="server" CssClass="form-control pull-left" placeholder="Country of Birth... "></asp:TextBox>
                            
                        </div>

                    </div>






                    <br />
                    <br />
                </div>
            </div>


            <div class="row">
                <div class="col-sm-6">
                    <br />

                </div>
                <div class="col-sm-6">
                </div>

            </div>
            <%--    end of fifth group div --%>

            <div class="row">
                <div class="col-sm-6">

                    <div class="form-group">
                        <label for="stateoforigin" class="col-lg-2 control-label" style="font-size: small; color: #4990bf">State of Origin</label>
                        <div class="col-lg-10">
                            <asp:TextBox ID="stateoforigin" runat="server" CssClass="form-control pull-left" placeholder="State" required="required"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorStateofOrigin" runat="server" ErrorMessage="State of Origin is Required" ForeColor="Red" Font-Bold="true" ControlToValidate="stateoforigin"></asp:RequiredFieldValidator>

                        </div>

                    </div>

                </div>

                <div class="col-sm-6">
                    <div class="form-group">
                        <label for="loo" class="col-lg-2 control-label" style="font-size: small; color: #4990bf">LGA of Origin</label>
                        <div class="col-lg-10">
                            <asp:TextBox ID="lgaOrigin" runat="server" CssClass="form-control pull-left" placeholder="LGA" required="required"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorLgaOriginID" runat="server" ErrorMessage="LGA of Origin is Required" ForeColor="Red" Font-Bold="true" ControlToValidate="lgaOrigin"></asp:RequiredFieldValidator>

                        </div>

                    </div>



                </div>
            </div>


            <div class="row">
                <div class="col-sm-6">

                    <div class="form-group">
                        <label for="customerID" class="col-lg-2 control-label" style="font-size: small; color: #4990bf">BVN Number</label>
                        <div class="col-lg-10">
                            <asp:TextBox ID="customerID" runat="server" CssClass="form-control pull-left" placeholder="BVN Number"></asp:TextBox>

                        </div>
                    </div>



                </div>


                <div class="col-sm-6">

                    <div class="form-group">
                        <label for="AnmfinCNID" class="col-lg-2 control-label" style="font-size: small; color: #4990bf">Unique Number</label>
                        <div class="col-lg-10">
                            <asp:TextBox ID="AnmfinCN" runat="server" CssClass="form-control pull-left" placeholder="Unique Number"></asp:TextBox>

                        </div>
                    </div>


                </div>
            </div>
            <br />
            <%--    <div class="row">
            <div class="col-sm-6">
                      <div class="form-group">
                                               <label for="BVNNumber" class="col-lg-3 control-label" style="font-size:small; color:#4990bf"> BVN Number </label>
                                                  <div class="col-lg-9">
                                                    <asp:TextBox ID="bvnID"  runat="server" CssClass="form-control pull-left" placeholder="BVN Number"></asp:TextBox>
                                                    
                                                  </div>
                                            </div>

            </div>
            <div class="col-sm-6"></div>
        </div>--%>
            <br />


            <div class="row">
                <div class="col-sm-6">
                    <%-- state of capture--%>
                    <div class="form-group">
                        <label for="stateofCapture" class="col-lg-2 control-label" style="font-size: small; color: #4990bf">State of Capture</label>
                        <div class="col-lg-10">
                            <asp:TextBox ID="stateofCapture" runat="server" CssClass="form-control pull-left" placeholder="State of Capture" required="required"></asp:TextBox>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="LGA of Capture is Required" ForeColor="Red" Font-Bold="true" ControlToValidate="stateofCapture"></asp:RequiredFieldValidator>--%>
                        </div>
                    </div>

                </div>

                <div class="col-sm-6">
                    <%--  lga of capture--%>
                    <div class="form-group">
                        <label for="lgaofCapture" class="col-lg-2 control-label" style="font-size: small; color: #4990bf">LGA of Capture</label>
                        <div class="col-lg-10">
                            <asp:TextBox ID="lgaofCapture" runat="server" CssClass="form-control pull-left" placeholder="LGA of Capture" required="required"></asp:TextBox>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="LGA of Capture is Required" ForeColor="Red" Font-Bold="true" ControlToValidate="lgaofCapture"></asp:RequiredFieldValidator>--%>
                        </div>
                    </div>
                </div>

            </div>
            <br />
            <br />


            <div class="row">
                <div class="col-sm-12">
                    <div class="form-group">
                        <label for="address" class="col-lg-2 control-label" style="font-size: small; color: #4990bf">Residential Address</label>
                        <div class="col-lg-10">
                            <asp:TextBox ID="address" runat="server" TextMode="MultiLine" CssClass="form-control pull-left" placeholder="Address... " required="required"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorAddress" runat="server" ErrorMessage="Address is Required" ForeColor="Red" Font-Bold="true" ControlToValidate="address"></asp:RequiredFieldValidator>
                        </div>

                    </div>
                </div>

            </div>
            <br />
            <br />

            <div class="row">
                <div class="col-md-6">

                    <div class="form-group">
                        <label for="stateofResidence" class="col-lg-2 control-label" style="font-size: small; color: #4990bf">State of Residence </label>
                        <div class="col-lg-10">
                            <asp:TextBox ID="stateofResidence" runat="server" CssClass="form-control pull-left" placeholder="State" required="required"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorStateResidence" runat="server" ErrorMessage="State of Residence is Required" ForeColor="Red" Font-Bold="true" ControlToValidate="stateofResidence"></asp:RequiredFieldValidator>
                        </div>
                    </div>


                </div>

                <div class="col-sm-6">

                    <div class="form-group">
                        <label for="lgaofResidence" class="col-lg-2 control-label" style="font-size: small; color: #4990bf">LGA of Residence </label>
                        <div class="col-lg-10">
                            <asp:TextBox ID="lgaofResidence" runat="server" CssClass="form-control pull-left" placeholder="Residence" required="required"></asp:TextBox>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorLGAResidence" runat="server" ErrorMessage="LGA of Residence is Required" ForeColor="Red" Font-Bold="true" ControlToValidate="lgaofResidence"></asp:RequiredFieldValidator>
                        </div>
                    </div>


                </div>
            </div>
            <br />


            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="phonenumber1" class="col-lg-2 control-label" style="font-size: small; color: #4990bf">Phone Numer 1 </label>
                        <div class="col-lg-10">
                            <asp:TextBox ID="phonenumber1" runat="server" CssClass="form-control pull-left" placeholder="Mobile 1" required="required"></asp:TextBox>

                        </div>
                    </div>

                </div>

                <div class="col-sm-6">
                    <div class="form-group">
                        <label for="phonenumber2" class="col-lg-2 control-label" style="font-size: small; color: #4990bf">Phone Numer 2 </label>
                        <div class="col-lg-10">
                            <asp:TextBox ID="phonenumber2" runat="server" CssClass="form-control pull-left" placeholder="Mobile 2" required="required"></asp:TextBox>

                        </div>
                    </div>
                    <br />
                    <br />
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="emailAddress" class="col-lg-2 control-label" style="font-size: small; color: #4990bf">Email Address </label>
                        <div class="col-lg-10">
                            <asp:TextBox ID="emailAddress" runat="server" CssClass="form-control pull-left" placeholder=" Email Address" required="required"></asp:TextBox>

                        </div>
                    </div>

                </div>

                <div class="col-sm-6">
                    <div class="form-group">
                        <label for="formstatus" class="col-lg-2 control-label" style="font-size: small; color: #4990bf">Form Status </label>
                        <div class="col-lg-10">
                            <select id="formStatus" class="form-control" name="formstatus" runat="server" datavaluefield="FORMSTATUSID" datatextfield="FORMSTATUS" required="required">
                            </select>
                        </div>
                    </div>

                    <br />
                    <br />
                </div>
            </div>

            <div class="row">
                <div class="col-sm-6">
                   <label for="agent" class="col-lg-2 control-label" style="font-size: small; color: #4990bf"><strong>Select Agent</strong></label>
                        <div class="col-lg-10">
                             <select id="agentID" class="form-control" name="agentID" runat="server" datavaluefield="AGENTID" datatextfield="AGENTID" required="required">
                            </select>   <br />   <br />
                        </div>
                    <br />

                    <label for="upload" class="col-lg-2 control-label" style="font-size: small; color: #4990bf"></label>
                    <div class="col-lg-10">
                        <asp:FileUpload ID="FileUpload1" runat="server" />


                    </div>
                </div>


                <div class="col-sm-6">
                    <div class="form-group">
                        <label for="enrolticketID" class="col-lg-2 control-label" style="font-size: small; color: #4990bf"><strong>Enrollment Ticket ID</strong></label>
                        <div class="col-lg-10">
                            <asp:TextBox ID="enrolticketID" runat="server" CssClass="form-control pull-left" placeholder="Ticket ID" required="required"></asp:TextBox>
                            <%--<input type="text" class="form-control" id="txtBox4" placeholder="Contact Number"/>--%>
                            <asp:Label ID="LabelError" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidatorEnrolTicket" runat="server" ErrorMessage="Ticket ID is Required" ForeColor="Red" Font-Bold="true" ControlToValidate="enrolticketID"></asp:RequiredFieldValidator>--%>
                        </div>

                    </div>


                    <br />
                </div>
                <br />
            </div>

            <br />

            <hr />
            <hr />


            <br />
            <div class="row">
                <div class="col-sm-4">
                    <br />
                    <%--<asp:Label ID="Label1" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>--%>
                    <%--<asp:LinkButton ID="LinkButton2" CssClass="btn btn-block btn-warning" OnClick="LinkButton2_Click" runat="server"><strong>UPDATE</strong></asp:LinkButton>--%>
                    <asp:LinkButton CausesValidation="false" CssClass="btn btn-block btn-warning" OnClick="LinkButton2_Click" runat="server"><strong>SEARCH</strong></asp:LinkButton>
                    <br />
                </div>

                <div class="col-sm-4">
                    <div class="form-group">
                        <%--<button class="btn btn-block btn-primary" id="btnSubmit" runat="server"> <strong>SUBMIT</strong></button>--%><br />
                        <asp:LinkButton CssClass="btn btn-block btn-info" ID="LinkUpdate" OnClick="btnUpdateDetails" runat="server"><strong>UPDATE</strong></asp:LinkButton>
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="form-group">
                        <%--<button class="btn btn-block btn-primary" id="btnSubmit" runat="server"> <strong>SUBMIT</strong></button>--%><br />
                        <asp:LinkButton CssClass="btn btn-block btn-success" ID="submit" OnClick="btnSubmit" runat="server"><strong>SUBMIT</strong></asp:LinkButton>
                    </div>
                </div>
                <br />
            </div>
        </div>

    </form>
    <br />
    <br />



    <div class="footer" style="margin-top: 40px;">

        <div class="container text-center">
            <%--<center>--%>
            <p id="footer">&copy; 2017 - Powered by Chams Plc 
                <img src="chams.jpg" style="margin-bottom: 2px" /></p>
            <%--</center>--%>
        </div>
        <br />
        <br />
    </div>


    <%--    End of div--%>

    <script src="Scripts/bootstrap.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
    <%--<script src="sweetalert.min.js"></script>--%>



    <script type="text/javascript">
        $(document).ready(function () {
            $(function () {
                //  $('#datetimepicker6').datetimepicker();
                $('#datetimepicker7').datetimepicker({
                    useCurrent: false //Important! See issue #1075
                });
                //   $("#datetimepicker6").on("dp.change", function (e) {
                //        $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
                //   });
                $("#datetimepicker7").on("dp.change", function (e) {
                    $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
                });
            });
        });
    </script>


</body>
</html>
