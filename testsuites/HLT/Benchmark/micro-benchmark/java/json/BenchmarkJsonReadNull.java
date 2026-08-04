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
public class BenchmarkJsonReadNull {
    static JsonReader jsonReader= new JsonReader(new InputStreamReader(new ByteArrayInputStream(new byte[]{1})));

    @Setup(Level.Invocation)
    public void makeWriter() throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        JsonWriter jsonWriter = new JsonWriter(new OutputStreamWriter(out));
        jsonWriter.beginArray();
        for (int i = 0; i < 10; i++) {
            jsonWriter.nullValue();
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
    public void BenchmarkJsonReadNull_G10() throws IOException{
        while (jsonReader.hasNext()) {
            jsonReader.nextNull();
        }
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(json.BenchmarkJsonReadNull.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
