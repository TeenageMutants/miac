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



    $("#todolist_event_attributes_starts_at").on("dp.change", function (e) {
        $('#todolist_event_attributes_ends_at').data("DateTimePicker").minDate(e.date);
    });
    $("#todolist_event_attributes_ends_at").on("dp.change", function (e) {
        $('#todolist_event_attributes_starts_at').data("DateTimePicker").maxDate(e.date);
    });


};

$(document).ready(ready);

$(document).on('page:load', ready);









