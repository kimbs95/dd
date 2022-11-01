<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
  request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>다드림 관리자페이지</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="/css/admin/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="${contextPath}/admin/admin.do">다드림 Admin</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
                <div class="input-group">            
                </div>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="${contextPath}/admin/admin.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                매출관리
                            </a>
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseProduct" aria-expanded="false" aria-controls="pagesCollapseProduct">
                                        상품관리
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseProduct" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="#">상품조회</a>
                                            <a class="nav-link" href="#">상품리뷰관리</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseDealing" aria-expanded="false" aria-controls="pagesCollapseDealing">
                                        매물관리
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseDealing" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="${contextPath}/admin/dealingsList.do">매물목록</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseMember" aria-expanded="false" aria-controls="pagesCollapseMember">
                                        회원관리
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseMember" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="#">회원조회</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseReport" aria-expanded="false" aria-controls="pagesCollapseReport">
                                        신고관리
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseReport" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="${contextPath}/admin/reportList.do">신고내역</a>
                                        </nav>
                                    </div>
                                </nav>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <h1>매물관리</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">Dealin Management</li>
                </ol>
                <h3>매물내역</h3>
                <div style="margin: 100px 20px 0 20px;">
                    <div class="card mb-12">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            매물 목록
                        </div>
                        <div class="card-body">
                            <input type="checkbox" name="checkAll" onclick="selectAll(this)"> 전체선택
                            <form name="dealingForm" method="post" action="/admin/deleteDealing.do">
                        <table id="datatablesSimple">
                            <thead>
                                <div style="margin-bottom: 40px;">
                                </div>
                                <tr>
                                    <th style="width: 3%;">체크</th>
                                    <th>매물번호</th>
                                    <th>매물명</th>
                                    <th>매물종류</th>
                                    <th>매매종류</th>
                                    <th>등록날짜</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="dl" items="${dealingsList}">
                            <tr>
                                <td>
                                    <input id="checkAll" name="checkAll" type="checkbox" value="${dl.dl_Num}">
                                </td>
                                <td>${dl.dl_Num}</td>
                                <td><a href="${contextPath}/admin/adminDlView.do?dl_Num=${dl.dl_Num}">${dl.dl_Title}</a></td>
                                <td>${dl.dl_Form}</a></td>
                                <td>${dl.dl_Form2}</td>
                                <td>${dl.dl_Date}</td>
                                </tr>
                        </c:forEach>
                            </tbody>
                        </table>
                        <input type="submit" value="선택삭제">
                    </form>
                    </div>
                </div>
            </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2022</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script>
            /* 전체선택 */
            function selectAll(selectAll) {
                var checkboxes = document.getElementsByName('checkAll');

                checkboxes.forEach(function (checkbox) {
                    checkbox.checked = selectAll.checked;
                });
                console.log(checkboxes);
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/admin/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="/js/admin/chart-area-demo.js"></script>
        <script src="/js/admin/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/js/admin/datatables-simple-demo.js"></script>
    </body>
</html>