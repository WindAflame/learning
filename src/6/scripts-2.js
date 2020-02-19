$(() => {
    selectorJqColor.on({
        'mouseenter': function() {
            $(this).css("color", "blue");
        },
        'mouseleave': (e) => {
            $(e.currentTarget).css("color", "black");
        }
    });

    selectorJqItalic.on({
        'mouseenter': (e) => {
            $(e.currentTarget).css("font-style", "italic");
        },
        'mouseleave': (e) => {
            $(e.currentTarget).css("font-style", "initial");
        }
    });

    const selectorJqBold = $('p.bold');
    selectorJqBold.on({
        'mouseenter': (e) => {
            $(e.currentTarget).css("font-weight", "bold");
        },
        'mouseleave': (e) => {
            $(e.currentTarget).css("font-weight", "initial");
        }
    });
});