<%-- 
    Document   : login
    Created on : Mar 17, 2018, 4:22:33 PM
    Author     : LAPTOP
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>ExpertConnect</title>
        <!-- plugins:css -->
        <link rel="stylesheet" href="css/materialdesignicons.min.css">
        <link rel="stylesheet" href="css/simple-line-icons.css">
        <!-- endinject -->
        <!-- plugin css for this page -->
        <!-- End plugin css for this page -->
        <!-- inject:css -->
        <link rel="stylesheet" href="css/style.css">
        <!-- endinject -->
        <link rel="shortcut icon" href="images/favicon.png" />
    </head>

    <body>
        <div class="container-scroller">
            <div class="container-fluid page-body-wrapper full-page-wrapper">
                <div class="content-wrapper d-flex align-items-center auth login-full-bg">
                    <div class="row w-100">
                        <div class="col-lg-4 mx-auto">
                            <div class="auth-form-dark text-left p-5">
                                <h2>Login</h2>
                                <h4 class="font-weight-light">Hello! let's get started</h4>
                                <form  method="post"  action="LoginAdmin" name="form1" class="pt-5">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Username</label>
                                        <input name="username" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Username">
                                        <i class="mdi mdi-account"></i>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                        <i class="mdi mdi-eye"></i>
                                    </div>
                                    <div class="mt-5">
                                        <button class="btn btn-block btn-warning btn-lg font-weight-medium" href="index.html">Login</button>
                                    </div>
                                    <div class="mt-3 text-center">
                                        <button href="#" class="auth-link">Forgot password?</button>
                                    </div>
                                    <%
                                        if (request.getAttribute("invalid") != null) {
                                    %>

                                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                        <strong>Invalid Login!</strong> Please try again.
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <%
                                        }
                                    %>
                                </form>                  
                            </div>
                        </div>
                    </div>
                </div>
                <!-- content-wrapper ends -->
            </div>
            <!-- page-body-wrapper ends -->
        </div>
        <!-- container-scroller -->
        <!-- plugins:js -->
        <script src="js/jquery.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- endinject -->
        <!-- inject:js -->
        <script src="js/off-canvas.js"></script>
        <script src="js/misc.js"></script>
        <!-- endinject -->
    </body>

</html>

