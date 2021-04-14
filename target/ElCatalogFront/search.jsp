<%--
  Created by IntelliJ IDEA.
  User: Danila
  Date: 08.05.2020
  Time: 23:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="Style.css">
    <title>SEARCH</title>
</head>
<body>
<header class="header">
    <div id="rectangle1"></div>
    <nav>
        <form method="get" action="Direct">
            <div id="navBar1">
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
                                document.getElementById("bookingComplete").style.display = "none";
                            }
                            else{
                                document.getElementById("inputLogin").style.display = "none";
                                document.getElementById("bookingComplete").style.display = "none";
                            }
                        });
                    }
                </script>
                <script>
                    function authorization1(){
                        var xhr = new XMLHttpRequest();
                        xhr.open('GET', 'CheckBooking', true);
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
                                output1(books);
                            }
                        }
                        xhr.send();
                    }
                    function output1(books) {
                        books.forEach(function (books) {
                            if(books.idBooks === "null"){
                                document.getElementById("bookingButton").style.display = "none";
                                document.getElementById("registerButton").style.display = "none";
                            }
                            else{
                            }
                        });
                    }
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
                <script>authorization()</script>
                <script>setTimeout(authorization1,25)</script>


                <button type="submit" id="inputLogin" name="method" value="login" class="navig" style="
                margin-top: 0px;
                padding: 10px;
                color: #000000;
                border: 1px solid blue;
                border-radius: 5px;
                text-decoration: none;">
                    Авторизация</button>

                <button type="submit" onclick="logout(); setTimeout(100)" id="outputLogin" name="method"
                        value="mainPage" class="navig"
                        style="
                margin-top: 0px;
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
        <div>
            <script>
                function login() {
                    let xhr = new XMLHttpRequest();
                    xhr.open('POST','Search');
                    let json ='';
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState !== 4) return;
                        if (xhr.status !== 200) {
                            // обработать ошибку
                            alert(xhr.status + ': ' + xhr.statusText);
                        }
                    }
                    json ={ 'method' : "search",
                        'bookName' : document.getElementById("bookName").value};
                    xhr.send(JSON.stringify(json));
                }
                function search() {
                    var xhr = new XMLHttpRequest();
                    xhr.open('GET', 'Search', true);
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
                            show(books);
                        }
                    }
                    xhr.send();
                }
                function show(books) {
                    let li = catalog;
                    while(li.firstChild) {
                        li.removeChild(li.firstChild);
                    }
                    books.forEach(function (books) {
                        li = catalog.appendChild(document.createElement('li'));
                        li.innerHTML = books.bookName + ' ' + books.author + ' ' + books.bookYear + ' Status: '
                            + books.statusReservation;
                        document.getElementById("bookingButton").style.display = "inline";
                    });
                }
                function booking() {
                    let xhr = new XMLHttpRequest();
                    xhr.open('POST','Booking');
                    let json ='';
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState !== 4) return;
                        if (xhr.status !== 200) {
                            // обработать ошибку
                            alert(xhr.status + ': ' + xhr.statusText);
                        }
                    }
                    json ={ 'method' : "booking"};
                    document.getElementById("bookingComplete").style.display = "inline";
                    xhr.send(JSON.stringify(json));
                }
            </script>
            <input type="text" name="bookName" id="bookName" placeholder="Поиск по электронному каталогу...">
            <button onclick="login(); setTimeout(search, 25)" class="searchingBar" name="method">&#128270</button>
            <button onclick="booking()" id="bookingButton" class="bookButton" name="method">Забронировать</button>
        </div>
    </nav>
</header>

<section class="Search" id="searching">
    <article class="searching">
        <div class="search">
            <h3 align="center" id="tagSearch">Результат поиска
            </h3>
            <h3 align="center" id="bookingComplete">Книга успешно забронирована на 2 недели!
            </h3>
            <ul id="catalog">
                <li></li>
            </ul>
        </div>
    </article>
</section>

<footer class="footer">
    <div id="rectangle2"></div>
</footer>

</body>
</html>
