<%@page import="java.util.Arrays"%>
<%@page import="java.util.Collection"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileReader"%>
<%@page import="models.Result"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="include/css/rankIdiom.css">

<%
	BufferedReader br = null;
	ArrayList<Result> results = new ArrayList<Result>();
	String filePath= application.getRealPath("./include/data/result.txt");
	try{
		br = new BufferedReader(new FileReader(filePath));
		
		while(true){
			// 한 줄 씩 읽어옴
			
			String str = br.readLine();
			if(str == null)
				break;
			else{
				//String userID, String date, int score
//				strToday+"/"+userID+"/"+score+"\n"
				String result[] = str.split("/");
				results.add(new Result(result[1], result[0], Integer.parseInt(result[2])));
			}
		}
		br.close();	
	}catch(IOException e){
		System.out.println(e.toString());
	}
	//TODO sort
	
	
	
	

%>
<section id="sc_result">
	<%
		for(int i = 0; i<results.size(); i++){
			out.println("<section class=\"sc_result_row\">");
			out.println("<div class=\"rank\">"+(i+1)+"</div>");
			out.println("<div class=\"date\">"+results.get(i).getDate()+"</div>");
			out.println("<div class=\"user_id\">"+results.get(i).getUserID()+"</div>");
			out.println("<div class=\"score\">"+results.get(i).getScore()+"</div>");
			out.println("</section>");
		}
	%>
	
</section>