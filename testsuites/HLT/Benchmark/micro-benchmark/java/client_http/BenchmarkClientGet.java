/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package client_http;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;
import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkClientGet {
    @Param(value = {"0", "32", "256", "2048", "16384", "131072", "1048576"})
    static int bodySize;

    static int port = 60001;
    static OkHttpClient client;
    static Request request;

    @Setup(Level.Iteration)
    public void startClient() throws IOException {
        // startClient
        client = new OkHttpClient();
        request = new Request.Builder()
                .url("http://127.0.0.1:" + port + "/get" + bodySize)
                .get()
                .build();
    }

    @TearDown(Level.Iteration)
    public void closeClient() {
        client.dispatcher().cancelAll();
        client.connectionPool().evictAll();
        client.dispatcher().executorService().shutdown();
    }

    @Benchmark
    public void BenchmarkHttpClientGet_N() {
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
                .include(BenchmarkClientGet.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
