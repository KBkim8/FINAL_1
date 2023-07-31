<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set value="${pageContext.request.contextPath}" var="root" />
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="/app/resources/css/chat/list.css">
	</head>

	<body>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
			<nav>
				
			</nav>

			<main>
				<div id="wrap">
					<div id="left-area">
						<div class="upper-area">
							<span>채팅방 목록</span>
						</div>
						<div class="content-area">
							<div class="icon-area">
								<div class="icon-wrap">
									<button><i class="fa-solid fa-user-group fa-2x"></i></button>
									<button class="moveChatList"><i class="fa-solid fa-comment fa-2x" style="color: #858181;"></i></button>
								</div>
							</div>
							<div class="room-list-area">
								<div id="roomArea">
									<c:forEach items="${rList}" var="rList">
										<div class="room-name" id="detailBtn">
											<div id="roomNo" hidden>${rList.no}</div>
											<img src="${root}/resources/img/chat/${rList.img}" alt="채팅방사진">
											<span id="roomName">${rList.name}</span>
										</div>
									</c:forEach>
								</div>
								<!-- 채팅 만들기 버튼 함수 추가~~ -->
								<button class="openChat"> + 새로운 채팅</button>
							</div>
						</div>
					</div>
					<div id="chat-area">
						<div id="chatArea"><div id="chatMessageArea"></div></div>
						<div class="input-area">
							<textarea name="" id="message" placeholder="내용을 입력하세요."></textarea>
							<button id="sendBtn" onclick="f01();">보내기</button>
						</div>
					</div>
				</div>

				<!-- 채팅방 친구 초대 모달 영역 -->
				<div class="invite-modal hidden">
					<div class="bg"></div>
					<div class="invite-modalBox">
						<div class="upper-bar">
							<span>채팅방 생성</span>
							<button class="invite-closeBtn"><i class="fa-solid fa-xmark fa-2x"></i></button>
						</div>
						<div class="invite-first-area">
							<div class="search-list">
								<input type="text" id="name">
								<button class="searchBtn">검색</button>
							</div>
							<form action="/app/chat/add" method="post">
								<div class="friend-list">
									<c:forEach begin="1" end="10">
										<div>
											<img src="/app/resources/profile/profile03sponge.jpg" alt="프로필사진">
											<span>이정민</span>
											<label for="addMember"><input type="checkbox" name="checkMember"></label>
										</div>
									</c:forEach>
								</div>
							</form>
								<div id="inviteBtn"><button>채팅 시작하기</button></div>
							</div>
					</div>
				</div>
			</main>

	</body>

	</html>

	<script>
		
		// 헤더 함수 실행
		basicSetting();
    	headerName('채팅');

		// 체크 박스 체크
        const changeBox = () => {
        document.querySelector(".checkedBox").classList.remove("hidden");
        };

        // 체크 박스 해제
        const backBox = () => {
        document.querySelector(".checkedBox").classList.add("hidden");
        };

        const checkBox = document.querySelectorAll(".checkBox");
        checkBox.forEach((btn) => {
        btn.addEventListener("click", changeBox);
        });

		// 채팅 아이콘 클릭 시 이동
		const chatIcon = document.querySelector(".moveChatList");
		chatIcon.addEventListener("click", function(){
			location.href="/app/chat/detail";
		})

		// 채팅방 초대 모달 열기
        const openListModal = () => {
        document.querySelector(".invite-modal").classList.remove("hidden");
        };

        // 채팅방 초대 모달 닫기
        const closeListModal = () => {
        document.querySelector(".invite-modal").classList.add("hidden");
        };

		// 모달 닫기 버튼에 이벤트 추가
		document.querySelector(".invite-closeBtn").addEventListener("click", closeListModal);

		// 모달 배경 클릭 시 모달 닫기
		document.querySelector(".bg").addEventListener("click", closeListModal);


		// 친구 초대 클릭 이벤트 추가
		const inviteBtn = document.querySelector(".openChat");
		inviteBtn.addEventListener("click", openListModal);
		
		// 채팅방 눌렀을 시, detail 로 이동
		$(document).ready(function() {
			const detailBtns = document.querySelectorAll("#detailBtn");
			detailBtns.forEach((btn) => {
			btn.addEventListener("click", function() {
			var rno = $(this).closest("div").find("#roomNo").text().trim();
			console.log(rno);

		// $.ajax({
		// 		type: "GET",
		// 		url: "/app/chat/detail",
		// 		data: {no : rno},
		// 		success: function(response) {
		// 			console.log(response);
		// 			location.href="/app/chat/detail?no=" + rno;
		// 		},
		// 		error: function(error) {
		// 			console.log(error);
		// 		}
		// 	});
		})
			});
	});
	
	

	</script>