<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url var='root' value='/'/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>공지사항</title>
</head>
<body>

<!-- ===============================  header  =============================== -->
<%--    <c:import url="/WEB-INF/views/include/header.jsp"/> --%>
<!-- ===============================  header  =============================== -->

	<div>
		<form:form action="${root }blackList/blackListWrite_pro" method="post" modelAttribute="blWriteBean"
		enctype="multipart/form-data">
		<div>
			<form:label path="m_memberNo">고객 번호</form:label>
			<form:input path="m_memberNo" />
			<form:errors path="m_memberNo" style="color:red"></form:errors>
		</div>
		<div>
			<form:label path="a_memberNo">학원 번호</form:label>
			<form:input path="a_memberNo" />
			<form:errors path="a_memberNo" style="color:red"></form:errors>
		</div>
		<div>
			<form:label path="black_contents">내용</form:label>
			<form:textarea path="black_contents" rows="10" style="resize:none"></form:textarea>
			<form:errors path="black_contents" style="color:red"></form:errors>
		</div>
		
		<div >
		<div>
			<form:button>작성하기</form:button>
		</div>
		</div>			
			</form:form>
	</div>

<!-- ===============================  footer  =============================== -->
<%--  <c:import url="/WEB-INF/views/include/footer.jsp"/> --%>
<!-- ===============================  footer  =============================== -->


</body>
</html>
