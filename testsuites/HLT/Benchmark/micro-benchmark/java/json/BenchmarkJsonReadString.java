/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package json;

import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.Blackhole;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.io.*;
import java.util.concurrent.TimeUnit;
import java.util.Random;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
public class BenchmarkJsonReadString {
    static JsonReader jsonReader= new JsonReader(new InputStreamReader(new ByteArrayInputStream(new byte[]{1})));
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
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        JsonWriter jsonWriter = new JsonWriter(new OutputStreamWriter(out));
        String string = makeString(size);
        jsonWriter.beginArray();
        for (int i = 0; i < 10; i++) {
            jsonWriter.value(string);
        }
        jsonWriter.endArray();
        jsonWriter.close();
        byte[] content = out.toByteArray();
        jsonReader =  new JsonReader(new InputStreamReader(new ByteArrayInputStream(content)));
        jsonReader.beginArray();
    }

    @TearDown(Level.Invocation)
    public void teardown() throws IOException {
        jsonReader.endArray();
    }

    @Benchmark
    public void BenchmarkJsonReadString_G10(Blackhole blackhole) throws IOException{
        String value = "";
        while (jsonReader.hasNext()) {
            value = jsonReader.nextString();
        }
        blackhole.consume(value);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(json.BenchmarkJsonReadString.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
