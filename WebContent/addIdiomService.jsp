<%@page import="java.io.IOException"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");

	String chineseCharacter = request.getParameter("chinese_character");
	String koreanCharacter = request.getParameter("korean_character");
	String mean = request.getParameter("mean");

	String filePath= application.getRealPath("./include/data/lion.txt");

	BufferedWriter bw;
	try{
		bw = new BufferedWriter(new FileWriter(filePath, true));
		bw.write(chineseCharacter+"\t"+koreanCharacter+"\t"+mean+"\n");
		bw.flush();
		bw.close();
		%>
		<jsp:forward page="index.jsp"></jsp:forward>
		<%
	}catch(IOException e){
		e.printStackTrace();
	}

%>
