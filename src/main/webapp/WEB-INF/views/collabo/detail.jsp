<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value=""/>
</jsp:include>
<!-- Popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!-- collabo/detail.css -->
<link href="${path }/resources/css/collabo/detail.css?ver=1.1" rel="stylesheet"/>
<!-- Noto Sans -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans&display=swap" rel="stylesheet">
<section class="container-fluid" id="content">
	<div class="row collabo-header" >
		<span style="font-size:18px;color:white;font-weight:bold;">대충 트렐로 메뉴</span>
	</div>
	<div class="board" >
		<div class="list-wrapper">
			<div class="list-content" >
				<div class="list-header">
					리스트이름
					<button type="button" class="fa fa-align-justify btn-menu" onclick=""></button>
				</div>
				<div id="div1" class="list-cards"  ondrop="drop(this,event)" ondragover="return false;">
					<div id="drag1" class="list-card" ondrop="return false;" draggable="true" ondragstart="drag(this,event)">
						<span class="card-content">
							카드내용카드내용카드내용카드드내용카드내내용카드내용
						</span>
					</div>
					<div id="drag2" class="list-card" ondrop="return false;" draggable="true" ondragstart="drag(this,event)">
						<span class="card-content">
							카드내용카드내용카드내용카드드내용카드내내용카드내용
						</span>
					</div>
				</div>
				<div class="open-card" >
					<span onclick="createCard(this);" class="fa fa-plus btn-createCard" >Add another card</span>
				</div>
			</div>
		</div>
		<!-- Add another list -->
		<div class="list-wrapper" >
			<div class="list-content" >
			
				<div class="dropdown div-drop" >
					<button class="dropdown btn-addList" type="button" onclick='$("#listTitle").val(" ");' name="btn_addList"  data-toggle="dropdown" >
						<span class="fa fa-plus" >Add another list</span>
					</button>
					<div class="dropdown-menu">
						<input type="text" id="listTitle" class="dropdown-item" placeholder="Input List Name"/>
						<Button class="btn-createList dropdown-item" type="button" name="btn_cList" onclick="requestCreateList();" >Create</Button>
					</div>
				</div>
				
			</div>
		</div>
		<!-- END  -->
	</div>
</section>
<script>
var userId =  prompt("Input your ID");
var collaboNo = 1;
let sock = new SockJS("<c:url value="/collabo/soc"/>");
sock.onmessage = onMessage;
sock.onclose = onClose;

sock.onopen = function(){
	var sendData ={
		type : "connect",
		userId : userId,
		collaboNo : collaboNo
	};
	sendMessage(sendData);
}

// 메시지 전송
function sendMessage(sendData) {
/* 	var sendData = {
		type : type,
		userId : userId,
		method : method,
		collaboNo : collaboNo,
		content : content,
		listNo : listNo,
		cardNo : cardNo
	}; */
	var jsonData = JSON.stringify(sendData);
    sock.send(jsonData);
}

// 서버로부터 메시지를 받았을 때
function onMessage(msg) {
      var receive = JSON.parse(msg.data);
      console.log(receive);
      if(receive.type == 'list'){
    	  if(receive.method == 'create'){
    		  responseCreateList(receive);
    	  }
      }
}
// 서버와 연결을 끊었을 때
function onClose(evt) {
       $("#data").append("연결 끊김");
}	
</script>

<script> 
function createWrapper(ele){
	var wrapper=$("<div/>");
	wrapper.attr("class","list-wrapper");
	
	var content=$("<div/>");
	content.attr("class","list-content");
	
	var dropdiv=$("<div/>");
	dropdiv.attr("class","dropdown div-drop");
	
	var btndrop=$("<button/>");
	btndrop.attr("class","dropdown btn-addList");
	btndrop.attr("type","button");
	btndrop.attr("onclick",'$("#listTitle").val(" ");');
	btndrop.attr("name","btn_addList");
	btndrop.attr("data-toggle","dropdown");
	
	var faplus =$("<span/>");
	faplus.text("Add another list");
	faplus.attr("class","fa fa-plus");
	
	btndrop.append(faplus);
	dropdiv.append(btndrop);
	
	var dropmenu=$("<div/>");
	dropmenu.attr("class","dropdown-menu");
	dropdiv.append(dropmenu);
	
	var listTitle = $("<input/>");
	listTitle.attr("class","dropdown-item");
	listTitle.attr("type","text");
	listTitle.attr("id","listTitle");
	listTitle.attr("placeholder","Input List Name");
	
	dropmenu.append(listTitle);
	
	var btncList = $("<button/>");
	btncList.text("Create");
	btncList.attr("class","btn-createList dropdown-item");
	btncList.attr("type","button");
	btncList.attr("name","btn_cList");
	btncList.attr("onclick","requestCreateList();");
	
	dropmenu.append(btncList);
	
	content.append(dropdiv);
	
	wrapper.append(content);
	
	ele.append(wrapper);
}



function createCard(ele){
	var title= prompt("Card's Title ? ");
	
	if(title!=null){
	var listCards = $(ele).parent().parent().children('.list-cards');
	
	var card = $('<div/>');
	var content = $('<span/>');
	content.text(title);
	
	card.attr("class","list-card");
	card.attr("ondrop","return false");
	card.attr("draggable","true");
	card.attr("ondragstart","drag(this,event)");
	/* card.css({
		"margin":"5px 0px",
		"background-color":"#ffffff",
		"padding":"5px 5px",
		"font-size":"14px"
	}); */
	
	content.attr("class","card-content");
	
	card.append(content);
	listCards.append(card);
	}else{
		alert("Cancel Make a Card");
	}
}

function requestCreateList(){
	var listTitle= $("#listTitle").val();
	if(listTitle!=''){
	
		var sendData = {
			type : "list",
			method : "create",
			content : listTitle,
			userId : userId,
			collaboNo : collaboNo
		};
		sendMessage(sendData);
	}
}

function responseCreateList(receive){
		var content = $("button[name=btn_cList]").parent().parent().parent();
		var board = content.parent().parent();
		content.empty();
		
		content.attr("id",receive.listNo);
		
		var listHeader = $('<div/>');
		listHeader.attr("class","list-header");
	
		var btnMenu = $('<button>');
		btnMenu.attr("type","button");
		btnMenu.attr("class","fa fa-align-justify btn-menu");
		
		
		var listCards = $('<div/>');
		listCards.attr("class","list-cards");
		listCards.attr("ondrop","drop(this,event)");
		listCards.attr("ondragover","return false;");
		
		var openCard = $('<div/>');
		openCard.attr("class","open-card");
	
		var faplus = $('<span/>');
		faplus.text("Add another card");
		faplus.attr("onclick","createCard(this);");
		faplus.attr("class","fa fa-plus");
	
		openCard.append(faplus);
		
		listHeader.append(receive.content);
		listHeader.append(btnMenu);
		
		content.append(listHeader);
		content.append(listCards);
		content.append(openCard);
		
		createWrapper(board);
	
} 	

function allowDrop(ev) {
	  ev.preventDefault();
	}

function drag(element, ev) {
  ev.dataTransfer.setData("text",element.id);
  console.log(element.id);
}

function drop(element, ev) {
	console.log(element.id);
	 var id = ev.dataTransfer.getData("text");
	 element.appendChild(document.getElementById(id));
	 ev.preventDefault();
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 
