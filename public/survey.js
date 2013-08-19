var current_question = 1;
var total_questions = 70;
var answer_a_category = '';
var answer_b_category = '';

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

function find_question(question_id){
	ajax_request_obj = $.ajax({ 
	      type: 'GET', 
	      url: server + '/api/questions/find/'+ question_id +'.json', 
	      async: false
	  });
	var response =  $.parseJSON(ajax_request_obj.responseText);
	return response;
}

function load_question(question_id){
	var question = find_question(question_id);
	$('#question').html(current_question +'. '+ question[0].question +'.');
	$('#answer1').html(question[0].answers[0].content);
	$('#answer2').html(question[0].answers[1].content);
	answer_a_category = question[0].answers[0].category;
	answer_b_category = question[0].answers[1].category;
}

function load_next_question(){
	current_question += 1;
	console.log("current_question: "+ current_question);
	if(current_question > total_questions){
		console.log("Submitting form!");
		$('form').submit();
	}
	else {
		load_question(current_question);
	}
}

$(document).ready(function(){
	load_question(current_question);
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