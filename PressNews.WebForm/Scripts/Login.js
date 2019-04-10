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
            //data: JSON.stringify(login),
            dataType: "json",
            //contentType: "application/json; charset=utf-8",
            type: "POST",
            success: function () {
                alert('Chegou');

                window.location.href = 'http://localhost:50427/About.aspx';
            },
            error: function () {
                alert('failure');
            }
        });
    });
});