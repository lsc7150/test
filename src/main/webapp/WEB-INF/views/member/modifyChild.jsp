<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:url var='root' value='/' />
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Needs
	================================================== -->
<meta charset="UTF-8">
<title>:: 자녀 정보 수정 ::</title>

<!-- Mobile Specific Metas
	================================================== -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Construction Html5 Template">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
<meta name="author" content="Themefisher">
<meta name="generator"
	content="Themefisher Educenter HTML Template v1.0">

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
	<!-- preloader start -->
	<div class="preloader">
		<img src="images/preloader.gif" alt="preloader">
	</div>
	<!-- preloader end -->

	<!-- ===============================  header  =============================== -->
	<c:import url="/WEB-INF/views/include/header.jsp" />
	<!-- ===============================  header  =============================== -->

	<!-- page title -->
	<section class="page-title-section overlay"
		data-background="images/backgrounds/page-title.jpg">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<ul class="list-inline custom-breadcrumb mb-2">
						<li class="list-inline-item"><a
							class="h2 text-primary font-secondary">Home</a></li>
						<li class="list-inline-item text-white h3 font-secondary nasted">정보
							수정</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<!-- /page title -->


	<!-- insert section -->
	<section class="section">
		<div class="container">
			<h3 class="text-center">자녀 정보 수정</h3>
			<hr>
			<div class="row justify-content-center">
				<div>
					<form:form action="${root}member/modifyChild_pro" method="post"
						modelAttribute="modifyChildBean">
						<form:hidden path="m_memberNo" />
						<div>
							<form:label path="c_name">학생이름</form:label>
							<form:input path="c_name" readonly="true" />
						</div>
						<div>
							<form:label path="c_grade">학년</form:label>
							<form:input path="c_grade" />
						</div>
						<div>
							<form:label path="c_gender">성별</form:label>
							<form:input path="c_gender" />
						</div>
						<div>
							<form:label path="c_level">학업수준</form:label>
							<form:input path="c_level" />
						</div>
						
						<div class="text-center">
							<form:button type="submit" class="btn btn-primary">수정하기</form:button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</section>
	<!-- modify section -->

	<!-- ===============================  footer  =============================== -->
	<c:import url="/WEB-INF/views/include/footer.jsp" />
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU"></script>
	<script src="plugins/google-map/gmap.js"></script>

	<!-- Main Script -->
	<script src="js/script.js"></script>
</body>
</html>