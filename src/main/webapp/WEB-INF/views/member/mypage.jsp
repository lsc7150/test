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
<!-- Modal -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header border-bottom-0">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-title text-center">
						<h4>회원 로그인</h4>
					</div>
					<div class="d-flex flex-column text-center">
						<form>
							<div class="form-group">
								<input type="text" class="form-control" id="id" name="id"
									placeholder="ID">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" id="password"
									name="password" placeholder="Password">
							</div>
							<button type="button" class="btn btn-info btn-block btn-round"
								type="submit">로그인</button>
						</form>
						<div class="text-center text-muted delimiter">다른 계정으로 로그인</div>
						<div class="d-flex justify-content-center social-buttons">
							<button type="button" class="btn btn-secondary btn-round"
								data-toggle="tooltip" data-placement="top" title="Google">
								<i class="fab fa-google"></i>
							</button>
							<button type="button" class="btn btn-secondary btn-round"
								data-toggle="tooltip" data-placement="top" title="Facebook">
								<i class="fab fa-facebook"></i>
							</button>
							<button type="button" class="btn btn-secondary btn-round"
								data-toggle="tooltip" data-placement="top" title="twitter">
								<i class="fab fa-twitter"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 학원 로그인 -->
	<div class="modal fade" id="loginModal2" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header border-bottom-0">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-title text-center">
						<h4>학원 로그인</h4>
					</div>
					<div class="d-flex flex-column text-center">
						<form>
							<div class="form-group">
								<input type="text" class="form-control" id="id2" name="id2"
									placeholder="ID">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" id="password2"
									name="password2" placeholder="Password">
							</div>
							<button type="button" class="btn btn-info btn-block btn-round"
								type="submit">로그인</button>
						</form>
						<div class="text-center text-muted delimiter">다른 계정으로 로그인</div>
						<div class="d-flex justify-content-center social-buttons">
							<button type="button" class="btn btn-secondary btn-round"
								data-toggle="tooltip" data-placement="top" title="Google">
								<i class="fab fa-google"></i>
							</button>
							<button type="button" class="btn btn-secondary btn-round"
								data-toggle="tooltip" data-placement="top" title="Facebook">
								<i class="fab fa-facebook"></i>
							</button>
							<button type="button" class="btn btn-secondary btn-round"
								data-toggle="tooltip" data-placement="top" title="twitter">
								<i class="fab fa-twitter"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

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
            <li class="list-inline-item"><a class="d-inline-block p-2" href="${root}member/mypage"><h4>내 정보</h4></a></li>
            <li class="list-inline-item"><a class="d-inline-block p-2" href="${root}member/studentinfo"><h4>자녀 정보</h4></a></li>
            <li class="list-inline-item"><a class="d-inline-block p-2" href="${root}member/myfavorite"><h4>찜 목록</h4></a></li>
            <li class="list-inline-item"><a class="d-inline-block p-2" href="${root}member/mypage_siteAsk?m_memberNo=${sessionScope.loginMemberBean.m_memberNo}"><h4>내 문의사항</h4></a></li>
          </ul>
        </div>
      </div>
    </div>
<!-- user info  -->
<section class="section">
<div class="container">
<h3 class="text-center">My Page</h3><hr>
<div class="row justify-content-center">
<div>
		<form:form action="${root}member/mypage_pro" method="post" modelAttribute="mypageMemberBean">
		
			<table class="center">
			<tr>
				<td class="text-left"><strong>이름 :</strong></td>
					<td class="text-center">${mypageMemberBean.m_name}</td>
			</tr>
			<tr>
				<td class="text-left"><strong>아이디 :</strong></td>
					<td class="text-center">${mypageMemberBean.m_id}</td>
			</tr>
			<tr>
				<td class="text-left"><strong>전화번호 :</strong></td>
					<td class="text-center">${mypageMemberBean.m_tele}</td>
			</tr>
			<tr>
				<td class="text-left"><strong>이메일 :</strong></td>
					<td class="text-center">${mypageMemberBean.m_email}</td>
			</tr>
			</table>
		</form:form>
		<hr>
		<div class="text-center">	
	<a href="${root }member/modify?m_memberNo=${sessionScope.loginMemberBean.m_memberNo}" class="btn btn-primary text-center">회원정보수정</a>
	<a href="${root }member/delete?m_memberNo=${sessionScope.loginMemberBean.m_memberNo}" class="btn btn-danger text-center">회원탈퇴</a>
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