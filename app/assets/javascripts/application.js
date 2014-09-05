// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require chosen-jquery
//= require jquery
//= require bootstrap-sprockets
//= require_tree .

jQuery(function($) {
	addDailyReportFields();
	addDailyCostFields();
	chosenCssInit();
});

function validatePriceField() {
	field_class = ["price_field_class", "cost_field_class"]

	for(k=0; k<field_class.length; k++){

		jQuery("." + field_class[k]).each(function() {
			var amount_pattern = new RegExp('^[0-9]+[\.]+[0-9]+$');

			if($(this)[0].value.indexOf('.') == -1)
			{
				$(this)[0].value = $(this)[0].value + ".00";
			} else {
				separator =	$(this)[0].value.indexOf('.');
				$(this)[0].value = $(this)[0].value.slice(0, separator+3);
			}

			if($(this)[0].value.match(amount_pattern))
			{
				callculateTotalAmount();
			} else {
				alert("Amount is INVALID!!!!");
			}		
		});
	}
}

function insertAt(src, index, str) {
	if(src.length == 1) {
		return '0.0'+src
	} else if(src.length == 2) {
		return '0.'+ src 
	} else {
		return src.substr(0, index) + str + src.substr(index)
	}
}

function callculateTotalAmount() {
	var total_amount = 0;
	jQuery(".price_field_class").each(function() {		
		total_amount = parseInt($(this)[0].value.replace(".", "")) + total_amount;
		updateTotalAmountField(total_amount);
	});

	jQuery(".cost_field_class").each(function() {		
		total_amount = total_amount - parseInt($(this)[0].value.replace(".", ""));
		updateTotalAmountField(total_amount);
	});
}

function updateTotalAmountField(total_amount) {
	string_length = String(total_amount).length;
	document.getElementById("hidden_field_total_amount_id").value = insertAt(String(total_amount), string_length-2, '.');
	document.getElementById("total_amount_id").innerHTML = insertAt(String(total_amount), string_length-2, '.');
}

function chosenCssInit() {
  return $('.chosen-select').chosen({
    allow_single_deselect: true,
    no_results_text: 'No results matched',
    width: '200px'
  });
};

function addDailyReportFields() {
	jQuery('#add_daily_report_field_id').bind('click', function() {
		var field_value = document.getElementById('export_daily_report_hidden_field_id').value;
		document.getElementById('export_daily_report_hidden_field_id').value = parseInt(field_value) + 1;
    jQuery.ajax({
      type: "POST",
			url: '/daily_reports/add_daily_report_fields',
			data: { counter: field_value }
		});
  });
}

function addDailyCostFields() {
	jQuery('#add_daily_cost_field_id').bind('click', function() {
    jQuery.ajax({
      type: "POST",
			url: '/daily_reports/add_daily_cost_fields',
		});
  });
}
