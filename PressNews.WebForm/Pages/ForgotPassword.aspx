﻿<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="PressNews.WebForm.ForgotPassword" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<!DOCTYPE html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>




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
            
            <div style="position:absolute; z-index:1;" id="Layer1">
                <div class="row">
                <div class="col-xs-8"">
                    <img src="../img/logo_77.png" style="width:100%;"/>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-8" style="align-content:center;">
                              <h2 style="text-align:center">Password Request</h2>
                            <div class="form-group">
                                <label for="ds_emluser" class="control-label">E-mail</label>
                                <input type="email" class="form-control" id="ds_emluser" title="Enter your registered e-mail" placeholder="Enter you E-mail here"></input>
                                <span class="help-block"></span>
                            </div>
                            <input type="button" class="btn btn-success btn-block" id="login" value="Recover Password"></input>
                         </div>
                         <div class="col-xs-8" style="text-align:center;">
                            <a class="lead" href="./Pages/Register.aspx">Don't have an Account? Create User here!</a>
                        </div>
                    </div>
                 </div>
             </div>
        </div>
 
</body>
</html>
</asp:Content>