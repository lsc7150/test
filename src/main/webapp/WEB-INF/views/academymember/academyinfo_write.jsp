<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:url var='root' value='/' />
<!DOCTYPE html>
<html lang="ko">
<head>

<!-- Basic Page Needs
   ================================================== -->
<meta charset="utf-8">
<title>SKYCASTLE</title>

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

	<!-- ===============================  header  =============================== -->
	<c:import url="/WEB-INF/views/include/header.jsp" />
	<!-- ===============================  header  =============================== -->

	<!-- page title -->
	<section class="page-title-section overlay"
		data-background="images/backgrounds/bg_pagetitle1.png">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<ul class="list-inline custom-breadcrumb mb-2">
						<li class="list-inline-item"><a
							class="h2 text-primary font-secondary"
							href="${root}academymember/my_academypage">My Page</a></li>
						<li class="list-inline-item text-white h3 font-secondary nasted">??????
							?????? ??????</li>

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
					<li class="list-inline-item"><a class="d-inline-block p-2"
						href="${root}academymember/my_academypage"><h4>?????? ??????</h4></a></li>
					<li class="list-inline-item"><a class="d-inline-block p-2"
						href="${root}academymember/academyinfo"><h4>?????? ??????</h4></a></li>
					<li class="list-inline-item"><a class="d-inline-block p-2"
						href="${root}academymember/academyBlacklist"><h4>??????????????? ??????</h4></a></li>
					<li class="list-inline-item"><a class="d-inline-block p-2"
						href="${root}academymember/academyaskboard"><h4>??? ????????????</h4></a></li>
				</ul>
			</div>
		</div>
	</div>


	<!--  -->
	<section class="section bg-gray">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="text-center">?????? ?????? ??????</h3>
					<hr>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-8 mb-5 mb-lg-0">
					<form:form action="${root}academymember/academyinfo_write_pro"
						method="post" modelAttribute="infoIntroduce"
						enctype="multipart/form-data">
						<form:hidden path="a_memberNo" value="${sessionScope.loginAcademyMemberBean.a_memberNo}"/>
						<form:input class="form-control mb-3" path="a_name"
							value="${sessionScope.loginAcademyMemberBean.a_name}"
							readonly="true" />
						<form:input class="form-control mb-3" path="a_id"
							value="${sessionScope.loginAcademyMemberBean.a_id}"
							readonly="true" />
						<form:input class="form-control mb-3" path="a_tele"
							value="${sessionScope.loginAcademyMemberBean.a_tele}"
							readonly="true" />
						<form:textarea path="a_introduce" class="form-control mb-3"
							placeholder="?????? ?????????"></form:textarea>
						<div class="text-center">
							<form:label path="a_gradeMin">
								<strong>?????? ?????? ?????? :</strong>
							</form:label>
							<form:select path="a_gradeMin">
								<form:option value="0" label="?????????" />
								<form:option value="1" label="???1" />
								<form:option value="2" label="???2" />
								<form:option value="3" label="???3" />
								<form:option value="4" label="???4" />
								<form:option value="5" label="???5" />
								<form:option value="6" label="???6" />
								<form:option value="7" label="???1" />
								<form:option value="8" label="???2" />
								<form:option value="9" label="???3" />
								<form:option value="10" label="???1" />
								<form:option value="11" label="???2" />
								<form:option value="12" label="???3" />
								<form:option value="13" label="????????????" />
							</form:select>
							&nbsp;&nbsp;


							<form:label path="a_gradeMax">
								<strong>?????? ?????? ?????? :</strong>
							</form:label>
							<form:select path="a_gradeMax">
								<form:option value="0" label="?????????" />
								<form:option value="1" label="???1" />
								<form:option value="2" label="???2" />
								<form:option value="3" label="???3" />
								<form:option value="4" label="???4" />
								<form:option value="5" label="???5" />
								<form:option value="6" label="???6" />
								<form:option value="7" label="???1" />
								<form:option value="8" label="???2" />
								<form:option value="9" label="???3" />
								<form:option value="10" label="???1" />
								<form:option value="11" label="???2" />
								<form:option value="12" label="???3" />
								<form:option value="13" label="????????????" />
							</form:select>
							&nbsp;&nbsp;

							<form:label path="a_shuttle">
								<strong>???????????? :</strong>
							</form:label>
							<form:select path="a_shuttle">
								<form:option value="y" label="???" />
								<form:option value="n" label="???" />
							</form:select>
							<br>
							<br>

							<form:label path="a_openTime">
								<strong>??????????????????</strong>
							</form:label>
							<form:select path="a_openTime">
								<form:option value="-" />
								<c:forEach var="i" begin="0" end="23">
									<c:forEach var="j" begin="0" end="1">
										<form:option value="${ i}:${ 30*j}" label="${ i}:${ 30*j}" />
									</c:forEach>
								</c:forEach>
							</form:select>

							<form:label path="a_closeTime">
								<strong>??????????????????</strong>
							</form:label>
							<form:select path="a_closeTime">
								<form:option value="-" />
								<c:forEach var="i" begin="0" end="23">
									<c:forEach var="j" begin="0" end="1">
										<form:option value="${ i}:${ 30*j}" label="${ i}:${ 30*j}" />
									</c:forEach>
								</c:forEach>
							</form:select>
						</div>
						<br>
						<br>
						<div>
							<form:label path="a_mainImg"><strong>?????? ?????????</strong></form:label>
							<form:input type="file" path="upload_file" accept="image/*" />
						</div>
						<div>
							<form:label path="a_file"><strong>?????? ?????????</strong></form:label>
							<form:input type="file" path="upload_file2" accept="image/*" />
						</div>
						<br>
						<br>
						<div class="text-center">
							<form:button type="submit" class="btn btn-primary">????????????</form:button>
						</div>
					</form:form>

				</div>
			</div>
		</div>
	</section>

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