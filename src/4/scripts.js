$(function () {
    console.log("jQuery est prêt !");

    // Selection de tout les DOM 'h1'
    $('h1');

    // Selection d'un ID
    $('#title');

    // Selection de tout les élèments ayant la classe 'bold'
    $('.bold');

    // Selection des tout les enfants descendants de 'h1'
    $('h1 .bold');

    // Selection des enfants 'bold' ayant comme parent 'h1'
    $('h1 > .bold');

    // Selection du premier 'bold' disponible
    $('.bold:first');
    $('.bold:eq(0)');

    // Selection du dernier 'bold' disponible
    $('.bold:last');
    $('.bold:eq(1)');

    // Retourne seulement les paragraphes ayant un identifiant
    $('p[id]');

    // Cible seulement l'élément de formulaire ayant "pseudo" pour nom
    $('input[name=pseudo]');

    // Cible seulement l'élément de formulaire n'ayant pas "pseudo" pour nom
    $('input[name!=pseudo]');

    // On sélectionne un input de type button
    $('input[type=button]');
    // mais il est préférable d'utiliser la syntaxe suivante car existante :
    $('input:button');
});