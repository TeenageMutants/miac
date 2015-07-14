// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery

//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require ckeditor/init
//= require jquery-migrate.min
//= require_tree .


$('.tooltips').tooltip();
$('.tooltips-show').tooltip('show');      
$('.tooltips-hide').tooltip('hide');       
$('.tooltips-toggle').tooltip('toggle');       
$('.tooltips-destroy').tooltip('destroy');       

/*Popovers*/
$('.popovers').popover();
$('.popovers-show').popover('show');
$('.popovers-hide').popover('hide');
$('.popovers-toggle').popover('toggle');
$('.popovers-destroy').popover('destroy');

$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
});

function hide_show(){
	var div=document.getElementById("div").style.display;
	var link=document.getElementById("link").innerHTML;
	if(div=="")div="block";
	if(div=="none")
	{
		div="block";
		link="Скрыть карту";
	}
	else
	{
		div="none";
		link="Посмотреть по карте";
	}
	document.getElementById("div").style.display=div;
	document.getElementById("link").innerHTML=link;
};
$(document).ready(function() {
    if ($('textarea').length > 0) {
        var data = $('textarea');
        $.each(data, function(i) {
            CKEDITOR.replace(data[i].id);
        });
    }
});