<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url var='root' value='/'/>
<!DOCTYPE html>

<!--
 // WEBSITE: https://themefisher.com
 // TWITTER: https://twitter.com/themefisher
 // FACEBOOK: https://www.facebook.com/themefisher
 // GITHUB: https://github.com/themefisher/
-->

<html lang="ko">
<!-- Main Stylesheet -->
  <link href="css/main.css" rel="stylesheet">

 <main class="main">
  <section class="home">
    <h1>Welcome to the <span>SKYCASTLE</span></h1>
    <button id="sign-up" class="btn">일반 회원가입</button>
    <button id="sign-in" class="btn">학원 회원가입</button>
  </section>

  <section class="sign-up">
    <article class="signup-left">
      <img src="images/logo.png" alt="logo">
      <div class="wc_message">
        <h3>지금바로 가입하세요!</h3>
      </div>
      <div class="btn-back">
        <i class="fas fa-2x fa-angle-left angle-left-color"></i>
        HOME
      </div>
    </article>

    <article class="form-area">
      <!-- Form area Sign Up -->
      <div class="organize-form form-area-signup">
        <h2>회원가입</h2>
        <form:form class="form" action="${root }member/join_pro" method="post" modelAttribute="joinMemberBean">
          <div class="form-field">
            <form:label path="m_id">ID</form:label>
            <form:input type="text" path="m_id"/>
			<form:errors path="m_id" style="color:red"/>
          </div>

          <div class="form-field">
            <form:label path="m_pw">Password</form:label>
            <form:input type="password" path="m_pw"/>
			<form:errors path="m_pw" style="color:red"/>
          </div>

          <div class="form-field">
            <form:label path="m_name">이름</form:label>
            <form:input type="text" path="m_name"/>
			<form:errors path="m_name" style="color:red"/>
          </div>
          
          <div class="form-field">
            <form:label path="m_birth">주민번호</form:label>
            <form:input type="text" path="m_birth" placeholder="6자리 입력"/>
			<form:errors path="m_birth" style="color:red"/>
          </div>
          
        
          <div class="form-field">
          <form:label path="m_gender">성별</form:label>
           <form:input path="m_gender"/>
           <form:errors path="m_gender" style="color:red"/>
		</div>
          <div class="form-field">
            <form:label path="m_tele">전화번호</form:label>
            <form:input type="tele" path="m_tele" placeholder="-까지 입력" />
			<form:errors path="m_tele" style="color:red"/>
          </div>
          
          <div class="form-field">
            <form:label path="m_email">이메일</form:label>
            <form:input type="email" path="m_email"/>
			<form:errors path="m_email" style="color:red"/>
          </div>
          <form:hidden path="m_classify" value="100"/>
          <form:button class="btn-sign btn-up" type="submit">회원가입 완료</form:button>
        </form:form>
       
      </div>

       <div class="organize-form form-area-signin">
         <h2>학원 회원가입</h2>
       <form:form class="form" action="${root}academymember/join_pro" method="post" modelAttribute="joinAcademyMemberBean">
      <div class="form-field">
         <form:label path="a_id">아이디</form:label>
         <form:input path="a_id"/>
         <form:errors path="a_id"></form:errors>
      </div>
      <div class="form-field">
         <form:label path="a_pw">비밀번호</form:label>
         <form:input path="a_pw"/>
         <form:errors path="a_pw"></form:errors>
      </div>
      <div class="form-field">
         <form:label path="a_name">이름</form:label>
         <form:input path="a_name"/>
         <form:errors path="a_name"/>
      </div>
      <div class="form-field">
         <form:label path="a_CRN">사업자등록번호</form:label>
         <form:input path="a_CRN"/>
         <form:errors path="a_CRN"/>
      </div>
      <div class="form-field">
         <form:label path="a_location">지역(동까지)</form:label>
         <form:input path="a_location"/>
         <form:errors path="a_location"/>
      </div>
      <div class="form-field">
         <form:label path="a_locationDetail">상세주소</form:label>
         <form:input path="a_locationDetail"/>
         <form:errors path="a_locationDetail"/>
      </div>
      <div class="form-field">
         <form:label path="a_tele">학원대표전화번호</form:label>
         <form:input path="a_tele"/>
         <form:errors path="a_tele"/>
      </div>
      <div class="form-field">
         <form:select path="a_classify">
            <form:option value="1" label="종합"/>
            <form:option value="2" label="단과"/>
            <form:option value="3" label="예체능(기타)"/>
         </form:select>
      </div>
   
         <form:button class="btn-sign btn-in" type="submit">회원가입 완료</form:button>
      
   </form:form>
       
       </div>
       
    </article>

    <article class="signup-right">
      <i class="fas fa-2x fa-bars bars-style"></i>

    </article>
  </section>
</main>

<!-- Main Script -->
<script src="js/form.js"></script>