<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>매물 수정/삭제</title>
        <!-- reset css -->
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
        <style>
     
            #dealing-mod-delete {
                margin: 15px;
                margin-left: 50px;
                /* margin-right: 50px; */
                padding: 15px;
                
                

            }
            #my-dealing1 {
                margin: 20px;
            }
           
        </style>
    </head>
    <body>
      

        <div id="dealing-mod-delete" style="border:0px; width: 1920px; height: auto; display:inline-block">
            <h2 style="font-weight: bolder; font-size: 1.2em;">매물수정 / 삭제</h2>
            <!--1번 매물-->
            <div
                id="my-dealing1"
                style="width: 550px; height: 100px; border: 1px solid black;display: inline-flex;">
                <div style="margin:20px"><input
                    type="image"
                    src="image/mainlogo.png"
                    style="border: 1px soild grey; width: 100px; height: 60px;">
                </div>

            </div>
            <div
                style="border: 0px solid white; width: auto; height: 50px;display: inline-flex; ">
                <button id="mod" type="submit" onclick="">수정</button>
                <button id="delete" type="submit">삭제</button>
            </div>

            <!--2번 매물-->

            <div
                id="my-dealing1"
                style="width: 550px; height: 100px; border: 1px solid black;display: inline-flex;">
                <div style="margin:20px"><input
                    type="image"
                    src="image/mainlogo.png"
                    style="border: 1px soild grey; width: 100px; height: 60px;">
                </div>

            </div>
            <div
                style="border: 0px solid white; width: auto; height: 50px;display: inline-flex; ">
                <button id="mod" type="submit" onclick="">수정</button>
                <button id="delete" type="submit">삭제</button>
            </div>

            <!--3번 매물-->
            <div
                id="my-dealing1"
                style="width: 550px; height: 100px; border: 1px solid black;display: inline-flex;">
                <div style="margin:20px"><input
                    type="image"
                    src="image/mainlogo.png"
                    style="border: 1px soild grey; width: 100px; height: 60px;">
                </div>

            </div>
            <div
                style="border: 0px solid white; width: auto; height: 50px;display: inline-flex; ">
                <button id="mod" type="submit" onclick="">수정</button>
                <button id="delete" type="submit">삭제</button>
            </div>
            <!--4번매물-->
            <div
                id="my-dealing1"
                style="width: 550px; height: 100px; border: 1px solid black;display: inline-flex;">
                <div style="margin:20px"><input
                    type="image"
                    src="image/mainlogo.png"
                    style="border: 1px soild grey; width: 100px; height: 60px;">
                </div>

            </div>
            <div
                style="border: 0px solid white; width: auto; height: 50px;display: inline-flex; ">
                <button id="mod" type="submit" onclick="">수정</button>
                <button id="delete" type="submit">삭제</button>
            </div>

            <div
                id="my-dealing1"
                style="width: 550px; height: 100px; border: 1px solid black;display: inline-flex;">
                <div style="margin:20px"><input
                    type="image"
                    src="image/mainlogo.png"
                    style="border: 1px soild grey; width: 100px; height: 60px;">
                </div>

            </div>
            <div
                style="border: 0px solid white; width: auto; height: 50px;display: inline-flex; ">
                <button id="mod" type="submit" onclick="">수정</button>
                <button id="delete" type="submit">삭제</button>
            </div>

            <div
                id="my-dealing1"
                style="width: 550px; height: 100px; border: 1px solid black;display: inline-flex;">
                <div style="margin:20px"><input
                    type="image"
                    src="image/mainlogo.png"
                    style="border: 1px soild grey; width: 100px; height: 60px;">
                </div>

            </div>
            <div
                style="border: 0px solid white; width: auto; height: 50px;display: inline-flex; ">
                <button id="mod" type="submit" onclick="">수정</button>
                <button id="delete" type="submit">삭제</button>
            </div>
        </div>
    </body>
</html>