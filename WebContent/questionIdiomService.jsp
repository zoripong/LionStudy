<%@page import="models.Lion"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//문제 제출시 session에 저장해야할 것들 : scoreMap(ScoreMap), 현재 문제 Index(QuestionIndex)
	request.setCharacterEncoding("utf-8");
	
	int questionIndex = (Integer)session.getAttribute("QuestionIndex");
	if(!((String)request.getParameter("input_answer")).equals("")){
		// pass가 아닐 경우
		String[] userAnswerIndex = request.getParameter("input_answer").split("/");
		ArrayList<Integer> answerIndex = (ArrayList<Integer>)session.getAttribute("answerIndex");
		boolean isCorrect = true;
		for(int i = 0 ; i<answerIndex.size(); i++){
			if(Integer.parseInt(userAnswerIndex[i]) != answerIndex.get(i)){
				isCorrect = false;
				break;
			}
		}
	
		if(isCorrect){
			session.setAttribute("QuestionIndex", questionIndex+1);
			session.setAttribute("CorrectCount", ((Integer)session.getAttribute("CorrectCount"))+1);
			
		}
		
	}
	
	// TODO catch the exception
	if(questionIndex == 5){
		// 마지막 문제제출
		System.out.println("QuestionIdiomProc : Questions were finished!");
			
		long time = ((Long)session.getAttribute("StartTime")) - System.currentTimeMillis();
		
		session.removeAttribute("Questions");
		session.removeAttribute("QuestionIndex");
		session.removeAttribute("answerIndex");
		session.removeAttribute("StartTime");
		
		System.out.println((Integer)session.getAttribute("CorrectCount")+"/"+time+"/"+(Integer)session.getAttribute("CorrectCount")*time);
		
	%>
		<jsp:forward page="rankIdiom.jsp"></jsp:forward>
	<%
	
	}else{
	%>
		<jsp:forward page="questionIdiom.jsp"></jsp:forward>
	<%
	}
		
	// 페이지 넘기기
%>
