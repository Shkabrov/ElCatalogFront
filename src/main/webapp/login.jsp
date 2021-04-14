<%--
  Created by IntelliJ IDEA.
  User: Danila
  Date: 08.05.2020
  Time: 21:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="Style.css">
    <title>LOGIN</title>
</head>
<body>
<header class="header">
    <div id="rectangle1"></div>
    <nav>
        <form method="get" action="Direct">
            <div id="navBar1">

                <button type="submit" id="inputLogin" name="method" value="login" class="navig" style="
                margin-top: 0px;
                padding: 10px;
                color: #000000;
                border: 1px solid blue;
                border-radius: 5px;
                text-decoration: none;">
                    Авторизация</button>

                <button type="submit" id="registerButton" name="method" value="register" class="navig" style="
                margin-top: 5px;
                padding: 10px;
                color: #000000;
                border: 1px solid blue;
                border-radius: 5px;
                text-decoration: none;">
                    Регистрация</button>

                <button type="submit" id="reserveBooks" name="method" value="reservations" class="navig" style="
                margin-top: 5px;
                padding: 10px;
                color: #000000;
                border: 1px solid blue;
                border-radius: 5px;
                text-decoration: none;">
                    Ваши книги</button>

                <button type="submit" name="method" value="mainPage" style="
                Position:absolute;
                top: -2px;
                left: 48%;
                display: flex;
                text-align: center;
                background: rgba(0, 0, 0, 0);
                border-radius: 3px;
                border-color: rgba(0, 0, 0, 0);">
                    <img src="logo.png" alt="Логотип" class="logo"></button>

            </div>
        </form>
        <form action="Direct" method="get">
            <div>
                <script>
                    function authorization(){
                        var xhr = new XMLHttpRequest();
                        xhr.open('GET', 'Login', true);
                        xhr.onreadystatechange = function () {
                            if (xhr.readyState !== 4) return;
                            if (xhr.status !== 200) {
                                // обработать ошибку
                                alert(xhr.status + ': ' + xhr.statusText);
                            } else {
                                try {
                                    var books = JSON.parse(xhr.responseText);
                                } catch (e) {
                                    alert("Некорректный ответ " + e.message);
                                }
                                output(books);
                            }
                        }
                        xhr.send();
                    }
                    function output(books) {
                        books.forEach(function (books) {
                            if(books.idClients === "null"){
                                document.getElementById("reserveBooks").style.display = "none";
                                document.getElementById("searchButton").style.display = "none";
                            }
                            else{
                                document.getElementById("inputLogin").style.display = "none";
                                document.getElementById("registerButton").style.display = "none";
                            }
                        });
                    }
                </script>
                <script>authorization()</script>
                <button type="submit" id="searchButton" name="method" value="search" class="searchingBari">
                    Бронирование</button>
            </div>
        </form>
    </nav>
</header>

<section class="Authorization" id="authentication">
    <article class="authentication">
        <div class="authorization">
            <h3 align="center">АВТОРИЗАЦИЯ
            </h3>
            <script>
                function login() {
                    let xhr = new XMLHttpRequest();
                    xhr.open('POST','servlet');
                    let json ='';
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState !== 4) return;
                        if (xhr.status !== 200) {
                            // обработать ошибку
                            alert(xhr.status + ': ' + xhr.statusText);
                        }
                    }
                    json ={ 'method' : "login",
                        'login' : document.getElementById("login").value ,
                        'password' : document.getElementById("password").value};
                    xhr.send(JSON.stringify(json));
                }
            </script>
                <input type="text" name="login" id="login" placeholder="Логин">
                <input type="password" name="password" id="password" placeholder="Пароль">
                <button onclick="login(); window.location.href =
                        'http://localhost:8080/ElCatalogFront_war_exploded/index.jsp'" class="loginPeople"
                        name="method">Авторизоваться</button>
        </div>
    </article>
</section>

<footer class="footer">
    <div id="rectangle2"></div>
</footer>

</body>
</html>
