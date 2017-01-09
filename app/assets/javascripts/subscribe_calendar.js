// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener("turbolinks:load", function() {



if(window.location.href.indexOf("calendar/subscribed")!=-1)
$.get(window.location.href +".json", function( data ) {
    $('#calendar1').fullCalendar(
        {events: data}
    );
});


  
      
     
});