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
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkDelete {
    static int port;
    static HttpServer httpServer;
    static OkHttpClient client;
    static Request request;

    @Setup(Level.Iteration)
    public void startServer() throws IOException {
        // startServer
        httpServer = HttpServer.create(new InetSocketAddress(0), 0);
        httpServer.createContext("/dd", new BenchmarkDelete.TestHandler());
        httpServer.start();
        port = httpServer.getAddress().getPort();

        // startClient
        client = new OkHttpClient();
        request = new Request.Builder()
                .url("http://127.0.0.1:" + port + "/dd")
                .delete()
                .build();
    }

    static class TestHandler implements HttpHandler {
        @Override
        public void handle(HttpExchange exchange) throws IOException {
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
    public Response BenchmarkDelete() throws IOException {
        return client.newCall(request).execute();
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkDelete.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
