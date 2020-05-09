<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
    
    
    
    
<%@ include file="/WEB-INF/views/include/include-headernav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${rootPath}/test" method="post">

<form:form modelAttribute="fileVO">
<form:checkbox path="file_code" value="asdf"/>


<input type="checkbox" name="file_code2" value="asdf2"/>

<button>ddddd</button>
</form:form>
</form>
</body>
</html>