/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package json;

import com.google.gson.stream.JsonWriter;
import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.io.*;
import java.util.Random;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
public class BenchmarkJsonWriteString {
    JsonWriter jsonWriter = new JsonWriter(new OutputStreamWriter(new ByteArrayOutputStream()));
    String string = "";
    @Param(value = {"4", "8", "16", "64", "256", "1024", "4096", "16384", "131072", "1048576"})
    static int size;

    public static String generateRandomString(int length, String characters) {
        Random random = new Random();
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            int randomIndex = random.nextInt(characters.length());
            char randomChar = characters.charAt(randomIndex);
            sb.append(randomChar);
        }
        return sb.toString();
    }

    public String makeString(int size) {
        String characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"; // 可选的字符集合
        return generateRandomString(size, characters);
    }

    @Setup(Level.Invocation)
    public void makeWriter() throws IOException {
        string = makeString(size);
        jsonWriter = new JsonWriter(new OutputStreamWriter(new ByteArrayOutputStream()));
        jsonWriter.beginArray();
    }

    @Benchmark
    public void BenchmarkJsonWriteString_G10() throws IOException{
        for (int i = 0; i < 10; i++) {
            jsonWriter.value(string);
        }
    }

    @TearDown(Level.Invocation)
    public void teardown() throws IOException {
        jsonWriter.endArray();
        jsonWriter.flush();
        jsonWriter.close();
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(json.BenchmarkJsonWriteString.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
