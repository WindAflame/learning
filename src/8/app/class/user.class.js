export class User {

    // Déclaration champ publique
    surname;
    // Déclaration champ privé
    #name;

    constructor(name, surname) {
        this.#name = name;
        this.surname = surname;
    }

    toString() {
        return `${this.#name} ${this.surname}`;
    }

}