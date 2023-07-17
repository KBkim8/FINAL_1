<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://kit.fontawesome.com/794ac64f16.js" crossorigin="anonymous"></script>
		<style>
			* {
				padding: 0px;
				margin: 0px;
				box-sizing: border-box;
			}

			body {
				font-family: 'Noto Sans KR';
				color: #2e2e2e;
				overflow-x: hidden;
				font-weight: 400;
				background-color: #f5f5f5;
			}

			body::-webkit-scrollbar {
				width: 12px;
			}

			body::-webkit-scrollbar-thumb {
				background: #4A321F;
				/* 스크롤바 색상 */
				/* border-radius: 10px; 스크롤바 둥근 테두리 */
			}

			body::-webkit-scrollbar-track {
				background: #4a321f23;
				/*스크롤바 뒷 배경 색상*/
			}

			#floor {
				height: 1500px;
				width: 1920px;
				display: flex;
				justify-content: center;
				align-items: center;
			}

			#login-area {
				display: flex;
				justify-content: center;
				width: 1200px;
				height: 1300px;
				margin: 50px;
				padding: 100px;
				background-color: #FAD355;
				border-radius: 60px;
				overflow-y: scroll;
			}

			#login-area::-webkit-scrollbar {
				display: none;
			}

			#loginForm {
				width: 100%;
				display: grid;
				grid-template-columns: 1.5fr 3fr 1.5fr;
				align-items: center;
			}

			#loginForm>div:not(.box4) {
				display: flex;
				justify-content: center;
				align-items: center;
			}

			.logo {
				font-size: 52px;
				font-weight: bold;
				text-align: center;
			}

			.box {
				background-color: rgb(255, 255, 255);
				border-radius: 20px;
				border: none;
				height: 70px;
			}

			.box2 {
				background-color: #4A321F;
				color: white;
				width: 100%;
				font-size: 24px;
			}

			.box3 {
				background-color: #4A321F;
				margin-left: 50px;
				margin-right: 50px;
				color: white;
				font-size: 24px;
			}

			.box4 {
				display: flex;
				justify-content: space-between;
				align-items: center;
				border: none;
				height: 70px;
			}

			.box5 {
				background-color: red;
				color: white;
				font-size: 24px;
				width: 25%;
			}

			#tit {
				font-size: 28px;
			}

			#tit3 {
				font-size: 44px;
				font-weight: bold;
			}

			.grayCircle {
				position: relative;
				width: 200px;
				height: 200px;
				border-radius: 90%;
				background-color: #929292;
				display: flex;
				justify-content: center;
				align-items: center;
			}

			#cir {
				height: 45px;
				width: 45px;
				background-color: white;
				position: absolute;
				border-radius: 70%;
				top: 10px;
				left: 150px;
			}
		</style>

	</head>

	<body>
		<div id="floor">
			<div id="login-area">
				<div id="loginForm">
					<div></div>
					<div class="logo">HONEY POT</div>
					<div></div>
					<div></div>
					<div>
						<div class="grayCircle">
							<div id=cir><i class="fa-solid fa-gear fa-2xl" style="color: #d9d9d9;"></i></div>
							<i class="fa-sharp fa-solid fa-user fa-7x" style="color: #ffffff;"></i>
						</div>
					</div>
					<div></div>
					<div></div>
					<div id="tit3">관리소장</div>
					<div></div>
					<div id="tit">아이디</div>
					<input type="text" class="box">
					<div></div>
					<div id="tit">비밀번호</div>
					<input type="text" class="box">
					<div class="box3 box">수정</div>
					<div id="tit">이름</div>
					<input type="text" class="box">
					<div></div>

					<div></div>
					<input type="submit" class="box box2" value="수정">
					<div></div>
				</div>
			</div>
		</div>
	</body>

	</html>

	<script>

	</script>