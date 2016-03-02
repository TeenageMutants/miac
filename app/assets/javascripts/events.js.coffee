curSource = new Array
curSource[0] = '/events'
newSource = new Array

ready = undefined

ready = ->




#  $('#eventFilterCalendar').fullCalendar dayClick: ->
#  alert 'a day has been clicked!'
#  return

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

#    $('input[type="radio"]').click (evt) ->
#
#      console.log( $(this).val())
#      $.ajax
#        url: '/events/update_username'
#        data:
#          user_id: $(this).val()
#
#        dataType: 'script'
#      return







#  $('#user_id').change ->
#    #get current status of our filters into newSource
#    newSource[0] = if $('#user_id').is(':checked') then '/events?user_id'
#    #    + $('#e1').is(':checked') + '&e2=' + $('#e2').is(':checked')
#    newSource[1] = if $('#user_admin').is(':checked') then '/events' else ''
#    #remove the old eventSources
#    $('#eventFilterCalendar').fullCalendar 'removeEventSource', curSource[0]
#    $('#eventFilterCalendar').fullCalendar 'removeEventSource', curSource[1]
#    $('#eventFilterCalendar').fullCalendar 'refetchEvents'
#    #attach the new eventSources
#    $('#eventFilterCalendar').fullCalendar 'addEventSource', newSource[0]
#    $('#eventFilterCalendar').fullCalendar 'addEventSource', newSource[1]
#    $('#eventFilterCalendar').fullCalendar 'refetchEvents'
#    curSource[0] = newSource[0]
#    curSource[1] = newSource[1]
#    return
#  return

$(document).ready ready
$(document).on 'page:load', ready