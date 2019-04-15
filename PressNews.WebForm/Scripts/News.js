$(document).ready(function () {
    newsList();
    getCat();
});

function getCat() {
   
        $.ajax({
            type: "GET",
            url: "http://localhost:51076/api/GetCategories",
            dataType: 'json',
            data: {},
            success: function (result) {
                $.each(result, function (i) {
                    $('#catlist').append($('<option></option>').val(result[i].id_cat).html(result[i].nm_cat));
                });
            },
            failure: function () {
                alert("Error");
            }
        });

}

function newsList() {
    $.ajax({
        url: 'http://localhost:51076/api/GetNews',
        type: 'GET',
        dataType: 'json',
        success: function (news) {
            newsListSuccess(news);
        },
        error: function (request, message, error) {
            handleException(request, message, error);
        }
    });
}

function newsListSuccess(news) {
    // Iterate over the collection of data
    $.each(news, function (index, news) {
        // Add a row to the News table
        newsAddRow(news);
    });
}

function newsAddRow(news) {
    // Check if <tbody> tag exists, add one if not
    if ($("#newsTable tbody").length === 0) {
        $("#newsTable").append("<tbody></tbody>");
    }
    // Append row to <table>
    $("#newsTable tbody").append(
        newsBuildTableRow(news));
}
//Build Table Function
function newsBuildTableRow(news) {
    var ret =
        "<tr>" +
        "<td>" +
        "<button type='button' " +
        "onclick='newsGet(this);' " +
        "class='btn btn-default' " +
        "data-id='" + news.id_new + "'>" +
        "<span class='glyphicon glyphicon-edit' />" +
        "</button>" +
        "</td >" +
        "<td>" + news.nm_new + "</td>" +
        "<td>" + news.ds_txtnew + "</td>" +
        "<td>" + news.dt_new + "</td>" +
        "<td>" + news.ds_urlnew + "</td>" +
        "<td>" + news.TB_CATEGORIES.nm_cat + "</td>" +
        "<td>" +
        "<button type='button' " +
        "onclick='newsDelete(this);' " +
        "class='btn btn-default' " +
        "data-id='" + news.id_new + "'>" +
        "<span class='glyphicon glyphicon-remove' />" +
        "</button>" +
        "</td>" +
        "</tr>";
    $("#id_cat").val(news.TB_CATEGORIES.id_cat);
    return ret;
}

function handleException(request, message,
    error) {
    var msg = "";
    if (request.responseJSON !== null) {
        msg += "Message: " +
            request.responseJSON.Message + "\n";
    }
    alert(msg);
}

function newsGet(ctl) {
    // Get Category id from data- attribute
    var id = $(ctl).data("id");

    // Store Category id in hidden field
    $("#id_new").val(id);

    // Call Web API to get a list of Categorys
    $.ajax({
        url: "http://localhost:51076/api/News/" + id,
        type: 'GET',
        dataType: 'json',
        success: function (news) {
            newsToFields(news);

            // Change Update Button Text
            $("#updateButton").text("Update");
        },
        error: function (request, message, error) {
            handleException(request, message, error);
        }
    });
}

function GetNewsAfterInsert(data) {
    // Get Category id from data- attribute
    var id = data;

    // Call Web API to get a list of Categorys
    $.ajax({
        url: "http://localhost:51076/api/News/" + id,
        type: 'GET',
        dataType: 'json',
        success: function (news) {
            newsToFields(news);

            // Change Update Button Text
            $("#updateButton").text("Update");
        },
        error: function (request, message, error) {
            handleException(request, message, error);
        }
    });
}

function newsToFields(news) {
    $("#newsname").val(news.nm_new);
    $("#newsdesc").val(news.ds_txtnew);
    $("#newsdate").val(news.dt_new);
    $("#newsurl").val(news.ds_urlnew);
    $("#catlist").val(news.TB_CATEGORIES.id_cat); 
}


function newsAddSuccess(news) {
    newsAddRow(news);
    formClear();
}
function formClear() {
    $("#newsname").val("");
    $("#newsdesc").val("");
    $("#newsdate").val("");
    $("#newsurl").val("");
    $("#catlist").val("");
}
function addClick() {
    formClear();
}

function updateClick() {
    // Build Category object from inputs
    News = new Object();
    News.id_new = $("#id_new").val();
    News.nm_new = $("#newsname").val();
    News.ds_txtnew = $("#newsdesc").val();
    News.dt_new = $("#newsdate").val();
    News.ds_urlnew = $("#newsurl").val();
    News.id_cat = $("#catlist").val();

    if ($("#updateButton").text().trim() == "Add") {
        newsAdd(News);
    }
    else {
        newsUpdate(News);
    }
}


function newsUpdate(news) {
   
    var newvar = { "id_new": news.id_new, "nm_new": news.nm_new, "ds_txtnew": news.ds_txtnew, "dt_new": news.dt_new, "ds_urlnew": news.ds_urlnew, "id_cat": news.id_cat };
    // Call Web API to update Category
    $.ajax({
        url: "http://localhost:51076/api/UpdateNews/",
        type: 'POST',
        datatype: "json",
        data: newvar,
        success: function (data) {
            newsUpdateSuccess(data);
        },
        error: function (request, message, error) {
            handleException(request, message, error);
        }
    });
}

function newsUpdateSuccess(news) {
    newsUpdateInTable(news);
}


function newsAdd(news) {
    // Call Web API to add a new Category

    var newvar = { "id_new": 0, "nm_new": news.nm_new, "ds_txtnew": news.ds_txtnew, "dt_new": news.dt_new, "ds_urlnew": news.ds_urlnew, "id_cat": news.id_cat };
    $.ajax({
        url: "http://localhost:51076/api/PostNews",
        type: 'POST',
       // contentType: "application/json;charset=utf-8",
        datatype: "json",
        data: newvar,
        success: function (data) {
            newvar.id_new = data.id_new;

            newvar.TB_CATEGORIES = data.TB_CATEGORIES;

            newsAddSuccess(newvar);
        },
        error: function (request, message, error) {
            handleException(request, message, error);
            
        }
    });
}



// Update News inside <table>
function newsUpdateInTable(news) {
    // Find Category in <table>
    var row = $("#newsTable button[data-id='" + news.id_new + "']")
        .parents("tr")[0];
    // Add changed Category to table
    $(row).after(newsBuildTableRow(news));
    // Remove original Category
    $(row).remove();

    // Clear form fields
    formClear();

    // Change Update Button Text
    $("#updateButton").text("Add");
}

// Delete product from <table>
function newsDelete(ctl) {
    var id = $(ctl).data("id");

    // Call Web API to delete a product
    $.ajax({
        url: "http://localhost:51076/api/DeleteNews/" + id,
        type: 'GET',
        datatype: "json",
        //contentType: "application/json",
        success: function (data) {
            $(ctl).parents("tr").remove();
        },
        error: function (request, message, error) {
            handleException(request, message, error);
        }
    });
}
