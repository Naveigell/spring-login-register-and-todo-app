<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
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
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
        <style>
            .panel-table .panel-body{
                padding:0;
            }

            .panel-table .panel-body .table-bordered{
                border-style: none;
                margin:0;
            }

            .panel-table .panel-body .table-bordered > thead > tr > th:first-of-type {
                text-align:center;
                width: 100px;
            }

            .panel-table .panel-body .table-bordered > thead > tr > th:last-of-type,
            .panel-table .panel-body .table-bordered > tbody > tr > td:last-of-type {
                border-right: 0px;
            }

            .panel-table .panel-body .table-bordered > thead > tr > th:first-of-type,
            .panel-table .panel-body .table-bordered > tbody > tr > td:first-of-type {
                border-left: 0px;
            }

            .panel-table .panel-body .table-bordered > tbody > tr:first-of-type > td{
                border-bottom: 0px;
            }

            .panel-table .panel-body .table-bordered > thead > tr:first-of-type > th{
                border-top: 0px;
            }

            .panel-table .panel-footer .pagination{
                margin:0;
            }

            /*
            used to vertically center elements, may need modification if you're not using default sizes.
            */
            .panel-table .panel-footer .col{
                line-height: 34px;
                height: 34px;
            }

            .panel-table .panel-heading .col h3{
                line-height: 30px;
                height: 30px;
            }

            .panel-table .panel-body .table-bordered > tbody > tr > td{
                line-height: 34px;
            }

        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Navbar</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Dropdown
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#">Disabled</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <a class="nav-item" href="/logout">Logout</a>
                </form>
            </div>
        </nav>
        <div class="container d-flex justify-content-center" style="margin-top: 30px; width: 100%;">
            <div class="row">
                <p></p>
                <h1>Bootstrap Material Design TodoApp</h1> <br/>
                <p>A simple example of how-to create a simple todo app with login register with spring mvc.</p>
                <p></p>
                <p></p>

                <div class="col-md-12 col-md-offset-12">
                    <div class="panel panel-default panel-table">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col col-xs-6">
                                    <h3 class="panel-title">Panel Heading</h3>
                                </div>
                                <div class="col col-xs-6 text-right">
                                    <button type="button" class="btn btn-sm btn-primary btn-create" data-toggle="modal" data-target="#todoModalAdd">Create New</button>
                                </div>
                            </div>
                        </div>
                        <core:if test="${errors != null}">
                            <core:forEach items="${errors}" var="error">
                                <div class="alert alert-danger">${error.key} ${error.value}</div>
                            </core:forEach>
                        </core:if>
                        <core:if test="${successMessage != null}">
                            <div class="alert alert-success">${successMessage}</div>
                        </core:if>
                        <core:if test="${errorMessage != null}">
                            <div class="alert alert-success">${errorMessage}</div>
                        </core:if>
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-list">
                                <thead>
                                    <tr>
                                        <th class="" style="width: 20%;">
                                            <em class="fa fa-cog"></em>
                                        </th>
                                        <th class="hidden-xs">Number</th>
                                        <th class="">Title</th>
                                        <th class="">Description</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <core:forEach items="${todos}" var="todo" varStatus="loop">
                                        <tr>
                                            <td align="center" style="width: 20%;" class="">
                                                <a href="/todo/${todo.getId()}/edit" class="btn btn-default btn-md">
                                                    <em class="fa fa-pencil"></em>
                                                </a>
                                                <a href="/todo/${todo.getId()}/delete" class="btn btn-danger btn-md">
                                                    <em class="fa fa-trash"></em>
                                                </a>
                                            </td>
                                            <td class="hidden-xs">${loop.index + 1}</td>
                                            <td class="">${todo.getTitle()}</td>
                                            <td class="">${todo.getDescription()}</td>
                                        </tr>
                                    </core:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="todoModalAdd" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">New Todo</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="/todo/create" method="post">
                            <security:csrfInput/>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="title" class="col-form-label">Title:</label>
                                    <input type="text" name="title" class="form-control" id="title">
                                </div>
                                <div class="form-group">
                                    <label for="description" class="col-form-label">Description:</label>
                                    <textarea class="form-control" name="description" id="description" style="resize: none; height: 200px;"></textarea>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Save</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="/resources/assets/js/jquery.min.js"></script>
        <script src="/resources/assets/js/bootstrap.min.js"></script>
        <script src="/resources/assets/js/mdb.min.js"></script>
        <script>
            // $("#exampleModal").modal("toggle");
        </script>
    </body>
</html>