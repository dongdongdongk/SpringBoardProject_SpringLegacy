<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>      
            <head>
                <meta charset="UTF-8">
                <c:import url="../common/common.jsp"></c:import>
                <link rel="stylesheet" href="/css/searchBoard.css">
                <title>검색</title>
            </head>   
            <body>
            <c:import url="../common/nav.jsp"></c:import>
            <h1></h1>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-1">
                        <div class="image-container">
                            <a href="http://www.wooriict.com" target="_blank"><img alt="em" src="https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png" ></a>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="cs-form">
                            <input type="text" class="form-control input-sm" name="searchInput" id="searchInput" />
                        </div>
                    </div>
                    <button class="button" onclick="test()">입력</button>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div id="result"></div>
                    </div>
                </div>
            </div>
            <script src="../js/searchBoard.js"></script>
        </body>

        </html>