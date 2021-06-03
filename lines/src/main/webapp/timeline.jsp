<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "model.timelinelogic,model.tubuyakiID,java.util.List" %>
<% 
//リクエストスコープに保存されたつぶやきリストを取得
List<tubuyakiID> tubu = (List<tubuyakiID>)application.getAttribute("tubuyakilist");
%>

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

.content {
  top: 0;
  bottom: 0;
  position: absolute;
  right: 0;
  left: 0;
  background-color: #fff;
  z-index: 2;
  transition: transform .5s ease-in-out;
  background-image: url(https://data.1freewallpapers.com/download/circuit-chip-neon-abstraction.jpg);
  background-size: cover;
}

h1 {
  margin: 0;
  position: relative;
  top: 50%;
  left: 0;
  right: 0;
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
  color: #969696;
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
.box{
  width: 77.5%;
    height: 63%;
    left: 5px;
    padding: 30px;
    margin: 0;
    top: -25px;
    position: relative;
    background: #ddd;
    border: dashed 4px #969696;
    padding: 0.2em 0.5em;
    color: #454545;
}

.box:after{
    positiot: '';
    right: -7px;
    top: -7px;
    border-width: 0 15px 15px 0;
    border-style: solid;
    border-color: #ffdb88 #fff #ffdb88;
    box-shadow: -1px 1px 1px rgba(0, 0, 0, 0.15);
}
.box p {
    margin: 0; 
    padding: 0;
}
.scroll{
  overflow:scroll;
}
.scrollx{
  overflow:hidden;
  overflow-x:scroll;
}
.scrolly{
  overflow:hidden;
  overflow-y:scroll;
}
p{
 white-space:nowrap; 
}
.textlines {
    border: 4px solid #868888;  /* 枠線 */
    border-radius: 0.67em;   /* 角丸 */
    padding: 0.5em;          /* 内側の余白量 */
    background-color: snow;  /* 背景色 */
    width: 40em;             /* 横幅 */
    height: 60px;           /* 高さ */
    font-size: 1em;          /* 文字サイズ */
    line-height: 1.2;        /* 行の高さ */
    position: relative;
    top: -40px;
}

.button {
  display       : inline-block;
  border-radius : 24%;          /* 角丸       */
  font-size     : 12pt;        /* 文字サイズ */
  text-align    : center;      /* 文字位置   */
  cursor        : pointer;     /* カーソル   */
  padding       : 11px 17px;   /* 余白       */
  background    : #4da6ff;     /* 背景色     */
  color         : #ffffff;     /* 文字色     */
  line-height   : 1em;         /* 1行の高さ  */
  transition    : .3s;         /* なめらか変化 */
  box-shadow    : 6px 6px 3px #666666;  /* 影の設定 */
  border        : 2px solid #4da6ff;    /* 枠の指定 */
}
.button:hover {
  box-shadow    : none;        /* カーソル時の影消去 */
  color         : #4da6ff;     /* 背景色     */
  background    : #ffffff;     /* 文字色     */
}

.cp_link {
	position: relative;
    top: -20px;
    left: -602px;
	padding: 0.1em 0.3em;
	display: inline-block;
	transition: .3s;
	color: #f7f7f7;
}
.cp_link::before,
.cp_link::after {
	position: absolute;
	content: '';
	width: 0;
	height: 1px;
	background-color:#f7f7f7 ;
	transition: .3s;
}
.cp_link::before {
	top: 0;
	left: 0;
}
.cp_link::after {
	bottom: 0;
	right: 0;
}
.cp_link:hover::before,
.cp_link:hover::after {
	width: 100%;
}

.btn-sticky {
  display: inline-block;
  padding: 0.5em 1em;
  text-decoration: none;
  background: #f7f7f7;
  border-left: solid 4px #ff007f;/*左線*/
  color: #ff007f;/*文字色*/
  font-weight: bold;
  box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.29);
}
.btn-sticky:active {
  box-shadow: inset 0 0 2px rgba(128, 128, 128, 0.1);
  transform: translateY(2px);
}

.btn-sticky2 {
  display: inline-block;
  padding: 0.5em 1em;
  text-decoration: none;
  background: #f7f7f7;
  border-left: solid 4px #0059b3;/*左線*/
  color: #0059b3;/*文字色*/
  font-weight: bold;
  box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.29);
}
.btn-sticky:active {
  box-shadow: inset 0 0 2px rgba(128, 128, 128, 0.1);
  transform: translateY(2px);
}

h2 {
  position: absolute;
  top:-20px;
  width:79%;
  left:5px;
  padding:4px;
  background-image: -webkit-linear-gradient(94deg, #37ec4d 0%, #44107a 29%, #1351ff 67%, #37ec4d 100%);
}
h2 span {
  display: block;
  padding: 0.7rem 4rem;
  background: #fff;
}

.submit_btn{
    border: 0px;
    height:50px;
    width:50px;
    background: url(https://gray-code.com/wp-content/uploads/2018/08/pici02.png) left top no-repeat;
    background-size: contain;
    position: relative;
    top: -54px;
    left: 10px;
}
.submit_btn:hover{
    cursor: pointer;
    opacity:0.5;
}

h4 {
  padding: 1rem 2rem;
  border-top: 4px solid #d8dcdc;
  border-right: 4px solid #666;
  border-bottom: 4px solid #333;
  border-left: 4px solid #868888;
  border-radius: 0;
  background-image: -webkit-linear-gradient(135deg, #ccc 0%, #868888 20%, #d8dcdc 34%, white 53%, #ccc 100%);
  background-image: linear-gradient(-45deg, #ccc 0%, #868888 20%, #d8dcdc 34%, white 53%, #ccc 100%);
  position: relative;
  top: -55px;
  width: 90.7%;
  left: 70px;
  font-size: 1.5rem;
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
</style>
<title>タイムライン</title>
</head>
<body>

<main>
  <aside>
    <ul class="asideList">
      <li><a href="/lines/WelcomeServlet" class="asideAnchor">トップへ</a></li>
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
<br><h4>～タイムライン～&nbsp;&nbsp;&nbsp;今日の出来事を投稿してください...<span class="blinktext">▼</span></h4>
<form action="/lines/timelineServlet" method="post">
&nbsp;<textarea id="kanso" name="tubuyaki" class="textlines" placeholder="今日は何がありましたか？"></textarea>

&nbsp;<input type="submit" class="submit_btn" value="">
<a href="/lines/timeline.jsp" class="cp_link">更新</a>
</form>
<br>
<div class="box scrolly">
<c:forEach var="tubu" items="${tubuyakilist}">
 
   &nbsp;📛<c:out value="${tubu.userid}" />『<c:out value="${tubu.tubuyaki}" />』<br>
   &nbsp;⌚<c:out value="${tubu.date}"/><br>
   <form action="/lines/goodbadServlet" method="post">
   <input type="submit" name="god" value="Good(`･ω･´)b ${tubu.goodpoint}" class="btn-sticky">
   <input type="hidden" name="id" value="${tubu.id}">
   &nbsp;&nbsp;
   <input type="submit" name="bad" value="Bad(・´з`・) ${tubu.badpoint}" class="btn-sticky2">
   <input type="hidden" name="id" value="${tubu.id}"></form><br>
</c:forEach>
</div>
</div>
</section>
</main>
</body>
</html>