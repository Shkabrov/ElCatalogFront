<!DOCTYPE HTML>
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<html>

<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="Style.css">
    <title>ELECTRONIC CATALOG</title>
</head>

<body>
<header class="header">
    <div id="rectangle1"></div>
    <nav>
        <form method="get" action="Direct">
            <div id="navBar1">
                <script>
                    function logout(){
                        var xhr = new XMLHttpRequest();
                        xhr.open('GET', 'Logout', true);
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
                            }
                        }
                        xhr.send();
                    }
                </script>

                <button type="submit" id="inputLogin" name="method" value="login" class="navig" style="
                margin-top: 16px;
                padding: 10px;
                color: #000000;
                border: 1px solid blue;
                border-radius: 5px;
                text-decoration: none;">
                    Авторизация</button>

                <button type="submit" onclick="logout()" id="outputLogin" name="method" value="mainPage" class="navig"
                        style="
                margin-top: 16px;
                padding: 10px;
                color: #000000;
                border: 1px solid blue;
                border-radius: 5px;
                text-decoration: none;">
                    Выйти</button>

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
                                document.getElementById("outputLogin").style.display = "none";
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

<section class="mainPage" id="main">
    <article class="main">
        <div class="MainPage">
            <h3 align="center" id="catalogs">Каталог
            </h3>
            <ul id="catalog">
                <li></li>
            </ul>
            <script>
                function load() {
                    var xhr = new XMLHttpRequest();
                    xhr.open('GET', 'servlet', true);
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
                            show(books.book)
                        }
                    }
                    xhr.send();
                }
                function show(books) {
                    console.log(books);
                    let li = catalog;
                    while(li.firstChild) {
                        li.removeChild(li.firstChild);
                    }
                    books.forEach(function (books) {
                        li = catalog.appendChild(document.createElement('li'));
                        li.innerHTML = books.bookName + ' ' + books.author + ' ' + books.bookYear;
                    });
                }
            </script>
            <script>
                load();
            </script>
        </div>
    </article>
</section>

<footer class="footer">
    <div id="rectangle2"></div>
</footer>
</body>
</html>
