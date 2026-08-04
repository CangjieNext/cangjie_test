/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package http;

import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpServer;
import okhttp3.*;
import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.InetSocketAddress;
import java.util.Arrays;
import java.util.HashMap;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkPostForm {
    @Param(value = {"32", "256", "2048", "16384", "131072", "1048576", "8388608", "67108864"})
    static int bodySize;

    static int port;
    static HttpServer httpServer;
    static OkHttpClient client;
    static Request request;

    @Setup(Level.Iteration)
    public void startServerAndClient() throws IOException {
        // startServer
        httpServer = HttpServer.create(new InetSocketAddress(0), 0);
        httpServer.createContext("/dd", new TestHandler());
        httpServer.setExecutor(null);
        httpServer.start();
        port = httpServer.getAddress().getPort();

        // startClient
        client = new OkHttpClient();
        String requestBody = "11=" + new String(new int [bodySize - 3], 0, bodySize - 3).replace('\0', '1');
        byte[] requestBodyBytes = requestBody.getBytes();
        int requestBodySize = requestBodyBytes.length;
        MediaType mediaType = MediaType.parse("application/x-www-form-urlencoded");
        RequestBody body = RequestBody.create(mediaType, requestBodyBytes);
        request = new Request.Builder()
                .url("http://127.0.0.1:" + port + "/dd")
                .post(body)
                .addHeader("Content-Type", "application/x-www-form-urlencoded")
                .addHeader("Content-Length", Integer.toString(requestBodySize))
                .build();
    }

    static HashMap<String, String> parseFormData(String formData) {
        HashMap<String, String> map = new HashMap<>();
        String[] pairs = formData.split("&");
        for (String pair : pairs) {
            String[] keyValue = pair.split("=");
            String key = keyValue[0];
            String value = keyValue.length > 1 ? keyValue[1] : "";
            map.put(key, value);
        }
        return map;
    }

    static class TestHandler implements HttpHandler {
        @Override
        public void handle(HttpExchange exchange) throws IOException {
            InputStream requestBody = exchange.getRequestBody();
            byte[] bytes = new BufferedReader(new InputStreamReader(requestBody))
                    .lines()
                    .collect(Collectors.joining("")).getBytes();
            HashMap<String, String> formData = parseFormData(Arrays.toString(bytes));
            requestBody.close();

            exchange.sendResponseHeaders(200, -1);
        }
    }

    @TearDown(Level.Iteration)
    public void closeServerAndClient() {
        client.dispatcher().cancelAll();
        client.connectionPool().evictAll();
        client.dispatcher().executorService().shutdown();
        httpServer.stop(0);
    }

    @Benchmark
    public void BenchmarkPostForm_N() {
        try (Response response = client.newCall(request).execute()) {
            ResponseBody responseBody = response.body();
            if (responseBody != null) {
                responseBody.string();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkPostForm.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
