$(() => {
    // console.log($('tbody tr[id=0] td[class=name]'));
    // console.log($('td[class=name]:contains(\'azeazea\')'));
    // console.log($('td:contains(\'azeazea\')'));
    // console.log($('tr:contains(\'azeazea\')'));
    // console.log('Test list td:contains(\'azeazea\') get parent')
    // $('td:contains(\'azeazea\')').each(function() {
    //     console.log($(this).parent());
    // });

    // console.log($('tr td:eq(1)'));
    // $('tr td:eq(1)').each(function() {
    //     console.log($(this).html());
    // });

    // Pre ES2015 - Fontion anonyme
    $('tr').each(function() {
        console.log($(this).find('td:eq(1)').html());
    })
    // POST ES2015 - Arrow Function
    $('tr').each((index, element) => {
        console.log($(element).find('td:eq(1)').html());
    })


    let o1 = { first: 200 };
    let o2 = $.extend({}, o1);
    o2.first = 100;
    console.log(o1);
    console.log(o2);
});