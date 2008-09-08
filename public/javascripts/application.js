function hotkeys(){
    jQuery.hotkeys.add('return',function (){ $('#new_message').submit(); });
}

$(document).ready(function(){
    $('#message_body').focus();
    hotkeys();
});