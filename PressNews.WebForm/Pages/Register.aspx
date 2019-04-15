<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="PressNews.WebForm.ForgotPassword" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<!DOCTYPE html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->



<html xmlns="http://www.w3.org/2000/svg">
<head>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <script src="../Scripts/Login.js"></script>

    <title>Login</title>
        
</head>

<body>
    
 
        <div>
            
            <div style="position:absolute;" id="Layer1">
                <div class="row">
                <div class="col-xs-8">
                    <img src="../img/logo_77.png" style="width:100%;"/>
                 </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-8" style="align-content:center;">
                              <h2 style="text-align:center;">Register New User</h2>
                            <div class="form-group">
                                <label for="ds_lgnusr" class="control-label">Username</label>
                                <input type="text" class="form-control" id="ds_lgnusr" title="Enter your Login" placeholder="Enter your login here"></input>
                                <span class="help-block"></span>
                            </div>
                            <div class="form-group">
                                <label for="nm_usr" class="control-label">Name</label>
                                <input type="text" class="form-control" id="nm_usr" title="Enter your Name" placeholder="Enter your name here"></input>
                                <span class="help-block"></span>
                            </div>
                            <div class="form-group">
                                <label for="ds_emluser" class="control-label">E-mail</label>
                                <input type="email" class="form-control" id="ds_emluser" title="Enter your registered e-mail" placeholder="Enter you E-mail here"></input>
                                <span class="help-block"></span>
                            </div>
                            <div class="form-group">
                                <label for="ds_pwdusr" class="control-label">Password</label>
                                <input type="password" class="form-control" id="ds_pwdusr" title="Enter your password" placeholder="Password"></input>
                                <span class="help-block"></span>
                            </div>
                            <input type="button" class="btn btn-success btn-block" id="register" value="Create User"></input>
                                
                                <div class="col-xs-12" style="text-align:center;">
                                    <a class="lead" href="../Pages/Login.aspx">Back to Login</a>
                                </div>
                    </div>
                 </div>
             </div>
        </div>
   
</body>
</html>
</asp:Content>