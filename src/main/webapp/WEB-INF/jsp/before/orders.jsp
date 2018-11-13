<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html; charset=utf-8" %>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="/static/image/favicon.png" type="image/png">
    <title>Royal Hotel</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/static/css/bootstrap.css">
    <link rel="stylesheet" href="/static/vendors/linericon/style.css">
    <link rel="stylesheet" href="/static/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="/static/vendors/nice-select/css/nice-select.css">
    <link rel="stylesheet" href="/static/vendors/owl-carousel/owl.carousel.min.css">
    <!-- main css -->
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="/static/css/responsive.css">
</head>
<body>
<!--================Header Area =================-->
<header class="header_area">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light">
            <!-- Brand and toggle get grouped for better mobile display -->
            <a class="navbar-brand logo_h" href="/static/index.html"><img src="/static/image/Logo.png" alt=""></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                <ul class="nav navbar-nav menu_nav ml-auto">
                    <li class="nav-item "><a class="nav-link" href="/web/index">主页</a></li>
                    <c:if test="${empty sessionScope.user}">
                        <li class="nav-item"><a class="nav-link" href="/web/tologin?type=1">登陆</a></li>
                        <li class="nav-item"><a class="nav-link" href="/web/tologin?type=0">注册</a></li>
                    </c:if>
                    <c:if test="${!empty sessionScope.user}">
                        <li class="nav-item active"><a class="nav-link" href="/web/orders">我的订单</a></li>
                    </c:if>
                </ul>
            </div>
        </nav>
    </div>
</header>
<!--================Header Area =================-->

<!--================Breadcrumb Area =================-->
<section class="breadcrumb_area">
    <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
    <div class="container">
        <div class="page-cover text-center">
            <h2 class="page-cover-tittle">我的订单</h2>
            <ol class="breadcrumb">
                <li><a href="/static/index.html">主页</a></li>
                <li class="active">我的订单</li>
            </ol>
        </div>
    </div>
</section>
<!--================Breadcrumb Area =================-->
<!--================ Testimonial Area  =================-->
<section class="testimonial_area section_gap">
    <div class="container">

        <table>


            <tr>
            <td style="width: 200px"></td>
            <td style="width: 180px">房间号</td>
            <td style="width: 180px">单价</td>
            <td style="width: 180px">床型</td>
            <td style="width: 180px">入驻人</td>
            <td style="width: 180px">下单时间</td>
            </tr>
            <c:forEach items="${orderList}" var="order">
                        <tr>
                            <td>
                                <img src="${order.room.image}" style="    width: 150px;height: 120px;">
                            </td>
                            <td>${order.room.name}</td>
                            <td>￥<font color="red">${order.room.price}</font></td>
                            <td>
                                <c:if test="${order.room.category eq 1}">精品单人床</c:if>
                                <c:if test="${order.room.category eq 2}">豪华双人床</c:if>
                                <c:if test="${order.room.category eq 3}">豪华单人床</c:if>
                            </td>
                            <td>
                                    ${order.user.realname}
                            </td>
                            <td>
                                    <fmt:formatDate value="${order.time}" pattern="yyyy-MM-dd HH:mm:ss"/>
                            </td>
                        </tr>
            </c:forEach>
        </table>

    </div>
</section>
<!--================ start footer Area  =================-->
<footer class="footer-area section_gap">
    <div class="container">

        <div class="row footer-bottom d-flex justify-content-between align-items-center">
            <p class="col-lg-8 col-sm-12 footer-text m-0">
                版权所有 &copy;
                <script>document.write(new Date().getFullYear());</script>

            </p>
            <div class="col-lg-4 col-sm-12 footer-social">
                <a href="/static/#"><i class="fa fa-facebook"></i></a>
                <a href="/static/#"><i class="fa fa-twitter"></i></a>
                <a href="/static/#"><i class="fa fa-dribbble"></i></a>
                <a href="/static/#"><i class="fa fa-behance"></i></a>
            </div>
        </div>
    </div>
</footer>
<!--================ End footer Area  =================-->


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="/static/js/jquery-3.2.1.min.js"></script>
<script src="/static/js/popper.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/vendors/owl-carousel/owl.carousel.min.js"></script>
<script src="/static/js/jquery.ajaxchimp.min.js"></script>
<script src="/static/vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.js"></script>
<script src="/static/vendors/nice-select/js/jquery.nice-select.js"></script>
<script src="/static/js/mail-script.js"></script>
<script src="/static/js/stellar.js"></script>
<script src="/static/vendors/lightbox/simpleLightbox.min.js"></script>
<script src="/static/js/custom.js"></script>
</body>
</html>