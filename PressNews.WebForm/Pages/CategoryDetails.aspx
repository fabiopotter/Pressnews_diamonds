<%@ Page Title="Press News" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CategoryDetails.aspx.cs" Inherits="PressNews.WebForm.CategoryDetails" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<!DOCTYPE html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->



<html xmlns="http://www.w3.org/2000/svg">
<head>
    

    <title>Category Details</title>

     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700" rel="stylesheet">

    <link href="../Content/bootstrap.min.css"rel="stylesheet" />
    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/CategoryDetails.js"></script>
    <link href="../Content/Gallery.css" rel="stylesheet" />

  


</head>
<nav class="navbar navbar-expand-md navbar-dark fixed-top" id="banner">
   
	<div class="container">
  <!-- Brand -->
   <a class="navbar-brand" href="Galery.aspx">Home</a>

  <!-- Toggler/collapsibe Button -->
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>

  <!-- Navbar links -->
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" href="Gallery.aspx">About us</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="Gallery.aspx">Products</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="Login.aspx">Admin Panel</a>
      </li> 
	   <!-- Dropdown -->
 
    </ul>
  </div>
	</div>
</nav>

    <picture>
       <%-- <source mmedia="(min-width:769px)" srcset="../img/77Banner_desktop.jpg">--%>
            <img src="../img/77Banner_desktop.jpg" alt="Main Banner"  class="hidden-mobile">
            <img src="../img/77Banner_mobile.jpg" alt="Main Banner"  class="visible-mobile">
    </picture>

<body>
     <hr></hr>
    <div id="imageCat" style="margin:0 auto">
    </div>

    <hr></hr>
    <div class="container" id="newsTable">
        
    </div>     
    
 </body>
 
</html>
</asp:Content>