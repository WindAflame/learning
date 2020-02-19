import { User } from "./class/user.class.js";
import { Form } from "./class/form.class.js";

const $listUser = document.getElementById("list-user");
const ATTR_USER_ID = "user-id";
const CLASS_USER_TO_REMOVE = "remove-user";

const userForm = new Form();
let users = [];

function init() {
    users.push(new User("Endy", "WindAflame"));
    drawUsers();
}

var getUsers = function() {
    console.log(users.toString());
}

function drawUsers() {
    if (users.length !== $listUser.children.length) {
        // $listUser.empty();
        // $listUser.removeChild() - Synthaxe not work;
        for (const [index, user] of users.entries()) {
            // JQUERY
            // $listUser.append(`<li>${user.toString()} <button class="${CLASS_USER_TO_REMOVE}" ${ATTR_USER_ID}="${index}">Supprimer</button> </li> `);
            // ES6
            const node = document.createElement('li');
            const nodeBtn = document.createElement('button');
            node.appendChild(document.createTextNode(user.toString()));
            nodeBtn.appendChild(document.createTextNode("Supprimer"));
            nodeBtn.setAttribute("class", CLASS_USER_TO_REMOVE);
            nodeBtn.setAttribute(ATTR_USER_ID, index);
            node.appendChild(nodeBtn);
            $listUser.appendChild(node);
        }
    }
}

function onClickSubmit() {
    userForm.$submit.click((e) => {
        const cond1 = Form.checkField(userForm.$name);
        const cond2 = Form.checkField(userForm.$surname);
        if (cond1 && cond2) {
            addUser(userForm.$name.val(), userForm.$surname.val());
            userForm.reset();
        }
        e.preventDefault();
    });
}

function onClickRemove() {
    // $(`button.${CLASS_USER_TO_REMOVE}`).click((e) => { - NOT WORKED
    $(document).on('click', `button.${CLASS_USER_TO_REMOVE}`, (e) => {
        const index = $(e.currentTarget).attr(ATTR_USER_ID);
        $(e.currentTarget).parent().remove();
        users.splice(index, 1);
    });
}

function addUser(name, surname) {
    users.push(new User(name, surname));
    drawUsers();
}

init();
onClickSubmit();
onClickRemove();
getUsers();



