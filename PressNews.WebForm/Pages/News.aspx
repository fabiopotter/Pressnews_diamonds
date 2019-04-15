<%@ Page Title="Main Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="PressNews.WebForm.News" %>

<asp:Content id="HeadContent" ContentPlaceHolderID="Header" runat="server">
<div class="topnav">
   <a class="active" href="Login.aspx">Logout</a>
   <a href="Category.aspx"">Category</a>
   <a href="Gallery.aspx"">Gallery</a>

</div>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">



<!DOCTYPE html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>




<html xmlns="http://www.w3.org/2000/svg">
<head>
    
     <link href="../Content/bootstrap.min.css"rel="stylesheet" />
    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/News.js"></script>

    <title>News Page</title>

<script>
 
</script>
        




<body>
    <div class="container">
    <div class="row">
      <div class="col-sm-6">
        <h2>News</h2>
      </div>
    </div>
  </div>
</body>
<div class="container">
  <div class="row">
    <div class="col-sm-6">
      <input type="hidden" id="id_new" value="0" />
        <input type="hidden" id="id_cat" value="0" />
        <table id="newsTable"
               class="table table-bordered table-condensed table-striped">
          <thead>
            <tr>
              <th>Edit</th>
              <th>News</th>
              <th>Text</th>
              <th>News Date</th>
              <th>Link Url</th>
              <th>Category</th>
              <th>Delete</th>  
            </tr>
          </thead>
        </table>
      <div class="row">
          <div class="col-sm-6">
            <button type="button" id="addButton" class="btn btn-primary" onclick="addClick();"> Add News</button>
          </div>
     </div>
      </br>
          <div class="row">
              <div class="col-sm-12">
                    <div class="panel panel-primary">
                      <div class="panel-heading">
                        News Information
                      </div>
                      <div class="panel-body">
                        <div class="form-group">
                              <label for="newsname">
                                News Name
                              </label>
                              <input type="text"
                                     class="form-control"
                                     id="newsname" />
                            </div>
                            <div class="form-group">
                              <label for="introdate">
                                News Description
                              </label>
                              <input type="text"
                                     class="form-control"
                                     id="newsdesc" />
                            </div>
                            <div class="form-group">
                                  <label for="introdate">
                                    News Date
                                  </label>
                                  <input type="date"
                                         class="form-control"
                                         id="newsdate" />
                            </div>
                            <div class="form-group">
                              <label for="url">
                                URL
                              </label>
                              <input type="url"
                                     class="form-control"
                                     id="newsurl" />
                            </div>
                          <div class="form-group">
                              <label for="url">
                                Category
                              </label>
                              <select class="form-control" id="catlist" style="height:110%;">
                              </select> 
                            </div>
                      </div>
                      <div class="panel-footer">
                        <div class="row">
                          <div class="col-xs-12">
                            <button type="button" id="updateButton"  class="btn btn-primary"onclick="updateClick();">Add</button>
                          </div>
                        </div>
                     </div>
                  </div>
    </div>
  </div>

</html>
        </asp:Content>