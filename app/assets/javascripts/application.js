// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui/widgets/draggable
//= require jquery-ui/widgets/droppable
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-fileinput/js/fileinput.min
//= require_tree .

$(document).ready( function(){  

	$(document).on("change", ".checkbox_all input[type='checkbox']", function(e){
		var checked = $(this).is(":checked");
		var checkboxes = $(this).closest(".order_table").find(".print_selector input[type='checkbox']");
		$(checkboxes).prop('checked', checked);
		$(checkboxes).trigger('change');
	});

	$(document).on("change, keyup", ".order_table input[type='text']", function(e){
		var code= e.keyCode || e.which;
		if (code != '9'){
			$(this).closest("form").addClass("changed");
		}
	});

	$(document).on("change", ".order_table .print_selector .checkbox input[type='checkbox']", function(e){
		var checked = $(this).is(":checked");
		var id = $(this).val();
		$(".preview_form #orders_" + id ).prop("checked", checked);
	});

	$(document).on("click", "#print_button", function(e){
		e.preventDefault();
		window.print();
	});

	function snapToPosition(dragger, target){
		var topMove = target.position().top - dragger.data('position').top + (target.outerHeight(true) - dragger.outerHeight(true)) / 2;
		var leftMove= target.position().left - dragger.data('position').left + (target.outerWidth(true) - dragger.outerWidth(true)) / 2;
		dragger.animate({top:topMove,left:leftMove},{duration:200,easing:'linear'});
	}

	
	/* LOAD ON READY */
  
	function setup() {
		$( ".draggable" ).draggable({
			scroll: false,
			revert: 'invalid',
			stack: false,
			create: function(){$(this).data('position',$(this).position())},
			cursor: "pointer",
			start:function(){$(this).stop(true,true)},
			drag: function(event, ui)
			{
				$( ".droparea" ).removeClass( "highlight" );
			}		
		});
		$(".droppable").droppable({
			accept: ".order_box",
  			drop: function(event, ui) {
				console.log("prueba");
				$( this ).addClass( "highlight" ).find( "p" );
				snapToPosition(ui.draggable, $(this));
			}
		});
	}

	setup();

});
