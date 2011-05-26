// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
	$(".submit_form").click(function(){
		form = $(this).attr("role");
		$("#" + form).submit();
	});
	
	$("#in_the_last").change(function(){$("#filter_me").submit()});
	$("#has_spent").change(function(){$("#filter_me").submit()});
	
	if($('#growl').length > 0){ growl($('#growl').html())}

});

function growl(message){
	
	$.blockUI({ 
            message: message, 
            fadeIn: 700, 
            fadeOut: 700, 
            timeout: 4000, 
            showOverlay: false, 
            centerY: false, 
            css: { 
                width: '350px', 
                top: '10px', 
                left: '', 
                right: '10px', 
                border: 'none', 
                padding: '10px',
                fontSize: '1.2em', 
                backgroundColor: '#000', 
                '-webkit-border-radius': '10px', 
                '-moz-border-radius': '10px', 
                color: '#fff' 
            } 
        });
	
}
