
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="models.Lion"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="include/css/index.css">
	
<%
	String filePath= application.getRealPath("./include/data/lion.txt");
	System.out.println(filePath);
	
	// read file
	BufferedReader br = null;
	HashSet<Lion> lions = new HashSet<Lion>();
	out.println(filePath);
	
		try{
			br = new BufferedReader(new FileReader(filePath));
			
			while(true){
				// 한 줄 씩 읽어옴
				
				String str = br.readLine();
				if(str == null)
					break;
				else{
					StringTokenizer token = new StringTokenizer(str, "\t");
					while(token.hasMoreTokens()){
						lions.add(new Lion(token.nextToken(), token.nextToken(), token.nextToken()));
					}
				}
			}
			br.close();	
		}catch(IOException e){
			System.out.println(e.toString());
		}
		
		session.setAttribute("lions", lions);
		
		Iterator<Lion> iter = lions.iterator();
		Lion lion = iter.next();
		System.out.println("이번 사자성어는 ? "+lion.toString());
		

%>
<section id="sc_today_lion">
	오늘의 사자성어는
	<section id="sp_chinese"><%=lion.getChinese() %></section>
	<section id="sp_chinese"><%= lion.getKorean() %></section>
	<section id="sp_mean"><%= lion.getMean() %></section>
</section>

