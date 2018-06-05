<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="include/css/addIdiom.css">

<section id="sc_add_lion">
	<section id="sc_description">
		<p id="description">새로운 사자성어를 추가 하고 싶으신가요?</p>
		<p id="sub_description"><a href="lionList.jsp" target="_blank">현재 입력되어있는 사자성어를 확인해보세요.</a></p>
	</section>
	<form id="add_form" name="add_form" action="addIdiomService.jsp" method="POST">
		<input type="text" name="chinese_character" placeholder="한자입력" required><br/>
		<input type="text" name="korean_character" placeholder="한글입력" required><br/>
		<input type="text" name="mean" placeholder="의미" required><br/>
		<input id="submit_input" type="submit" value="등록" >
	</form>
	
</section>