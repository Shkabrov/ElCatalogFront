package servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

public class Logout extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Server.makeConnection();
        String json = "{\"method\":\"outputLogin\"}";
        Server.sendMsg(json);
        BufferedReader in = Server.getIn();
        String str = "[" + in.readLine() + "]";
        resp.getWriter().print(str);
    }

}