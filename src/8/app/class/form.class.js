export class Form {

    $form;
    $name;
    $surname;
    $submit;
    $refresh;

    constructor() {
        this.$form = $(`form#user-form`);
        this.$name = $(`input#name`);
        this.$surname = $(`input#surname`);
        this.$submit = $(`input#submit`);
        this.$refresh = $(`input#refresh`);
        this.verifyField();
    }

    static checkField(field) {
        const $field = $(field);
        const result = ($field.val() !== "");
        if (result) {
            $field.removeClass(`field-error`);
        } else {
            $field.addClass(`field-error`);
        }
        return result;
    }

    verifyField() {
        this.$name.keyup((e) => {
            Form.checkField(e.currentTarget);
        })
        this.$surname.keyup((e) => {
            Form.checkField(e.currentTarget);
        })
    }

    reset() {
        this.$refresh.click();
    }
}