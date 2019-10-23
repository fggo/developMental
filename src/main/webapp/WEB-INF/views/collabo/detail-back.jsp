<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value=""/>
</jsp:include>
<!-- Popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!-- collabo/detail.css -->
<link href="${path }/resources/css/collabo/detail.css" rel="stylesheet"/>
<!-- Noto Sans -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans&display=swap" rel="stylesheet">
<section class="container-fluid" id="content" style="margin-top:58px;background-color:rgb(131, 140, 145);font-family: 'Noto Sans', sans-serif;">
	<div class="row collabo-header" style="background-color:gray;height:44px;padding:5px 5px">
		<span style="font-size:18px;color:white;font-weight:bold;">대충 트렐로 메뉴</span>
	</div>
	<div class="board" style="display:flex">
		<div class="list-wrapper" style="width:272px;height:732px;padding:10px 10px;margin-left:5px">
			<div class="list-content" style="width:272px;background-color:#ebecf0;border-radius:5px;padding:5px 10px" >
				<div class="list-header" style="padding:5px 5px;font-weight:bold;font-size:14px" >
					리스트이름
					<button type="button" class="fa fa-align-justify" onclick=""></button>
				</div>
				<div id="div1" class="list-cards" style="margin-top:10px;padding:3px 3px" ondrop="drop(this,event)" ondragover="return false;">
					<div id="drag1" class="list-card" style="margin:5px 0px;background-color:#ffffff;padding:5px 5px;font-size:14px" ondrop="return false;" draggable="true" ondragstart="drag(this,event)">
						<span class="card-content">
							카드내용카드내용카드내용카드드내용카드내내용카드내용
						</span>
					</div>
					<div id="drag2" class="list-card" style="margin:5px 0px;background-color:#ffffff;padding:5px 5px;font-size:14px" ondrop="return false;" draggable="true" ondragstart="drag(this,event)">
						<span class="card-content">
							카드내용카드내용카드내용카드드내용카드내내용카드내용
						</span>
					</div>
				</div>
				<div class="open-card" style="color:#5e6c84;font-size:14px;padding:5px 5px;margin-top:10px;">
					<span onclick="createCard(this);" class="fa fa-plus btn-createCard" style="margin-right:5px">Add another card</span>
				</div>
			</div>
		</div>
		<!-- Add another list -->
		<div class="list-wrapper" style="width:272px;height:732px;padding:10px 10px;margin-left:5px">
			<div class="list-content" style="width:272px;background-color:#ebecf0;border-radius:5px;padding:5px 10px" >
			
				<div class="dropdown div-drop" style="color:#5e6c84;font-size:14px;padding:5px 5px;margin-top:0px;">
					<button class="dropdown btn-addList" type="button" onclick='$("#listTitle").val(" ");' name="btn_addList"  data-toggle="dropdown" style="border:0;background-color:#ebecf0;width:100%">
						<span class="fa fa-plus" style="margin-right:5px">Add another list</span>
					</button>
					<div class="dropdown-menu">
						<input type="text" id="listTitle" class="dropdown-item" placeholder="Input List Name"/>
						<Button class="btn-createList dropdown-item" type="button" name="btn_cList" onclick="createList();" style="background-color:#0069d9;color:white;">Create</Button>
					</div>
				</div>
				
			</div>
		</div>
		<!-- END  -->
	</div>
</section>
<script> 
function createCard(ele){
	var title= prompt("Card's Title ? ");
	
	var listCards = $(ele).parent().parent().children('.list-cards');
	
	/* console.log($(ele).parent().parent().children('.list-cards')); */
	
	var card = $('<div/>');
	var content = $('<span/>');
	content.text(title);
	
	card.attr("class","list-card");
	card.attr("ondrop","return false");
	card.attr("draggable","true");
	card.attr("ondragstart","drag(this,event)");
	card.css({
		"margin":"5px 0px",
		"background-color":"#ffffff",
		"padding":"5px 5px",
		"font-size":"14px"
	});
	
	content.attr("class","card-content");
	
	card.append(content);
	listCards.append(card);
}

function createList(){
	var listTitle= $("#listTitle").val();
	var content = $("button[name=btn_cList]").parent().parent().parent();
	content.empty();
	
	var listHeader = $('<div/>');
	listHeader.attr("class","list-header");
	listHeader.css({
		"padding":"5px 5px",
		"font-weight":"bold",
		"font-size":"14px"
	});
	var btnMenu = $('<button>');
	btnMenu.attr("type","button");
	btnMenu.attr("class","fa fa-align-justify");
	btnMenu.css({"margin-left":"3px"});
	
	/* <div id="div3" class="list-cards" style="margin-top:10px;padding:3px 3px" ondrop="drop(this,event)" ondragover="return false;"> */
	
	var listCards = $('<div/>');
	listCards.attr("class","list-cards");
	listCards.attr("ondrop","drop(this,event)");
	listCards.attr("ondragover","return false;");
	listCards.css({
		"margin-top":"10px",
		"padding":"3px 3px"
	});
	
	
	
	var openCard = $('<div/>');
	openCard.attr("class","open-card");
	openCard.css({
		"color":"#5e6c84",
		"font-size":"14px",
		"padding":"5px 5px",
		"margin-top":"10px"
	});
	
	var faplus = $('<span/>');
	faplus.text("Add another card");
	faplus.attr("onclick","createCard(this);");
	faplus.attr("class","fa fa-plus");
	faplus.css({"margin-right":"5px"});
	
	openCard.append(faplus);
	
	listHeader.append(listTitle);
	listHeader.append(btnMenu);
	
	content.append(listHeader);
	content.append(listCards);
	content.append(openCard);
	
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
