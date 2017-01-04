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
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery-ui/widgets/datepicker
//= require moment
//= require fullcalendar

//= require websocket_rails/main
//= require toastr
//= require_tree .

//= require turbolinks

//Only one global Document Ready Function
$(document).ready(function() {
    // Websockets
    bindWebSockets(dispatcher);

    //To Clear local Chat data
    Chat.destroy();
});





//User search/////////////////////////////////////////////////////////////////
//f.e. url = user_search

function search_user(url, callbackfunction, search, layout_type) {
    if (layout_type == false) {
        $.get(url, {search: search, class: 'chat'}, callbackfunction, "html");
    }
    else {
        $.get(url, {search: search, class: 'chat', layout_type: layout_type}, callbackfunction, "html");
    }
}

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
