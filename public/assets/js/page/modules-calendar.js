"use strict";

$("#myEvent").fullCalendar({
    height: 'auto',
    buttonText:calender_header,
    header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay,listWeek'
    },
    editable: true,
    selectable: true,
    events: tasks,
    droppable: true,
    locale: local_lang,
    eventDrop: function (event, delta, revertFunc, jsEvent, ui, view) {

        if (event.type == 'invoice') {
            var eventObj = {
                end: event.start.format(),
                calendaraction: 'dropped',
                type: event.type,
                eventId: event.eventId,
                _token: $('meta[name="csrf-token"]').attr('content'),
            };
        } else {
            var eventObj = {
                start: event.start.format(),
                end: event.end.format(),
                calendaraction: 'dropped',
                type: event.type,
                eventId: event.eventId,
                _token: $('meta[name="csrf-token"]').attr('content'),
            };
        }


        $.ajax({
            url: event.eventUrl,
            method: 'PUT',
            data: eventObj,
            success: function (response) {
            },
            error: function (data) {
                data = data.responseJSON;
            }
        });
    }
});
