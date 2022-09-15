<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>

<head>
  <meta charset="UTF-8" />
  <title>Vanilla js slide with pagination</title>
  <style>

    
    /* 슬라이드 화면 css */
    .slide {
      margin-top: 20px;
      margin-bottom: 20px;
      

      /* layout */
      display: flex;
      flex-wrap: nowrap;
      /* 컨테이너의 내용물이 컨테이너 크기(width, height)를 넘어설 때 보이지 않도록 하기 위해 hidden을 준다. */
      overflow: hidden;

      /* position */
      /* slide_button의 position absolute가 컨테이너 안쪽에서 top, left, right offset이 적용될 수 있도록 relative를 준다. (기본값이 static인데, static인 경우 그 상위 컨테이너로 나가면서 현재 코드에선 html을 기준으로 offset을 적용시키기 때문) */
      position: relative;

      /* size */
      width: 1130px;
      
    }

    .slide_item {
      /* layout */
      display: flex;
      align-items: center;
      justify-content: center;

      /* position - 버튼 클릭시 left offset값을 적용시키기 위해 */
      position: relative;
      left: 0px;

      /* size */
      width: 1130px;
      height: 350px;
      /* flex item의 flex-shrink는 기본값이 1이므로 컨테이너 크기에 맞게 줄어드는데, 슬라이드를 구현할 것이므로 줄어들지 않도록 0을 준다. */
      flex-shrink: 0;

      /* transition */
      transition: left 0.15s;
    }

    .slide_button {
      /* layout */
      display: flex;
      justify-content: center;
      align-items: center;

      /* position */
      position: absolute;
      /* 버튼이 중앙에 위치하게 하기위해 계산 */
      top: calc(50% - 16px);

      /* size */
      width: 32px;
      height: 32px;

      /* style */
      border-radius: 100%;
      background-color: #cccc;
      cursor: pointer;
    }

    .slide_prev_button {
      left: 10px;
    }

    .slide_next_button {
      right: 10px;
    }

    /* 각 슬라이드가 변경되는 것을 시각적으로 확인하기 쉽도록 각 슬라이드별 색상 적용 */
    .slide_item:nth-child(1) {
      background-color: darkgoldenrod;
    }

    .slide_item:nth-child(2) {
      background-color: aqua;
    }

    .slide_item:nth-child(3) {
      background-color: blueviolet;
    }

    .slide_item:nth-child(4) {
      background-color: burlywood;
    }

    .slide_item:nth-child(5) {
      background-color: cornflowerblue;
    }

    /* 페이지네이션 스타일 */
    ul,
    li {
      list-style-type: none;
      padding: 0;
      margin: 0;
    }
    .slide_pagination {
      /* layout */
      display: flex;
      gap: 5px;

      /* position */
      position: absolute;
      bottom: 0;
      /* left:50%, translateX(-50%)를 하면 가로 가운데로 위치시킬 수 있다. */
      left: 50%;
      transform: translateX(-50%);
    }
    .slide_pagination>li {
      /* 현재 슬라이드가 아닌 것은 투명도 부여 */
      color: #7fb5ff88;
      cursor: pointer;
      font-size: 25px;
    }
    .slide_pagination>li.active {
      /* 현재 슬라이드 색상은 투명도 없이 */
      color: #7fb5ff;
    }
    .pro_category_menu {
      display: flex;
      margin: 15px 0;
    }
    .pro_category_menu p{
      margin: 10px 0;
    }
    .fixed{
      position: fixed;
    }
  </style>
</head>

<body>
  <!-- 슬라이드 body -->
  <div class="slide slide_wrap .fixed">
    <div class="slide_item">1</div>
    <div class="slide_item">2</div>
    <div class="slide_item">3</div>
    <div class="slide_item">4</div>
    <div class="slide_item">5</div>
    <div class="slide_prev_button slide_button">◀</div>
    <div class="slide_next_button slide_button">▶</div>
    <ul class="slide_pagination"></ul>
  </div>

  <!-- 카테고리상품들 -->
  <div class="pro_category_padding">
    <div class="pro_category_menu">
      <img src="../메인 카테고리 사진/스텐드.png" alt="" width="200px" height="200px">
      <div class="pro_category_content">
        <p>title</p>
        <p>pay</p>
        <p>content</p>
      </div>
    </div>
    <div class="pro_category_menu">
      <img src="../메인 카테고리 사진/스텐드.png" alt="" width="200px" height="200px">
      <div class="pro_category_content">
        <p>title</p>
        <p>pay</p>
        <p>content</p>
      </div>
    </div>
    <div class="pro_category_menu">
      <img src="../메인 카테고리 사진/스텐드.png" alt="" width="200px" height="200px">
      <div class="pro_category_content">
        <p>title</p>
        <p>pay</p>
        <p>content</p>
      </div>
    </div>
    <div class="pro_category_menu">
      <img src="../메인 카테고리 사진/스텐드.png" alt="" width="200px" height="200px">
      <div class="pro_category_content">
        <p>title</p>
        <p>pay</p>
        <p>content</p>
      </div>
    </div>
    <div class="pro_category_menu">
      <img src="../메인 카테고리 사진/스텐드.png" alt="" width="200px" height="200px">
      <div class="pro_category_content">
        <p>title</p>
        <p>pay</p>
        <p>content</p>
      </div>
    </div>
  </div>
  <script>
    // 슬라이크 전체 크기(width 구하기)

    const slide = document.querySelector(".slide");
    let slideWidth = slide.clientWidth;

    // 버튼 엘리먼트 선택하기
    const prevBtn = document.querySelector(".slide_prev_button");
    const nextBtn = document.querySelector(".slide_next_button");

    // 슬라이드 전체를 선택해 값을 변경해주기 위해 슬라이드 전체 선택하기
    const slideItems = document.querySelectorAll(".slide_item");
    // 현재 슬라이드 위치가 슬라이드 개수를 넘기지 않게 하기 위한 변수
    const maxSlide = slideItems.length;

    // 버튼 클릭할 때 마다 현재 슬라이드가 어디인지 알려주기 위한 변수
    let currSlide = 1;

    // 페이지네이션 생성
    const pagination = document.querySelector(".slide_pagination");

    for (let i = 0; i < maxSlide; i++) {
      if (i === 0) pagination.innerHTML += `<li class="active">•</li>`;
      else pagination.innerHTML += `<li>•</li>`;
    }

    const paginationItems = document.querySelectorAll(".slide_pagination > li");
    console.log(paginationItems);

    // 버튼 엘리먼트에 클릭 이벤트 추가하기
    nextBtn.addEventListener("click", () => {
      // 이후 버튼 누를 경우 현재 슬라이드를 변경
      currSlide++;
      // 마지막 슬라이드 이상으로 넘어가지 않게 하기 위해서
      if (currSlide <= maxSlide) {
        // 슬라이드를 이동시키기 위한 offset 계산
        const offset = slideWidth * (currSlide - 1);
        // 각 슬라이드 아이템의 left에 offset 적용
        slideItems.forEach((i) => {
          i.setAttribute("style", `left: ${-offset}px`);
        });
        // 슬라이드 이동 시 현재 활성화된 pagination 변경
        paginationItems.forEach((i) => i.classList.remove("active"));
        paginationItems[currSlide - 1].classList.add("active");
      } else {
        currSlide--;
      }
    });
    // 버튼 엘리먼트에 클릭 이벤트 추가하기
    prevBtn.addEventListener("click", () => {
      // 이전 버튼 누를 경우 현재 슬라이드를 변경
      currSlide--;
      // 1번째 슬라이드 이하로 넘어가지 않게 하기 위해서
      if (currSlide > 0) {
        // 슬라이드를 이동시키기 위한 offset 계산
        const offset = slideWidth * (currSlide - 1);
        // 각 슬라이드 아이템의 left에 offset 적용
        slideItems.forEach((i) => {
          i.setAttribute("style", `left: ${-offset}px`);
        });
        // 슬라이드 이동 시 현재 활성화된 pagination 변경
        paginationItems.forEach((i) => i.classList.remove("active"));
        paginationItems[currSlide - 1].classList.add("active");
      } else {
        currSlide++;
      }
    });

    // 브라우저 화면이 조정될 때 마다 slideWidth를 변경하기 위해
    window.addEventListener("resize", () => {
      slideWidth = slide.clientWidth;
    });

    // 각 페이지네이션 클릭 시 해당 슬라이드로 이동하기
    for (let i = 0; i < maxSlide; i++) {
      // 각 페이지네이션마다 클릭 이벤트 추가하기
      paginationItems[i].addEventListener("click", () => {
        // 클릭한 페이지네이션에 따라 현재 슬라이드 변경해주기(currSlide는 시작 위치가 1이기 때문에 + 1)
        currSlide = i + 1;
        // 슬라이드를 이동시키기 위한 offset 계산
        const offset = slideWidth * (currSlide - 1);
        // 각 슬라이드 아이템의 left에 offset 적용
        slideItems.forEach((i) => {
          i.setAttribute("style", `left: ${-offset}px`);
        });
        // 슬라이드 이동 시 현재 활성화된 pagination 변경
        paginationItems.forEach((i) => i.classList.remove("active"));
        paginationItems[currSlide - 1].classList.add("active");
      });
    }
  </script>
</body>

</html>