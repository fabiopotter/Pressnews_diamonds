﻿<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PressNews.WebForm._Default" %>


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
    <script src="Scripts/Login.js"></script>

    <title>Login</title>
</head>

<body>
    
    <%-- <form id="loginForm" method="post" >--%>
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
                                <label for="ds_pwdusr" class="control-label">Password</label>
                                <input type="password" class="form-control" id="ds_pwdusr" title="Enter your password" placeholder="Password"></input>
                                <span class="help-block"></span>
                            </div>

                            <input type="button" class="btn btn-success btn-block" id="login">Login</input>
                            <button type="submit" class="btn btn-default btn-block">Forgot Password ?</button>
                        </div>
                         <div class="col-xs-8" style="text-align:center;">
                            <a class="lead" href="/Register.aspx">Create User</a>
                        </div>
                    </div>
                 </div>
             </div>
        </div>
   <%-- </form>--%>
    <%--<div class="container">
        <div class="row">
			<div class="col-md-4 mx-auto">
				<div class="myform form ">
					 <div class="logo mb-4">
						 <div class="col-md-12 text-center">
							<h1>Login</h1>
						 </div>
					</div>
                   <form action="" method="post" name="login">
                           <div class="form-group">
                              <label for="login">Login</label>
                              <input type="text" name="email"  class="form-control" id="login" aria-describedby="loginHelp" placeholder="Enter login">
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1">Password</label>
                              <input type="password" name="password" id="password"  class="form-control" aria-describedby="loginHelp" placeholder="Enter Password">
                           </div>
                           <div class="col-md-12 text-center ">
                              <button type="submit" class=" btn btn-block mybtn btn-primary tx-tfm">Login</button>
                           </div>
                          <div class="form-group">
                              <p class="text-center">Don't have account? <a href="User.aspx" id="signup">Create here</a></p>
                           </div>
                        </form>
                 
				</div>
			</div>
		</div>
      </div>   --%>
</body>
</html>
</asp:Content>