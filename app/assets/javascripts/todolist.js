var ready;

ready = function() {

    //$('input[type="radio"]').click(function(evt) {
    //    alert("you chose the option: " + $(this).val());
    //});




    //jQuery(".fullcalendar").fullCalendar();
    //jQuery(".datetimepicker").datetimepicker();
    //jQuery(".colorpicker").colorpicker();


    //$('#eventFilterCalendar').fullCalendar();
    //
    $('#starts_at').datetimepicker({
        locale: 'ru'
    });
    $('#end_at').datetimepicker({
        format: 'YYYY-MM-DD HH:mm  ',
        locale: 'ru'
    });

    $('#todolist_event_attributes_starts_at').datetimepicker({
        format: 'YYYY-MM-DD HH:mm  ',
        locale: 'ru'
    });
    $('#todolist_event_attributes_ends_at').datetimepicker({
        format: 'YYYY-MM-DD HH:mm',
        locale: 'ru'
    });

    $('#color').colorpicker();


    $('#todolist_event_attributes_starts_at').val("#{@starts_at}")
    $('#todolist_event_attributes_ends_at').val("#{@ends_at}")



    $("#starts_at").on("dp.change", function (e) {
        $('#end_at').data("DateTimePicker").minDate(e.date);
    });
    $("#end_at").on("dp.change", function (e) {
        $('#starts_at').data("DateTimePicker").maxDate(e.date);
    });

    $("#todolist_event_attributes_starts_at").on("dp.change", function (e) {
        $('#todolist_event_attributes_ends_at').data("DateTimePicker").minDate(e.date);
    });
    $("#todolist_event_attributes_ends_at").on("dp.change", function (e) {
        $('#todolist_event_attributes_starts_at').data("DateTimePicker").maxDate(e.date);
    });


    $('#save_event').on('click', function(){


        if ((document.getElementById("todolist_title").value)=='' ||
            (document.getElementById("todolist_performer_id").value)=='' ||
            (document.getElementById("starts_at").value)==''  ||
            (document.getElementById("end_at").value)==''){
            window.alert('Заполните поля, помеченные звездочкой');
            return false;}
        else {

            return true;}


    });


};

$(document).ready(ready);

$(document).on('page:load', ready);









