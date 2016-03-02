
jQuery(function ($) {

    $('.language-selector').on('click', function (event) {
        var language = $(event.currentTarget).data('slug');
        var url = lsVars.ajax + '?action=change_language&lang=' + language;

        $.ajax(url).done(function (result) {
                location.reload(true);
            });
    });
});
