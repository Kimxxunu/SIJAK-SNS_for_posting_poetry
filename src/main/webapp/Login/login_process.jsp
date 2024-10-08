<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="User.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "user" class="User.UserEntity" scope = "page"/>
<jsp:setProperty name = "user" property = "userid"/>
<jsp:setProperty name = "user" property = "password"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 프로세스</title>
</head>
<body>
	<%
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserid(), user.getPassword());
		if(result == 1){
			session.setAttribute("userID",user.getUserid());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = '../Main/main.jsp'");
			script.println("</script>");
		}
		else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다..')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>

