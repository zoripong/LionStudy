<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="models.Lion"%>
<%@page import="java.util.HashSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="include/css/questionIdiom.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
<script>
	
	// TODO: css convert
	var clickIndex = [];
	var clickChracter = [];
	
	function clickCharacter(character, index){
		document.getElementById("character_index_"+index).innerHTML= character;
		
		if(clickIndex.includes(index)){
			alert("취소");
			clickIndex.splice(clickIndex.indexOf(index), 1);
			clickChracter.splice(clickChracter.indexOf(character), 1);
			
		}else{
			if(clickIndex.length >= 4){
				alert("이미 4개를 선택하였습니다.");
			}else{
				clickIndex.push(index);
				clickChracter.push(character);
			}
		}
		document.getElementById("sc_answer").innerHTML = "";
		
		for(var i = 0; i<clickChracter.length; i++){
			document.getElementById("sc_answer").innerHTML += clickChracter[i];
		}		
	}
	
	function convertToChinese(character, index){
		if(clickIndex.includes(index)){
			return;
		}
		document.getElementById("character_index_"+index).innerHTML= character;
		
	}
	
	function convertToKorean(character, index){
		document.getElementById("character_index_"+index).innerHTML= character;
	}
	
	function submitAnswer(){
		if(clickIndex.length < 4){
			alert("4개 미만 선택했습니다.");
			return;
		}
		var answerIndex = "";
		for(var i = 0; i<clickIndex.length; i++){
			answerIndex += clickIndex[i]+"/";
		}
		document.getElementById("input_answer").value = answerIndex;
		document.forms['submit_form'].submit();
		return false;			
	}
	
	function passAnswer(){
		document.getElementById("input_answer").value = "";		
		document.forms['submit_form'].submit();
		return false;
	}
	
	function clearAnswer(){
		document.getElementById("sc_answer").innerHTML = "<br>";	
		clickIndex = [];
		clickChracter = [];
		alert(clickIndex);
	}
	
</script>
<%
	final int QUESTION_NUMBER = 5;
	long seed = System.nanoTime();

	HashSet<Lion> lions = (HashSet<Lion>)session.getAttribute("lions");
	
	Map<Integer, String> questionKoreanTable = null;
	Map<Integer, String> questionChineseTable = null;
    ArrayList<Integer> answerIndex = null;
    Lion answerLion = null;
    
	if(session.getAttribute("QuestionIndex") == null){		
		ArrayList<Lion> questions = new ArrayList<Lion>();
		int questionIndex = 1;
		
		//FIXME : 매번 같은 값..
		List<Lion> lionRandomList = new ArrayList<Lion>(lions);
    	Collections.shuffle(lionRandomList, new Random(seed));
	
		for(int i = 0; i<QUESTION_NUMBER; i++){
			questions.add(lionRandomList.get(i));
		}
		
		//문제세팅하고 다시 자기 자신 부르기
		System.out.println("QuestionIdimoProc : Questions were initialized!");
		session.setAttribute("Questions", questions);
		session.setAttribute("QuestionIndex", questionIndex);
		session.setAttribute("StartTime", System.currentTimeMillis());
		session.setAttribute("CorrectCount", 0);
		
		%>
		<META http-equiv=refresh content="0;url=questionIdiom.jsp">
	<%
	}else{
		//문제를 풀고있음 (1~QUESTION_NUMBER)
		// 문제 세팅
		int questionIndex = (Integer)session.getAttribute("QuestionIndex");

		System.out.println("QuestionIndex ?? " + questionIndex);
		System.out.println("QuestionIdiomProc : Question["+questionIndex+"] was created!");		

		ArrayList<Lion> questions = (ArrayList<Lion>)session.getAttribute("Questions");
		
		// 선택 할 수 있는 한자가 나올 리스트
		ArrayList<Lion> questionLions = new ArrayList<Lion>();
		
		int index = 0;
		Iterator<Lion> iter = lions.iterator();
		
		while(iter.hasNext()){
			Lion lion = iter.next();
			if(!questions.get(questionIndex).equals(lion)){
				questionLions.add(lion);
				index++;
			}
			if(index == QUESTION_NUMBER)
				break;
		}
		
		Collections.shuffle(questionLions, new Random(seed));
			
		System.out.println("QuestionIdiomProc :"+questions);
		System.out.println("QuestionIdiomProc :"+questionLions);
		
		// random으로 index shuffle
		ArrayList<Integer> tableRandomIndex = new ArrayList<Integer>();
		for(int i = 0; i<QUESTION_NUMBER*4; i++){
			tableRandomIndex.add(i);
		}
		Collections.shuffle(tableRandomIndex, new Random(seed));
		
		// make question table
		questionKoreanTable = new HashMap<Integer, String>();
		questionChineseTable = new HashMap<Integer, String>();
 		for(int i = 0; i<QUESTION_NUMBER*4; i++){ // index of tableRandomIndex
			//System.out.println("i:"+i+"/(i/4):"+(i/4)+"/(i%4):"+(i%4));
			//FIXME : getKorean() -> getChinese();
 			questionKoreanTable.put(tableRandomIndex.get(i), String.valueOf(questionLions.get(i/4).getKorean().charAt(i%4)));		
 			questionChineseTable.put(tableRandomIndex.get(i), String.valueOf(questionLions.get(i/4).getChinese().charAt(i%4)));
 		}
 		
 		Random rand = new Random();
 		answerLion = questions.get(questionIndex);
 		answerIndex = new ArrayList<Integer>();
 		
 		// 정답을 추가
 		for(int i = 0; i<4; i++){
 			int j = rand.nextInt(QUESTION_NUMBER*4);
 			if(answerIndex.contains(j)){
 				i--;
 			}else{
 	 			answerIndex.add(j);
 				questionKoreanTable.put(j, String.valueOf(answerLion.getKorean().charAt(i)));
 				questionChineseTable.put(j, String.valueOf(answerLion.getChinese().charAt(i)));
 			}
 		}
 		
 		System.out.println("정답 : "+answerLion.getKorean());
 		System.out.println("정답 인덱스 : "+answerIndex.toString());
		
 		session.setAttribute("answerIndex", answerIndex);
	}
	
	
	
%>

<section id="sc_question">
	<section id="sc_chinese_map">
		<%
			if(questionKoreanTable != null){
				out.println("<section class=\"sc_chinese_row\">");
				for(int i = 0 ;i<QUESTION_NUMBER*4; i++){					
					out.println("<div id=\"character_index_"+i+"\" onmouseover=\"convertToKorean('"+questionKoreanTable.get(i)+"', "+i+")\" onmouseout=\"convertToChinese('"+questionChineseTable.get(i)+"', "+i+")\" onclick=\"clickCharacter('"+questionKoreanTable.get(i)+"', "+i+");\" class=\"chinese_character\">"+questionChineseTable.get(i)+"</div>");
					if(i%4 == 3){
						out.println("</section><section class=\"sc_chinese_row\">");
					}
				}
				out.println("</section>");
			}
		%>
	</section>
	<section id="sc_korean_hint">
		<section id="sc_hint_detail"><%= answerLion.getMean() %></section>
		<section id="sc_answer"><br/></section>
		<form name="submit_form" action="questionIdiomService.jsp" method="POST">
			<input id="input_answer" type="hidden" name="input_answer">
			<input onclick="submitAnswer()" type="button" name="submit_btn" value="제출">
			<input onclick="passAnswer()" type="button" name="pass_btn" value="패스">
			<input onclick="clearAnswer()" type="button" name="clear_btn" value="초기화">
		</form>
	</section>
</section>

