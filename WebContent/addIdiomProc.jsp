<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<section id="sc_add_lion">

	<form name="add_form" action="addIdiomService.jsp" method="POST">
		<input type="text" name="chinese_character" placeholder="한자입력" required><br/>
		<input type="text" name="korean_character" placeholder="한글입력" required><br/>
		<input type="text" name="mean" placeholder="의미" required><br/>
		<input type="submit" value="등록" >
	</form>
	
</section>