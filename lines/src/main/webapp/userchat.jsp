<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import = "dao.privatechatDAO,model.privatechat,java.util.List" %>
<% 
//リクエストスコープに保存されたつぶやきリストを取得
List<privatechat> chatli = (List<privatechat>)application.getAttribute("chatlist");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
body {
    display: block;
    margin: 0px;
    margin-top: 0px;
    margin-right: 0px;
    margin-bottom: 0px;
    margin-left: 0px;
    background: #7494c0;
}

element.style {
    margin: 5px;
    
}
@charset "utf-8";

.line__container {
  
  background: #7494c0;
  overflow: hidden;
  font-size: 100%;
}

/* タイトル部分 */
.line__container .line__title {
  font-family:"Yu Gothic", "游ゴシック", YuGothic, "游ゴシック体";
  position: relative;
  background: #273246;
  text-align: center;
  font-size: 300%;
  color: #ffffff;
}

/* 会話部分 */
.line__container .line__contents {
  overflow: hidden;
  line-height: 135%;
}

.line__container .scroll {
  height: 500px;
  overflow-y: scroll;
}


/* 相手の会話 */
.line__container .line__left {
    position: relative;
    display: block;
    margin: 5px 0;
    max-width: 75%;
    float: left;
    margin-left: 15px;
    clear: both;
}



.line__container .line__left .line__left-text {
  margin-left: 80px;
}

.line__container .line__left .line__left-text .name {
  position: absolute;
  right: -10px;
  font-size: 180%;
  color: #ffffff;
}
/* 相手の名前 */
.name {
  position: absolute;
  right: 135px;
  top: -20px;
  font-size: 100%;
  color: #ffffff;
}

/* コメントエリア */
.line__container .line__left .text {
  margin: 0;
  position: relative;
  padding: 10px;
  border-radius: 20px;
  background-color: #ffffff;
}

/* 吹き出し */
.line__container .line__left .text::after {
  content: '';
  position: absolute;
  display: block;
  width: 0;
  height: 0;
  left: -10px;
  top: 10px;
  border-right: 20px solid #ffffff;
  border-top: 10px solid transparent;
  border-bottom: 10px solid transparent;
}

/* 自分の会話 */
.line__container .line__right {
    position: relative;
    display: block;
    margin: 20px 0;
    max-width: 75%;
    float: right;
    margin-right: 15px;
    clear: both;
}

/* コメントエリア */
.line__container .line__right .text {
  padding: 10px;
  border-radius: 20px;
  background-color: #8de055;
  margin: 0;
  margin-left: 80px;
}

/* 吹き出し */
.line__container .line__right .text::after {
  content: '';
  position: absolute;
  display: block;
  width: 0;
  height: 0;
  right: -10px;
  top: 40px;
  border-left: 20px solid #8de055;
  border-top: 10px solid transparent;
  border-bottom: 10px solid transparent;
}

.textlines {
    border: 3px solid #0a0;  /* 枠線 */
    border-radius: 0.67em;   /* 角丸 */
    padding: 0.5em;          /* 内側の余白量 */
    background-color: snow;  /* 背景色 */
    width: 95%;             /* 横幅いっぱいにする */
    box-sizing: border-box;  /* ※これがないと横にはみ出る */
    height: 120px;           /* 高さ */
    font-size: 1em;          /* 文字サイズ */
    line-height: 1.2;        /* 行の高さ */
    margin-left: 0.5em;
}

.textlines:focus {
    border-color: skyblue;   /* 枠線の色 */
    background-color: #ffc;  /* 背景色 */
    outline: none;           /* ※ブラウザが標準で付加する線を消したいとき */
}

.button {
  display       : inline-block;
  border-radius : 17%;          /* 角丸       */
  font-size     : 14pt;        /* 文字サイズ */
  text-align    : center;      /* 文字位置   */
  cursor        : pointer;     /* カーソル   */
  padding       : 8px 17px;   /* 余白       */
  background    : #00FF00;     /* 背景色     */
  color         : #ffffff;     /* 文字色     */
  line-height   : 1em;         /* 1行の高さ  */
  transition    : .3s;         /* なめらか変化 */
  box-shadow    : 4px 4px #666666;  /* 影の設定 */
  border        : 2px solid #00FF00;    /* 枠の指定 */
  margin-left: 0.5em;
}
.button:hover {
  box-shadow    : none;        /* カーソル時の影消去 */
  color         : #00FF00;     /* 背景色     */
  background    : #ffffff;     /* 文字色     */
}

.cp_link {
	position: relative;
	padding: 0.1em 0.3em;
	display: inline-block;
	transition: .3s;
	color: #00FF00;
	margin-left: 0.5em;
	top:-20px;
}
.cp_link::before,
.cp_link::after {
	position: absolute;
	content: '';
	width: 0;
	height: 1px;
	background-color: #00FF00;
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
.submit_btn{
    border: 0px;
    height:50px;
    width:50px;
    background: url(https://gray-code.com/wp-content/uploads/2018/08/pici02.png) left top no-repeat;
    background-size: contain;
}
.submit_btn:hover{
    cursor: pointer;
    opacity:0.5;
}
</style>
<!-- タイトル表示 -->
<c:choose>
<c:when test = "${userid == youid}">
<title><c:out value="${userid}"/>さんのマイスペース</title>
</c:when>
<c:otherwise>
<title><c:out value="${userid}"/>さんと<c:out value="${youid}"/>さんの個人チャット</title>
</c:otherwise>
</c:choose>
</head>
<body>
<!-- ▼LINE風ここから -->
  <div class="line__container">
<!-- タイトル -->
  <div class="line__title">
<c:choose>
<c:when test = "${userid == youid}">
<c:out value="${userid}"/>さんのマイスペース
</c:when>
<c:otherwise>
<c:out value="${userid}"/>さんと<c:out value="${youid}"/>さんの個人チャット
</c:otherwise>
</c:choose>
  </div>
<!-- チャット送信フォーム -->
<form action="/lines/userchatlogicServlet" method="post">
<p>
<textarea class="textlines" id="chat" name="chat"placeholder="メッセージを記入してください"></textarea><br>
&nbsp;&nbsp;<input type="submit"  class="submit_btn" value="">
<a href="/lines/userchatServlet" class="cp_link">ユーザーセレクト画面に戻る</a>
</p>
</form>
<!-- ▼会話エリア scrollを外すと高さ固定解除 -->
    <div class="line__contents">
<c:forEach var="chatli" items="${chatlist}">
<c:choose>
<c:when test = "${userid == chatli.user_id}">
   
   <!-- 自分の発言 -->
   <div class="line__left">
   <!--<div class="name"><c:out value="${chatli.user_id}" /></div>-->
   <div class="text">
   <c:out value="${chatli.chat}" /><br>
   <c:out value="${chatli.date}" /></div></div>
   
</c:when>
<c:otherwise>
   
   <!-- 相手の発言 -->
   <div class="line__right">
   <div class="name"><c:out value="${chatli.user_id}" /></div>
   <div class="text">
   <c:out value="${chatli.chat}" /><br>
   <c:out value="${chatli.date}" /></div></div>
   
</c:otherwise>
</c:choose> 
</c:forEach>
</div>
    <!--　▲会話エリア ここまで -->
  </div>
  <!--　▲LINE風 ここまで -->  
</body>
</html>