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

import java.io.*;
import java.net.InetSocketAddress;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkPutRequestBody {
    @Param(value = {"32", "256", "2048", "16384", "131072", "1048576"})
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
        httpServer.start();
        port = httpServer.getAddress().getPort();

        // startClient
        client = new OkHttpClient();
        String requestBody = new String(new int [bodySize], 0, bodySize).replace('\0', 'H');
        byte[] requestBodyBytes = requestBody.getBytes();
        int requestBodySize = requestBodyBytes.length;
        MediaType mediaType = MediaType.parse("application/octet-stream");
        RequestBody body = RequestBody.create(mediaType, requestBodyBytes);
        request = new Request.Builder()
                .url("http://127.0.0.1:" + port + "/dd")
                .put(body)
                .addHeader("Content-Type", "application/octet-stream")
                .addHeader("Content-Length", Integer.toString(requestBodySize))
                .build();
    }

    static class TestHandler implements HttpHandler {
        @Override
        public void handle(HttpExchange exchange) throws IOException {
            String requestMethod = exchange.getRequestMethod();
            if (requestMethod.equalsIgnoreCase("PUT")) {
                InputStream requestBody = exchange.getRequestBody();
                byte[] bytes = new BufferedReader(new InputStreamReader(requestBody))
                        .lines()
                        .collect(Collectors.joining("")).getBytes();

                String httpResponse = "";
                exchange.sendResponseHeaders(200, 0);
                OutputStream os = exchange.getResponseBody();
                os.write(httpResponse.getBytes());
                os.close();
            } else {
                exchange.sendResponseHeaders(405, -1);
            }
            exchange.close();
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
    public void BenchmarkPut_Req() {
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
                .include(BenchmarkPutRequestBody.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
