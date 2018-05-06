

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Star Admin Free Bootstrap-4 Admin Dashboard Template</title>
        <!-- plugins:css -->
        <link rel="stylesheet" href="css/materialdesignicons.min.css">
        <link rel="stylesheet" href="css/simple-line-icons.css">
        <!-- endinject -->
        <!-- inject:css -->
        <link rel="stylesheet" href="css/style.css">
        <!-- endinject -->
        <link rel="shortcut icon" href="images/favicon.png" />
    </head>

    <body>

        <div class="container-scroller">
            <!-- partial:partials/_navbar.html -->
            <%@include file="navbar.jsp" %>
            <!-- partial -->
            <div class="container-fluid page-body-wrapper">
                <!-- partial:partials/_sidebar.html -->
                <%@include file="sidebar.jsp" %>
                <!-- partial -->
                <div class="main-panel">
                    <div class="container-scroller">
                        <div class="container-fluid page-body-wrapper full-page-wrapper">
                            <div class="content-wrapper d-flex align-items-center text-center error-page bg-primary">
                                <div class="row flex-grow">
                                    <div class="col-lg-7 mx-auto text-white">
                                        <div class="row align-items-center d-flex flex-row">
                                            <div class="col-lg-6 text-lg-right pr-lg-4">
                                                <h3 class="display-1 mb-0">About Us</h1>
                                            </div>
                                            <div class="col-lg-6 error-page-divider text-lg-left pl-lg-4">
                                                <h4 class="font-weight-light">${aboutus}</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- content-wrapper ends -->
                        </div>
                        <!-- page-body-wrapper ends -->
                    </div>
                    <!-- content-wrapper ends -->
                    <!-- partial:partials/_footer.html -->
                    <%@include file="footer.jsp"  %>
                    <!-- partial -->
                </div>
                <!-- main-panel ends -->
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
