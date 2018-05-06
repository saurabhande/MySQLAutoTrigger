<%-- 
    Document   : index
    Created on : Mar 17, 2018, 4:23:06 PM
    Author     : LAPTOP
--%>

<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Object obj = session.getAttribute("sessionCredentials");
    HashMap<String, String> hasMap = new LinkedHashMap<String, String>();
    if (obj == null) {
        response.sendRedirect("login.jsp");
    } else {
        hasMap = (HashMap<String, String>) obj;
    }
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Expert Admin panel</title>
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
            <!-- partial:partials/_navbar.html -->
            <%@include file="navbar.jsp" %>
            <!-- partial -->
            <div class="container-fluid page-body-wrapper">
                <!-- partial:partials/_sidebar.html -->
                <%@include file="sidebar.jsp" %>
                <!-- partial -->
                <div class="main-panel">
                    <div class="content-wrapper">
                        <div class="row">
                            <div class="col-12 grid-margin">
                                <div class="card">
                                    <div class="card-body">
                                        <%
                                            String added = "";
                                            if (session.getAttribute("expert") != null) {
                                                added = (String) session.getAttribute("expert");
                                                if (added.contains("not")) {
                                                    added = "<strong>Expert Not Added!</strong> Please try again.";
                                                } else {
                                                    added = "<strong>Expert Added Successfully..</strong> ";
                                                }
                                                session.removeAttribute("expert");
                                        %>

                                        <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                            <%=added%>
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <%
                                            }
                                        %>
                                        <h4 class="card-title">Create Expert</h4>
                                        <form method="post"  enctype="multipart/form-data" action="CreateExpert" class="form-sample">

                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 col-form-label">Expert Name</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" class="form-control" id="expertName" name="expertName" placeholder="Name">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 col-form-label">Expert Country</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" class="form-control" id="expertCountry" name="expertCountry" placeholder="Country">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group row"> 
                                                        <label class="col-sm-3 col-form-label">Email address</label>
                                                        <div class="col-sm-9">
                                                            <input type="email" class="form-control" id="email" name="email" placeholder="Email">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group row"> 
                                                        <label class="col-sm-3 col-form-label">Password</label>
                                                        <div class="col-sm-9">
                                                            <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 col-form-label">Photo upload</label>
                                                        <div class="col-sm-9">
                                                            <div class="input-group col-xs-12">
                                                                <input type="file"  name="image" class="form-control file-upload-info" placeholder="Upload Photo">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 col-form-label">Trophies</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" class="form-control" id="trophies" name="trophies" placeholder="Trophies">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 col-form-label">Ranking</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" class="form-control" id="ranking" name="ranking" placeholder="Ranking">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 col-form-label">Rate/Hour</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" class="form-control" id="ratehour" name="ratehour" placeholder="Per Hour Rate">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 col-form-label">Biography</label>
                                                        <div class="col-sm-9">
                                                            <textarea class="form-control" id="biography" name="biography" rows="6"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <button type="submit" class="btn btn-success mr-2">Submit</button>
                                                        <button class="btn btn-light">Cancel</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
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
        <!-- Plugin js for this page-->
        <!-- End plugin js for this page-->
        <!-- inject:js -->
        <script src="js/off-canvas.js"></script>
        <script src="js/misc.js"></script>
        <!-- endinject -->
        <!-- Custom js for this page-->
        <!-- End custom js for this page-->
    </body>

</html>
