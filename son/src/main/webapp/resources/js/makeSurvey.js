$(document).ready(function(){
	$('#home').click(function(){
		$(location).attr('href', '/main.son');
	});
	
	$('#logout').click(function(){
		$(location).attr('href', '/member/logout.son');
	});
	
	$('#topicReset').click(function(){
		$('#topicFr input').val('');
	});
	
	$('#qList').on('click', '.quest', function(){
		$(this).children().eq(1).stop().slideToggle(300);
	});
	
	$('#tpnoFr').css('display', 'none');
	$('#questFr').css('display', 'none');
	$('#answerFr').css('display', 'none');
	
	$('#addTopic').click(function(){
		// 작성하고 있는 화면이 리로드 되면 안되므로 비동기 통신으로 처리하기로 한다.
		// 할일
		// 1. 주제 읽고
		var topic = $('#topic').val();
		if(!topic){
			$('#topic').focus();
			return;
		}
		// 2. 시작일 읽고
		var startdate = $('#start').val();
		if(!startdate){
			$('#start').focus();
			return;
		}
		// 3. 종료일 읽고
		var enddate = $('#end').val();
		if(!enddate){
			$('#end').focus();
			return;
		}
		
		var outdata = {
				title: topic,
				start: startdate,
				end: enddate
		};
		
		// 4. 서버에 보내서 결과받고
		$.ajax({
			url: '/survey/addTopic.son',
			type: 'POST',
			dataType: 'json',
			data: outdata,
			success: function(obj){
				if(obj.result == 'OK'){
					// 설문주제 등록에 성공한 경우
					$('#frm').append('<input type="hidden" id="tpno">');
					$('#tpno').val(obj.tpno);
					
					$('#topicFr').css('display', 'none');
					
					$('#tpnoFr h4').eq(1).text(topic);
					$('#tpnoFr').slideDown(500, function(){
						/* 설문 문항 입력 태그 보여지게 처리 */
						$('#questFr').delay(500).slideDown(500);
					});
					
				} else {
					setMsg();
				}
			},
			error: function(){
				$('#modalFr h2').html('통신 에러!');
				$('#strMsg').html('서버와 통신에 실패했습니다!');
				$('#modalFr').css('display', 'block');
			}
		});
		
	});
	
	$('.closeBtn').click(function(){
		$('#modalFr').css('display', 'none');
	});
	
	$('#btnInputTitle').click(function(){
		$('#inputTitle').removeClass('w3-hide');
		$('#selectTitle').addClass('w3-hide');
		
		$(this).removeClass('w3-gray w3-hover-pink').addClass('w3-blue w3-hover-yellow');
		$('#btnSelectTitle').removeClass('w3-blue w3-hover-yellow').addClass('w3-gray w3-hover-pink');
	});
	
	$('#btnSelectTitle').click(function(){
		$('#selectTitle').removeClass('w3-hide');
		$('#inputTitle').addClass('w3-hide');
		$(this).removeClass('w3-gray w3-hover-pink').addClass('w3-blue w3-hover-yellow');
		$('#btnInputTitle').removeClass('w3-blue w3-hover-yellow').addClass('w3-gray w3-hover-pink');
	
		// 아이디가 selTitle 인 태그의 내용 읽기
		var str = $('#selTitle').html();
		if(str){
			/* str = '내용있음!'; */
			$('#selTitle').html('');
		}
		
		// 데이터베이스 조회해서 태그 추가하고
		$.ajax({
			url: '/survey/questList.son',
			type: 'POST',
			dataType: 'json',
			success: function(obj){
				// 매개변수 obj는 배열변수다.
				// 배열에 JSON 형식의 데이터가 채워져 있는 형태이다.
				// 따라서 배열의 크기만큼 반복해서 처리해야 한다.
				var len = obj.length;
				$('#selTitle').append('<option selected># 문항 선택 #</option>');
				for(var i = 0 ; i < len ; i++ ){
					$('#selTitle').append('<option value="' + obj[i].qno + '">' + obj[i].body + '</option>')
				}
			},
			error: function(){
				alert('### 서버 통신 에러 ###');
			}
		});
	});
	
	// 아이디가 "squestAddBtn"인 태그 클릭이벤트
	$('#squestAddBtn').click(function(){
		var svalue = $('#selTitle').val();
		var stitle = $('#selTitle > option:selected').text();
		alert(svalue + ' - ' + stitle);
		
		if(stitle != '# 문항 선택 #'){
			$('#selTitle > option:selected').remove();
		}
	});
	
	/* 문항 추가 버튼 클릭 이벤트 */
	$('#tquestAddBtn').click(function(){
		// 할일
		// 1. 입력한 문항 내용 읽고
		var squest = $('#title').val();
		if(!squest){
			// 문항이 입력안된 경우
			$('#title').focus();
			return;
		}
		// 2. 서버에 보내고 결과 받고
		$.ajax({
			url: '/survey/addQuest.son',
			type: 'POST',
			dataType: 'json',
			data: {
				body: squest
			},
			success: function(obj){
				// 3. 결과에 따라서 처리해주고
				if(obj.result == 'OK'){
					// 데이터베이스 등록에 성공한 경우
					// 입력된 내용 태그 추가
					$('#qList > h4').append('<li class="quest">' + 
												'<span id="q' + obj.qno + '">' + squest + '</span>' +
												'<ol style="display: none; list-style-type: lower-alpha;">' +
											/* 
													'<li></li>' +
													'<li></li>' +
													'<li></li>' +
											*/
												'</ol>' +
											'</li>');
					/*
						$('#qList > h4 > li:last-child li').get()
					*/
					// 감싸는 태그 보여주고
					$('#qList').parent().css('display', 'block');
					
					$('#questFr').slideUp(500, function(){
						$('#answerFr').slideDown(500);
					});
				} else {
					setMsg();
				}
			},
			error: function(){
				servError();
			}
		});
		
	});
	
	/**
		보기 추가 버튼 클릭이벤트
	*/
	$('#tAnswerAddBtn').click(function(){
		// 할일
		// 1. 입력 보기 읽고
		var bogi = $('#answer').val();
		if(!bogi){
			$('#answer').focus();
			return;
		}
		
		var upno = $('#qList li.quest:last > span').attr('id').substring(1);
		
		// 2. 데이터베이스에 기록 요청하고
		$.ajax({
			url: '/survey/addEx.son',
			type: 'post',
			dataType: 'json',
			data: {
				body: bogi,
				qupno: upno
			},
			success: function(obj){
				// 3. 결과에 따라 처리하고
				if(obj.result == 'OK'){
					// 보기입력 태그 내용 지우고
					$('#answer').val('');
					
					// 보기 태그 추가하고
					$('#qList ol:last').append('<li id="a' + obj.qno + '">' + bogi + '</li>');
					
					// 추가된 보기 갯수 확인하고
					var cnt = $('#qList ol:last > li').length;
					if(cnt == 4){
						$('#qList .quest:last').append('<div class="w3-btn w3-small w3-pink w3-right addSurvey">설문등록</div>');
						$('#title').val('');
						$('#answerFr').slideUp(500, function(){
							$('#questFr').slideDown(500);
						});
					}
				} else {
					$('#answer').val('');
					setMsg();
					$('#answer').focus();
				}
			},
			error: function(){
				servError();
			}
		});
		
	});
	
	/* 설문 등록 클릭 이벤트 */
	$('#qList').on('click', '.addSurvey', function(){
		
	});
	
	function servError(){
		// 모달창을 띄워준다.
		$('#modalFr h2').html('통신 에러!');
		$('#strMsg').html('서버와 통신에 실패했습니다!');
		$('#modalFr').css('display', 'block');
	}
	
	function setMsg(){
		// 설문주제 등록에 실패한 경우
		$('#modalFr h2').html('등록 실패!');
		$('#strMsg').html('등록에 실패했습니다.');
		$('#modalFr').css('display', 'block');
	}
	
});


























