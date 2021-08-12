<%-- 
    Document   : profile
    Created on : Aug 7, 2021, 5:45:04 AM
    Author     : kajay002
--%>

<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome <%=user.getName()%></title>
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 81% 0, 99% 0, 100% 100%, 80% 90%, 50% 100%, 20% 90%, 0 100%, 0 0, 21% 0);
            }
        </style>
    </head>
    <body>
        <!--navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp" id="companyName"><span class="fa fa-certificate"></span>&nbsp;Tech Blog</a>
            <button class="navbar-toggler" id="btn" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"><span class="fa fa-cloud"></span>&nbsp;Learn Development <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item active dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fa fa-snowflake-o"></span>
                            Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#"><span class="fa fa-fighter-jet"></span>&nbsp;Programming Language</a>
                            <a class="dropdown-item" href="#"><span class="fa fa-fighter-jet"></span>&nbsp;Project Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#"><span class="fa fa-fighter-jet"></span>&nbsp;Data Structure</a>
                            <a class="dropdown-item" href="#"><span class="fa fa-fighter-jet"></span>&nbsp;Selenium</a>
                        </div>
                    </li>

                    <li class="nav-item active">
                        <a class="nav-link" href="#"><span class="fa fa-address-book-o"></span>&nbsp;Contact</a>
                    </li>

                    <li class="nav-item active">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-book"></span>&nbsp;Write Post</a>
                    </li>

                </ul>
                <!--                <form class="form-inline my-2 my-lg-0">
                                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                                    <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
                                </form>-->

                <ul class="navbar-nav mr-right">
                    <li class="nav-item active">
                        <a href="#!" data-toggle="modal" data-target="#profile-model" class="nav-link"><span class="fa fa-user-circle"></span>&nbsp;<%=user.getName()%></a>
                    </li>
                    <li class="nav-item active">
                        <a href="LogoutServlet" class="nav-link"><span class="fa fa-sign-out"></span>&nbsp;Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        <!--end of navbar-->

        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {
        %>
        <div class="alert <%=m.getCssClass()%>" role="alert" id="danger" name="danger">
            <%=m.getContent()%>
        </div>
        <%
                session.removeAttribute("msg");
            }
        %>

        <!--Start of Profile Modal-->

        <!-- Modal -->
        <div class="modal fade" id="profile-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">
                        <h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <%--<%=user.getProfile()%>--%>
                            <img src="pics/<%=user.getProfile()%>" class="img-fluid" style="border-radius:50%; max-width: 150px;">
                            <h5 class="modal-title" id="exampleModalLabel"><%=user.getName()%></h5>
                            <!--//Details-->
                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID :</th>
                                            <td><%=user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email :</th>
                                            <td><%=user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender :</th>
                                            <td><%=user.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Status :</th>
                                            <td><%=user.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Registered On :</th>
                                            <td><%=user.getDateTime().toString()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!--Profile Edit-->
                            <div id="profile-edit" style="display: none;">
                                <h3 class="mt-3">Please Edit Carefully</h3>
                                <form action="EditServlet" method="POST" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID :</td>
                                            <td><%=user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email :</td>
                                            <td><input type="email" class="form-control" name="user_email" value="<%=user.getEmail()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td><input type="text" class="form-control" name="user_name" value="<%=user.getName()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Password :</td>
                                            <td><input type="password" class="form-control" name="user_password" value="<%=user.getPassword()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Gender :</td>
                                            <td><%=user.getGender().toUpperCase()%></td>
                                        </tr>
                                        <tr>
                                            <td>About :</td>
                                            <td>
                                                <textarea class="form-control" id="user_about" name="user_about" rows="3"><%=user.getAbout()%></textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Update Profile Picture :</td>
                                            <td>
                                                <input type="file" name="user_profile" class="form-control">
                                            </td>
                                        </tr>

                                    </table>

                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>

                                </form>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>


        <!--End of Profile Modal-->

        <!--Start Write Post Modal-->


        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Blog Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">


                        <form id="add-post-form" action="AddPostServlet" method="POST">


                            <div class="form-group">
                                <label>Select category</label><br>
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select category---</option>
                                    <%
                                        PostDao pDao = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = pDao.getAllCategories();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%=c.getCid()%>"><%=c.getName()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>


                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Blog Title" class="form-control"/>
                            </div>

                            <div class="form-group">
                                <textarea name="pContent" class="form-control" style="height: 200px;" placeholder="Blog Content"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="pCode" class="form-control" style="height: 200px;" placeholder="Program Code if any"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Select Picture</label><br>
                                <input type="file" name="pPic">
                            </div>
                                
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-outline-primary">Post</button>
                                </div>
                                
                        </form>




                    </div>
                    
                </div>
            </div>
        </div>


        <!--End Write Post Modal-->

        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

        <script>
            $(document).ready(function () {
                let editStatus = false;
                $('#edit-profile-button').click(function () {
                    if (editStatus == false) {
                        $("#profile-details").hide();
                        $("#profile-edit").show();
                        editStatus = true;
                        $(this).text("Back");
                    } else {
                        $("#profile-details").show();
                        $("#profile-edit").hide();
                        editStatus = false;
                        $(this).text("Edit");
                    }
                });
            });
        </script>

        <!--Now Add Post JS-->
        <script>
            $(document).ready(function () {
                //
                $("#add-post-form").on("submit", function (event) {
                    //This Code will get executed when form submitted..
                    event.preventDefault();
                    console.log("You CLicked on Post Button");

                    let form = new FormData(this);

                    //Now Requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //Success
                            console.log(data);
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //Error
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>

    </body>
</html>
