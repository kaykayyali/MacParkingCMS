// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function() {

	$('#employee_name').on('blur', function() {
		var name = $('#employee_name').val().split(' ');
		var corrected_name_array = [];
		name.forEach(function(word){
			word = word.toLowerCase();
			word = word.charAt(0).toUpperCase() + word.slice(1);
			corrected_name_array.push(word);
		})
		$('#employee_name').val(corrected_name_array.join(' '));
	})

	$('#pay_input').on('keypress').on('keydown', function (e) {
	    if (e.which == 13) {
	        handle_pay_input_submission();
	     }
	});
});
var entries_count = 0
var handle_pay_input_submission = function() {
		var name = $('#employee_name').val(),
	    	gross_pay = $('#pay_input').val()
	    if (name != undefined && gross_pay != "" && gross_pay > 0) {
	    	entries_count = entries_count + 1
		    var  medicare_tax = (gross_pay * .0145),
		    	employers_tax = (gross_pay * .062),
		    	net_pay = roundToTwo((gross_pay - medicare_tax - employers_tax)),
		    	new_item = "<li class='payroll_item clearfix' id ='"+(entries_count)+"'> <div class='col-xs-3 payroll_item_" + entries_count + "_name'><b>" + name + "</b></div><div class='col-xs-9 text-right payroll_item_" + entries_count + "_info'><span class='gross_pay'>Gross Pay: $" +gross_pay+ "</span> Employers Tax: <b>$" + roundToTwo(employers_tax) + "</b> Medicare Tax: <b>$" + roundToTwo(medicare_tax) + "</b> Net Pay: <b>$" + net_pay + "</b></div></li>"
			$('#payroll_items').prepend(new_item)
		} 
		else if (name == undefined || name == "" ) {
			alertBox("Name is empty or invalid")
		}
		else if (gross_pay == undefined || gross_pay <= 0 ) {
			alertBox("Pay is empty or invalid")
		} 
		else {
			alertBox("Unidentified error.")
		}
}

var handle_payroll_save = function() {
	var payroll_items  = $('.payroll_item'),
	payroll_data = collect_payroll_data(payroll_items);
	console.log(payroll_data);
}

var collect_payroll_data = function(items) {
	var data = []
	$.each(items, function(index, item) {
		var name = $('.payroll_item_' + (index + 1) + '_name').text(),
		info_unsanitized = $('.payroll_item_' + (index + 1) + '_info').text();
		data.push({
			employee_name: name, 
			employee_info: info_unsanitized
		})
	})
	return data;
}
var roundToTwo = function(value) {
	return(Math.round(value * 100) / 100);
}
