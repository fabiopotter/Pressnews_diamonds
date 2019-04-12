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


