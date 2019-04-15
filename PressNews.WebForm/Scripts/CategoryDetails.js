$(document).ready(function () {
    NewsList();
    
});


function NewsList() {

    var id_cat = location.search.split('id_cat=')[1]

    $.ajax({
        url: 'http://localhost:51076/api/GetNewsByCat/' + id_cat,
        type: 'GET',
        dataType: 'json',
        success: function (news) {
            for (var i = 0; i < news.length; i++) {

                var catelement = $('<img src="http://localhost:51076/images/' + news[i].TB_CATEGORIES.ds_imgcat + '" clas="imageNews"/>');
                $("#imageCat").append(catelement);

                var element = $('<div class="col-md-4 text-center">  <article><a href ="' + news[i].ds_urlnew + '"><div class="content-wrapper"><img src="../img/Background.png" class="imgBkg"> <div clas="text-wrapper"> <h3 class="h3new">' + news[i].nm_new + '</h3></div></div><div class="middle" ><div class="text" class="newName"><h3>READ MORE</h3><div> </div></a></article></div>');
                $("#newsTable").append(element);

                
            }                  

        },
        error: function (request, message, error) {
            handleException(request, message, error);
        }
    });
}
