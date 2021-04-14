package servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Direct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String direct = new String(req.getParameter("method"));

        switch (direct) {
            case "login":
                resp.sendRedirect("http://localhost:8080/ElCatalogFront_war_exploded/login.jsp");
                break;
            case "register":
                resp.sendRedirect("http://localhost:8080/ElCatalogFront_war_exploded/register.jsp");
                break;
            case "reservations":
                resp.sendRedirect("http://localhost:8080/ElCatalogFront_war_exploded/reservations.jsp");
                break;
            case "search":
                resp.sendRedirect("http://localhost:8080/ElCatalogFront_war_exploded/search.jsp");
                break;
            case "mainPage":
                resp.sendRedirect("http://localhost:8080/ElCatalogFront_war_exploded/index.jsp");
                break;
        }
    }
}
