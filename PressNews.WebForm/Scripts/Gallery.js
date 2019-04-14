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
                var element = $('<div class="col-md-4 text-center">  <article><a href ="CategoryDetails.aspx?id_cat=' + categories[i].id_cat + '">  <img class="imgBkg" src="http://localhost:51076/images/' +
                    categories[i].ds_imgcat + '"><div class="middle"><div class="text" id="catName"><h3>SHOW NEWS</h3><div class="text"><div></div></a></article></div>');
                    $("#galleryTable").append(element);

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