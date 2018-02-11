<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ctg" uri="tags" %>
<jsp:useBean class="bsuir.vintsarevich.entity.Product" scope="page" id="product"/>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <style>
        <%@include file="/front/css/menu/main.css" %>
        <%@include file="/front/css/form/form.css"%>
        <%@include file="/front/css/index/review.css"%>
        <%@include file="/front/css/menu/search.css"%>
        <%@include file="/front/css/form/addForm.css"%>
        <%@include file="/front/css/form/button.css"%>
    </style>
    <script>
        <%@include file="/front/js/lib/jquery.min.js" %>
        <%@include file="/front/js/lib/skel.min.js" %>
    </script>
    <%@include file="/front/html/allBundle.html" %>
    <title>Epam Cafe</title>
</head>
<body>
<!— Wrapper —>
<div id="wrapper">
    <!— Main —>
    <div id="main">
        <div class="inner">

            <%@include file="/front/html/header.html" %>

            <%@include file="/front/html/forms.html" %>
            
            <div id="cd-changePassword">
                <form method="POST" class="cd-form" id="changePassword-form" action="/cafe.by/change_password">
                    <h2>${change_password_word}</h2>
                    <h3>${change_password_error}</h3>
                    <p class="fieldset">
                        <label class="image-replace cd-password" for="changePassword-old">{password_word}</label>
                        <input class="full-width has-padding has-border" name="changePassword_old"
                               id="changePassword-old"
                               type="text"
                               placeholder=${old_password_word}>
                        <a href="#0" id="a-changePassword-old" class="hide-password">""</a>
                        <span class="cd-error-message">${mistake_password_word}</span>
                    </p>
                    <p class="fieldset">
                        <label class="image-replace cd-password" for="changePassword-new">{password_word}</label>
                        <input class="full-width has-padding has-border" name="changePassword_new"
                               id="changePassword-new"
                               type="text"
                               placeholder=${new_password_word}>
                        <a href="#0" id="a-changePassword-new" class="hide-password">""</a>
                        <span class="cd-error-message">${mistake_password_word}</span>
                    </p>
                    <p class="fieldset">
                        <label class="image-replace cd-password" for="changePassword-re-new">{re_password_word}</label>
                        <input class="full-width has-padding has-border" id="changePassword-re-new" type="text"
                               placeholder=${re_new_password_word}>
                        <a href="#0" id="a-changePassword-re-new" class="hide-password">""</a>
                        <span class="cd-error-message">${mistake_word}</span>
                    </p>
                    <input type="submit" id="add" value=${change_password_word}>
                </form>
            </div>
        </div>
    </div>

    <ctg:menu/>

</div>

<!— Scripts —>
<script>
    <%@include file="/front/js/menu/main.js" %>
</script>
<script>
    <%@include file="/front/js/menu/util.js" %>
</script>
<script>
    <%@include file="/front/js/form/form.js"%>
</script>
<script>
    <%@include file="/front/js/validation.js"%>
</script>

</body>
</html>
