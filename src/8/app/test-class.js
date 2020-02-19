import { User } from "./class/user.class.js";

const aUser = new User("Endy", "WindAflame");

console.log(`Ceci est mon utilisateur : ${aUser.toString()}`);
console.log(`Je ne peux pas voir l'attribut nom ${aUser.surname}`);
// console.log(`Je peux voir l'attribut prénom : ${aUser.#name}`);
console.log(`Je peux voir l'attribut prénom : ${aUser.name}`);