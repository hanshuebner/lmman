// This may look like -*- Java -*- but it really is Javascript

function page_down() {
        if (!window.scroller) {
                window.scroller = setInterval('do_scroll()', 25);
                window.scroll_amount = 0;
        }
        window.scroll_amount += window.innerHeight - 50;
}

function do_scroll() {
        if (window.scroll_amount > 0) {
                var step = Math.min(window.scroll_amount, 100);
                window.scroll_amount -= step;
                window.scrollBy(0, step);
        }
}