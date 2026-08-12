/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package client_http;

import okhttp3.*;
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
public class BenchmarkClientPost {
    @Param(value = {"0", "32", "256", "2048", "16384", "131072", "1048576"})
    static int bodySize;

    static int port = 60001;
    static OkHttpClient client;
    static Request request;

    @Setup(Level.Iteration)
    public void startClient() throws IOException {
        // startClient
        client = new OkHttpClient();
        String requestBody = new String(new char[bodySize], 0, bodySize).replace('\0', 'a');
        byte[] requestBodyBytes = requestBody.getBytes();
        int requestBodySize = requestBodyBytes.length;
        MediaType mediaType = MediaType.parse("application/octet-stream");
        RequestBody body = RequestBody.create(mediaType, requestBodyBytes);
        request = new Request.Builder()
                .url("http://127.0.0.1:" + port + "/post")
                .post(body)
                .addHeader("Content-Type", "application/octet-stream")
                .addHeader("Content-Length", Integer.toString(requestBodySize))
                .build();
    }

    @TearDown(Level.Iteration)
    public void closeClient() {
        client.dispatcher().cancelAll();
        client.connectionPool().evictAll();
        client.dispatcher().executorService().shutdown();
    }

    @Benchmark
    public void BenchmarkHttpClientPost_N() {
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
                .include(BenchmarkClientPost.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
