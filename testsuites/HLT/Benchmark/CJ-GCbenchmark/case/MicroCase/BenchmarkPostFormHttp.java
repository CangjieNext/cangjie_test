/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import okhttp3.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

public class BenchmarkPostFormHttp {
    static int[] SIZE = {32, 256, 2048, 16384, 131072, 1048576, 8388608, 67108864};

    static OkHttpClient client;
    static Request request;
    static ServerSocket serverSocket;

    public static void handleClientRequest() throws IOException {
        Socket clientSocket = serverSocket.accept();
        BufferedReader reader = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
        PrintWriter writer = new PrintWriter(clientSocket.getOutputStream(), true);

        String requestLine = reader.readLine();

        try {
            if (requestLine.startsWith("PUT")) {
                writer.println("HTTP/1.1 200 ");
                writer.println();
            } else {
                writer.println("HTTP/1.1 405 ");
                writer.println("Content-Length: -1");
                writer.println();
            }
        } finally {
            writer.close();
            reader.close();
            clientSocket.close();
        }
    }

    public static void benchmarkPostForm(int len) throws IOException {
        int port = serverSocket.getLocalPort();
        client = new OkHttpClient();

        String requestBody = "11=" + "1".repeat(len - 3);
        MediaType mediaType = MediaType.parse("application/x-www-form-urlencoded");

        RequestBody body = RequestBody.create(mediaType, requestBody);
        int requestBodySize = requestBody.length();

        request = new Request.Builder()
                .url("http://127.0.0.1:" + port + "/dd")
                .post(body)
                .addHeader("Content-Type", "application/x-www-form-urlencoded")
                .addHeader("Content-Length", Integer.toString(requestBodySize))
                .build();


        try {
            Response response = client.newCall(request).execute();
            handleClientRequest();
            ResponseBody responseBody = response.body();
            if (responseBody != null) {
                responseBody.string();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) throws IOException {
        var startTime = System.nanoTime();
        serverSocket = new ServerSocket(0);
        for (int value : SIZE) {
            benchmarkPostForm(value);
        }
        serverSocket.close();
        var perTime = System.nanoTime() - startTime;
        System.out.println("BenchmarkPostFormHttp: ms = " + perTime / 1000000.0);
    }
}
