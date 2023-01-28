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
  <title> :: My Page ::</title>

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
  <!-- Mypage CSS -->
  <link href="css/mypagemenu.css" rel="stylesheet">
  <!--Favicon-->
  <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
  <link rel="icon" href="images/favicon.png" type="image/x-icon">

</head>

<body>
  <!-- preloader start -->
  <div class="preloader">
    <img src="images/preloader.gif" alt="preloader">
  </div>
  <!-- preloader end -->

<!-- ===============================  header  =============================== -->
   <c:import url="/WEB-INF/views/include/header.jsp"/>
<!-- ===============================  header  =============================== -->
<!-- page title -->
<section class="page-title-section overlay" data-background="images/backgrounds/page-title.jpg">
  <div class="container">
    <div class="row">
      <div class="col-md-8">
        <ul class="list-inline custom-breadcrumb mb-2">
          <li class="list-inline-item"><a class="h2 text-primary font-secondary" href="${root}index">Home</a></li>
          <li class="list-inline-item text-white h3 font-secondary nasted">My Page</li>
        </ul>
      </div>
    </div>
  </div>
</section>
<!-- /page title -->

<!-- side menu nav -->
<div class="container">
      <div class="row">
        <div class="col-sm-12 text-center">
          <ul class="list-inline text-center">
            <li class="list-inline-item"><a class="d-inline-block p-2" href="${root}academymember/my_academypage"><h4>학원 정보</h4></a></li>
            <li class="list-inline-item"><a class="d-inline-block p-2" href="${root}academymember/academyinfo"><h4>학원 소개</h4></a></li>
            <li class="list-inline-item"><a class="d-inline-block p-2" href="${root}academymember/academyteacher"><h4>학원 강사 조회</h4></a></li>
			<li class="list-inline-item"><a class="d-inline-block p-2" href="${root}academymember/academypay"><h4>결제 내역 조회</h4></a></li>     
            <li class="list-inline-item"><a class="d-inline-block p-2" href="${root}academymember/mypage_siteAcaAsk"><h4>내 문의사항</h4></a></li>
            <li class="list-inline-item"><a class="d-inline-block p-2" href="${root}academymember/academyBlacklist"><h4>블랙리스트 등록 조회</h4></a></li>
          </ul>
        </div>
      </div>
    </div>

<!-- academy member modify -->   
<section class="section">
<div class="container">
<h3 class="text-center">학원 정보</h3><hr>
<div class="row justify-content-center">
<div>
	<form:form action="${root}academymember/modify_pro" method="post" modelAttribute="modifyAcademyMemberBean">
		<form:hidden path="a_memberNo"/>
		<table class="center">
		<tr>
			<td class="text-left"><strong>아이디 :</strong></td>
			<td class="text-center">${modifyAcademyMemberBean.a_id}</td>
		</tr>
		<tr>
			<td class="text-left"><strong>이름 :</strong></td>
			<td class="text-center">${modifyAcademyMemberBean.a_name}</td>
		</tr>
		<tr>
			<td class="text-left"><strong>지역(동까지) :</strong></td>
			<td class="text-center">${modifyAcademyMemberBean.a_location}</td>
		</tr>
		<tr>
			<td class="text-left"><strong>상세주소 :</strong></td>
			<td class="text-center">${modifyAcademyMemberBean.a_locationDetail}</td>
		</tr>
		<tr>
			<td class="text-left"><strong>학원대표전화번호 :</strong></td>
			<td class="text-center">${modifyAcademyMemberBean.a_tele}</td>
		</tr>
		<tr>
			<td class="text-left"><strong>1종합2단과3예체능</strong></td>
			<td class="text-center">${modifyAcademyMemberBean.a_classify}</td>
		</tr> <!-- 스크립트 이용해서 번호를 종합,단과,예체능으로 변환 필요. -->
		</table>
	</form:form>
		<hr>
		<div class="text-center">	
	<a href="${root }academymember/modify?a_memberNo=${sessionScope.loginAcademyMemberBean.a_memberNo}" class="btn btn-primary text-center">학원정보수정</a>
	<a href="${root }academymember/delete?a_memberNo=${sessionScope.loginAcademyMemberBean.a_memberNo}" class="btn btn-danger text-center">회원탈퇴</a>
	</div>
	</div>
	</div>
	</div>
	</section>
	<!-- / user info -->
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