$(function () {
    $('.create-event-button').click(function () {
        $('#overlay, .modal-window').fadeIn();
    });

    $('.js-close').click(function () {
        $('#overlay, .modal-window, .modal-window1').fadeOut();
    });
});
