<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url var='root' value='/'/> 
<!DOCTYPE html>
<html lang="ko">
<head>

  <!-- Basic Page Needs
   ================================================== -->
  <meta charset="utf-8">
  <title>askBoard</title>

  <!-- Mobile Specific Metas
   ================================================== -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="Construction Html5 Template">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
  <meta name="author" content="Themefisher">
  <meta name="generator" content="Themefisher Educenter HTML Template v1.0">

  <!-- ** Plugins Needed for the Project ** -->
  <!-- Bootstrap -->
  <link rel="stylesheet" href="plugins/bootstrap/bootstrap.min.css">
  <!-- slick slider -->
  <link rel="stylesheet" href="plugins/slick/slick.css">
  <!-- themefy-icon -->
  <link rel="stylesheet" href="plugins/themify-icons/themify-icons.css">
  <!-- animation css -->
  <link rel="stylesheet" href="plugins/animate/animate.css">
  <!-- aos -->
  <link rel="stylesheet" href="plugins/aos/aos.css">
  <!-- venobox popup -->
  <link rel="stylesheet" href="plugins/venobox/venobox.css">

  <!-- Main Stylesheet -->
  <link href="css/style.css" rel="stylesheet">

  <!--Favicon-->
  <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
  <link rel="icon" href="images/favicon.png" type="image/x-icon">

</head>

<body>

<!-- ===============================  header  =============================== -->
   <c:import url="/WEB-INF/views/include/header.jsp"/>
<!-- ===============================  header  =============================== -->

<!-- page title -->
<section class="page-title-section overlay" data-background="images/backgrounds/page-title.jpg">
  <div class="container">
    <div class="row">
      <div class="col-md-8">
        <ul class="list-inline custom-breadcrumb mb-2">
          <li class="list-inline-item"><a class="h2 text-primary font-secondary" href="index">Home</a></li>
          <li class="list-inline-item text-white h3 font-secondary nasted">????????????</li>
          <li class="list-inline-item text-white h3 font-secondary nasted">????????????</li>
        </ul>
      </div>
    </div>
  </div>
</section>
<!-- /page title -->

<!-- contact -->
<section class="section bg-gray">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <h2 class="section-title">????????????</h2>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-7 mb-4 mb-lg-0">
        <form:form action="${root }serviceBoard/siteAcaAskWrite_pro" method="POST"  modelAttribute="aaWriteBean"
        enctype="multipart/form-data">
        <form:hidden path="a_memberNo" value="${sessionScope.loginAcademyMemberBean.a_memberNo }" />
          <form:input class="form-control mb-3" path="a_id" value="${sessionScope.loginAcademyMemberBean.a_id }" readonly="true" />
         </form:form> 
          
       <form:form action="${root }serviceBoard/siteAcaAskWrite_pro" method="POST"  modelAttribute="aaWriteBean"
        enctype="multipart/form-data">   
          <form:input class="form-control mb-3" path="a_name" readonly="true" />
          <form:input class="form-control mb-3" path="a_tele" readonly="true"  />
          <form:input class="form-control mb-3" path="aa_title" placeholder="??????" />
          <form:textarea path="aa_contents" class="form-control mb-3" placeholder="????????????" ></form:textarea>
          <form:input type="file" class="form-control mb-3" path="upload_file" placeholder="????????????" accept="image/*"/>
          <form:button type="submit" class="btn btn-primary" >????????????</form:button>
        </form:form>
      </div>
    
      <div class="col-lg-5">
      	<div class="section-img">
        <h3><img class="content-img" src="images/icon/icons1.png"> ??????????????????</h3> <p class="mb-5"> <a href="#">??????09:00 ~ ??????06:00</a><br />
        <h3><img class="content-img" src="images/icon/icons2.png"> ????????????</h3>   <p class="mb-5"><a href="tel:+8802057843248"> 02-1234-5678</a></p>
        <h3><img class="content-img" src="images/icon/icons3.png"> Email</h3> <p class="mb-5"><a href="mailto:yourmail@email.com">skycastle@naver.com</a>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- /contact -->

<!-- ===============================  footer  =============================== -->
 <c:import url="/WEB-INF/views/include/footer.jsp"/>
<!-- ===============================  footer  =============================== -->


<!-- jQuery -->
<script src="plugins/jQuery/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script src="plugins/bootstrap/bootstrap.min.js"></script>
<!-- slick slider -->
<script src="plugins/slick/slick.min.js"></script>
<!-- aos -->
<script src="plugins/aos/aos.js"></script>
<!-- venobox popup -->
<script src="plugins/venobox/venobox.min.js"></script>
<!-- filter -->
<script src="plugins/filterizr/jquery.filterizr.min.js"></script>
<!-- google map -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU"></script>
<script src="plugins/google-map/gmap.js"></script>

<!-- Main Script -->
<script src="js/script.js"></script>

</body>
</html>