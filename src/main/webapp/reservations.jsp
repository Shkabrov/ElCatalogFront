<%--
  Created by IntelliJ IDEA.
  User: Danila
  Date: 08.05.2020
  Time: 23:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="Style.css">
    <title>RESERVATIONS</title>
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

                <button type="submit" onclick="logout(); setTimeout(100)" id="outputLogin" name="method" value="mainPage" class="navig"
                        style="
                margin-top: 0px;
                padding: 10px;
                color: #000000;
                border: 1px solid blue;
                border-radius: 5px;
                text-decoration: none;">
                    Выйти</button>

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
                            }
                            else{
                            }
                        });
                    }
                </script>
                <script>authorization()</script>
                <button type="submit" id="searchButton" name="method" value="search" class="searchingBari">Бронирование</button>
            </div>
        </form>
    </nav>
</header>

<section class="Reservations" id="reserve">
    <article class="reserve">
        <div class="reservations">
            <h3 align="center" id="yourBooks">Ваши книги
            </h3>
            <ul id="catalog">
                <li></li>
            </ul>
            <script>
                function load() {
                    var xhr = new XMLHttpRequest();
                    xhr.open('GET', 'Reserve', true);
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
                        li.innerHTML = books.bookName + ' ' + books.author + ' ' + books.bookYear + ' '
                            + books.date;
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
