/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

import java.io.*;
import java.util.concurrent.TimeUnit;
import java.net.Socket;
import java.net.ServerSocket;
import java.net.InetSocketAddress;
import java.util.Arrays;

public class BenchmarkDeleteHttp {

    static OkHttpClient client;
    static Request request;

    public static void handleClientRequest(Socket clientSocket) throws IOException {
        try {
            BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
            PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);

            // Process the request and send back the response
            String httpResponse = "HTTP/1.1 200 OK\r\n\r\nHHHHHHH";
            out.write(httpResponse);
            out.flush();

            clientSocket.close();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
        in.close();
        out.close();
    }
    }
    
    public static void benchmarkDelete() throws IOException {
        var startTime = System.nanoTime();
        ServerSocket serverSocket = new ServerSocket(0);
        int port = serverSocket.getLocalPort();
        new Thread(() -> {
            try {
                Socket clientSocket = serverSocket.accept();
                handleClientRequest(clientSocket);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }).start();

        client = new OkHttpClient();
        request = new Request.Builder()
                .url("http://127.0.0.1:" + port + "/dd")
                .delete()
                .build();

        client.newCall(request).execute();
        client.dispatcher().cancelAll();
        client.connectionPool().evictAll();
        client.dispatcher().executorService().shutdown();
        serverSocket.close();
        var perTime = System.nanoTime() - startTime;


        System.out.println("BenchmarkDeleteHttp: ms = " + perTime / 1000000.0);
    }

    public static void main(String[] args) throws IOException {
        benchmarkDelete();
    }
}
