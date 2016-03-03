curSource = new Array
curSource[0] = '/events'
newSource = new Array

#ready = undefined

ready = ->

  $('#eventFilterCalendar').fullCalendar

    eventSources: [
      curSource[0]

    ]
    lang: 'ru'
    timeFormat: 'H(:mm)'
    timezone: 'Europe/Moscow'
    header: {
      left: 'prev, next, today',
      center: 'title',
      right: 'month, agendaDay, agendaWeek'
    }
    monthNames: [
      'Январь'
      'Февраль'
      'Март'
      'Апрель'
      'Май'
      'οюнь'
      'οюль'
      'Август'
      'Сентябрь'
      'Октябрь'
      'Ноябрь'
      'Декабрь'
    ]
    monthNamesShort: [
      'Янв.'
      'Фев.'
      'Март'
      'Апр.'
      'Май'
      'οюнь'
      'οюль'
      'Авг.'
      'Сент.'
      'Окт.'
      'Ноя.'
      'Дек.'
    ]
    dayNames: [
      'Воскресенье'
      'Понедельник'
      'Вторник'
      'Среда'
      'Четверг'
      'Пятница'
      'Суббота'
    ]
    dayNamesShort: [
      'ВС'
      'ПН'
      'ВТ'
      'СР'
      'ЧТ'
      'ПТ'
      'СБ'
    ]
    buttonText:
      prev: 'Предыдущий месяц'
      next: 'Следующий месяц'

      today: 'Сегодня'
      month: 'Месяц'
      week: 'Неделя'
      day: 'День'

    getRadioCheckedValue = (radio_name) ->
      oRadio = document.forms[0].elements[radio_name]
      i = 0
      while i < oRadio.length
        if oRadio[i].checked
          return oRadio[i].value
          console.log(oRadio[i].value)
        i++
      ''

    $('#user_id').change ->
      task_id = $("#user_id")
      value = $("#user_id").value
      console.log(task_id)
      alert 'Hooray!'

      return

    $('input[type="radio"]').click (evt) ->
#      alert 'you chose the option: ' + $(this).val()
      newSource[0] = if $(this).is(':checked') then '/events?user_id='+ $(this).val()

#      console.log(newSource[0])
      $('#eventFilterCalendar').fullCalendar 'removeEventSource', curSource[0]

      $('#eventFilterCalendar').fullCalendar 'refetchEvents'
      $('#eventFilterCalendar').fullCalendar 'addEventSource', newSource[0]
      $('#eventFilterCalendar').fullCalendar 'refetchEvents'
      curSource[0] = newSource[0]

      return



$(document).ready(ready)
$(document).on('page:load', ready)
