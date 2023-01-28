<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:url var='root' value='/'/>   
<!DOCTYPE html>


<html lang="ko">
<head>

  <!-- Basic Page Needs
	================================================== -->
  <meta charset="utf-8">
  <title>::SKYCASTLE::</title>

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
  <link href="css/faqstyle.css" rel="stylesheet">

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
          <li class="list-inline-item text-white h3 font-secondary nasted">고객센터</li>
          <li class="list-inline-item text-white h3 font-secondary nasted">FAQ</li>
        </ul>
      </div>
    </div>
  </div>
</section>
<!-- /page title -->

<!-- blogs -->
<section class="section bg-white">
  <div class="container">
    <div class="row justify-content-center mb-5">
      <div class="col-lg-6">
        <div class="section-title text-center">
          <h2 class="text-color">자주 묻는 질문</h2>
        </div>
      </div>
    </div>
   <c:forEach var="str" items="${faqlist}" varStatus="status">
   
    <div class="row justify-content-center">
    
      <div class="col-lg-9">
        <div class="accordion accordion-border-bottom" id="accordionFAQ">
          <div align="right">
           <c:if test="${Integer.toString(sessionScope.loginMemberBean.m_memberNo).length() == 4 }">
          <button class="search-btn btn-color" onclick="location.href='${root }faq/faqModify?fb_no=${str.fb_no }'">수정</button>
          <button class="search-btn btn-color" onclick="location.href='${root }faq/faqDelete?fb_no=${str.fb_no }'" >삭제</button>
           </c:if>
          
          <div class="accordion-item">
          <br>
            <h2 class="accordion-header accordion-button h5 border-0 collapsed"
              style="background-color:mistyrose"
              id="heading-${status.index}" type="button" data-bs-toggle="collapse"
              data-bs-target="#collapse-${status.index}" aria-expanded="true"
              aria-controls="collapse-${status.index}">
              <span id="Qstyle">Q</span> &nbsp; ${str.fb_contentsQ }  
                &emsp;&emsp;&emsp;  &emsp;&emsp;&emsp;  
            

            </h2>
            <div id="collapse-${status.index}"
              class="accordion-collapse border-0 collapse"
              style="background-color: lavender"
              aria-labelledby="${status.index}" data-bs-parent="#accordionFAQ">
              <div class= "accordion-header h5 border-0 active text-left"> &nbsp;&nbsp;&nbsp;&nbsp; 
             <br> <span id="Astyle">A</span>  &nbsp; ${str.fb_contentsA } <br>
              </div>
            </div>
           
          </div>
        </div> 
      </div>
       </div>
    </div>
    <br><br>
  </c:forEach>

  <c:if test="${Integer.toString(sessionScope.loginMemberBean.m_memberNo).length() == 4 }">
 <div align = "right">
  <button class="search-btn btn-color" onclick="location.href='${root }faq/faqWrite'">글쓰기</button>
  </div>
  </c:if>
  </div>
</section>
<!-- /blogs -->

<!-- ===============================  footer  =============================== -->
 <c:import url="/WEB-INF/views/include/footer.jsp"/>
<!-- ===============================  footer  =============================== -->

<!-- jQuery -->
<script src="plugins/jQuery/jquery.min.js"></script>
<script src="plugins/jQuery/faqjquery.min.js"></script>
<!-- Bootstrap JS -->
<script src="plugins/bootstrap/bootstrap.min.js"></script>
<script src="plugins/bootstrap/faqbootstrap.min.js"></script>
<!-- slick slider -->
<script src="plugins/slick/slick.min.js"></script>
<script src="plugins/slick/faqslick.min.js"></script>
<!-- aos -->
<script src="plugins/aos/aos.js"></script>
<!-- venobox popup -->
<script src="plugins/venobox/venobox.min.js"></script>
<!-- filter -->
<script src="plugins/filterizr/jquery.filterizr.min.js"></script>
<!-- google map -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU"></script>
<script src="plugins/google-map/gmap.js"></script>
<!-- # JS Plugins -->
<script src="plugins/scrollmenu/scrollmenu.min.js"></script>

<!-- Main Script -->
<script src="js/script.js"></script>
<script src="js/faqscript.js"></script>

</body>
</html>