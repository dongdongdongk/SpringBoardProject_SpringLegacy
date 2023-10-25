<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<c:import url="../common/common.jsp"></c:import>
	<c:import url="../common/nav.jsp"></c:import>
	<title>로그인</title>
    <style>
        /* 중앙 정렬을 위한 스타일 */
        .center-container {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh; /* 화면 전체 높이에 맞추기 */
        }
    </style>
</head>
<body>
    <div class="container center-container">
        <div class="row">
            <div class="col-md-12">
                <form class="form-horizontal" action="/action_page.php">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="email">ID</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="email" placeholder="ID" name="email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="pwd">PW</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="pwd" placeholder="Password" name="pwd">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">로그인</button>
                            <button class="btn btn-default" type="button" onclick="location.href='/board/userJoin'">회원가입</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>


</body>
</html>