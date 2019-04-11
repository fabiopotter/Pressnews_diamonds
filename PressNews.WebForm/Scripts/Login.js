var login = {
    Username: "",
    Password: ""
};

var register = {
    Login:"",
    Name: "",
    Email:"",
    Password: ""
};

$(document).ready(function () {
    categoryList();
});

$(document).ready(function () {
    $('#login').click(function () {
        login.username = $('#ds_lgnusr').val();
        login.password = $('#ds_pwdusr').val();
        $.ajax({
            url: 'http://localhost:51076/api/account',
            crossdomain: true,
            data: { "username": login.username, "password": login.password },
            datatype: "json",
            type: "post",
            success: function () {
                window.location.href = 'http://localhost:50427/pages/Main.aspx';
            },
            error: function () {
                alert('error!');

            }
        });
    });

});

$(document).ready(function () {
    $('#register').click(function () {
        register.Login = $('#ds_lgnusr').val();
        register.Name = $('#nm_usr').val();
        register.Email = $('#ds_emluser').val();
        register.Password = $('#ds_pwdusr').val();
        $.ajax({
            url: 'http://localhost:51076/api/register',
            crossdomain: true,
            data: { "nm_lgnusr": register.Login, "ds_emlusr": register.Email, "nm_usr": register.Name, "ds_pwdusr": register.Password },
            datatype: "json",
            type: "post",
            success: function () {
                alert('User Created !');
                window.location.href = 'http://localhost:50427/pages/Login.aspx';
            },
            error: function () {
                alert('Error When Creating user!');

            }
        });
    });
});



function categoryList() {
    $.ajax({
        url: 'http://localhost:51076/api/GetCategories',
        type: 'GET',
        dataType: 'json',
        success: function (categories) {
            categoryListSuccess(categories);
        },
        error: function (request, message, error) {
            handleException(request, message, error);
        }
    });
}

function categoryListSuccess(categories) {
    // Iterate over the collection of data
    $.each(categories, function (index, category) {
        // Add a row to the Product table
        categoryAddRow(category);
    });
}

function categoryAddRow(category) {
    // Check if <tbody> tag exists, add one if not
    if ($("#categoryTable tbody").length === 0) {
        $("#categoryTable").append("<tbody></tbody>");
    }
    // Append row to <table>
    $("#categoryTable tbody").append(
        categoryBuildTableRow(category));
}
//Build Table Function
function categoryBuildTableRow(category) {
    var ret =
        "<tr>" +
        "<td>" + category.nm_cat + "</td>" +
        "<td>" + category.ds_imgcat + "</td>" +
        "<td>" + category.dt_icl + "</td>" +
        "<td>" +
        "<button type='button' " +
        "onclick='categoryGet(this);' " +
        "class='btn btn-default' " +
        "data-id='" + category.id_cat + "'>" +
        "<span class='glyphicon glyphicon-edit' />"
        + "</button>" +
        "</td >" +
        "</tr>";
    return ret;
}

function handleException(request, message,
    error) {
    var msg = "";
    msg += "Code: " + request.status + "\n";
    msg += "Text: " + request.statusText + "\n";
    if (request.responseJSON !== null) {
        msg += "Message" +
            request.responseJSON.Message + "\n";
    }
    alert(msg);
}

function categoryGet(ctl) {
    // Get product id from data- attribute
    var id = $(ctl).data("id");

    // Store product id in hidden field
    $("#id_cat").val(id);

    // Call Web API to get a list of Products
    $.ajax({
        url: "http://localhost:51076/api/Categories/" + id,
        type: 'GET',
        dataType: 'json',
        success: function (category) {
            categoryToFields(category);

            // Change Update Button Text
            $("#updateButton").text("Update");
        },
        error: function (request, message, error) {
            handleException(request, message, error);
        }
    });
}

function categoryToFields(category) {
    $("#categoryname").val(category.nm_cat);
    $("#introdate").val(category.dt_icl);
    $("#url").val(category.ds_imgcat);
}


function categoryAddSuccess(product) {
    categoryAddRow(category);
    formClear();
}
function formClear() {
    $("#categoryname").val("");
    $("#introdate").val("");
    $("#url").val("");
}
function addClick() {
    formClear();
}