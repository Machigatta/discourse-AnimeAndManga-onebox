import { withPluginApi, decorateCooked } from 'discourse/lib/plugin-api';

function toBox($elem) {
    if ($elem == undefined || $elem == null || !$($elem).is("a")) { return; }
    $($elem).each(function(i, el) {
        $(el).linkToKokoroBox();
    });
}

function initializeBox(api, settings) {
    api.decorateCooked(t => toBox($(t).find("a"), settings));

}

export default {
    name: "kokoro-box",
    initialize(container) {
        const siteSettings = container.lookup('site-settings:main');
        if (siteSettings.kokoro_box_enabled) {
            withPluginApi('0.5', initializeBox(api, siteSettings));
        }
    }
};