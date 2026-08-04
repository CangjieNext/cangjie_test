/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import okhttp3.*;
import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.InetSocketAddress;
import java.util.Arrays;


public class BenchmarkGetHttp {

    static int[] SIZE = {32, 256, 2048, 16384, 131072, 1048576, 8388608, 67108864};

    static OkHttpClient client;
    static Request request;

    public static void handleClientRequest(Socket clientSocket, int num) throws IOException {
        try {
            BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
            PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);

            // Process the request and send back the response
            char[] responseStr = new char[num];
            Arrays.fill(responseStr, 'H');
            String httpResponse = "HTTP/1.1 200 OK\r\n\r\n" + responseStr;
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


    public static void benchmarkGet(int num) throws IOException {
        
        ServerSocket serverSocket = new ServerSocket(0);
        try {
        int port = serverSocket.getLocalPort();
        new Thread(() -> {
            try {
                Socket clientSocket = serverSocket.accept();
                handleClientRequest(clientSocket, num);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }).start();

        client = new OkHttpClient();
        request = new Request.Builder()
                .url("http://127.0.0.1:" + port + "/dd")  // Replace "/dd" with your actual path
                .get()
                .build();

        Response response = client.newCall(request).execute();

        client.dispatcher().cancelAll();
        client.connectionPool().evictAll();
        client.dispatcher().executorService().shutdown();
        } finally {
        serverSocket.close();

        }
        
    }

    public static void main(String[] args) throws IOException {
        var startTime = System.nanoTime();
        for (int i = 0;i < SIZE.length; i++) {
            benchmarkGet(SIZE[i]);
        }
        var perTime = System.nanoTime() - startTime;
        System.out.println("BenchmarkGetHttp: ms = " + perTime / 1000000.0);
    }
}