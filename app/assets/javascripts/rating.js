// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//$(document).ready(function(){
//    $('.best_in_place').best_in_place();
//})

$(document).ready(function(){
    jQuery(".best_in_place").best_in_place();
    $('[data-toggle="tooltip"]').tooltip();
    if ($('textarea').length > 0) {
        var data = $('textarea');
        $.each(data, function(i) {
            CKEDITOR.replace(data[i].id);
        });
    }
});