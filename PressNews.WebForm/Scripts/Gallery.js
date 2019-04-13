$(document).ready(function () {
    categoryList();
    
});


function categoryList() {
    $.ajax({
        url: 'http://localhost:51076/api/GetCategories',
        type: 'GET',
        dataType: 'json',
        success: function (categories) {
            for (var i = 0; i < categories.length; i++) {
                //Now that you are iterating the people objects, iterate the keys of the object

                //Append h1 with key name and its value
                //$("#galleryTable").append('<div class="col sm- 4"' > + categories[i].nm_cat + "</div>");
                $("#galleryTable").append("<a href='Press.aspx' onClick='goToPage(this," + categories[i].id_cat + ");'>" + categories[i].nm_cat + "</a>");
            }                  

        },
        error: function (request, message, error) {
            handleException(request, message, error);
        }
    });
}


function goToPage(href, ctl) {
    // Get Category id from data- attribute
    var id = $(ctl).data("id");

    // Store Category id in hidden field
    $("#id_cat").val(id);
    window.location.href = 'http://localhost:50427/pages/Category.aspx';
}