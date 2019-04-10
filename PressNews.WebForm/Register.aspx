<%@ Page Language="C#"  AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="PressNews.WebForm.Register" %>


<!DOCTYPE html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<html xmlns="http://www.w3.org/2000/svg">
<head>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link href="Content/Site.css" rel="stylesheet"/>
    <title>Register Page</title>
</head>
<body>
    <form id="formRegister" method="post" class="myForm">
        <div>
            <div style="position:absolute; z-index:1;" id="Layer1">
                <div class="row">
                <div class="col-xs-8"">
                    <img src="img/logo_77.png" style="width:100%;"/>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-8" style="align-content:center;">
                            <div class="form-group">
                                <label for="ds_lgnusr" class="control-label">Username</label>
                                <input type="text" class="form-control" id="ds_lgnusr" title="Enter your login" placeholder="Login"></input>
                                <span class="help-block"></span>
                            </div>
                            <div class="form-group">
                                <label for="ds_emlusr" class="control-label">E-mail</label>
                                <input type="email" class="form-control" id="ds_emlusr" title="Enter your login" placeholder="Email"></input>
                                <span class="help-block"></span>
                            </div>
                            <div class="form-group">
                                <label for="ds_pwdusr" class="control-label">Password</label>
                                <input type="password" class="form-control" id="ds_pwdusr" title="Enter your password" placeholder="Password"></input>
                                <span class="help-block"></span>
                            </div>

                            <button type="submit" class="btn btn-success btn-block">Create User</button>
                         </div>
                    </div>
                 </div>
             </div>
        </div>
    </form>
</body>
</html>

