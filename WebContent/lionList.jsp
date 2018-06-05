<%@page import="java.io.IOException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
	String filePath= application.getRealPath("./include/data/lion.txt");
	
	// read file
	BufferedReader br = null;
	try{
		br = new BufferedReader(new FileReader(filePath));
		
		while(true){
			// 한 줄 씩 읽어옴
			
			String str = br.readLine();
			if(str == null)
				break;
			else{
				out.println(str+"<br/>");
			}
		}
		br.close();	
	}catch(IOException e){
		System.out.println(e.toString());
	}
	%>
</body>
</html>