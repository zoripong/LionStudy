<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="include/css/insertUserInfo.css">
<section id="sc_input_info">
<p id="content">당신의 ID를 입력해주세요.</p>
<p id="sub_content">랭킹 결과를 확인하는데 사용됩니다. </p>
<form id="form_info"action="insertUserInfoService.jsp">
	<input id="id_input" type="text" name="id" placeholder="아이디를 입력해주세요." required/><br/>
	<input id="submit_input" type="submit" value="시작하기"/>
</form>

</section>