<%-- 
    Document   : nav
    Created on : Mar 17, 2018, 6:03:33 PM
    Author     : LAPTOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
        <li class="nav-item"><a class="nav-link" href="index.jsp"><img class="menu-icon" src="images/menu_icons/01.png" alt="menu icon"><span class="menu-title">Dashboard</span></a></li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#expert-pages" aria-expanded="false" aria-controls="expert-pages"> <img class="menu-icon" src="images/menu_icons/08.png" alt="menu icon"> <span class="menu-title">Expert</span><i class="menu-arrow"></i></a>
            <div class="collapse" id="expert-pages">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link" href="createexpert.jsp">Create Expert</a></li>
                    <li class="nav-item"> <a class="nav-link" href="updateexpert.jsp">Update Expert</a></li>
                    <li class="nav-item"> <a class="nav-link" href="deleteExpert.jsp">Delete Expert</a></li>
                    <li class="nav-item"> <a class="nav-link" href="viewExpert.jsp">View Expert</a></li>
                </ul>
            </div>
        </li>
        <li class="nav-item"><a class="nav-link" href="notification.jsp"><img class="menu-icon" src="images/menu_icons/02.png" alt="menu icon"><span class="menu-title">Notification</span></a></li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#general-pages" aria-expanded="false" aria-controls="general-pages"> <img class="menu-icon" src="images/menu_icons/08.png" alt="menu icon"> <span class="menu-title">Categories</span><i class="menu-arrow"></i></a>
            <div class="collapse" id="general-pages">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link" href="todaystar.jsp">Today's Star</a></li>
                    <li class="nav-item"> <a class="nav-link" href="gameLegends.jsp">Game Legends</a></li>
                    <li class="nav-item"> <a class="nav-link" href="celebcouches.jsp">Celebrity Coaches</a></li>
                    <li class="nav-item"> <a class="nav-link" href="fitnessexperts.jsp">Fitness Experts</a></li>
                    <li class="nav-item"> <a class="nav-link" href="collegeounsellor.jsp">World Class College Counsellors</a></li>
                </ul>
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#other-pages" aria-expanded="false" aria-controls="other-pages"> <img class="menu-icon" src="images/menu_icons/08.png" alt="menu icon"> <span class="menu-title">Other Details</span><i class="menu-arrow"></i></a>
            <div class="collapse" id="other-pages">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link" href="genre.jsp">Genre</a></li>
                    <li class="nav-item"> <a class="nav-link" href="payments.jsp">Payments</a></li>
                    <li class="nav-item"> <a class="nav-link" href="subscription.jsp">Subscriptions</a></li>
                    <li class="nav-item"> <a class="nav-link" href="appointments.jsp">Appointments</a></li>
                </ul>
            </div>
        </li>
        <li class="nav-item"><a class="nav-link" href="support.jsp"><img class="menu-icon" src="images/menu_icons/03.png" alt="menu icon"><span class="menu-title">Customer Support</span></a></li>
        <li class="nav-item"><a class="nav-link" href="feedback.jsp"><img class="menu-icon" src="images/menu_icons/04.png" alt="menu icon"><span class="menu-title">Feedback</span></a></li>
        <li class="nav-item"><a class="nav-link" href="AboutUs"><img class="menu-icon" src="images/menu_icons/04.png" alt="menu icon"><span class="menu-title">About Us</span></a></li>
        <li class="nav-item"><a class="nav-link" href="ContactUs"><img class="menu-icon" src="images/menu_icons/09.png" alt="menu icon"> <span class="menu-title">Contact Us</span></a></li>
    </ul>
</nav>
