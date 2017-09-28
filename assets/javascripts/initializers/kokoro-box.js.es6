import { withPluginApi, decorateCooked } from 'discourse/lib/plugin-api';
import { onPageChange } from 'discourse/lib/page-tracker';
// import { addPostClassesCallback } from 'discourse/widgets/post';
// import { addPostTransformCallback } from 'discourse/widgets/post-stream';
import { addDecorator } from 'discourse/widgets/post-cooked';

function toBox($elem) {
    if ($elem == undefined || $elem == null || !$($elem).is("a")) { return; }
    $($elem).each(function(i, el) {
        $(el).linkToKokoroBox();
    });
}

function initializeBox(api) {
    // api.onPageChange((url, title) => {
    //     var aList = $("div.regular.contents").find("a");
    //     toBox(aList);
    // });
    // addPostClassesCallback((t) => { toBox(t); })
    // addPostTransformCallback((t) => { toBox(t); })

    api.decorateCooked(t => toBox($(t).find("a")));

}

export default {
    name: "kokoro-box",
    initialize(container) {
        const siteSettings = container.lookup('site-settings:main');
        if (siteSettings.kokoro_box_enabled) {
            withPluginApi('0.5', initializeBox);
        }
    }
};