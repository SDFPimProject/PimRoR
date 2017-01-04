// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
idsOfInvitedUsers = new Array();
namesOfInvitedUsers = new Array();

document.addEventListener("turbolinks:load", function() {
    idsOfInvitedUsers = new Array();
    namesOfInvitedUsers = new Array();

    $('#calendar').fullCalendar(
        {events: '/events.json'}
    );
    $('#calendar_published_on').datepicker();
});

$(document).on('keyup', '.search-user-input_field', function (event) {
    search = $(this).val();
    search_user('../../user_search', on_search_user_results, search, 'layout_for_invites');
});


function on_search_user_results(html) {
    $(".chat-user-search-result").html(html);
    $(".chat-user-search-result").show();
}

$(document).on('click', '.user-search-list-wrapper.invite li', function (e) {
    e.preventDefault();
    var user_id = $(this).data('userid');
    var current_id = user.id;
    var user_name = $(this).data('username');
    if (user_id && idsOfInvitedUsers.indexOf(user_id) === -1) {
        idsOfInvitedUsers[idsOfInvitedUsers.length] = user_id;
        namesOfInvitedUsers[namesOfInvitedUsers.length] = user_name;
        write_ivited_user_ids_to_textarea();
        write_ivited_users_to_the_list();
    }
    $(".chat-user-search-result").hide();
});

function write_ivited_user_ids_to_textarea() {
    var list_as_string = "";
    for (var i = 0; i < idsOfInvitedUsers.length; i++) {
        if (i != 0) {
            list_as_string += ";";
        }
        list_as_string += idsOfInvitedUsers[i];
    }

    $(".invited_persons_textarea").val(list_as_string);
}

function write_ivited_users_to_the_list() {
    var list_as_string = "";
    if (idsOfInvitedUsers.length > 0) {
        for (var i = 0; i < idsOfInvitedUsers.length; i++) {
            list_as_string += "<p><span class=\"deleter\" onclick=\"delete_invited_user_by_id(";
            list_as_string += idsOfInvitedUsers[i] + ")\">X</span>" + namesOfInvitedUsers[i] + "</p>";
        }
    }
    else {
        list_as_string = "<p>keine</p>";
    }
    $(".invited_persons_list").html(list_as_string);
}

function delete_invited_user_by_id(id) {
    var new_ids = new Array();
    var new_user_names = new Array();
    for (var i = 0; i < idsOfInvitedUsers.length; i++) {
        if (id != idsOfInvitedUsers[i]) {
            new_ids[new_ids.length] = idsOfInvitedUsers[i];
            new_user_names[new_user_names.length] = namesOfInvitedUsers[i];
        }
    }
    idsOfInvitedUsers = new_ids;
    namesOfInvitedUsers = new_user_names;

    write_ivited_user_ids_to_textarea();
    write_ivited_users_to_the_list();
}
