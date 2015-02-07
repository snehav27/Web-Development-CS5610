function functionx(evt) {
    if (evt.charCode > 31 && (evt.charCode < 48 || evt.charCode > 57)) {
        alert("Only Numbers are allowed in the text box");
        return false;
    }
}

$(function () {
    var pull = $('#pull');
    menu = $('nav ul');
    menuHeight = menu.height();

    $(pull).on('click', function (e) {
        e.preventDefault();
        menu.slideToggle();
    });

    $(window).resize(function () {
        var w = $(window).width();
        if (w > 320 && menu.is(':hidden')) {
            menu.removeAttr('style');
        }
    });
});
