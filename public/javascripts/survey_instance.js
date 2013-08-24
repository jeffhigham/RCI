var current_question = 1;
var total_questions = 70;
var answer_a_category = '';
var answer_b_category = '';
var question_list = null;
var server=location.protocol +'//'+ location.host;

function all_questions(){
	ajax_request_obj = $.ajax({ 
	      type: 'GET', 
	      url: server + '/api/questions/all.json', 
	      async: false
	  });
	var response =  $.parseJSON(ajax_request_obj.responseText);
	return response;
}

function load_question(){
	var question = question_list[current_question];
	$('#question').html(current_question +'. '+ question.question );
	$('#answer1').html(question.answers[0].content + '.');
	$('#answer2').html(question.answers[1].content +'.');
	answer_a_category = question.answers[0].category;
	answer_b_category = question.answers[1].category;
}

function load_next_question(){
	current_question += 1;
	console.log("current_question: "+ current_question);
	if(current_question > total_questions){
		console.log("Submitting form!");
		$('form').submit();
	}
	else {
		load_question();
	}
}

$(document).ready(function(){
	question_list = all_questions();
	load_question();
	$("#answer1").bind('click',function(){
		$('#question'+ current_question).attr({'value': answer_a_category})
		console.log($('#question'+ current_question).attr('value'));
		load_next_question();
	});
	$("#answer2").bind('click',function(){
		$('#question'+ current_question).attr({'value': answer_b_category})
		console.log($('#question'+ current_question).attr('value'));
		load_next_question();
	});

});