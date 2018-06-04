<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
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
			System.out.println("end of "+questionIndex+"nd now => "+(questionIndex+1));
			session.setAttribute("CorrectCount", ((Integer)session.getAttribute("CorrectCount"))+1);
			
		}
		
	}
	
	// TODO catch the exception
	if(questionIndex == 4){
		// 마지막 문제제출
		System.out.println("QuestionIdiomProc : Questions were finished!");
		
		System.out.println("user_id" + (String)session.getAttribute("user_id"));
		
		String userID = (String)session.getAttribute("user_id");
		long time = (System.currentTimeMillis() - ((Long)session.getAttribute("StartTime"))/1000);
		int score = (int)time * ((Integer)session.getAttribute("CorrectCount"));
		
		// result에 입력
		String filePath = application.getRealPath("./include/data/result.txt");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Calendar c1 = Calendar.getInstance();
		String strToday = sdf.format(c1.getTime());


		BufferedWriter bw;
		try{
			bw = new BufferedWriter(new FileWriter(filePath, true));
			bw.write(strToday+"/"+userID+"/"+score+"\n");
			bw.flush();
			bw.close();
		}catch(IOException e){
			e.printStackTrace();
		}
		
		
		
		session.removeAttribute("Questions");
		session.removeAttribute("QuestionIndex");
		session.removeAttribute("answerIndex");
		session.removeAttribute("StartTime");
		session.removeAttribute("user_id");
		
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
