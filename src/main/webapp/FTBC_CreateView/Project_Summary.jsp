﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 만들기 </title>
<!--=============================================================================================
	프로젝트 올리기 - 프로젝트 개요 탭
	날짜:2019-09-12
================================================================================================  -->
<link rel="stylesheet" type="text/css" href="Project_Summary.css">
</head>
<body>	
<!--=============================================================================================
	프로젝트 올리기 - 프로젝트 개요 탭
	날짜:2019-09-12
================================================================================================  -->
	<script type="text/javascript">
		var check =null;
		$(document).ready(function() {
			$("#pjo_title_edit").hide();
			$("#pjo_img_edit").hide();
			$("#pjo_summary_edit").hide();
			$("#pjo_category_edit").hide();
			$("#pjo_page_edit").hide();
			$("#pjo_tag_edit").hide();
			$("#pjo_profile_img_edit").hide();
			$("#pjo_name_edit").hide();
			$("#pjo_introduction_edit").hide();
			$("#pjo_active_area_edit").hide();
		});
		/* ======================== 타이틀 에딧창 ==========================*/
		function pjo_title_edit_open(){
			$("#pjo_title").hide();
			$("#pjo_title_edit").show();
			pjo_img_edit_cancle();
			pjo_summary_edit_cancle();
			pjo_category_edit_cancle();
			pjo_page_edit_cancle();
			pjo_tag_edit_cancle();
			pjo_profile_img_edit_cancle();
			pjo_name_edit_cancle();
			pjo_introduction_edit_cancle();
			pjo_active_area_edit_cancle();
		}	
		function pjo_title_edit_save(){
			var title = $("#short_title").val( );
			$("#title").html(title);
			var summary_all_form = document.summary_all_form;
			if(summary_all_form.short_title.value==""||summary_all_form.long_title.value==""){
				alert("제목을 입력해 주세요");
			}
			else{
				change();
				pjo_title_edit_cancle();
			}
		}
		function pjo_title_edit_cancle(){
			$("#pjo_title_edit").hide();
			$("#pjo_title").show();
		}
		/* ========================== 이미지 에딧창 =========================== */
		function pjo_img_edit_open(){
			$("#pjo_img").hide();
			$("#pjo_img_edit").show();
			pjo_title_edit_cancle();
			pjo_summary_edit_cancle();
			pjo_category_edit_cancle();
			pjo_page_edit_cancle();
			pjo_tag_edit_cancle();
			pjo_profile_img_edit_cancle();
			pjo_name_edit_cancle();
			pjo_introduction_edit_cancle();
			pjo_active_area_edit_cancle();
		}
		function pjo_img_edit_cancle(){
			$("#pjo_img_edit").hide();
			$("#pjo_img").show();
		}
		/* ========================== 요약 에딧창 =================================*/
		function pjo_summary_edit_open(){
			$("#pjo_summary").hide();
			$("#pjo_summary_edit").show();
			pjo_title_edit_cancle();
			pjo_img_edit_cancle();
			pjo_category_edit_cancle();
			pjo_page_edit_cancle();
			pjo_tag_edit_cancle();
			pjo_profile_img_edit_cancle();
			pjo_name_edit_cancle();
			pjo_introduction_edit_cancle();
			pjo_active_area_edit_cancle();
		}
		function pjo_summary_edit_cancle(){
			$("#pjo_summary_edit").hide();
			$("#pjo_summary").show();
		}
		function pjo_summary_edit_save(){
			var summary_all_form = document.summary_all_form;
			if(summary_all_form.pjo_summary_edit_text.value==""){
				alert("내용을 입력해 주세요");
			}
			else if(summary_all_form.pjo_summary_edit_text.value.length<10){
				alert("10자 이상 작성해 주세요");
			}
			else if(summary_all_form.pjo_summary_edit_text.value!=""||summary_all_form.pjo_summary_edit_text.value.length>=10){
				pjo_summary_edit_cancle();
				change();
			}
		}
		/* =========================== 카테고리 에딧창================================== */
		function pjo_category_edit_open(){
			$("#pjo_category").hide();
			$("#pjo_category_edit").show();
			pjo_title_edit_cancle();
			pjo_img_edit_cancle();
			pjo_summary_edit_cancle();
			pjo_page_edit_cancle();
			pjo_tag_edit_cancle();
			pjo_profile_img_edit_cancle();
			pjo_name_edit_cancle();
			pjo_introduction_edit_cancle();
			pjo_active_area_edit_cancle();
		}
		function pjo_category_edit_cancle(){
			$("#pjo_category_edit").hide();
			$("#pjo_category").show();
		}
		/* ============================ 페이지 에딧창 ================================*/
		function pjo_page_edit_open(){
			$("#pjo_page").hide();
			$("#pjo_page_edit").show();
			pjo_title_edit_cancle();
			pjo_img_edit_cancle();
			pjo_summary_edit_cancle();
			pjo_category_edit_cancle();
			pjo_tag_edit_cancle();
			pjo_profile_img_edit_cancle();
			pjo_name_edit_cancle();
			pjo_introduction_edit_cancle();
			pjo_active_area_edit_cancle();
		}
		function pjo_page_edit_cancle(){
			$("#pjo_page_edit").hide();
			$("#pjo_page").show();
		}
		function pjo_page_edit_save(){
			var summary_all_form = document.summary_all_form;
			if(summary_all_form.pjo_page_text.value==""){
				alert("내용을 입력해 주세요");
			
			}
			else if(summary_all_form.pjo_page_text.value.length<5){
				alert("5자 이상 작성해 주세요");
			}
			else{
				pjo_page_edit_cancle();
				change();
			}
		}
		/* ================================= 태그 에딧창 ===========================*/
		function pjo_tag_edit_open(){
			$("#pjo_tag").hide();
			$("#pjo_tag_edit").show();
			pjo_title_edit_cancle();
			pjo_img_edit_cancle();
			pjo_summary_edit_cancle();
			pjo_category_edit_cancle();
			pjo_page_edit_cancle();
			pjo_profile_img_edit_cancle();
			pjo_name_edit_cancle();
			pjo_introduction_edit_cancle();
			pjo_active_area_edit_cancle();
		}
		function pjo_tag_edit_cancle(){
			$("#pjo_tag_edit").hide();
			$("#pjo_tag").show();
		}	
		function pjo_tag_edit_save(){
			var summary_all_form = document.summary_all_form;
			if(summary_all_form.pjo_tag_text.value==""){
				alert("내용을 입력해 주세요");
			
			}
			else if(summary_all_form.pjo_tag_text.value.length<2){
				alert("2자 이상 작성해 주세요");
			}
			else{
				pjo_tag_edit_cancle();
				change();
			}
		}
		/* ================================= 프로필 이미지 에딧창 ===========================*/
		function pjo_profile_img_edit_open(){
			$("#pjo_profile_img").hide();
			$("#pjo_profile_img_edit").show();
			pjo_title_edit_cancle();
			pjo_img_edit_cancle();
			pjo_summary_edit_cancle();
			pjo_category_edit_cancle();
			pjo_page_edit_cancle();
			pjo_tag_edit_cancle();
			pjo_name_edit_cancle();
			pjo_introduction_edit_cancle();
			pjo_active_area_edit_cancle();
		}
		function pjo_profile_img_edit_cancle(){
			$("#pjo_profile_img_edit").hide();
			$("#pjo_profile_img").show();
		}
		/* ================================= 창작자 이름 에딧창 ===========================*/
		function pjo_name_edit_open(){
			$("#pjo_name").hide();
			$("#pjo_name_edit").show();
			pjo_title_edit_cancle();
			pjo_img_edit_cancle();
			pjo_summary_edit_cancle();
			pjo_category_edit_cancle();
			pjo_page_edit_cancle();
			pjo_tag_edit_cancle();
			pjo_profile_img_edit_cancle();
			pjo_introduction_edit_cancle();
			pjo_active_area_edit_cancle();
		}
		function pjo_name_edit_cancle(){
			$("#pjo_name_edit").hide();
			$("#pjo_name").show();
		}
		function pjo_name_edit_save(){
			var summary_all_form = document.summary_all_form;
			if(summary_all_form.pjo_name_text.value==""){
				alert("내용을 입력해 주세요");
			
			}
			else if(summary_all_form.pjo_name_text.value.length<2){
				alert("2자 이상 작성해 주세요");
			}
			else{
				pjo_name_edit_cancle();
				change();
			}
		}
		/* ================================= 창작자 소개 에딧창 ===========================*/
		function pjo_introduction_edit_open(){
			$("#pjo_introduction").hide();
			$("#pjo_introduction_edit").show();
			pjo_title_edit_cancle();
			pjo_img_edit_cancle();
			pjo_summary_edit_cancle();
			pjo_category_edit_cancle();
			pjo_page_edit_cancle();
			pjo_tag_edit_cancle();
			pjo_profile_img_edit_cancle();
			pjo_name_edit_cancle();
			pjo_active_area_edit_cancle();
		}
		function pjo_introduction_edit_cancle(){
			$("#pjo_introduction_edit").hide();
			$("#pjo_introduction").show();
		}
		function pjo_introduction_edit_save(){
			var summary_all_form = document.summary_all_form;
			if(summary_all_form.pjo_introduction_edit_textarea.value==""){
				alert("내용을 입력해 주세요");
			
			}
			else if(summary_all_form.pjo_introduction_edit_textarea.value.length<10){
				alert("10자 이상 작성해 주세요");
			}
			else{
				pjo_introduction_edit_cancle();
				change();
			}
		}
		/* ================================= 창작자 활동지역 에딧창 ===========================*/
		function pjo_active_area_edit_open(){
			$("#pjo_active_area").hide();
			$("#pjo_active_area_edit").show();
			pjo_title_edit_cancle();
			pjo_img_edit_cancle();
			pjo_summary_edit_cancle();
			pjo_category_edit_cancle();
			pjo_page_edit_cancle();
			pjo_tag_edit_cancle();
			pjo_profile_img_edit_cancle();
			pjo_name_edit_cancle();
			pjo_introduction_edit_cancle();
		}
		function pjo_active_area_edit_cancle(){
			$("#pjo_active_area_edit").hide();
			$("#pjo_active_area").show();
		}
		function pjo_active_area_edit_save(){
			var summary_all_form = document.summary_all_form;
			if(summary_all_form.pjo_active_area_text.value==""){
				alert("내용을 입력해 주세요");
			
			}
			else if(summary_all_form.pjo_active_area_text.value.length<2){
				alert("2자 이상 작성해 주세요");
			}
			else{
				pjo_active_area_edit_cancle();
				change();
			}
		}
		/* ================================= 이미지 저장 및 변경 ===========================*/
		function getThumbnailPrivew(html) {
		    if (html.files && html.files[0]) {
		        var reader = new FileReader();
		        reader.onload = function (e) {
		            $("#pjo_img_edit_img").css('display', '');
		            $("#pjo_img_edit_img").html('<img src="' + e.target.result + '" border="0" alt="" />');
		            $("#img_pjo").html('<img src="' + e.target.result + '" border="0" alt="" />');
		            $("#pjo_img img").css({
		            	width : "200px",
		            	height : "auto",
		            });
		            $("#img_pjo").css({
		            	margin:"0px 0px 5px 0px"
		            });
		            $("#pjo_img").css({
		            	height : "auto"
		            });
		            $("#pjo_img_edit_button_1").html('<button class="button" id="pjo_img_edit_button_2" onClick="pjo_img_edit_remove()">'+'<div class="glyphicon glyphicon-repeat"/>'+"다른 이미지 파일로 교체하기"+'</button>')
		        }
		        reader.readAsDataURL(html.files[0]);
		    }
		}
		function pjo_img_edit_remove(){
			var tag = "<form id='form1'><div id='pjo_img_edit_img'><div class='filebox'><label for='cma_file'><img src='../FTBC_Images/imageupload.png'></label><input type='file' name='cma_file' id='cma_file' accept='image/*' capture='camera' onchange='getThumbnailPrivew(this)'/></div></div></form><br>";
			document.getElementById("pjo_img_edit_img").innerHTML=tag;
			$("#cma_file").css({
				position: "absolute",
			    width: "1px",
			    height: "1px",
			    padding: "0",
			    margin: "-1px",
			    overflow: "hidden",
			    clip:"rect(0,0,0,0)",
			    border: "0"
			});
			$("#pjo_img_edit_button_2").remove();
			var tag2 = "<div class='row'><div class='col-sm-10'><img src='../FTBC_Images/finger.png'></img><label>&nbsp; 프로젝트	대표 이미지를 등록해 주세요</label></div>	<div class='col-sm-2'><img src='../FTBC_Images/edit.png'></img><label>&nbsp; 업로드하기</label></div></div>";
			document.getElementById("img_pjo").innerHTML=tag2;
            $("#pjo_img img").css({
        		width:"15px"
            });	
		
		} 
		function pjo_profile_img(html) {
		    if (html.files && html.files[0]) {
		        var reader = new FileReader();
		        reader.onload = function (e) {
		            $("#pjo_profile_img_edit_img").css('display', '');
		            $("#pjo_profile_img_edit_img").html('<img src="' + e.target.result + '" border="0" alt="" />');
		            $("#pjo_profile_img_1").html('<img src="' + e.target.result + '" border="0" alt="" />');
		            $("#pjo_profile_img img").css({
		            	width : "200px",
		            	height : "auto",
		            	margin:"5px;"
		            });
		            $("#pjo_profile_img_1").css({
		            	margin:"0px 0px 5px 0px"
		            });
		            $("#pjo_profile_img").css({
		            	height : "auto"
		            });
		            $("#pjo_profile_img_edit_img_button_1").html('<button class="button button_cancle" id="pjo_profile_img_edit_img_button_2" onClick="pjo_profile_img_cancle()">'+'<div class="glyphicon glyphicon-repeat"/>'+"다른 이미지 파일로 교체하기"+'</button>')
		        }
		        reader.readAsDataURL(html.files[0]);
		    }
		}
		function pjo_profile_img_cancle(){
			var tag = "<div class='filebox'><label for='pjo_profile_img_edit_img_file'><img src='../FTBC_Images/imageupload.png'></label><input type='file' name='pjo_profile_img_edit_img_file' id='pjo_profile_img_edit_img_file' accept='image/*' capture='camera' onchange='pjo_profile_img(this)'/></div>";
			document.getElementById("pjo_profile_img_edit_img").innerHTML=tag;
			$("#pjo_profile_img_edit_img_file").css({
				position: "absolute",
			    width: "1px",
			    height: "1px",
			    padding: "0",
			    margin: "-1px",
			    overflow: "hidden",
			    clip:"rect(0,0,0,0)",
			    border: "0"
			});
			$("#pjo_profile_img_edit_img_button_2").remove();
			var tag2 = "<div class='row'><div class='col-sm-10'><img src='../FTBC_Images/finger.png'></img><label>&nbsp; 창작자님의 프로필 이미지를 올려주세요</label></div>	<div class='col-sm-2'><img src='../FTBC_Images/edit.png'></img><label>&nbsp; 업로드하기</label></div></div>";
			document.getElementById("pjo_profile_img_1").innerHTML=tag2;
            $("#pjo_profile_img_1 img").css({
        		width:"15px"
            });	
		}
		$(function() {
			/* ================= 타이틀 긴이름 ============================ */
		      $('#long_title').keyup(function (e){
		          var content = $(this).val();
		          $('#long_title_length').html(32-content.length + '자 남았습니다');
		      });
		      $('#long_title').keyup();
		      
			/* ================= 타이틀 짧은이름 ============================ */
		      $('#short_title').keyup(function (e){
		          var content = $(this).val();
		          $('#short_title_length').html(7-content.length + '자 남았습니다');
		      });
		      $('#short_title').keyup();
		      
			/* ================= 프로젝트 요약 ============================ */
		      $('#pjo_summary_edit_text').keyup(function (e){
		          var content = $(this).val();
		          $('#pjo_summary_edit_text_length').html('최소 10자 / '+(50-content.length) + '자 남았습니다');
		      });
		      $('#pjo_summary_edit_text').keyup();
		      
			/* ================= 페이지 주소 ============================ */
		      $('#pjo_page_text').keyup(function (e){
		          var content = $(this).val();
		          $('#pjo_page_text_length').html('최소 5자 / '+(125-content.length) + '자 남았습니다');
		      });
		      $('#pjo_page_text').keyup();
		      
			/* ================= 프로젝트 태그 ============================ */
		      $('#pjo_tag_text').keyup(function (e){
		          var content = $(this).val();
		          $('#pjo_tag_text_length').html('최소 2자 / '+(125-content.length) + '자 남았습니다');
		          
		            var RegExp = /[ \{\}\[\]\/?.;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
		            var obj = document.getElementsByName("pjo_tag_text")[0];
		            if (RegExp.test(obj.value)) {
		                alert("특수문자는 입력하실 수 없습니다.");
		                obj.value = obj.value.substring(0, obj.value.length - 1);//특수문자를 지우는 구문
		            }

		      });
		      $('#pjo_tag_text').keyup();
		      
			/* ================= 창작자 이름 ============================ */
		      $('#pjo_name_text').keyup(function (e){
		          var content = $(this).val();
		          $('#pjo_name_text_length').html(20-content.length + '자 남았습니다');
		      });
		      $('#pjo_name_text').keyup();
		      
			/* ================= 창작자 소개 ============================ */
		      $('#pjo_introduction_edit_textarea').keyup(function (e){
		          var content = $(this).val();
		          $('#pjo_introduction_edit_text_length').html('최소 10자 / '+(500-content.length) + '자 남았습니다');
		      });
		      $('#pjo_introduction_edit_textarea').keyup();
		      
			/* ================= 창작자 소개 ============================ */
		      $('#pjo_active_area_text').keyup(function (e){
		          var content = $(this).val();
		          $('#pjo_active_area_text_length').html(20-content.length + '자 남았습니다');
		      });
		      $('#pjo_active_area_text').keyup();
		      
		});
		function next_page(){
			
			check_count();
			$("#tab1").removeClass("active");
			$("#tab2").attr('class','active');
	
		}
		/* ====== 저장 할때마다 널 체크해서 아이콘 바꿀찌 말지 정하는거 ========== */
		function change(){
			var summary_all_form = document.summary_all_form;
			if(summary_all_form.short_title.value==""||summary_all_form.long_title.value==""
			||summary_all_form.pjo_summary_edit_text.value==""||summary_all_form.pjo_page_text.value==""
			||summary_all_form.pjo_tag_text.value==""||summary_all_form.pjo_name_text.value==""
			||summary_all_form.pjo_introduction_edit_textarea.value==""||summary_all_form.pjo_active_area_text.value==""
			){
				$("#check_tab").html('<img id="check_tab1" src="../FTBC_Images/check1.png">');
			} else{
				$("#check_tab").html('<img id="check_tab1" src="../FTBC_Images/check.png">');
				
			}
		}
		function check_count(){
			var summary_all_form = document.summary_all_form;
			check =null;
			if(summary_all_form.short_title.value==""){
				check = check+",짧은 제목";
			}
			if(summary_all_form.long_title.value==""){
				check = check+",긴 제목";
			}
			if(summary_all_form.pjo_summary_edit_text.value==""){
				check = check+",요약";
			}
			if(summary_all_form.pjo_page_text.value==""){
				check = check+",홈페이지";
			}
			if(summary_all_form.pjo_tag_text.value==""){
				check = check+",태그";
			}
			if(summary_all_form.pjo_name_text.value==""){
				check = check+",창작자 이름";
			}
			if(summary_all_form.pjo_introduction_edit_textarea.value==""){
				check = check+",창작자 소개";
			}
			if(summary_all_form.pjo_active_area_text.value==""){
				check = check+",창작자 지역";
			}
			if(check!=null){
				//alert(check+"를 작성해 주세요");
				$("#check_tab").html('<img id="check_tab1" src="../FTBC_Images/check1.png">');
			}else{
				$("#check_tab").html('<img id="check_tab1" src="../FTBC_Images/check.png">');
			}
		}
	</script>
<p>프로젝트 개요</p>
<div id="pjo_outline">
	<form id="summary_all_form" name="summary_all_form" onsubmit="return false;">
	<table>
	<!-- ================================ 프로젝트 제목 =============================================== -->
	<tr><td>
	<a href="javascript:pjo_title_edit_open()">
	<div id="pjo_title">
		<div class="row">
			<br>
			<div class="col-sm-10">
				<label>&nbsp; 프로젝트 제목</label>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-10">
				<img src="../FTBC_Images/finger.png"></img><label>&nbsp; 프로젝트
					제목을 입력해 주세요</label>
			</div>
			<div class="col-sm-2">
				<img src="../FTBC_Images/edit.png"></img><label>&nbsp; 입력하기</label>
			</div>
		</div>
	</div>
	</a>
	<!-- ================================ 프로젝트 제목 입력창 =============================================== -->
	<div id="pjo_title_edit">
		<div class="row">
		<br>
			<div class="col-sm-10">
				<label>&nbsp;프로젝트 제목</label>
					<div class="summary_text">
						프로젝트에 멋진 제목을 붙여주세요. 감정에 호소하는 제목보다는 만드시려는 창작물, 작품명, 
						혹은 프로젝트의 주제가 드러나게 써주시는 것이 좋습니다. 공간이 부족한 곳에 쓰일 7자 이내의 짧은 제목도 정해주세요.			
					</div>
			</div>
			<div class="row">
				<div id="pjo_title_img" class="col-sm-11">
					<div class="col-sm-6">
						<label>프로젝트 제목은 어디에 쓰이나요?</label>
					</div>
					<div class="col-sm-6">
						<label>프로젝트 짧은 제목은 어디에 쓰이나요?</label>
					</div>
					<div class="col-sm-6">
						<img src="../FTBC_Images/pjo_title_edit_1.png"></img>
					</div>		
					<div class="col-sm-6">
						<img src="../FTBC_Images/pjo_title_edit_2.png"></img>
					</div>
				</div>
			</div>
			<br>
			<div id="pjo_title_edit2" class="row">
				<div class="col-sm-6">
					<label>프로젝트 제목</label>
				</div>
				<div class="col-sm-6">
					<label>프로젝트 짧은 제목</label>
				</div>
			</div>	 
			<div  id="pjo_title_edit3" class="row">
				<div class="col-sm-6">
					    <input type="text" id="long_title" name="long_title" placeholder="프로젝트 제목을 입력해 주세요.">
					    <br><h6 id="long_title_length">32자 남았습니다.</h6>				    
				</div>
				<div class="col-sm-6">
					    <input type="text" id="short_title" name="short_title" placeholder="프로젝트 짧은 제목을 입력해 주세요.">
					    <br><h6 id="short_title_length">7자 남았습니다</h6>
				</div>
			</div>	
			<div id="pjo_title_edit4" class="col-lg-12">			
				<div class="col-sm-8"></div>
				<div class="col-sm-4">
				<div class="col-sm-4"></div>
				
				<div class="col-sm-4">
					<button class="button button_cancle" onClick="pjo_title_edit_cancle()">취소하기</button>&nbsp;&nbsp;
				</div>
				<div class="col-sm-4">
					<button class="button button_save" onClick="pjo_title_edit_save()">저장하기</button>
				</div>
				<div class="col-sm-4"></div>
				</div>
			</div>	
		</div>	
	</div>	
	</td></tr>
	<!-- ============================== 프로젝트 이미지========================================== -->
	<tr><td>
	<a href="javascript:pjo_img_edit_open()">
	<div id="pjo_img">
		<div class="row">
			<br>
			<div class="col-sm-10">
				<label>&nbsp;프로젝트 대표 이미지</label>
			</div>
		</div>
		<div id="img_pjo">
		<div class="row">
			<div class="col-sm-10">
				<img src="../FTBC_Images/finger.png"></img><label>&nbsp; 프로젝트
					대표 이미지를 등록해 주세요</label>
			</div>
			<div class="col-sm-2">
				<img src="../FTBC_Images/edit.png"></img><label>&nbsp; 업로드하기</label>
			</div>
		</div>
		</div>
	</div>
	</a>
	<!-- ============================== 프로젝트 이미지 입력창 ========================================== -->
	<div id="pjo_img_edit"> 
		<div class="row">
			<br>
			<div class="col-sm-10">
				<label>&nbsp;프로젝트 대표 이미지</label>
					<div class="summary_text">
						대표 이미지는 프로젝트의 가장 중요한 시각적 요소입니다.
					<br>후원자들이 프로젝트의 내용을 쉽게 파악하고 좋은 인상을 받을 수 있게 하기 위해 다음 가이드 라인에 따라 디자인 해주세요			
					</div>
			</div>
			<div>
				<div class="col-sm-12">
					<div class="col-sm-6">
						<img src="../FTBC_Images/pjo_img_img.png"/>
					</div>
					<div class="col-sm-6">
						<div class="pjo_img_edit_1">
							<h4><b>대표 이미지가 보이는 곳</b></h4>
							<div class="summary_text">
							<b>∙</b> 프로젝트 카드에는 항상 제목과 함께<br>
							<b>∙</b> 소개 영상을 올리신 경우, 재생 전 화면에<br>
							<b>∙</b> 모바일 둘러보기에서는 아주 작은 사이즈로<br>
							<br>
							<br>
							</div>
							<h4><b>디자인 유의사항</b></h4>
							<div class="summary_text">
							<b>∙ 글자를 넣지 않은 창작물 이미지 만으로</b><br>
							&nbsp;&nbsp;&nbsp;(영화,공연,게임 등의 타이틀은 예외)<br>
							<b>∙</b> 창작 활동과 직접적으로 연관이 있는 자체 제작 이미지로<br>
							<b>∙</b> 테두리 장식 효과나 타일식 구성 없이 단일 이미지로<br>
							<b>∙</b> 어둡거나 흐릿하지 않고 내용이 분명히 드러나게<br>
							<b>∙</b> 사이트 배경과 구분을 위해 순백색이 아닌 배경색으로<br>
							<b>∙</b> 외부 서비스에 다른 비율로 제공될 수 있으니 테두리 부분이 잘려도 무방하도록<br>
							<b>∙</b> 찌그러지거나 작은 이미지를 확대한 것이 아닌 적정 해상도로<br>
							<br>
							가이드 라인에 부합하지 않는 이미지는 승인되지 않을 수 있습니다.
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
		<div id="pjo_img_edit_img">
		  <div id="pjo_img_edit_img">
		 	<div class="filebox">
		        <label for="cma_file"><img src="../FTBC_Images/imageupload.png"></label>
		        <input type="file" name="cma_file" id="cma_file" accept="image/*" capture="camera" onchange="getThumbnailPrivew(this)" />
		    </div>
		  </div>
		  <br>	
		</div>								
			<div class="col-sm-12">			
			<div class="col-sm-8"></div>
			<div class="col-sm-4">
				<div class="col-sm-8">
					<div id="pjo_img_edit_button_1"></div>
				</div>
				<div class="col-sm-4">
					<button class="button button_cancle" onClick="pjo_img_edit_cancle()">닫기</button>
				</div>
			</div>
			<br>
			<br>
			<br>
		</div>
		</div>
	</div>
	</td></tr>
	<!-- ================================= 프로젝트 요약 =========================================== -->
	<tr><td>
		<a href="javascript:pjo_summary_edit_open()">
			<div id="pjo_summary">
				<div class="row">
					<br>
					<div class="col-sm-10">
						<label>&nbsp;프로젝트 요약</label>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-10">
						<img src="../FTBC_Images/finger.png"></img><label>&nbsp; 프로젝트
							요약을 입력해 주세요</label>
					</div>
					<div class="col-sm-2">
						<img src="../FTBC_Images/edit.png"></img><label>&nbsp; 입력하기</label>
					</div>
				</div>
			</div>
		</a>
	<!-- ================================= 프로젝트 요약 입력창 =========================================== -->
		<div id="pjo_summary_edit">
				<br>
				<label>&nbsp;프로젝트 요약</label>
				<div class="summary_text">후원자 분들에게 본 프로젝트를 간략하게 소개해 봅시다.</div>
				<div class="row">
				<div class="col-sm-12" id="pjo_summary_edit_text_1">
					<textarea id="pjo_summary_edit_text" name="pjo_summary_edit_text" placeholder="프로젝트 요약을 입력해주세요"></textarea>
					<br><h6 id="pjo_summary_edit_text_length">최소 10자 / 50자 남았습니다</h6>
				</div>
				</div>
				<div id="pjo_summary_edit2" class="col-lg-12">			
					<div class="col-sm-8"></div>
					<div class="col-sm-4">
						<div class="col-sm-4"></div>
						<div class="col-sm-4">
							<button class="button button_cancle" onClick="pjo_summary_edit_cancle()">취소하기</button>&nbsp;&nbsp;
						</div>
						<div class="col-sm-4">
							<button class="button button_save" onClick="pjo_summary_edit_save()">저장하기</button>
						</div>
						<div class="col-sm-4"></div>
					</div>
				</div>
		</div>
	</td></tr>
	<!-- ================================= 프로젝트 카테고리 =========================================== -->
	<tr><td>
		<a href="javascript:pjo_category_edit_open()">
			<div id="pjo_category">
				<div class="row">
					<br>
					<div class="col-sm-10">
						<label>&nbsp;프로젝트 카테고리</label>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-10">
						<img src="../FTBC_Images/finger.png"></img><label>&nbsp; 프로젝트
							카테고리를 입력해 주세요</label>
					</div>
					<div class="col-sm-2">
						<img src="../FTBC_Images/edit.png"></img><label>&nbsp; 입력하기</label>
					</div>
				</div>
			</div>
		</a>
	<!-- ================================= 프로젝트 카테고리 입력창 =========================================== -->
		<div id="pjo_category_edit">
			<br>
			<label>&nbsp;프로젝트 카테코리</label>
			<div class="summary_text">프로젝트의 성격에 맞는 카테고리를 선택해 주세요.<br>
				(프로젝트 성격과 맞지 않는 카테고리를 선택하실 시 후원자가 해당 프로젝트를 찾기 어려워지기에 에디터에 의해 조정될 수 있습니다.)</div>
			<div class="row">
			<div class="col-sm-4">
				<select id="pjo_category_select">
				    <option selected>카테고리</option>
				    <option>db에서</option>
				    <option>가져와서</option>
			    	<option>for문 돌려서 넣을거</option>
				</select>
			</div>	
			</div>
			<div id="pjo_title_edit4" class="col-lg-12">			
				<div class="col-sm-8"></div>
				<div class="col-sm-4">
				<div class="col-sm-4"></div>
				
				<div class="col-sm-4">
					<button class="button button_cancle" onClick="pjo_category_edit_cancle()">취소하기</button>&nbsp;&nbsp;
				</div>
				<div class="col-sm-4">
					<button class="button button_save">저장하기</button>
				</div>
				<div class="col-sm-4"></div>
				</div>
			</div>	
		</div>	
	</td></tr>
	<!-- ================================= 프로젝트 페이지 주소 =========================================== -->
	<tr><td>
		<a href="javascript:pjo_page_edit_open()">
			<div id="pjo_page">
				<div class="row">
					<br>
					<div class="col-sm-10">
						<label>&nbsp;프로젝트 페이지</label>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-10">
						<img src="../FTBC_Images/finger.png"></img><label>&nbsp; 프로젝트
							페이지 주소를 입력해 주세요</label>
					</div>
					<div class="col-sm-2">
						<img src="../FTBC_Images/edit.png"></img><label>&nbsp; 입력하기</label>
					</div>
				</div>
			</div>
		</a>
	<!-- ================================= 프로젝트 페이지 주소 입력창 =========================================== -->
		<div id="pjo_page_edit">
			<br>
			<label>&nbsp;프로젝트 페이지 주소</label>
			<div class="summary_text">프로젝트 페이지로 접속할 수 있는 주소(URL)를 설정해주세요.</div>
			<div class="row">
				<div>
					<div class="col-sm-10">
						<div  id="pjo_page_site" class="col-sm-2">
							<div id="pjo_page_site_2"><b>https://우리사이트.sdas/</b></div>
						</div>
						<div>
 							<input type="text" class="col-sm-8" id="pjo_page_text" name="pjo_page_text">
							<br><h6 id="pjo_page_text_length">최소 5자 / 125자 남았습니다</h6>
						</div>
					</div>
				</div>
			</div>
			<div id="pjo_title_edit4" class="col-lg-12">			
				<div class="col-sm-8"></div>
				<div class="col-sm-4">
				<div class="col-sm-4"></div>
				
				<div class="col-sm-4">
					<button class="button button_cancle" onClick="pjo_page_edit_cancle()">취소하기</button>&nbsp;&nbsp;
				</div>
				<div class="col-sm-4">
					<button class="button button_save" onClick="pjo_page_edit_save()">저장하기</button>
				</div>
				<div class="col-sm-4"></div>
				</div>
			</div>	
		</div>
	</td></tr>
	<!-- ================================= 프로젝트 태그 =========================================== -->
	<tr><td>
		<a href="javascript:pjo_tag_edit_open()">
			<div id="pjo_tag">
				<div class="row">
					<br>
					<div class="col-sm-10">
						<label>&nbsp;검색용 태그</label>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-10">
						<img src="../FTBC_Images/finger.png"></img><label>&nbsp; 예시: 뱃지,
						 웹툰, 에코백, 고양이, 유기견</label>
					</div>
					<div class="col-sm-2">
						<img src="../FTBC_Images/edit.png"></img><label>&nbsp; 입력하기</label>
					</div>
				</div>
			</div>
		</a>
	<!-- ================================= 프로젝트 태그 입력창 =========================================== -->
		<div id="pjo_tag_edit">
			<br>
			<label>&nbsp;검색용 태그</label>
			<div id="summary_tex">내외부 검색 엔진에서 프로젝트가 잘 검색될 수 있도록, 사람들이 검색할만한 프로젝트의 핵심 단어를 입력해주세요.
			<br>여러 개의 태그를 입력하시는 경우 쉼표(,)로 구분하여 작성하실 수 있습니다.
			<br>프로젝트와 관련 없거나 검색에 불리한 키워드는 운영진에 의해 조정될 수 있습니다.
			<br>쉼표를 제외한 특수문자는 입력하실 수 없습니다.</div>
			<div class="row">
				<div class="col-sm-12" >
					<input type="text" id="pjo_tag_text" name="pjo_tag_text">
						<br><h6 id="pjo_tag_text_length">최소 2자 / 125자 남았습니다</h6>
				</div>
				<br>
			</div>
			<div class="col-sm-12">
				<div class="col-sm-8"></div>
				<div class="col-sm-4">
					<div class="col-sm-4"></div>
					<div class="col-sm-8">
					</div>
				</div>
			</div>
			<div id="pjo_title_edit4" class="col-lg-12">			
				<div class="col-sm-8"></div>
				<div class="col-sm-4">
				<div class="col-sm-4"></div>
				
				<div class="col-sm-4">
					<button class="button button_cancle" onClick="pjo_tag_edit_cancle()">취소하기</button>&nbsp;&nbsp;
				</div>
				<div class="col-sm-4">
					<button class="button button_save" onClick="pjo_tag_edit_save()">저장하기</button>
				</div>
				<div class="col-sm-4"></div>
				</div>
			</div>	
		</div>
	</td></tr>
	</table>
</div>
<br>
<p>창작자 정보</p>
<div id="pjo_creator">
	<table>
	<!-- ================================= 프로필 이미지 =========================================== -->
	<tr><td>
		<a href="javascript:pjo_profile_img_edit_open()">
		<div id="pjo_profile_img">
			<div class="row">
				<br>
				<div class="col-sm-10">
					<label>&nbsp; 프로필 이미지</label>
				</div>
			</div>
			<div id="pjo_profile_img_1">
			<div class="row">
				<div class="col-sm-10">
					<img src="../FTBC_Images/finger.png"></img><label>&nbsp; 창작자님의 프로필
					이미지를 올려주세요</label>
				</div>
				<div class="col-sm-2">
					<img src="../FTBC_Images/edit.png"></img><label>&nbsp; 입력하기</label>
				</div>
			</div>
			</div>
		</div>
		</a>
	<!-- ================================= 프로필 이미지 입력창 =========================================== -->
		<div id="pjo_profile_img_edit">
				<br>
				<label>&nbsp;프로필 이미지</label>
				<div class="summary_text">창작자님 개인이나 팀의 사진을 올려주세요. 얼굴이 나온 사진을 넣으면 프로젝트의 신뢰성 향상에 도움이 됩니다.</div>
			<div>
				  <div id="pjo_profile_img_edit_img">
				 	<div class="filebox">
				        <label for="pjo_profile_img_edit_img_file"><img src="../FTBC_Images/imageupload.png"></label>
				        <input type="file" name="pjo_profile_img_edit_img_file" id="pjo_profile_img_edit_img_file" accept="image/*" capture="camera" onchange="pjo_profile_img(this)" />
				    </div>
				  </div>
			  <br>	
	  			<div id="pjo_title_edit4" class="col-lg-12">			
					<div class="col-sm-8"></div>
					<div class="col-sm-4">
						<div class="col-sm-8">
							<div id="pjo_profile_img_edit_img_button_1"></div>&nbsp;&nbsp;
						</div>
						<div class="col-sm-4">
							<button class="button button_cancle" onClick="pjo_profile_img_edit_cancle()">닫기</button>
						</div>
					</div>
				</div>								
				<br>
				<br>
				<br>
			</div>
		</div>
	</td></tr>
	<!-- ================================= 창작자 이름 =========================================== -->
	<tr><td>
		<a href="javascript:pjo_name_edit_open()">
		<div id="pjo_name">
			<div class="row">
				<br>
				<div class="col-sm-10">
					<label>&nbsp; 창작자 이름</label>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-10">
					<img src="../FTBC_Images/finger.png"></img><label>&nbsp; 창작자 이름</label>
				</div>
				<div class="col-sm-2">
					<img src="../FTBC_Images/edit.png"></img><label>&nbsp; 수정하기</label>
				</div>
			</div>
		</div>
		</a>
	<!-- ================================= 창작자 이름 입력창 =========================================== -->
		<div id="pjo_name_edit">
				<br>
				<label>&nbsp;창작자 이름</label>
				<div class="summary_text">창작자님을 대표할 수 있는 이름을 써 주세요. 팀으로 진행하신다면 팀 이름을 쓰셔도 됩니다</div>
			<div class="row">
				<div class="col-sm-6">
				    <input type="text" id="pjo_name_text" name="pjo_name_text" placeholder="이름을 입력해 주세요">
				    <br><h6 id="pjo_name_text_length">20자 남았습니다.</h6>				    
				</div>
			</div>
			<div id="pjo_title_edit4" class="col-lg-12">			
				<div class="col-sm-8"></div>
				<div class="col-sm-4">
				<div class="col-sm-4"></div>
				
				<div class="col-sm-4">
					<button class="button button_cancle" onClick="pjo_name_edit_cancle()">취소하기</button>&nbsp;&nbsp;
				</div>
				<div class="col-sm-4">
					<button class="button button_save" onClick="pjo_name_edit_save()">저장하기</button>
				</div>
				<div class="col-sm-4"></div>
				</div>
			</div>	
		</div>
	</td></tr>
	<!-- ================================= 창작자 소개 =========================================== -->
	<tr><td>
		<a href="javascript:pjo_introduction_edit_open()">
		<div id="pjo_introduction">
			<div class="row">
				<br>
				<div class="col-sm-10">
					<label>&nbsp; 창작자 소개</label>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-10">
					<img src="../FTBC_Images/finger.png"></img><label>&nbsp; 창작자 소개를 입력해
					주세요</label>
				</div>
				<div class="col-sm-2">
					<img src="../FTBC_Images/edit.png"></img><label>&nbsp; 입력하기</label>
				</div>
			</div>
		</div>
		</a>
	<!-- ================================= 창작자 소개 입력창 =========================================== -->
		<div id="pjo_introduction_edit">
			<br>
			<label>&nbsp;창작자 소개</label>
			<div class="summary_text">창작자님의 이력과 간단한 소개를 써 주세요</div>
		<div class="row">
			<div id="pjo_introduction_text" class="col-sm-10">
				<div id="pjo_introduction_text_2"><div class="glyphicon glyphicon-question-sign"></div>&nbsp;<b>창작자 소개는 어디에 쓰이나요?</b>
				<br>
				<br><div id="summary_text">
				프로젝트 페이지를 방문하는 후원자들이 '크리에이터 자세히 보기'를 클릭하면, 창작자님의 과거 텀블벅 프로젝트들과 함께 창작자 소개 문구가 표시됩니다. 2~3문장으로 간략하게 어떤 작업을 위주로 활동해 온 창작자인지 알려주세요.
				</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12" id="pjo_introduction_edit_text">
					<textarea id="pjo_introduction_edit_textarea" name="pjo_introduction_edit_textarea" placeholder="창작자 소개를 입력해주세요"></textarea>
					<br><h6 id="pjo_introduction_edit_text_length">최소 10자 / 300자 남았습니다</h6>
				</div>
			</div>
		</div>
			<div id="pjo_introduction_edit4" class="col-lg-12">			
				<div class="col-sm-8"></div>
				<div class="col-sm-4">
				<div class="col-sm-4"></div>
				
				<div class="col-sm-4">
					<button class="button button_cancle" onClick="pjo_introduction_edit_cancle()">취소하기</button>&nbsp;&nbsp;
				</div>
				<div class="col-sm-4">
					<button class="button button_save" onClick="pjo_introduction_edit_save()">저장하기</button>
				</div>
				<div class="col-sm-4"></div>
				</div>
			</div>	
		</div>
	</td></tr>
	<!-- ================================= 창작자 활동 지역 =========================================== -->
	<tr><td>
		<a href="javascript:pjo_active_area_edit_open()">
		<div id="pjo_active_area">
			<div class="row">
				<br>
				<div class="col-sm-10">
					<label>&nbsp; 창작자 활동 지역</label>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-10">
					<img src="../FTBC_Images/finger.png"></img><label>&nbsp; 창작자 활동 지역을
					입력해 주세요</label>
				</div>
				<div class="col-sm-2">
					<img src="../FTBC_Images/edit.png"></img><label>&nbsp; 입력하기</label>
				</div>
			</div>
		</div>
		</a>
	<!-- ================================= 창작자 활동지역 입력창 =========================================== -->
		<div id="pjo_active_area_edit">
			<br>
			<label>&nbsp;창작자 활동 지역</label>
			<div class="summary_text">창작자님은 주로 어느 지역에서 활동하시나요? 활동 지역을 구체적으로 기입해주시면 프로젝트의 신뢰를 높이는 데 도움이 됩니다.</div>
			<div class="row">
				<div class="col-sm-10">
				    <input type="text" id="pjo_active_area_text" name="pjo_active_area_text" placeholder="활동 지역을 입력해 주세요">
				    <br><h6 id="pjo_active_area_text_length">20자 남았습니다.</h6>				    
				</div>
			</div>
			<div id="pjo_active_area_edit4" class="col-lg-12">			
				<div class="col-sm-8"></div>
				<div class="col-sm-4">
				<div class="col-sm-4"></div>
				
				<div class="col-sm-4">
					<button class="button button_cancle" onClick="pjo_active_area_edit_cancle()">취소하기</button>&nbsp;&nbsp;
				</div>
				<div class="col-sm-4">
					<button class="button button_save" onClick="pjo_active_area_edit_save()">저장하기</button>
				</div>
				<div class="col-sm-4"></div>
				</div>
			</div>	
		</div>
	</td></tr>
	</table>	
	</form>
	<br>
	<a class="tab_menu" data-toggle="tab" href="#menu2"><button onClick="next_page()" class="button button_next">다음&nbsp;<i class="glyphicon glyphicon-chevron-right"></i></button></a>
</div>
<!--end of pjo_title  -->
</body>
</html>










