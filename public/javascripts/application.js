// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
	$(".submit_form").click(function(){
		form = $(this).attr("role");
		$("#" + form).submit();
	});
});
