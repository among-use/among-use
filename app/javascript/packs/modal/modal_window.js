$(function () {
    $('.create-event-button').click(function () {
        $('#overlay, .modal-window').fadeIn();
    });

    $('.js-close').click(function () {
        console.log("モーダル削除");
        $('#overlay, .modal-window, .modal-window1').fadeOut();
    });
});
