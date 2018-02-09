<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean class="bsuir.vintsarevich.entity.Product" scope="page" id="product"/>
<jsp:useBean class="bsuir.vintsarevich.entity.Order" scope="page" id="order"/>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <style>
        <%@include file="/front/css/menu/main.css" %>
    </style>
    <style>
        <%@include file="/front/css/form/form.css"%>
    </style>
    <script>
        <%@include file="/front/js/lib/jquery.min.js" %>
    </script>
    <script>
        <%@include file="/front/js/lib/skel.min.js" %>
    </script>

    <fmt:setLocale scope="session" value="${locale}"/>
    <fmt:setBundle basename="localization.pageInformation" scope="session" var="loc"/>
    <fmt:message bundle="${loc}" key="local.word.welcome" var="welcome_word"/>
    <fmt:message bundle="${loc}" key="local.word.cafename_with_other_information"
                 var="cafename_with_other_information_word"/>
    <fmt:message bundle="${loc}" key="local.word.cafe_description" var="cafe_description_word"/>
    <fmt:message bundle="${loc}" key="local.word.login" var="login_word"/>
    <fmt:message bundle="${loc}" key="local.word.password" var="password_word"/>
    <fmt:message bundle="${loc}" key="local.word.name" var="name_word"/>
    <fmt:message bundle="${loc}" key="local.word.surname" var="surname_word"/>
    <fmt:message bundle="${loc}" key="local.word.remember" var="remember_word"/>
    <fmt:message bundle="${loc}" key="local.word.email" var="email_word"/>
    <fmt:message bundle="${loc}" key="local.button.signin" var="signin_button"/>
    <fmt:message bundle="${loc}" key="local.button.signup" var="signup_button"/>
    <fmt:message bundle="${loc}" key="local.button.signout" var="signout_button"/>
    <fmt:message bundle="${loc}" key="local.button.create" var="create_button"/>
    <fmt:message bundle="${loc}" key="local.button.comein" var="comein_button"/>
    <fmt:message bundle="${loc}" key="local.word.home" var="home_word"/>
    <fmt:message bundle="${loc}" key="local.word.view" var="view_word"/>
    <fmt:message bundle="${loc}" key="local.word.description_under_welcome" var="description_under_welcome_word"/>
    <fmt:message bundle="${loc}" key="local.word.add_product" var="add_product_word"/>
    <fmt:message bundle="${loc}" key="local.word.type_product" var="type_product_word"/>
    <fmt:message bundle="${loc}" key="local.word.name_ru" var="name_ru_word"/>
    <fmt:message bundle="${loc}" key="local.word.name_en" var="name_en_word"/>
    <fmt:message bundle="${loc}" key="local.word.volume" var="volume_word"/>
    <fmt:message bundle="${loc}" key="local.word.existence" var="existence_word"/>
    <fmt:message bundle="${loc}" key="local.word.desc_en" var="desc_en_word"/>
    <fmt:message bundle="${loc}" key="local.word.desc_ru" var="desc_ru_word"/>
    <fmt:message bundle="${loc}" key="local.word.cost" var="cost_word"/>
    <fmt:message bundle="${loc}" key="local.word.type_drink" var="type_drink_word"/>
    <fmt:message bundle="${loc}" key="local.word.type_food" var="type_food_word"/>
    <fmt:message bundle="${loc}" key="local.word.type_drink1" var="type_drink_word1"/>
    <fmt:message bundle="${loc}" key="local.word.type_food1" var="type_food_word1"/>
    <fmt:message bundle="${loc}" key="local.word.existense_no" var="existense_no_word"/>
    <fmt:message bundle="${loc}" key="local.word.existanse_yes" var="existanse_yes_word"/>
    <fmt:message bundle="${loc}" key="local.word.choose_file" var="choose_file_word"/>
    <fmt:message bundle="${loc}" key="local.word.choose_not_choosen" var="choose_not_choosen_word"/>
    <fmt:message bundle="${loc}" key="local.word.add_button" var="add_button_word"/>
    <fmt:message bundle="${loc}" key="local.word.found_nothing" var="found_nothing_word"/>
    <fmt:message bundle="${loc}" key="local.word.menu" var="menu_word"/>
    <fmt:message bundle="${loc}" key="local.word.search" var="search_word"/>
    <fmt:message bundle="${loc}" key="local.word.contacts" var="contacts_word"/>
    <fmt:message bundle="${loc}" key="local.word.address" var="address_word"/>
    <fmt:message bundle="${loc}" key="local.word.street" var="street_word"/>
    <fmt:message bundle="${loc}" key="local.word.stocks" var="stocks_word"/>
    <fmt:message bundle="${loc}" key="local.word.stock1" var="stock1_word"/>
    <fmt:message bundle="${loc}" key="local.word.stock2" var="stock2_word"/>
    <fmt:message bundle="${loc}" key="local.word.re_password" var="re_password_word"/>
    <fmt:message bundle="${loc}" key="local.word.mistake" var="mistake_word"/>
    <fmt:message bundle="${loc}" key="local.word.range" var="range_word"/>
    <fmt:message bundle="${loc}" key="local.word.forgot_pass" var="forgot_pass_word"/>
    <fmt:message bundle="${loc}" key="local.word.re_pass" var="re_pass_word"/>
    <fmt:message bundle="${loc}" key="local.word.back" var="back_word"/>
    <fmt:message bundle="${loc}" key="local.word.re_message" var="re_message_word"/>
    <fmt:message bundle="${loc}" key="local.word.mistake_login" var="mistake_login_word"/>
    <fmt:message bundle="${loc}" key="local.word.mistake_password" var="mistake_password_word"/>
    <fmt:message bundle="${loc}" key="local.word.mistake_email" var="mistake_email_word"/>
    <fmt:message bundle="${loc}" key="local.word.close" var="close_word"/>
    <fmt:message bundle="${loc}" key="local.word.mistake_name" var="mistake_name_word"/>
    <fmt:message bundle="${loc}" key="local.word.mistake_surname" var="mistake_surname_word"/>
    <fmt:message bundle="${loc}" key="local.word.exit" var="exit_word"/>
    <fmt:message bundle="${loc}" key="local.word.edit" var="edit_word"/>
    <fmt:message bundle="${loc}" key="local.word.basket_add" var="basket_add_word"/>
    <fmt:message bundle="${loc}" key="local.word.basket" var="basket_word"/>
    <fmt:message bundle="${loc}" key="local.word.basket_delete" var="basket_delete_word"/>
    <fmt:message bundle="${loc}" key="local.word.found_nothing" var="found_nothing_word"/>
    <fmt:message bundle="${loc}" key="local.word.account_add" var="account_add_word"/>

    <title>Epam Cafe</title>
</head>
<body>
<!-- Wrapper -->
<div id="wrapper">
    <!-- Main -->
    <div id="main">
        <div class="inner">

            <%@include file="/front/html/header.html" %>

            <%@include file="/front/html/forms.html" %>


            <!-- Section -->
            <section>
                <header class="major">
                    <h2>${basket_word}</h2>
                </header>
                <div class="posts">
                    <article>
                        <c:choose>
                            <c:when test="${products!=null}">
                                <c:forEach var="product" items="${products}">
                                    <c:choose>
                                        <c:when test="${product.ordered == 0}">
                                            <c:choose>
                                                <c:when test="${locale eq 'ru'}">
                                                    <span>${product.nameRu}(x${product.number})</span>
                                                </c:when>
                                                <c:when test="${locale eq 'en'}">
                                                    <span>${product.nameEn}(x${product.number})</span>
                                                </c:when>
                                            </c:choose>
                                            <span>${product.cost*product.number} BYN</span>
                                            <form method="POST"
                                                  action="/cafe.by/remove_product_from_basket?productId=${product.id}">
                                                <input type="number" step="1" min="0" max="${product.number}" value="0"
                                                       id="number-for-delete" name="number_for_delete"
                                                       onkeypress="return false">
                                                <input type="submit" id="delete-button-from-basket"
                                                       value="Удалить из корзины">
                                            </form>
                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                                <h1>Итого: ${orderCost}</h1>
                            </c:when>
                            <c:otherwise>
                                <h2>${found_nothing_word}</h2>
                            </c:otherwise>
                        </c:choose>
                    </article>
                    <article>
                        <h2>
                            Остаток бонусов: ${point}
                        </h2>
                        <form method="POST" name="payment" action="/cafe.by/payment">
                            <input type="number" step="0.05" min="0"
                                   max="${(user.point<orderCost)?user.point:orderCost}" value="0"
                                   id="point-to-payment" name="point_to_payment"
                                   onkeypress="return false">
                            <c:choose>
                            <c:when test="${products!=null}">
                            <h2>
                                <div>
                                    <p>Выберете форму оплаты</p>
                                    <input type="radio" class="radio_payment" id="by-card"
                                           name="choise_of_payment"
                                           value="card" checked>
                                    <label for="by-card">Кард</label>
                                    <input type="radio" class="radio_payment" id="by-cash"
                                           name="choise_of_payment"
                                           value="cash">
                                    <label for="by-cash">Кэш</label>
                                </div>
                                <h3>
                                    <p>Время желаемого получения</p>
                                    <input id="dateTime" type="datetime-local" name="dateTime" required>
                                    <span class="validity"></span>
                                </h3>
                                <div>
                                    <input type="submit" id="payment_button" value="Оплатить">
                                </div>
                            </h2>
                        </form>
                        </c:when>
                        </c:choose>
                    </article>
                </div>
            </section>

            <section>
                <header class="major">
                    <h2>Заказанные</h2>
                </header>

                <ul>
                    <c:choose>
                        <c:when test="${orders!=null}">
                            <c:forEach var="order" items="${orders}">
                                <h3>${order.id}</h3>
                                <c:forEach var="product" items="${products}">
                                    <c:choose>
                                        <c:when test="${product.orderId == order.id}">
                                            <li>
                                                <c:choose>
                                                    <c:when test="${locale eq 'ru'}">
                                                        <p>${product.nameRu}(x${product.number})</p>
                                                    </c:when>
                                                    <c:when test="${locale eq 'en'}">
                                                        <p>${product.nameEn}(x${product.number})</p>
                                                    </c:when>
                                                </c:choose>
                                            </li>
                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                                <div style="display: inline-block">
                                    <h3 id="COST" style="float: left">Итого: ${order.cost} BYN</h3>
                                    <label id="cost_data" for="COST">Дата получения: ${order.date}</label>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <h2>${found_nothing_word}</h2>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </section>


        </div>
    </div>

    <%@include file="/front/html/menu.html" %>

</div>

<!-- Scripts -->
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
    <%@include file="/front/js/elementcontroller.js"%>
</script>

</body>
</html>