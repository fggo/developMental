function responseCreateList(receive){
		var content = $("button[name=btn_cList]").parent().parent().parent();
		var board = $("button[name=btn_cList]").parent().parent().parent().parent().parent().parent();
		content.empty();
		
		content.attr("draggable","true");
		content.attr("ondrop","return false;");
		content.attr("ondragstart","listDrag(this,event)");
		content.attr("ondragend","endListDrag()");
		
		content.parent().attr("ondrop","requestMoveList(this,event)");
		content.parent().attr("ondragover","return false");
		
		var listHeader = $('<div/>');
		listHeader.attr("class","list-header");
		
		var listTitle = $('<span/>');
		listTitle.attr("class","list-title");
		listTitle.text(receive.content);
	
		var btnMenu = $('<button>');
		btnMenu.attr("type","button");
		btnMenu.attr("class","fa fa-align-justify btn-menu");
		btnMenu.attr("data-toggle","dropdown");
		
	    var dropMenu = $("<div/>");
	    dropMenu.attr("class","dropdown-menu");
	    
	    var dropitem = $("<div/>");
	    dropitem.attr("class","dropdown-item");
	    
	    var dropspan = $("<span/>");
	    dropspan.text("리스트 메뉴");
	    dropspan.css({
	    	"text-align":"center;",
	    	"margin-left" : "17px"
	    });
	    var hr = $("<hr/>");
	    
	    
	    var dropbtnDiv = $("<div/>");
	    dropbtnDiv.css({
	    	"text-align":"center"
	    });
	    
	    var btnEdit = $("<button/>");
	    btnEdit.attr("type","button");
	    btnEdit.attr("onclick","requestUpdateList(this)");
	    btnEdit.attr("class","btn btn-sm btn-primary");
	    btnEdit.css({
	    	"margin-right":"3px"
	    });
	    btnEdit.text("수정");
	    
	    var btnRemove = $("<button/>");
	    btnRemove.attr("type","button");
	    btnRemove.attr("onclick","requestDeleteList(this)");
	    btnRemove.attr("class","btn btn-sm btn-primary");
	    btnRemove.text("삭제");
	    
	    dropbtnDiv.append(btnEdit);
	    dropbtnDiv.append(btnRemove);
	    
	    dropitem.append(dropspan);
	    dropitem.append(hr);
	    dropitem.append(dropbtnDiv);
	    
	    dropMenu.append(dropitem);
		
		var listCards = $('<div/>');
		listCards.attr("class","list-cards");
		listCards.attr("ondrop","requestMoveCard(this,event)");
		listCards.attr("ondragover","return false;");
		listCards.attr("name","listNo_"+receive.listNo);
		listCards.attr("id","listNo_"+receive.listNo);
		
		
		var openCard = $('<div/>');
		openCard.attr("class","open-card");
	
		var faplus = $('<span/>');
		faplus.text("카드 생성");
		faplus.attr("onclick","requestCreateCard(this);");
		faplus.attr("class","fa fa-plus");
	
		openCard.append(faplus);
		
		listHeader.append(listTitle);
		listHeader.append(btnMenu);
		listHeader.append(dropMenu);
		
		content.append(listHeader);
		content.append(listCards);
		content.append(openCard);
		
		createWrapper(board);
	
}

function responseMoveCard(receive){
	var listNo = receive.listNo+"";
	var cardNo = receive.cardNo+"";
	
	/* $("#listNo").append(document.getElementById(cardNo)); */
	document.getElementById("listNo_"+listNo).appendChild(document.getElementById("cardNo_"+cardNo));
}

function allowDrop(ev) {
	  ev.preventDefault();
	}

function cardDrag(element, ev) {
	var wrapper = $(".list-wrapper");
	var content = $(".list-content");
	
	wrapper.removeAttr("ondrop");
	wrapper.removeAttr("ondragover");
	content.removeAttr("draggable");
	content.removeAttr("ondrop");
	content.removeAttr("ondragstart");
	
	ev.dataTransfer.setData("text",element.id);
}

function endCardDrag(){
	var wrapper = $(".list-wrapper");
	var content = $(".list-content");
	
	wrapper.attr("ondrop","requestMoveList(this,event)");
	wrapper.attr("ondragover","return false;");
	
	content.attr("draggable","true");
	content.attr("ondrop","return false;");
	content.attr("ondragstart","listDrag(this,event)");
}
function listDrag(element, ev){
	var list = $(".list-cards");
	var card = $(".list-card");
	
	list.removeAttr("ondrop");
	list.removeAttr("ondragover");
	card.removeAttr("ondrop");
	card.removeAttr("draggable");
	card.removeAttr("ondragstart");
	
	ev.dataTransfer.setData("text",$(element).children('.list-cards').attr("id"));
}

function endListDrag(){
	var list = $(".list-cards");
	var card = $(".list-card");
	
	list.attr("ondrop","requestMoveCard(this,event)");
	list.attr("ondragover","return false;");
	card.attr("ondrop","return false;");
	card.attr("draggable","true");
	card.attr("ondragstart","cardDrag(this,event)");
}

function requestMoveCard(element, ev){
	var cardNo = parseInt(ev.dataTransfer.getData("text").substring(7));
	var listNo = parseInt(element.id.substring(7));
	var sendData = {
			type : "card",
			method : "move",
			userId : userId,
			collaboNo : collaboNo,
			cardNo : cardNo,
			listNo : listNo
	};
	sendMessage(sendData);
}

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
	listTitle.attr("type","text");
	listTitle.attr("id","listTitle");
	listTitle.attr("placeholder","리스트 제목을 입력하세요");
	
	
	var btncList = $("<button/>");
	btncList.text("Create");
	btncList.attr("class","btn btn-sm btn-primary");
	btncList.attr("type","button");
	btncList.attr("name","btn_cList");
	btncList.attr("onclick","requestCreateList();");
	

	var dropItem=$("<div/>");
	dropItem.attr("class","dropdown-item");
	
	dropItem.append(listTitle);
	dropItem.append(btncList);
	
	dropmenu.append(dropItem);
	
	content.append(dropdiv);
	
	wrapper.append(content);
	
	
	ele.append(wrapper);
}



function responseCreateCard(receive){
	var listCards = $('div[name=listNo_'+receive.listNo+']');
	
	
	var card = $('<div/>');
	var content = $('<span/>');
	var button = $("<span/>");
	button.attr("class",'material-icons btn-edit');
	button.attr("data-toggle","modal");
	button.attr("data-test","cardNo_"+receive.cardNo);
	button.attr("data-target","#cardModal");
	button.text("edit");
	
	
	
	content.text(receive.content);
	
	card.attr("class","list-card");
	card.attr("ondrop","return false");
	card.attr("draggable","true");
	card.attr("ondragstart","cardDrag(this,event)");
	card.attr("ondragend","endCardDrag()");
	card.attr("id","cardNo_"+receive.cardNo);
	card.attr("name","cardNo_"+receive.cardNo);
	
	content.attr("class","card-content");
	
	card.append(content);
	card.append(button);
	listCards.append(card);
}
function requestCreateCard(ele){
	var content = prompt("Card's Title ? ");
	var listNo = parseInt($(ele).parent().parent().children('.list-cards').attr('id').substring(7));
	if(content!=''){
		var sendData = {
				type : "card",
				method : "create",
				content : content,
				userId : userId,
				collaboNo : collaboNo,
				listNo : listNo
		};
		sendMessage(sendData);
	}
}

function requestCreateList(){
	var listTitle= $("#listTitle").val();
	 if(listTitle!=' '){
	
		var sendData = {
			type : "list",
			method : "create",
			content : listTitle,
			userId : userId,
			collaboNo : collaboNo
		};
		sendMessage(sendData);
	 }else{
		 alert('공백은 불가능 합니다.');
	 }
	 
}


function responseDeleteCard(receive){
	var card = $('#cardNo_'+receive.cardNo).children('.card-content').parent();
	card.remove();
	
	var btnClose = $("button[name=btnModalClose]");
	btnClose.click();
}

function responseUpdateCard(receive){
	var card = $('#cardNo_'+receive.cardNo).children('.card-content');
	var modalCard = $("#modalContent");
	
	modalCard.text(receive.content);
	card.text(receive.content);
	
	var btnEdit = $("#btnEdit");
	btnEdit.click();
	
}

function requestMoveList(element, ev){
	console.log($(element));
	console.log(ev.dataTransfer.getData("text"));
	/* document.getElementById("listNo_"+listNo).appendChild(document.getElementById("cardNo_"+cardNo)); */
 	var listNo = $("#"+ev.dataTransfer.getData("text")).attr("id").substring(7);
	var targetListNo = $(element).children().children('.list-cards').attr("id").substring(7);
	var sendData = {
		type : "list",
		method : "move",
		listNo : listNo,
		userId : userId,
		collaboNo : collaboNo,
		targetNo : targetListNo
	};
	sendMessage(sendData); 
}

function responseUpdateList(receive){
	var targetList = $("#listNo_"+receive.listNo).parent().children().children('.list-title');
	targetList.text(receive.content);
}

function requestUpdateList(target){
	var listNo = $(target).parent().parent().parent().parent().parent().children(".list-cards").attr("id").substring(7);
	var content = prompt("Please enter the title of the list to modify");
	sendData={
		type :"list",
		method :"update",
		content : content,
		listNo : listNo,
		userId : userId,
		collaboNo : collaboNo
	};
	sendMessage(sendData);
}



function requestDeleteList(target){
	if(confirm("Are you Delete This List?")){
		var targetList = $(target).parent().parent().parent().parent().parent().children(".list-cards").attr("id").substring(7);
		sendData={
			type : "list",
			method : "delete",
			collaboNo : collaboNo,
			userId : userId,
			listNo : targetList
		};
		sendMessage(sendData);
	}
}


function requestDeletCard(target){
	var isDelete = confirm("Are you delete this card?");
	if(isDelete){
		var cardNo = $("#modalCardNo").val();
		var sendData ={
			type:"card",
			method:"delete",
			userId:userId,
			collaboNo:collaboNo,
			cardNo:cardNo
		};
		sendMessage(sendData);
	}
}


function requestUpdateCard(target){
	var content = $(target).parent().children("#editContent").val();
	var cardNo = $("#modalCardNo").val();
	var sendData ={
		type:"card",
		userId:userId,
		method : "update",
		collaboNo : collaboNo,
		content : content,
		cardNo : cardNo
	};
	
	sendMessage(sendData);
}


function responseMoveList(receive){
	  var listNo = $("#listNo_"+receive.listNo); 
	  var wrapper = $("#listNo_"+receive.targetNo).parent().parent();
	  
	  listNo.parent().parent().append(wrapper.children());
	  wrapper.append(listNo.parent());
	  
	}

function responseDeleteList(receive){
	var list = $("#listNo_"+receive.listNo).parent().parent();
	console.log(list.attr("class"));
	if(list.attr("class")== 'list-wrapper'){
		list.remove();
	}
	if(list.attr("class") == 'list-content'){
		list.parent().remove();
	}
}

function requestInvite(){
	var userId = $("#userId").val();
	
	if(userId!=''){
		$.ajax({
			type : "post",
			url : "${path}/collabo/inviteMember",
			dataType : "json",
			data : {
				userId : userId,
				collaboNo : collaboNo
			},
			success : function(data){
				if(data == "true"){
					alert('초대 메일을 발송했습니다.');
				}
				else if(data == "false"){
					alert('초대 실패!');
				}
			},
			beforeSend:function(){
				$('.wrap-loading').removeClass('display-none');
			},
			complete:function(){
				$('.wrap-loading').addClass('display-none');
			}
		});
	}else{
		alert('아이디를 입력해 주세요.');
	}
}

