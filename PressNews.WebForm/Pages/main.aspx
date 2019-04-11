<%@ Page Title="Main Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="PressNews.WebForm.Main" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<!DOCTYPE html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->



<html xmlns="http://www.w3.org/2000/svg">
<head>
    
     <link href="../Content/bootstrap.min.css"rel="stylesheet" />
    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/Login.js"></script>

    <title>Main Page</title>

<script>
 
</script>
        
</head>

<body>
    <div class="container">
    <div class="row">
      <div class="col-sm-6">
        <h2>Categories</h2>
      </div>
    </div>
  </div>

    <div class="row">
  <div class="col-sm-6">
      <input type="hidden" id="id_cat" value="0" />
        <table id="categoryTable"
               class="table table-bordered table-condensed table-striped">
          <thead>
            <tr>
              <th>Category</th>
              <th>URL Image</th>
              <th>Date Add</th>
              <th>Edit</th>
            </tr>
          </thead>
        </table>
      <div class="row">
          <div class="col-sm-6">
            <button type="button" id="addButton" class="btn btn-primary" onclick="addClick();"> Add Category</button>
          </div>
     </div>
          <div class="row">
              <div class="col-sm-12">
                    <div class="panel panel-primary">
                      <div class="panel-heading">
                        Category Information
                      </div>
                      <div class="panel-body">
                      </div>
                      <div class="panel-footer">
                      </div>
                    </div>
              </div>
              </div>
      
          <div class="row">
          <div class="col-xs-12">
            <button type="button" id="updateButton" class="btn btn-primary" onclick="updateClick();">Add</button>
           </div>
        </div>
    </div>
  </div>
</div>

</body>
</html>
</asp:Content>