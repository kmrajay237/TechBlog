<%-- 
    Document   : register_page
    Created on : Aug 6, 2021, 6:01:40 PM
    Author     : kajay002
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Technical Blog | Register new User</title>

        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>
        <main class="primary-background banner-background" style="padding-bottom: 80px;">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header primary-background text-white text-center">
                            <span class="fa fa-user-plus fa-3x"></span>
                            <p>Start Now! It's Free <br>New User Registration</p>
                        </div>
                        <div class="card-body">
                            <form id="reg-form" action="RegisterServlet" method="POST">
                                <div class="form-group">
                                    <label for="user_name">Full Name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name" placeholder="Enter username">
                                </div>
                                <div class="form-group">
                                    <label for="user_email">Email</label>
                                    <input name="user_email" type="email" class="form-control" id="user_email" placeholder="Enter email">
                                </div>
                                <div class="form-group">
                                    <label for="user_password">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="user_password" placeholder="Enter Password">
                                </div>
                                <div class="form-group">
                                    <label for="confirm_password">Confirm Password</label>
                                    <input name="user_confirm_password" type="password" class="form-control" id="confirm_password" placeholder="Re-Enter Password">
                                </div>
                                <div class="form-group">
                                    <label for="gender">Gender</label><br>
                                    <input type="radio" name="gender" id="male_gender" value="Male">&nbsp;Male
                                    <input type="radio" name="gender" id="female_gender" value="Female">&nbsp;Female
                                    <input type="radio" name="gender" id="trans_gender" value="Transgender">&nbsp;Transgender
                                </div>
                                <div class="form-group">
                                    <textarea class="form-control" name="about" id="about" cols="" rows="5" placeholder="Describe Yourself"></textarea>
                                </div>
                                <div class="form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="Tnc">
                                    <label class="form-check-label" for="Tnc">Agree T&C</label>
                                </div>
                                <br>
                                <div class="container text-center" id="loader" style="display: none;">
                                    <span class="fa fa-refresh fa-spin fa-3x"></span>
                                    <h4>Please wait...</h4>
                                </div>
                                <button id="submit_btn" type="submit" class="btn btn-primary">Register</button>
                            </form>
                        </div>
                    </div>                
                </div>
            </div>
        </main>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js">
        </script>
        <script>
            $(document).ready(function () {
                console.log("Loaded");
                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    $("submit_btn").hide();
                    $("#loader").show();
                    //Send to RegisterServlet
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            $("submit_btn").show();
                            $("#loader").hide();
                            if (data.trim() === 'done') {
                                swal("Congratulations!! You are successfully registered. Please login to start blogging")
                                        .then((value) => {
                                            window.location = "login_page.jsp"
                                        });
                            } else {
                                swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("submit_btn").show();
                            $("#loader").hide();
                            swal("Sorry! Something went wrong...Please try again");
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>
    </body>
</html>
