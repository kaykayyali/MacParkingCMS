// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
(function($) {

  /**
   * Copyright 2012, Digital Fusion
   * Licensed under the MIT license.
   * http://teamdf.com/jquery-plugins/license/
   *
   * @author Sam Sehnert
   * @desc A small plugin that checks whether elements are within
   *     the user visible viewport of a web browser.
   *     only accounts for vertical position, not horizontal.
   */

  $.fn.visible = function(partial) {
    
      var $t            = $(this),
          $w            = $(window),
          viewTop       = $w.scrollTop(),
          viewBottom    = viewTop + $w.height(),
          _top          = $t.offset().top,
          _bottom       = _top + $t.height(),
          compareTop    = partial === true ? _bottom : _top,
          compareBottom = partial === true ? _top : _bottom;
    
    return ((compareBottom <= viewBottom) && (compareTop >= viewTop));

  };
    
})(jQuery);
	function initAutocomplete() {
	  // Create the autocomplete object, restricting the search to geographical
	  // location types.
	  autocomplete = new google.maps.places.Autocomplete(
	      /** @type {!HTMLInputElement} */(document.getElementById('autocomplete')),
	      {types: ['geocode']});
	}
	function geolocate() {
	  if (navigator.geolocation) {
	    navigator.geolocation.getCurrentPosition(function(position) {
	      var geolocation = {
	        lat: position.coords.latitude,
	        lng: position.coords.longitude
	      };
	      var circle = new google.maps.Circle({
	        center: geolocation,
	        radius: position.coords.accuracy
	      });
	      autocomplete.setBounds(circle.getBounds());
	    });
	  }
	}
	$(function(){
	var win = $(window);
	var allMods = $(".slideIn");

	// Already visible modules
	allMods.each(function(i, el) {
	  var el = $(el);
	  if (el.visible(true)) {
	    el.addClass("already-visible"); 
	  } 
	});

	win.scroll(function(event) {
	  
	  allMods.each(function(i, el) {
	    var el = $(el);
	    if (el.visible(true)) {
	    	if (el.hasClass('already-visible')) {

	    	} else {
	      	el.addClass("come-in"); 
	 	 	}	
	    } 
	  });
	  
	});
	$('#estimateBtn').on('click', function(event) {
		if (estimateValidate()) {
			var guestCount = $('#guestCount').val()
			var expectedCars = Math.ceil(guestCount / 2)
			var attendants = Math.ceil(expectedCars / 15)
			var estimate = attendants * 95 + 200
			if (guestCount > 0 && estimate > 0) {
				$('.estimate').text(estimate)
			}
		}
	})
	function estimateValidate() {
		if ($('#estimateEmail').val() != ''){
			$('#estimateEmailLabel').css('font-size', '1em')
			$('#estimateEmailLabel').css('color', 'black')
			$('#estimateEmail').css('color', 'black')
			return true
		} else {
			alertBox("Please enter your Email")
			$('#estimateEmailLabel').css('color', 'red')
			$('#estimateEmailLabel').css('font-size', '18px')
			$('#estimateEmail').css('color', 'red')
		}
	}

	$('#contactButton').click(handleContactForm)
	function handleContactForm(){
		var name = $('#contactName').val();
		var phone = $('#contactPhone').val();
		var email = $('#contactEmail').val();
		var content = $('#contactContent').val();
		var payload = {
			name: name,
			phone: phone,
			email: email,
			content: content
		}
		if (!payload.name) {
			alertBox("Please enter your name.");
			return;
		}
		if (!payload.email) {
			alertBox("Please enter your email.");
			return;
		}
		if (!payload.phone) {
			alertBox("Please enter your phone number.");
			return;
		}
		if (!payload.content) {
			alertBox("Please enter a message.");
			return;
		}
		$.post('/contactus', payload);
		successBox("Sent Successfully")
		$('#contactName').val('');
		$('#contactPhone').val('');
		$('#contactEmail').val('');
		$('#contactContent').val('');
	}
	$('#newsButton').click(handleNewsForm)
	function handleNewsForm(){
		var email = $('#newsEmail').val();
		var payload = {
			email: email
		}
		$.post('/subscribe', payload)
		successBox("Sent Successfully")
	}

})