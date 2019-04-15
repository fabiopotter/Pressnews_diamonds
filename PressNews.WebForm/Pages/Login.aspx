<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PressNews.WebForm._Default" %>


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

     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
</head>

<body>
    
        <div class="containerLogin">
            
            <div>
                <div class="row">
                <div class="col-xs-8"">
                    <img src="../img/logo_77.png" style="width:100%;"/>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-8" style="align-content:center; padding-left:22em;">
                            <div class="form-group">
                                <label for="ds_lgnusr" class="control-label">Username</label>
                                <input type="text" class="form-control" id="ds_lgnusr" title="Enter your login" placeholder="Login"></input>
                                <span class="help-block"></span>
                            </div>
                            <div class="form-group">
                                <label for="ds_pwdusr" class="control-label">Password</label>
                                <input type="password" class="form-control" id="ds_pwdusr" title="Enter your password" placeholder="Password"></input>
                                <span class="help-block"></span>
                            </div>

                            <input type="button" class="btn btn-success btn-block" id="login" value="Login"></input>
                           
                        </div>
                         <div class="col-xs-8" style="text-align:center;">
                            <a class="lead" href="../Pages/Register.aspx">Create User</a>
                        </div>
                        
                    </div>
                 </div>
             </div>
        </div>
 </body>


</html>
</asp:Content>