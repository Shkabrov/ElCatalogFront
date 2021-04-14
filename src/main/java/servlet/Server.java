package servlet;

import java.io.*;
import java.net.Socket;

public class Server {

    private static BufferedReader in;
    private static BufferedWriter out;

    public static void makeConnection() {
        try {
            Socket socket = new Socket("localhost", 6000);
            in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            out = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static BufferedWriter getOut() {
        return out;
    }

    public static BufferedReader getIn() {
        return in;
    }

    public static void sendMsg(String msg) {
        try {
            out.write(msg + "\r\n");
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
