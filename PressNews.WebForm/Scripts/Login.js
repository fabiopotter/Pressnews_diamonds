var login = {
    Username: "",
    Password: ""
};

$(document).ready(function () {
    $('#login').click(function () {
        login.Username = $('#ds_lgnusr').val();
        login.Password = $('#ds_pwdusr').val();
        console.log(login);
        $.ajax({
            url: 'http://localhost:51076/api/Account',
            crossDomain: true,
            data: { "Username": login.Username, "Password": login.Password },
            dataType: "json",
            type: "POST",
            success: function () {
               
            },
            error: function () {


            }
        });
    });
});