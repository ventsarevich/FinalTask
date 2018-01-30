<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean class="bsuir.vintsarevich.entity.Product" scope="page" id="product"/>

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

            <%@include file="/front/html/banner.html" %>

            <!-- Section -->
            <section>
                <header class="major">
                    <h2>${login_word}</h2>
                </header>
                <div class="posts">
                    <c:choose>
                        <c:when test="${products!=null}">
                            <c:forEach var="product" items="${products}">
                                <article>
                                    <a href="#" class="image"><img src="images/products/${product.imagePath}"
                                                                   alt=""/></a>
                                    <c:choose>
                                        <c:when test="${locale eq 'ru'}">
                                            <h3>${product.nameRu}</h3>
                                            <p>${product.descriptionRu}</p>
                                        </c:when>
                                        <c:when test="${locale eq 'en'}">
                                            <h3>${product.nameEn}</h3>
                                            <p>${product.descriptionEn}</p>
                                        </c:when>
                                    </c:choose>
                                    <ul class="actions">
                                        <li><a href="/product.do?id=${product.id}" class="button">Просмотреть</a></li>
                                    </ul>
                                </article>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <h2>Ничего не найдено</h2>
                        </c:otherwise>
                    </c:choose>
                </div>
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

</body>
</html>