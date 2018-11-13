<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="/static/vendors/owl-carousel/owl.carousel.min.css">
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
                    <li class="nav-item active"><a class="nav-link" href="/web/index">主页</a></li>
                   <c:if test="${empty sessionScope.user}">
                       <li class="nav-item"><a class="nav-link" href="/web/tologin?type=1">登陆</a></li>
                       <li class="nav-item"><a class="nav-link" href="/web/tologin?type=0">注册</a></li>
                   </c:if>
                    <c:if test="${!empty sessionScope.user}">
                        <li class="nav-item"><a class="nav-link" href="/web/orders?uid=${sessionScope.user.id}">我的订单</a></li>
                    </c:if>
                </ul>
            </div>
        </nav>
    </div>
</header>
<!--================Header Area =================-->

<!--================Banner Area =================-->
<section class="banner_area">
    <div class="booking_table d_flex align-items-center">
        <div class="overlay bg-parallax" data-stellar-ratio="0.9" data-stellar-vertical-offset="0"
             data-background=""></div>
        <div class="container">
            <div class="banner_content text-center">

                <h2>远离单调的生活</h2>
                <p>在这里寻找理想的住所<br> 享受健康的生活</p>

            </div>
        </div>
    </div>

</section>
<!--================Banner Area =================-->

<!--================ Accomodation Area  =================-->
<section class="accomodation_area section_gap">
    <div class="container">
        <div class="section_title text-center">
            <h2 class="title_color">酒店住宿</h2>
            <p>极致奢华 尊贵享受 </p>
        </div>
        <div class="row mb_30">
           <c:forEach items="${roomList}" var="room">
               <div class="col-lg-3 col-sm-6">
                   <div class="accomodation_item text-center">
                       <div class="hotel_img">
                           <img src="${room.image}" alt="" style="height: 270px;width: 263px">
                          <c:if test="${room.status eq 0}">
                              <a href="javascript:;" onclick="bookRoom(${room.id})" class="btn theme_btn button_hover">立即 预定</a>
                          </c:if>
                           <c:if test="${room.status eq 1}">
                               <a href="javascript:;" class="btn theme_btn " style="background: grey">已被 预定</a>
                           </c:if>
                       </div>
                       <a href="javascript:;"><h4 class="sec_h4">
                           <c:if test="${room.category eq 1}">精品单人床</c:if>
                           <c:if test="${room.category eq 2}">精致双人床</c:if>
                           <c:if test="${room.category eq 3}">豪华单人床</c:if>

                       </h4></a>
                       <h5>￥${room.price}
                           <small>/天</small>
                       </h5>
                   </div>
               </div>
           </c:forEach>
        </div>
    </div>
</section>
<!--================ Accomodation Area  =================-->

<!--================ Facilities Area  =================-->
<section class="facilities_area section_gap">
    <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background="">
    </div>
    <div class="container">
        <div class="section_title text-center">
            <h2 class="title_w">配套设施</h2>
            <p>方便遍历</p>
        </div>
        <div class="row mb_30">
            <div class="col-lg-4 col-md-6">
                <div class="facilities_item">
                    <h4 class="sec_h4"><i class="lnr lnr-dinner"></i>餐厅</h4>
                    <p>这个有餐厅</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="facilities_item">
                    <h4 class="sec_h4"><i class="lnr lnr-bicycle"></i>体育俱乐部</h4>
                    <p>这个有俱乐部</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="facilities_item">
                    <h4 class="sec_h4"><i class="lnr lnr-shirt"></i>游泳池</h4>
                    <p>这个有游泳池</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="facilities_item">
                    <h4 class="sec_h4"><i class="lnr lnr-car"></i>出租车</h4>
                    <p>这个有出租车</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="facilities_item">
                    <h4 class="sec_h4"><i class="lnr lnr-construction"></i>网络</h4>
                    <p>这个有网络</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="facilities_item">
                    <h4 class="sec_h4"><i class="lnr lnr-coffee-cup"></i>酒吧</h4>
                    <p>这个有酒吧</p>
                </div>
            </div>
        </div>
    </div>
    <div class="tlinks">Collect from <a href="/static/http://www.cssmoban.com/" title="网站模板">网站模板</a></div>
</section>
<!--================ Facilities Area  =================-->


<!--================ Testimonial Area  =================-->
<section class="testimonial_area section_gap">
    <div class="container">
        <div class="section_title text-center">
            <h2 class="title_color">来自我们客户的推荐</h2>
            <p>我们用心服务，给你极致体验 </p>
        </div>
        <div class="testimonial_slider owl-carousel">
            <div class="media testimonial_item">
                <img class="rounded-circle" src="/static/image/testtimonial-1.jpg" alt="">
                <div class="media-body">
                    <p>好极了！好极了！好极了！好极了！好极了！好极了！好极了！好极了！好极了！好极了！ </p>
                    <a href="/static/#"><h4 class="sec_h4">张三</h4></a>
                    <div class="star">
                        <a href="/static/#"><i class="fa fa-star"></i></a>
                        <a href="/static/#"><i class="fa fa-star"></i></a>
                        <a href="/static/#"><i class="fa fa-star"></i></a>
                        <a href="/static/#"><i class="fa fa-star"></i></a>
                        <a href="/static/#"><i class="fa fa-star-half-o"></i></a>
                    </div>
                </div>
            </div>
            <div class="media testimonial_item">
                <img class="rounded-circle" src="/static/image/testtimonial-1.jpg" alt="">
                <div class="media-body">
                    <p>好极了！好极了！好极了！好极了！好极了！好极了！好极了！好极了！好极了！好极了！ </p>
                    <a href="/static/#"><h4 class="sec_h4">张三</h4></a>
                    <div class="star">
                        <a href="/static/#"><i class="fa fa-star"></i></a>
                        <a href="/static/#"><i class="fa fa-star"></i></a>
                        <a href="/static/#"><i class="fa fa-star"></i></a>
                        <a href="/static/#"><i class="fa fa-star"></i></a>
                        <a href="/static/#"><i class="fa fa-star-half-o"></i></a>
                    </div>
                </div>
            </div>
            <div class="media testimonial_item">
                <img class="rounded-circle" src="/static/image/testtimonial-1.jpg" alt="">
                <div class="media-body">
                    <p>好极了！好极了！好极了！好极了！好极了！好极了！好极了！好极了！好极了！好极了！ </p>
                    <a href="/static/#"><h4 class="sec_h4">张三</h4></a>
                    <div class="star">
                        <a href="/static/#"><i class="fa fa-star"></i></a>
                        <a href="/static/#"><i class="fa fa-star"></i></a>
                        <a href="/static/#"><i class="fa fa-star"></i></a>
                        <a href="/static/#"><i class="fa fa-star"></i></a>
                        <a href="/static/#"><i class="fa fa-star-half-o"></i></a>
                    </div>
                </div>
            </div>
            <div class="media testimonial_item">
                <img class="rounded-circle" src="/static/image/testtimonial-1.jpg" alt="">
                <div class="media-body">
                    <p>好极了！好极了！好极了！好极了！好极了！好极了！好极了！好极了！好极了！好极了！ </p>
                    <a href="/static/#"><h4 class="sec_h4">张三</h4></a>
                    <div class="star">
                        <a href="/static/#"><i class="fa fa-star"></i></a>
                        <a href="/static/#"><i class="fa fa-star"></i></a>
                        <a href="/static/#"><i class="fa fa-star"></i></a>
                        <a href="/static/#"><i class="fa fa-star"></i></a>
                        <a href="/static/#"><i class="fa fa-star-half-o"></i></a>
                    </div>
                </div>
            </div>
            <div class="media testimonial_item">
                <img class="rounded-circle" src="/static/image/testtimonial-1.jpg" alt="">
                <div class="media-body">
                    <p>好极了！好极了！好极了！好极了！好极了！好极了！好极了！好极了！好极了！好极了！ </p>
                    <a href="/static/#"><h4 class="sec_h4">张三</h4></a>
                    <div class="star">
                        <a href="/static/#"><i class="fa fa-star"></i></a>
                        <a href="/static/#"><i class="fa fa-star"></i></a>
                        <a href="/static/#"><i class="fa fa-star"></i></a>
                        <a href="/static/#"><i class="fa fa-star"></i></a>
                        <a href="/static/#"><i class="fa fa-star-half-o"></i></a>
                    </div>
                </div>
            </div>



        </div>
    </div>
</section>
<!--================ Testimonial Area  =================-->


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
<script type="text/javascript">
    var isLogin = ${!empty sessionScope.user};
    function bookRoom(id) {
        if (isLogin) {
            if (confirm("是否确定预定？")){
                $.post("/web/book",{id:id},function (data) {
                    if (data.code == 200){
                        alert("预定成功！");
                        location.reload();
                    } else {
                        alert(data.message);
                    }
                })
            }
        }else {
            alert("需要登陆之后才能预定！点击跳转登陆");
            location.href="/web/tologin?type=1";
        }

    }
</script>
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="/static/js/jquery-3.2.1.min.js"></script>
<script src="/static/js/popper.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/vendors/owl-carousel/owl.carousel.min.js"></script>
<script src="/static/js/jquery.ajaxchimp.min.js"></script>
<script src="/static/js/mail-script.js"></script>
<script src="/static/vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.js"></script>
<script src="/static/vendors/nice-select/js/jquery.nice-select.js"></script>
<script src="/static/js/mail-script.js"></script>
<script src="/static/js/stellar.js"></script>
<script src="/static/vendors/lightbox/simpleLightbox.min.js"></script>
<script src="/static/js/custom.js"></script>
</body>
</html>