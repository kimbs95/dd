<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <style>
  
    .list,.list th,.list td{
      border: 0;
      text-align: center;
    }
    .list a{
      
      text-decoration: none;
    }
    .list{
      width: 1000px;
      border-bottom: 1px solid black;
      color: gray;
      font-size: 12px;
      table-layout: fixed;
    }
    .list caption{
      display: none;
    }
    .list th{
      padding: 5px 0 6px;
      border-top: solid 1px black;
      border-bottom: solid 1px black;
      background-color: #f1f1f4;
      color: #333;
      font-weight: bold;
      line-height: 20px;
      vertical-align: top;
      width: 30px;
    }
    .list td{
      padding: 8px 0 9px;
      border-bottom: solid 1px #d2d2d2;
      text-align: center;
      line-height: 18px;
      
    }
    .list .date,.list .view{
      padding: 0;
      font-family: Tahoma;
      font-size: 11px;
      line-height: normal;
    }
    .list .num{
      text-align: center;
      /* padding-left: 15px; */
      font-size: 13px;
    }
    .write-btn :hover{ color: burlywood;
      
    }
    .write-btn{
      text-align: right;
      width: 1000px;
      margin-bottom: 2px;
    }
  </style>
</head>
<body>
  

    <div class="write-btn">
      <a href="${contextPath}/inteboardform.do"><input type="button" value="글쓰기"></a>
    </div>
    <table class="list" border="1" cellspacing="0" summary="게시판의 글제목 리스트">
      <caption>게시판 리스트</caption>
      <colgroup>
        <col>
        <col width="200">
        <col width="120">
        <col width="100">
      </colgroup>
      <thead>
        <tr>
      <th scope="col">Num</th>
      <th scope="col">제목</th>
      <th scope="col">작성자</th>
      <th scope="col">작성일</th>
      <th scope="col">조회수</th>
    </tr>
  </thead>
  <tbody>
    
    <tr>
      <td class="num">${board.inte_Num}</td>
      <td class="title"><a href="#" action="">${board.inte_Title}</a></td>
      <td class="name">${board.user_Id}</td>
      <td class="date">${board.inte_Date}</td>
      <td class="view">11</td>
    </tr>
  
    <tr class="">
      <td class="num">2</td>
      <td class="title"><a href="#" action="">0000</a></td>
      <td class="name">육주영</td>
      <td class="date">2022.09.22</td>
      <td class="view">555</td>
    </tr>
    <tr class="">
      <td class="num">3</td>
      <td class="title"><a href="#" action="">0000</a></td>
      <td class="name">육주영</td>
      <td class="date">2022.09.22</td>
      <td class="view">555</td>
    </tr>
    <tr class="">
      <td class="num">4</td>
      <td class="title"><a href="#" action="">0000</a></td>
      <td class="name">육주영</td>
      <td class="date">2022.09.22</td>
      <td class="view">555</td>
    </tr>
    <tr class="">
      <td class="num">5</td>
      <td class="title"><a href="#" action="">0000</a></td>
      <td class="name">육주영</td>
      <td class="date">2022.09.22</td>
      <td class="view">555</td>
    </tr>
  </tbody>
</table>


</body>
</html>