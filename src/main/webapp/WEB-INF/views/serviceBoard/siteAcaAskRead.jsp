<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <c:url var='root' value='/'/>   
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title> : 문 의 사 항 : </title>

  <!-- Mobile Specific Metas
	================================================== -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="Construction Html5 Template">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
  <meta name="author" content="Themefisher">
  <meta name="generator" content="Themefisher Educenter HTML Template v1.0">

  <!-- ** Plugins Needed for the Project ** -->
  <!-- serachbar -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
          <li class="list-inline-item text-white h3 font-secondary nasted">고객센터</li>
          <li class="list-inline-item text-white h3 font-secondary nasted">공지사항</li>
        </ul>
      </div>
    </div>
  </div>
</section>
<!-- /page title -->

<!-- Board -->    
<section class="section bg-gray">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
       <div class="section-title text-center">
          <h2>문의사항</h2>
          </div>
      </div>
    </div>
		<div class="board_view">
<table>
    <tr>
		<th>아이디</th>
		<th>${aaReadBean.a_id }</th>
		<th>이름</th>
		<th>${aaReadBean.a_name }</th>
		<th>전화번호</th>
		<th>${aaReadBean.a_tele }</th>
		<th>작성날짜</th>
		<th width="10%"><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${aaReadBean.aa_time }" /></th>
   		<th>제목</th>
		<th>${aaReadBean.aa_title }</th>
	</tr>
	<tr>
	<td colsapn="4" height="200" valign="top" style="padding: 20px; line-height:160%">
         <div id="bbs_file_wrap">
            <div>
               <img src="" width="900" onerror=""/><br />
               </div>
              </div> 			
				내용</td>
				<th>${aaReadBean.aa_contents }</th>
	</tr>
	<tr>				
		<c:if test="${saReadBean.sa_file != null }">
			<th>
			<label for="sa_file">첨부 이미지</label>
			<img src="${root }upload/${saReadBean.sa_file}" width="100%"/>						
			</th>
			</c:if>
	</tr>
</table>
  </div>
  <div class="btn_area">
    <div class="align_left">
      <input type="button" value="목록" class="btn_list btn_txt02" style="cursor:pointer;" onclick="location.href='${root }serviceBoard/siteAcaAskList'"/>
    </div>
    <div class="align_left">
<input type="button" value="돌아가기" class="btn_list btn_txt02" style="cursor:pointer;" onclick="location.href='${root }index'"/>
  </div>
</div>


</div>

</section>
<!-- /Board -->


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