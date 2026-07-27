/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package io;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.Blackhole;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.io.*;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkUTF8ReadMode {
    static Charset charset = StandardCharsets.UTF_8;
    @Param(value = {"galsworthy", "guanzhongluo", "tolstoy"})
    static String filepath;

    static byte[] input;
    static InputStream in;

    public int count_chars(InputStream in) throws IOException {
        Reader r = new InputStreamReader(in, charset);
        char[] cb = new char[1];
        int count = 0;
        while (r.read(cb) >= 1) {
            ++count;
        }
        return count;
    }

    public int count_buffers(InputStream in) throws IOException {
        Reader r = new InputStreamReader(in, charset);
        char[] cb = new char[1000];
        int count = 0;
        while (true) {
            int len = r.read(cb);
            if (len < 0) break;
            count += len;
        }
        return count;
    }

    public int count_lines(InputStream in) throws IOException {
        LineNumberReader r = new LineNumberReader(new InputStreamReader(in, charset));
        int count = 0;
        while (r.readLine() != null) {
            ++count;
        }
        return count;
    }

    public byte[] read_file(String name) throws IOException {
        System.out.print(name + ": ");
        File f = new File(name);
        long len = f.length();
        if (len == 0) {
            throw new FileNotFoundException("File not found: " + f);
        }
        byte[] bytes = new byte[(int) len];
        InputStream fin = new FileInputStream(f);
        int n = fin.read(bytes);
        if (n < len) {
            System.out.println("Error reading file " + f);
        }
        fin.close();
        return bytes;
    }

    @Setup(Level.Iteration)
    public void setup() throws IOException {
        String workSpace = System.getenv("BENCHROOT");
        String filename = workSpace + "/../data/io/" + filepath + ".txt";
        input = read_file(filename);
        in = new ByteArrayInputStream(input);
    }


    @Benchmark
    public void BenchmarkReadUTF8_count_by_1(Blackhole blackhole) throws IOException {
        in.reset();
        int count = count_chars(in);
        blackhole.consume(count);
    }

    @Benchmark
    public void BenchmarkReadUTF8_count_lines(Blackhole blackhole) throws IOException {
        in.reset();
        int count = count_lines(in);
        blackhole.consume(count);
    }

    @Benchmark
    public void BenchmarkReadUTF8_count_all(Blackhole blackhole) throws IOException {
        in.reset();
        int count = count_buffers(in);
        blackhole.consume(count);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkUTF8ReadMode.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
