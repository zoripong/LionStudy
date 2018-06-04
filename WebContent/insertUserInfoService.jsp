<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	if(session.getAttribute("Questions") != null){
		session.removeAttribute("Questions");		
	}

	if(session.getAttribute("answerIndex") != null){
		session.removeAttribute("answerIndex");		
	}
	
	if(session.getAttribute("StartTime") != null){
		session.removeAttribute("StartTime");		
	}
	
	if(session.getAttribute("user_id") != null){
		session.removeAttribute("user_id");		
	}
	
	if(session.getAttribute("QuestionIndex") != null){
		session.removeAttribute("QuestionIndex");		
	}
	
	String id = request.getParameter("id");
	session.setAttribute("user_id", id);
%>
<jsp:forward page="questionIdiom.jsp"></jsp:forward>

