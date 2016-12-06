// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener("turbolinks:load", function() {

    $('#calendar').fullCalendar(
        {events: '/events.json'}
    );
    $('#calendar_published_on').datepicker();
});
