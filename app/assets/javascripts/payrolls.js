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
var payroll_data = [];
var entries_count = 0;
var handle_pay_input_submission = function() {
		var employee_name = $('#employee_name').val(),
	    	gross_pay = $('#pay_input').val()
	    if (name != undefined && gross_pay != "" && gross_pay > 0) {
	    	entries_count = entries_count + 1
		    var  medicare_tax = (gross_pay * .0145),
		    	employers_tax = (gross_pay * .062),
		    	net_pay = roundToTwo((gross_pay - medicare_tax - employers_tax)),
		    	new_payroll_data = {
		    		name 	  :  employee_name,
		    		gross     :  gross_pay,
		    		medicare  : (gross_pay * .0145),
		    		employers : (gross_pay * .062),
		    		net 	  :  net_pay
		    	},
		    	new_item = "<li class='payroll_item clearfix' id ='"+(entries_count)+"'> <div class='col-xs-3 payroll_item_" + entries_count + "_name'><b>" + employee_name + "</b></div><div class='col-xs-9 text-right payroll_item_" + entries_count + "_info'><span class='gross_pay'>Gross Pay: $" +gross_pay+ "</span> Employers Tax: <b>$" + roundToTwo(employers_tax) + "</b> Medicare Tax: <b>$" + roundToTwo(medicare_tax) + "</b> Net Pay: <b>$" + net_pay + "</b></div></li>";
			$('#payroll_items').prepend(new_item);
			payroll_data.push(new_payroll_data);
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
	var payroll_items  = $('.payroll_item')
	console.log(payroll_data);
}
var roundToTwo = function(value) {
	return(Math.round(value * 100) / 100);
}
