<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	main {
		height: 100vh;
		display: flex;
		justify-content: center;
		align-items: center;
	}

	#board-list td:first {width: 50px;}

	#board-list {
		border-bottom: 3px solid #FAD355;
		border-spacing: 100px 0px;
	}

	.fa-solid fa-heart {color: red;}

	.board-list-area{
		width: 1560px;
		display: flex;
		justify-content: center;
		align-items: center;
	}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<nav>
		<%@ include file="/WEB-INF/views/common/first-nav.jsp"%>
	</nav>

	<main>
		
		<div id="search-box">
			<input type="search">
		</div>

		<div class="board-list-area">
			<table id="board-list">
				<tr>
					<td>제목ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ</td>
					<td>작성자</td>
					<td>날짜</td>
					<td><i class="fa-solid fa-heart"></i>좋아요</td>
					<td><i class="fa-solid fa-eye"></i>조회수</td>
				</tr>
			</table>
		</div>
			

	</main>

</body>
</html>

<script>
	const nav = document.querySelector("nav");
	const main = document.querySelector("main");
	const mainArea = document.querySelector("#main-area");
	const navArea = document.querySelector("#nav-area");

	mainArea.innerHTML = main.innerHTML;
	navArea.innerHTML = nav.innerHTML;
	main.innerHTML = "";
	nav.innerHTML = "";
</script>