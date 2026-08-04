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
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
public class BenchmarkJsonWriteBool {
    JsonWriter jsonWriter = new JsonWriter(new OutputStreamWriter(new ByteArrayOutputStream()));

    @Setup(Level.Invocation)
    public void makeWriter() throws IOException {
        jsonWriter = new JsonWriter(new OutputStreamWriter(new ByteArrayOutputStream()));
        jsonWriter.beginArray();
    }

    @TearDown(Level.Invocation)
    public void teardown() throws IOException {
        jsonWriter.endArray();
        jsonWriter.flush();
        jsonWriter.close();
    }

    @Benchmark
    public void BenchmarkJsonWriteBool_G10() throws IOException{
        for (int i = 0; i < 10; i++) {
            jsonWriter.value(true);
        }
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(json.BenchmarkJsonWriteBool.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
