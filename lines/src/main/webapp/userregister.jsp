<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
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
  padding: 35px 8px;
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
  padding: 35px 8px;
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

body{
  margin: 0;
  padding: 0;
  background: #fff;

  color: #fff;
  font-family: Arial;
  font-size: 15px;
   overflow:hidden;
}

.body{
  position: absolute;
  top: -20px;
  left: -20px;
  right: -40px;
  bottom: -40px;
  width: auto;
  height: auto;
  background-image: url(https://png.pngtree.com/back_origin_pic/04/31/05/e539c5c4cf53f99633511ff5124a7584.jpg);
  background-size: cover;
  -webkit-filter: blur(2px);
  z-index: 0;
}

.grad{
  position: absolute;
  top: -20px;
  left: -20px;
  right: -40px;
  bottom: -40px;
  width: auto;
  height: auto;
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(0,0,0,0)), color-stop(100%,rgba(0,0,0,0.65))); /* Chrome,Safari4+ */
  z-index: 1;
  opacity: 0.7;
}

.header{
  position: absolute;
  top: calc(50% - 35px);
  left: calc(50% - 255px);
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
  top: calc(25% - 75px);
  left: calc(50% - 50px);
  height: 150px;
  width: 350px;
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

.login input[type=submit]{
  width: 250px;
  background: #5379fa;
  border: 1px solid #fff;
  cursor: pointer;
  border-radius: 2px;
  color: #fdfdfd;
  font-family: 'Exo', sans-serif;
  font-size: 16px;
  font-weight: 400;
  padding: 6px;
  margin-top: 10px;
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
  width: 250px;
  background: #5379fa;
  border: 1px solid #fff;
  cursor: pointer;
  border-radius: 2px;
  color: #fdfdfd;
  font-family: 'Exo', sans-serif;
  font-size: 16px;
  font-weight: 400;
  padding: 6px;
  margin-top: 10px;
}

a.arrow3{
	position:relative;
	display:inline-block;
	padding:0 45px 0 40px;
	color:#fff;
	text-decoration:none;
	height:35px;
	line-height:35px;
	border-radius:12px;
	background: #5379fa;
	top: -50px;
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

.login input[type=reset]{
  width: 250px;
  background: #5379fa;
  border: 1px solid #fff;
  cursor: pointer;
  border-radius: 2px;
  color: #fdfdfd;
  font-family: 'Exo', sans-serif;
  font-size: 16px;
  font-weight: 400;
  padding: 6px;
  margin-top: 10px;
  position: relative;
    right: -260px;
    top: -47.5px;
}

.login input[type=reset]:hover{
  opacity: 0.8;
}

.login input[type=reset]:active{
  opacity: 0.6;
}
</style>
<title>lines ユーザー登録</title>
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
</head>
<body>
<div class="body"></div>
    <div class="grad"></div>
    <div class="header">
      <div>Site<span>Lines</span></div>
    </div>
    <br>
<div class="login">
<p>ユーザー新規登録画面</p>
<form action="/lines/RegisterServlet" method="post">
<div class="inputWithIcon">
ユーザーID[9文字以内]:<input type="text" name="newid" placeholder="username">
<i class="fa fa-user fa-lg fa-fw" aria-hidden="true"></i>
</div><br>
<div class="inputWithIcon">
パスワード[9文字以内]:<input type="password" name="newpass" placeholder="password"><br>
<i class="fas fa-key" aria-hidden="true"></i>
</div><br>
<div class="inputWithIcon">
電話番号[ハイフン無し10桁]:<input type="text" name="newtell"placeholder="phonenumber"><br>
<i class="fas fa-phone" aria-hidden="true"></i>
</div><br>
<div class="inputWithIcon">
秘密の質問 ペットの名前*飼ってない場合は想像で:
<input type="text" name="newsecret"placeholder="question"><br>
<i class="fas fa-question" aria-hidden="true"></i>
</div><br>
<input type="submit" value="登録"><input type="reset" value="リセット"><br><br>
<a href="welcome.jsp" class="arrow3">&nbsp;&nbsp;トップページに戻る&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>

</form>
</div>
</body>
</html>