<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "dao.AccountDAO,model.Account,java.util.List" %>
<% 
//リクエストスコープに保存されたつぶやきリストを取得
List<Account> acau = (List<Account>)application.getAttribute("Accountlist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.line__container {
  
  
  overflow: hidden;
  font-size: 100%;
}

/* タイトル部分 */
.line__container .line__title {
  font-family:"Yu Gothic", "游ゴシック", YuGothic, "游ゴシック体";
  position: relative;
  text-align: center;
  font-size: 300%;
  color: #273246;
}

.cp_ipselect {
	overflow: hidden;
	<!--margin: 2em auto;-->
	text-align: center;
}
.cp_ipselect select {
	width: 100%;
	padding-right: 1em;
	cursor: pointer;
	text-indent: 0.01px;
	text-overflow: ellipsis;
	border: none;
	outline: none;
	background: transparent;
	background-image: none;
	box-shadow: none;
	-webkit-appearance: none;
	appearance: none;
}
.cp_ipselect select::-ms-expand {
    display: none;
}
.cp_ipselect.cp_sl04 {
	position: relative;
	border-radius: 2px;
	border: 2px solid #6666ff;
  border-radius: 50px;
	background: #ffffff;
}
.cp_ipselect.cp_sl04::before {
	position: absolute;
	top: 0.8em;
	right: 0.8em;
	width: 0;
	height: 0;
	padding: 0;
	content: '';
	border-left: 6px solid transparent;
	border-right: 6px solid transparent;
	border-top: 6px solid #00007f;
	pointer-events: none;
}
.cp_ipselect.cp_sl04 select {
	padding: 8px 38px 8px 8px;
	color: #00007f;
}

.button {
  display       : inline-block;
  border-radius : 16%;          /* 角丸       */
  font-size     : 13pt;        /* 文字サイズ */
  text-align    : center;      /* 文字位置   */
  cursor        : pointer;     /* カーソル   */
  padding       : 8px 14px;   /* 余白       */
  background    : #6666ff;     /* 背景色     */
  color         : #ffffff;     /* 文字色     */
  line-height   : 1em;         /* 1行の高さ  */
  transition    : .3s;         /* なめらか変化 */
  border        : 2px solid #6666ff;    /* 枠の指定 */
}
.button:hover {
  box-shadow    : none;        /* カーソル時の影消去 */
  color         : #6666ff;     /* 背景色     */
  background    : #ffffff;     /* 文字色     */
}

.cp_link {
	position: relative;
	padding: 0.1em 0.3em;
	display: inline-block;
	transition: .3s;
	color: #6666ff;
}
.cp_link::before,
.cp_link::after {
	position: absolute;
	content: '';
	width: 0;
	height: 1px;
	background-color: #6666ff;
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

body{
  position: absolute;
  left: -7px;
  right: -40px;
  width: 100%;
  height: 100%;
  background-image: url(https://png.pngtree.com/back_origin_pic/04/31/05/e539c5c4cf53f99633511ff5124a7584.jpg);
  background-size: cover;
  z-index: 1;
   overflow:hidden;
}


input[type="text"] {
  width: 30%;
  border: 2px solid #aaa;
  border-radius: 4px;
  margin: 8px 0;
  outline: none;
  padding: 8px;
  box-sizing: border-box;
  transition: 0.3s;
}

input[type="text"]:focus {
  border-color: dodgerBlue;
  box-shadow: 0 0 8px 0 dodgerBlue;
}

.inputWithIcon input[type="text"] {
  padding-left: 40px;
}

.inputWithIcon {
  position: relative;
}

.inputWithIcon i {
  position: absolute;
  left: 0;
  top: 10px;
  padding: 9px 8px;
  color: #aaa;
  transition: 0.3s;
}

.inputWithIcon input[type="text"]:focus + i {
  color: dodgerBlue;
}

.inputWithIcon.inputIconBg i {
  background-color: #aaa;
  color: #fff;
  padding: 9px 4px;
  border-radius: 4px 0 0 4px;
}

.inputWithIcon.inputIconBg input[type="text"]:focus + i {
  color: #fff;
  background-color: dodgerBlue;
}

input[type="password"] {
  width: 30%;
  border: 2px solid #aaa;
  border-radius: 4px;
  margin: 8px 0;
  outline: none;
  padding: 8px;
  box-sizing: border-box;
  transition: 0.3s;
}

input[type="password"]:focus {
  border-color: dodgerBlue;
  box-shadow: 0 0 8px 0 dodgerBlue;
}

.inputWithIcon input[type="password"] {
  padding-left: 40px;
}

.inputWithIcon {
  position: relative;
}

.inputWithIcon i {
  position: absolute;
  left: 0;
  top: 10px;
  padding: 13px 8px;
  color: #aaa;
  transition: 0.3s;
}

.inputWithIcon input[type="password"]:focus + i {
  color: dodgerBlue;
}

.inputWithIcon.inputIconBg i {
  background-color: #aaa;
  color: #fff;
  padding: 9px 4px;
  border-radius: 4px 0 0 4px;
}

.inputWithIcon.inputIconBg input[type="password"]:focus + i {
  color: #fff;
  background-color: dodgerBlue;
}

@import url(https://fonts.googleapis.com/css?family=Exo:100,200,400);
@import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300);

.grad{
  position: absolute;
  left: 0px;
  right: -40px;
  width: 100%;
  height: 100%;
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(0,0,0,0)), color-stop(100%,rgba(0,0,0,0.65))); /* Chrome,Safari4+ */
  z-index: 1;
  opacity: 0.7;
   overflow:hidden;
}



.header{
  position: absolute;
  top: calc(50% - 35px);
  left: calc(40% - 255px);
  z-index: 2;
}

.header div{
  float: left;
  color: #fff;
  font-family: 'Exo', sans-serif;
  font-size: 35px;
  font-weight: 200;
}

.header div span{
  color: #5379fa !important;
}

.login{
  position: absolute;
  top: calc(50% - 75px);
  left: calc(50% - 50px);
  height: 150px;
  padding: 10px;
  z-index: 2;
}

.login input[type=text]{
  width: 250px;
  background: transparent;
  border: 1px solid rgba(255,255,255,0.6);
  border-radius: 2px;
  color: #fff;
  font-family: 'Exo', sans-serif;
  font-size: 16px;
  font-weight: 400;
}

.login input[type=password]{
  width: 250px;
  background: transparent;
  border: 1px solid rgba(255,255,255,0.6);
  border-radius: 2px;
  color: #fff;
  font-family: 'Exo', sans-serif;
  font-size: 16px;
  font-weight: 400;
}



.login input[type=submit]:hover{
  opacity: 0.8;
}

.login input[type=submit]:active{
  opacity: 0.6;
}

.login input[type=text]:focus{
  outline: none;
  border: 1px solid rgba(255,255,255,0.9);
}

.login input[type=password]:focus{
  outline: none;
  border: 1px solid rgba(255,255,255,0.9);
}

.login input[type=submit]:focus{
  outline: none;
}

::-webkit-input-placeholder{
   color: rgba(255,255,255,0.6);
}

::-moz-input-placeholder{
   color: rgba(255,255,255,0.6);
}

.login input[type=submit]{
  width: 300px;
  background: #5379fa;
  cursor: pointer;
  color: #fdfdfd;
  font-family: 'Exo', sans-serif;
  font-size: 16px;
  font-weight: 400;
  padding: 7px;
  margin-top: 10px;
  border-radius: 12px;
}

a.arrow3{
	position:relative;
	display:inline-block;
	padding:0 70px 0 70px;
	color:#fff;
	text-decoration:none;
	height:35px;
	line-height:35px;
	border-radius:12px;
	background: #5379fa;
}
a.arrow3:before,
a.arrow3:after{
	content:"";
	display:block;
	position:absolute;
}
a.arrow3:before{
	width:16px;
	height:16px;
	background:#fff;
	border-radius:50%;
	right:11px;
	top:10px;
}
a.arrow3:after{
	width:4px;
	height:4px;
	border-right:2px solid #62A1CB;
	border-top:2px solid #62A1CB;
	-webkit-transform:rotate(45deg);
	transform:rotate(45deg);
	right:17px;
	top:15px;
}

</style>
<title>ユーザーセレクト画面</title>
</head>
<body>
<div class="body"></div>
    <div class="grad"></div>
    <div class="header">
      <div>ユーザー<span>セレクト</span></div>
    </div>
    <br>
<div class="login">
<p><c:out value="${userid}"/>さん、どのユーザーとチャットしますか？

<form action="/lines/userchatServlet" method="post">

<div class="cp_ipselect cp_sl04">
<select id="userid" name="userid">
<c:forEach var="acau" items="${Accountlist}">
<option value=<c:out value="${acau.userid}" />><c:out value="${acau.userid}" /></option>
</c:forEach>
</select>
</div><br>
<input type="submit" value="チャットを開始する" class="button"><br><br>
<a href="/lines/loginOK.jsp" class="arrow3">トップメニューへ戻る</a>

</form>
</div>
</body>
</html>