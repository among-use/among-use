$(function () {
    $('.create-event-button').click(function () {
        $('#overlay, .modal-window').fadeIn();
    });

    $('.js-close').click(function () {
<<<<<<< HEAD
=======
        console.log("モーダル削除");
>>>>>>> 2adca5f4f79068f3ac72cd1de9dd57966b22bc54
        $('#overlay, .modal-window, .modal-window1').fadeOut(function(){
            $('[name="rule"] option[value=""]').prop('selected',true);
            $("input[type=number], number_field").val("");
            $("input[type=datetime-local], datetime_field").val("");
            $("input[type=text], text_field").val("");
        });
    });
});
