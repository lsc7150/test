<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:url var='root' value='/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::SKYCASTLE::</title>
</head>
<body>
<script type="text/javascript">
var send = confirm("등록하시겠습니까?");

if(send == true) {
	var send = confirm("작성이 완료되었습니다.");
	location.href="${root}serviceBoard/siteAskWrite"
}
else {
   history.back(-1);
}
</script>
</body>
</html>