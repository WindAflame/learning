import { User } from "./class/user.class.js";
import { Form } from "./class/form.class.js";
$(() => {

    const $listUser = $('ul#list-user');
    const USER_ID = "user-id";
    const CLASS_USER_TO_REMOVE = "remove-user";

    const userForm = new Form();
    let users = [];
    
    function init(){
        users.push(new User("Endy", "WindAflame"));
        drawUsers();
    }

    function drawUsers() {
        if (users.length !== $listUser.children().length) {
            $listUser.empty();
            for (const [index, user] of users.entries()) {
                $listUser.append(`<li>${user.toString()} <button class="${CLASS_USER_TO_REMOVE}" ${USER_ID}="${index}">Supprimer</button> </li> `);
            }
        }
    }
    
    function onClickSubmit() {
        userForm.$submit.click((e) => {
            const cond1 = Form.checkField(userForm.$name);
            const cond2 = Form.checkField(userForm.$surname);
            if (cond1 && cond2) {
                addUser();
            }
            e.preventDefault();
        });
    }

    function onClickRemove() {
        $(`button.${CLASS_USER_TO_REMOVE}`).click((e) => {
            const index = $(e.currentTarget).attr(USER_ID);
            $(e.currentTarget).parent().remove();
            users.splice(index, 1);
        });
    }

    function addUser() {
        users.push(new User(userForm.$name.val(), userForm.$surname.val()));
        userForm.reset();
        drawUsers();
    }

    init();
    onClickSubmit();
    onClickRemove();
});



