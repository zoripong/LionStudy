<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="models.Lion"%>
<%@page import="java.util.HashSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%="questionIdiomProc.jsp"%>
<%
	final int QUESTION_NUMBER = 5;
	
	HashSet<Lion> lions = (HashSet<Lion>)session.getAttribute("lions");
	
//session.removeAttribute("QuestionIndex");
	
	if(session.getAttribute("QuestionIndex") == null){		
		ArrayList<Lion> questions = new ArrayList<Lion>();
		HashMap<Lion, Integer> scoreMap = new HashMap<Lion, Integer>();
		int questionIndex = 1;
		
		//FIXME : 매번 같은 값..
		Iterator<Lion> iterator = lions.iterator();
		
		for(int i = 0; i<QUESTION_NUMBER; i++){
			Lion lion = iterator.next();
			questions.add(lion);
			scoreMap.put(lion, 0);
		}
		//문제세팅하고 다시 자기 자신 부르기
		
		System.out.println("QuestionIdimoProc : Questions were initialized!");
		session.setAttribute("Questions", questions);
		session.setAttribute("ScoreMap", scoreMap);
		session.setAttribute("QuestionIndex", questionIndex);
		%>
		<META http-equiv=refresh content="0;url=questionIdiom.jsp">
	<%
	}else if((Integer)session.getAttribute("QuestionIndex") > 5){
		//TODO: 마지막 문제일 경우 session에서 attribute를 지워줘야함 + 파일에 점수 기록
		// 문제가 끝났으니 결과 화면으로 redirect
		System.out.println("QuestionIdiomProc : Questions were finished!");
		session.removeAttribute("Questions");
		session.removeAttribute("QuestionIndex");
		session.removeAttribute("ScoreMap");
		%>
		<META http-equiv=refresh content="0;url=rankIdiom.jsp">
	<%
	}else{
		//문제를 풀고있음 (1~QUESTION_NUMBER)
		// 문제 세팅
		int questionIndex = (Integer)session.getAttribute("QuestionIndex");
		System.out.println("QuestionIndex ?? " + questionIndex);
		ArrayList<Lion> questions = (ArrayList<Lion>)session.getAttribute("Questions");
		HashMap<Lion, Integer> scoreMap = (HashMap<Lion, Integer>)session.getAttribute("ScoreMap");
		
		
		System.out.println("QuestionIdiomProc : Question["+questionIndex+"] was created!");		
		//TODO : random으로 테이블 띄우기
		
		/*
		session.setAttribute("QuestionIndex", questionIndex + 1);
		
		--%>
			<META http-equiv=refresh content="0;url=questionIdiom.jsp">
		<%
		*/
		
	}
	
	
	
%>
<section id="sc_question">
	<section id="sc_chinese_map">
	
	</section>
	<section id="sc_korean_hint">
	
	</section>
	<section id="sc_mean">
	
	</section>
<%-- 문제 제출시 session에 저장해야할 것들 : scoreMap(ScoreMap), 현재 문제 Index(QuestionIndex) --%>	
</section>