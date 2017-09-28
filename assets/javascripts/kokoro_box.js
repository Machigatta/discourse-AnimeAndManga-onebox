(function($) {

    var DEFAULTS = {
        viewUrl: "https://api.kokoro-ko.de/onebox/onebox.php",
        mal_anime: new RegExp(/^https?:\/\/(?:www\.)?myanimelist\.net\/anime\/(?!directory)([a-zA-Z0-9_]{1,25})\/(?!directory)([a-zA-Z0-9_]{1,25})\S*$/),
        mal_manga: new RegExp(/^https?:\/\/(?:www\.)?myanimelist\.net\/manga\/(?!directory)([a-zA-Z0-9_]{1,25})\/(?!directory)([a-zA-Z0-9_]{1,25})\S*$/),
        ann_anime: new RegExp(/^http?:\/\/(?:www\.)?animenewsnetwork\.com\/encyclopedia\/anime.php\?id=([a-zA-Z0-9_]{1,25})\S*$/)
    };

    function applyBox($el) {
        var href = $($el).attr("href");
        if (DEFAULTS.mal_anime.test(href)) {
            var excP = DEFAULTS.mal_anime.exec(href);
            $($el).closest(".onebox").replaceWith('<iframe src="' + DEFAULTS.viewUrl + '?api=mal&type=anime&name=' + excP[2] + '&id=' + excP[1] + '" frameborder="0" width="100%" height="255"></iframe>');
        } else if (DEFAULTS.mal_manga.test(href)) {
            var excP = DEFAULTS.mal_manga.exec(href);
            $($el).closest(".onebox").replaceWith('<iframe src="' + DEFAULTS.viewUrl + '?api=mal&type=manga&name=' + excP[2] + '&id=' + excP[1] + '" frameborder="0" width="100%" height="255"></iframe>');
        } else if (DEFAULTS.ann_anime.test(href)) {
            var excP = DEFAULTS.ann_anime.exec(href);
            $($el).closest(".onebox").replaceWith('<iframe src="' + DEFAULTS.viewUrl + '?api=ann&id=' + excP[1] + '" frameborder="0" width="100%" height="255"></iframe>');
        }
    }

    $.fn.linkToKokoroBox = function(options) {
        var opts = $.extend(DEFAULTS, options || {});
        return this.each(function() {
            applyBox($(this), opts);
        });
    };
})(jQuery);