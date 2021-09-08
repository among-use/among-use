$(function () {
    $('.create-event-button').click(function () {
        $('#overlay, .modal-window').fadeIn();
    });

    $('.js-close').click(function () {
        $('#overlay, .modal-window, .modal-window1').fadeOut(function(){
            $('[name="rule"] option[value=""]').prop('selected',true);
            $("input[type=number], number_field").val("");
            $("input[type=datetime-local], datetime_field").val("");
            $("input[type=text], text_field").val("");
        });
    });
});
