$(document).ready(function () {
    categoryList();
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
        // Add a row to the Category table
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
        "<td>" +
        "<button type='button' " +
        "onclick='categoryGet(this);' " +
        "class='btn btn-default' " +
        "data-id='" + category.id_cat + "'>" +
        "<span class='glyphicon glyphicon-edit' />" +
        "</button>" +
        "</td >" +
        "<td>" + category.nm_cat + "</td>" +
        "<td>" + category.ds_imgcat + "</td>" +
        "<td>" + category.dt_icl + "</td>" +
        "<td>" +
        "<button type='button' " +
        "onclick='categoryDelete(this);' " +
        "class='btn btn-default' " +
        "data-id='" + category.id_cat + "'>" +
        "<span class='glyphicon glyphicon-remove' />" +
        "</button>" +
        "</td>" +
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
    // Get Category id from data- attribute
    var id = $(ctl).data("id");

    // Store Category id in hidden field
    $("#id_cat").val(id);

    // Call Web API to get a list of Categorys
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


function categoryAddSuccess(category) {
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

function updateClick() {
    // Build Category object from inputs
    Category = new Object();
    Category.id_cat = $("#id_cat").val();
    Category.nm_cat = $("#categoryname").val();
    Category.dt_icl = $("#introdate").val();
    Category.ds_imgcat = $("#url").val();

    if ($("#updateButton").text().trim() == "Add") {
        categoryAdd(Category);
    }
    else {
        categoryUpdate(Category);
    }
}


function categoryUpdate(category) {
    var url = "http://localhost:51076/api/Categories/" + category.id_cat;

    // Call Web API to update Category
    $.ajax({
        url: url,
        type: 'PUT',
        contentType: "application/json;charset=utf-8",
        data: JSON.stringify(category),
        success: function (category) {
            CategoryUpdateSuccess(category);
        },
        error: function (request, message, error) {
            handleException(request, message, error);
        }
    });
}

function categoryUpdateSuccess(category) {
    categoryUpdateInTable(category);
}


function categoryAdd(category) {
    // Call Web API to add a new Category
    $.ajax({
        url: "http://localhost:51076/api/PostCategory",
        type: 'POST',
        contentType: "application/json;charset=utf-8",
        data: { "nm_cat": category.nm_cat, "ds_imgcat": category.ds_imgcat, "dt_icl": category.dt_icl },
        success: function (category) {
            categoryAddSuccess(category);
        },
        error: function (request, message, error) {
            handleException(request, message, error);
        }
    });
}



// Update Category inside <table>
function categoryUpdateInTable(Category) {
    // Find Category in <table>
    var row = $("#categoryTable button[data-id='" + category.id_cat + "']")
        .parents("tr")[0];
    // Add changed Category to table
    $(row).after(categoryBuildTableRow(Category));
    // Remove original Category
    $(row).remove();

    // Clear form fields
    formClear();

    // Change Update Button Text
    $("#updateButton").text("Add");
}

// Delete product from <table>
function categoryDelete(ctl) {
    var id = $(ctl).data("id");

    // Call Web API to delete a product
    $.ajax({
        url: "http://localhost:51076/api/Categories/" + id,
        type: 'DELETE',
        success: function (category) {
            $(ctl).parents("tr").remove();
        },
        error: function (request, message, error) {
            handleException(request, message, error);
        }
    });
}
