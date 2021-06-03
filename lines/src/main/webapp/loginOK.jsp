<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
body, html {
  margin: 0;
  padding: 0;
  height: 100%;
  width: 100%;
  font-family: 'Open Sans', sans-serif;
}

main {
  height: 100%;
  width: 100%;
}

aside {
  background-color: #969696;
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  width: 20%;
  z-index: 1;
}

section {
  position: relative;
  width: 100%;
  height: 100%;
  background-color: #fff;
  overflow: hidden;
}

label {
  display: inline-block;
  padding: 7px 10px;
  background-color: transparent;
  cursor: pointer;
  margin: 10px;
  z-index: 3;
  position: fixed;
}

.bar {
  display: block;
  background-color: #969696;
  width: 30px;
  height: 3px;
  border-radius: 5px;
  margin: 5px auto;
  transition: background-color .5s ease-in, transform .5s ease-in, width .5s ease-in;
}
@import url(https://fonts.googleapis.com/css?family=Exo:100,200,400);
@import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300);

.content {
  top: 0;
  bottom: 0;
  position: absolute;
  right: 0;
  left: 0;
  background-color: #fff;
  z-index: 2;
  transition: transform .5s ease-in-out;
  background-image: url(https://png.pngtree.com/back_origin_pic/04/31/05/e539c5c4cf53f99633511ff5124a7584.jpg);
  background-size: cover;
}
h1 {
  margin: 0;
  position: relative;
  top: 70%;
  left: -90px;
  right: 0;
  font-weight: bold; /*太字に*/
  transform: translateY(-50%);
  text-align: center;
  font-size: 40px;
}

.asideList {
  list-style: none;
  padding: 0;
  margin: 0;
  margin-top: 100px;
  text-align: center;
  border-top: 2px solid rgb(0 0 0 / 70%);
}

.asideAnchor {
  border-bottom: 2px solid rgb(0 0 0 / 70%);
  padding: 20px 0;
  display: block;
  color: #fff;
  text-transform: uppercase;
  text-decoration: none;
  font-size: 20px;
  font-weight: 500;
  position: relative;
  transition: color .3s .15s ease-in;
}

.asideAnchor::after {
  content: "";
  position: absolute;
  left: 0;
  bottom: 0;
  height: 100%;
  background-color: #fff;
  width: 0;
  transition: width .3s ease-in;
  z-index: -1;
}

.asideAnchor:hover {
  color: rgb(0 0 0 / 70%);
}

.asideAnchor:hover::after {
  width: 100%;
}

input[type="checkbox"] {
  display: none;
}

input[type="checkbox"]:checked ~ .content {
  transform: translateX(20%);
}

input[type="checkbox"]:checked ~ label .bar {
  background-color: #fff;
}

input[type="checkbox"]:checked ~ label .top {
  -webkit-transform: translateY(0px) rotateZ(45deg);
  -moz-transform: translateY(0px) rotateZ(45deg);
  -ms-transform: translateY(0px) rotateZ(45deg);
  -o-transform: translateY(0px) rotateZ(45deg);
  transform: translateY(0px) rotateZ(45deg);
}

input[type="checkbox"]:checked ~ label .bottom {
  -webkit-transform: translateY(-15px) rotateZ(-45deg);
  -moz-transform: translateY(-15px) rotateZ(-45deg);
  -ms-transform: translateY(-15px) rotateZ(-45deg);
  -o-transform: translateY(-15px) rotateZ(-45deg);
  transform: translateY(-15px) rotateZ(-45deg);
}

input[type="checkbox"]:checked ~ label .middle {
  width: 0;
}

.middle {
  margin: 0 auto;
}

.ua {
  position: absolute;
  right: 20px;
  bottom: 20px;
  color: #6666ff;
  font-size: 2em;
  z-index: 2;
}

@import url(https://fonts.googleapis.com/css?family=Lato:300);

.container {
  font-family: "Lato";
  font-size: 20px;
  font-weight: 300;
  width: 60%;
  margin: 2em auto;
  
  border-top: 2px solid #555;
  border-bottom: 2px solid #555;
  line-height: 1.4;
  padding: 20px 0;
  background: #CCC;
  background-image: -webkit-gradient(linear,0% 0%,25% 100%,from(#FF2C2C),to(#7A5E91));
  background-image: -moz-gradient(linear,0% 0%,25% 100%,from(#FF2C2C),to(#7A5E91));
  background-image: -ms-gradient(linear,0% 0%,25% 100%,from(#FF2C2C),to(#7A5E91));
  -webkit-background-clip: text;
  -moz-background-clip: text;
  -ms-background-clip: text;
  -webkit-text-fill-color: transparent;
  -moz-text-fill-color: transparent;
  -ms-text-fill-color: transparent;  
}

h2 {
  padding: 1rem 2rem;
  border-top: 4px solid #d8dcdc;
  border-right: 4px solid #666;
  border-bottom: 4px solid #333;
  border-left: 4px solid #868888;
  border-radius: 0;
  background-image: -webkit-linear-gradient(135deg, #ccc 0%, #868888 20%, #d8dcdc 34%, white 53%, #ccc 100%);
  background-image: linear-gradient(-45deg, #ccc 0%, #868888 20%, #d8dcdc 34%, white 53%, #ccc 100%);
  position: relative;
  top: -20px;
  width: 90.7%;
  left: 70px;
}

/****** 文字を点滅せさるアニメーション *******/
.blinktext{
-webkit-animation:blink 1.2s ease-in-out infinite alternate;
-moz-animation:blink 1.2s ease-in-out infinite alternate;
animation:blink 1.2s ease-in-out infinite alternate;
}
@-webkit-keyframes blink{
0% {opacity:0;}
100% {opacity:1;}
}
@-moz-keyframes blink{
0% {opacity:0;}
100% {opacity:1;}
}
@keyframes blink{
0% {opacity:0;}
100% {opacity:1;}
}


.main2 {
  position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}

.main2-heading {
  color: #1c0f0f;
  text-transform: uppercase;
}

.main2-heading-primary {
  display: block;
  font-size: 5.0rem;
  font-weight: 400;
  letter-spacing: 35px;
  animation: moveInLeft 1s ease-out;
}

.main2-heading-secondary {
  font-family: sans-serif;
  display: block;
  font-size: 1.5rem;
  font-weight: bold;
  text-align: center;
  letter-spacing: 31px;
  color: #000000;
  animation: moveInRight 1s ease-out;
  left: 120px;
  position: relative;
}

@keyframes moveInLeft {
  0% {
    opacity: 0;
    transform: translateX(-100px);
  }
  
  80% {
    transform: translateX(10px);
  }
  
  100% {
    opacity: 1;
    transform: translate(0);
  }
}

@keyframes moveInRight {
  0% {
    opacity: 0;
    transform: translateX(100px);
  }
  
  80% {
    transform: translateX(-10px);
  }
  
  100% {
    opacity: 1;
    transform: translate(0);
  }
}


</style>
<title>lines</title>
</head>
<body>

<main>
  <aside>
    <ul class="asideList">
      <li><a href="/lines/WelcomeServlet" class="asideAnchor">トップへ</a></li>
      <li><a href="/lines/timelineServlet" class="asideAnchor">タイムラインへ</a></li>
      <li><a href="/lines/userchatServlet" class="asideAnchor">ユーザーチャットへ</a>
    </ul>
  </aside>
  <section>
    <input type="checkbox" id="myInput">
    <label for="myInput">
      <span class="bar top"></span>
      <span class="bar middle"></span>
      <span class="bar bottom"></span>
    </label>

    <div class="content"> 
     <h1></h1>
     <h2>ようこそ<c:out value="${userid}"/>さん!左のメニューバーからコンテンツを選択...<span class="blinktext">▼</span></h2>
     <div class="main2">
      <h3 class="main2-heading">
    <span class="main2-heading-primary">Lines</span>
    <span class="main2-heading-secondary">～It's ChatTool～</span>
  </h3>
</div>
    </div>
  </section>
</main>

</body>
</html>