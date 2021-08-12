<%-- 
    Document   : error_page
    Created on : Aug 7, 2021, 4:42:37 AM
    Author     : kajay002
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry! Something Went Wrong</title>
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
        <div class="container text-center">
            <img src="img/sampling.png" class="img-fluid fa-spin mt-2">
            <h3 class="display-3">Sorry! Something Went Wrong</h3>
            <%=exception %>
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">Home</a>
        </div>
    </body>
</html>
