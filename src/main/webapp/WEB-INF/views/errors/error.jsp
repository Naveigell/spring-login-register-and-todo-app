<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/assets/css/error.css" var="errorCss" />
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>404 HTML Template by Colorlib</title>

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Fredoka+One" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Raleway:400,700" rel="stylesheet">
        <link href="${errorCss}" rel="stylesheet"/>
    </head>
    <body>
        <div id="notfound">
            <div class="notfound">
                <div class="notfound-404">
                    <h1>${status}</h1>
                </div>
                <h2>${message}</h2>
<%--                <form class="notfound-search">--%>
<%--                    <input type="text" placeholder="Search..."/>--%>
<%--                    <button type="button">Search</button>--%>
<%--                </form>--%>
                <core:choose>
                    <core:when test="${status.equals(\"403\")}">
                        <br/>
                        <a href="/login-register"><span class="arrow"></span>Return To Login Page</a>
                    </core:when>
                </core:choose>
            </div>
        </div>
    </body>
</html>