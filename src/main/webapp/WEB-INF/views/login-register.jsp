<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<spring:url value="/resources/assets/css/bootstrap.min.css" var="bootstrap" />
<spring:url value="/resources/assets/css/mdb.min.css" var="mdb" />
<spring:url value="/resources/assets/icons/css/all.min.css" var="all" />
<spring:url value="/resources/assets/icons/css/brands.min.css" var="brands" />
<spring:url value="/resources/assets/icons/css/fontawesome.min.css" var="fontAwesome" />
<html>
<head>
    <link href="${bootstrap}" rel="stylesheet" />
    <link href="${mdb}" rel="stylesheet" />
    <link href="${all}" rel="stylesheet" />
    <link href="${brands}" rel="stylesheet" />
    <link href="${fontAwesome}" rel="stylesheet" />
    <style>
        .login-container{
            margin-top: 5%;
            margin-bottom: 5%;
        }
        .login-form-1{
            padding: 5%;
            box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
        }
        .login-form-1 h3{
            text-align: center;
            color: #333;
        }
        .login-form-2{
            padding: 5%;
            background: #0062cc;
            /*background: #ff508e;*/
            box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
        }
        .login-form-2 h3{
            text-align: center;
            color: #fff;
        }
        .login-container form{
            padding: 10%;
        }
        .btnSubmit
        {
            width: 50%;
            border-radius: 1rem;
            padding: 1.5%;
            border: none;
            cursor: pointer;
        }
        .login-form-1 .btnSubmit{
            font-weight: 600;
            color: #fff;
            background-color: #0062cc;
        }
        .login-form-2 .btnSubmit{
            font-weight: 600;
            color: #0062cc;
            background-color: #fff;
        }
        .login-form-2 .ForgetPwd{
            color: #fff;
            font-weight: 600;
            text-decoration: none;
        }
        .login-form-1 .ForgetPwd{
            color: #0062cc;
            font-weight: 600;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="container login-container">
    <div class="row">
        <div class="col-md-6 login-form-1">
            <h3>Login Form</h3>
            <form action="/login" method="post">
                <sec:csrfInput/>
                <div class="form-group">
                    <input type="text" name="email" class="form-control" placeholder="Your Email *" value="aruna_rosa400@yahoo.co.id" />
                </div>
                <div class="form-group">
                    <input type="password" name="password" class="form-control" placeholder="Your Password *" value="123456" />
                </div>
                <core:if test="${loginMessage != null}">
                    <div class="form-group">
                        <span class="text-danger">${loginMessage}</span>
                    </div>
                </core:if>
                <div class="form-group">
                    <input type="submit" class="btnSubmit" value="Login" />
                </div>
                <div class="form-group">
                    <a href="#" class="ForgetPwd">Forget Password?</a>
                </div>
            </form>
        </div>
        <div class="col-md-6 login-form-2">
            <h3>Register Form</h3>
            <form method="post" action="/register">
                <sec:csrfInput/>
                <div class="form-group">
                    <input type="text" class="form-control" name="username" placeholder="Your Username *" value="" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="email" placeholder="Your Email *" value="" />
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="password" placeholder="Your Password *" value="" />
                </div>
                <core:if test="${errors != null}">
                    <core:forEach items="${errors}" var="error">
                        <div class="alert alert-danger">${error.value}</div>
                    </core:forEach>
                </core:if>
                <div class="form-group">
                    <input type="submit" class="btnSubmit" value="Register" />
                </div>
                <div class="form-group">
                    <a href="#" class="ForgetPwd" value="Login">Forget Password?</a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>