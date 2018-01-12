﻿var s = '';
var cook = -1;
var today = new Date();
var expiration = new Date(today.getTime() + 31 * 24 * 60 * 60 * 1000);  // 31 день
function valid(form) {
    var fail;
    var n = 1;
    fail = "";
    var login_regex = /^[a-zA-Z](.[a-zA-Z0-9_-]*)$/i;
    if (login_regex.test(form.login.value) == false || form.login.value.length < 5) {
        fail = "Логин введен неверно.\n";
        if (form.login.value.length < 5) fail = fail + "(длина логина должна быть более 5 символов)";
        fail = fail + "\n";
        n++;
    }
    var name_regex = /([A-Z]{1}[a-z]+)|([А-Я]{1}[а-я]+)$/i;
    if (name_regex.test(form.name.value) == false) {
        fail = fail + "Имя введено неверно.\n";
        n++;
    }
    var surname_regex = /([A-Z]{1}[a-z]+)|([А-Я]{1}[а-я]+)$/i;
    if (surname_regex.test(form.surname.value) == false) {
        fail = fail + "Фамилия введена неверно.\n";
        n++;
    }
    var mail = /[0-9a-z_-]+@[0-9a-z_-]+\.[a-z]{2,5}/i;
    if (mail.test(form.email.value) == false) {
        fail = fail + "E-mail введен неверно.\n";
        n++;
    }
    var password_regex = /(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*]{6,}/i;
    if (password_regex.test(form.password.value) == false) {
        fail = fail + "Пароль введен неверно";
        if (form.password.value.length < 6) {
            fail = fail + "(длина пароля должна быть более 6 символов)"
        }
        else fail = fail + "(пароль должен содержать цифры,строчные и заглавные буквы)";
        fail = fail + "\n";
        form.password.value = "";
        form.rePassword.value = "";
        n++;
    }
    if (form.rePassword.value != form.password.value && form.password.value != "") {
        fail = fail + "Введенные пароли не совпадают.\n";
        form.rePassword.value = "";
        n++;
    }
    if (form.address.value == "") {
        fail = fail + "Адрес введен неверно.\n";
        n++;
    }
    if (n != 1) {
        alert(fail);
        return false;
        form.submit1.style.display = 'none';
    }
    else {
        setCookie();
        return true;
    }
}

function validMedicament(form) {
    var fail;
    var n = 1;
    fail = "";
    var name_regex = /([A-Z]{1}[a-z]+)|([А-Я]{1}[а-я]+)$/i;
    if (name_regex.test(form.name.value) == false) {
        fail = "Название введено неверно.\n";
        n++;
    }
    if (name_regex.test(form.producer.value) == false) {
        fail = "Производитель введен неверно.\n";
        n++;
    }


    if (form.image.value == "") {
        fail = fail + "Картинка не выбрана.\n";
        n++;
    }

    if (n != 1) {
        alert(fail);
        return false;
        form.submit1.style.display = 'none';
    }
    else {
        setCookie();
        return true;
    }
}






