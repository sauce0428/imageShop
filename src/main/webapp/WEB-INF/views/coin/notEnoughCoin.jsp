<%@ page contentType="text/html;charset=UTF-8"%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 

<html>
<head>
    <title>코인 부족 알림</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Pretendard:wght@400;700&family=Noto+Sans+KR:wght@400;700&display=swap">
    
    <link rel="stylesheet" type="text/css" href="<spring:url value='/css/coin.css'/>">
</head>
<body>
    <div class="coin-notice-container">
        <h2><spring:message code="coin.header.chargeCoin" /></h2> 
 
        <p><spring:message code="coin.notEnoughCoin" /></p> 
 
        <a href="charge"><spring:message code="coin.charge" /></a> 
    </div>
    
    <script>
        const starsCount = 300; // 별 수 (300개)
        for (let i = 0; i < starsCount; i++) {
            const star = document.createElement("div");
            star.className = "star";
            // 랜덤한 위치 설정
            star.style.top = Math.random() * window.innerHeight + "px";
            star.style.left = Math.random() * window.innerWidth + "px";
            // 랜덤한 크기 설정 (1px ~ 3px)
            star.style.width = star.style.height = (Math.random() * 2 + 1) + "px";
            // 랜덤한 애니메이션 속도 및 지연 시간 설정
            star.style.animationDuration = (Math.random() * 3 + 2) + "s";
            star.style.animationDelay = Math.random() * 5 + "s";
            document.body.appendChild(star);
        }
    </script>
</body>
</html>