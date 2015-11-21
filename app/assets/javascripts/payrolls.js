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
var payload = {
	payroll_data : []
}
var entries_count = 0;
var handle_pay_input_submission = function() {
	var employee_name = $('#employee_name').val(),
    	gross_pay = $('#pay_input').val()
    	$('#employee_name').val('')
    	$('#pay_input').val('')
    	$('#employee_name').focus()
    if (name != undefined && gross_pay != "" && gross_pay > 0) {
    	entries_count = entries_count + 1
	    var  medicare_tax = (gross_pay * .0145),
	    	employers_tax = (gross_pay * .062),
	    	net_pay = roundToTwo((gross_pay - medicare_tax - employers_tax)),
	    	new_payroll_data = {
	    		name 	  :  employee_name,
	    		gross     :  gross_pay,
	    		medicare  : roundToTwo((gross_pay * .0145)),
	    		employers : roundToTwo((gross_pay * .062)),
	    		net 	  :  net_pay
	    	},
	    	new_item = "<li class='payroll_item clearfix' id ='"+(entries_count)+"'> <div class='col-xs-3 payroll_item_" + entries_count + "_name'><b>" + employee_name + "</b></div><div class='col-xs-9 text-right payroll_item_" + entries_count + "_info'><span class='gross_pay'>Gross Pay: $" +gross_pay+ "</span> Employers Tax: <b>$" + roundToTwo(employers_tax) + "</b> Medicare Tax: <b>$" + roundToTwo(medicare_tax) + "</b> Net Pay: <b>$" + net_pay + "</b></div></li>";
		$('#payroll_items').prepend(new_item);
		payload.payroll_data.push(new_payroll_data);
	} 
	else if (name == undefined || name == "" ) {
		alertBox("Name is empty or invalid");
	}
	else if (gross_pay == undefined || gross_pay <= 0 ) {
		alertBox("Pay is empty or invalid");
	} 
	else {
		alertBox("Unidentified error.");
	}
}
var handle_payroll_save = function() {
	var payroll_items  = $('.payroll_item'),
	url = "/admin/payrolls_new"
	console.log(payload.payroll_data)
	var request = $.ajax({
					  type: "POST",
					  url: url,
					  data: payload,
					  success: handle_payroll_post_success,
					  error: handle_payroll_post_failure,
					  dataType: "JSON"
					});
	event.stopPropagation();
}
var handle_payroll_post_success = function() {
	successBox("Payroll entry saved. Redirecting...", {
		redirect_address : "/admin/payrolls",
		timer 			 : 1500
	});
}
var handle_payroll_post_failure = function() {
	alertBox("Payroll entry failed to save.Please retry");
}
var roundToTwo = function(value) {
	return(Math.round(value * 100) / 100);
}
