// Déclaration de fonction avec argument
function helloWorld(nom){
    alert('Hello World, ' + nom + '!');
}

// Déclaration de fonction "asynchrone" avec une fonction anonyme.
var helloWorldAsync = function(nom){
    alert('Hello World, ' + nom + '!');
},
// Déclaration de variable ....
    paramHelloWorld = 'Please insert your name here';

helloWorld(paramHelloWorld); // affichera une alerte "Hello World Please insert your name here !"
helloWorldAsync(paramHelloWorld)