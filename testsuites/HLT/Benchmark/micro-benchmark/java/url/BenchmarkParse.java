/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package url;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.Blackhole;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLDecoder;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkParse {
    static String stringLong = "http://www.cangjie.com";

    @Setup(Level.Trial)
    public void setup() {
        for (int i = 0; i < 100; i++) {
            stringLong = stringLong + "/abc";
        }
        stringLong = stringLong + "?nums";
        for (int i = 0; i < 100; i++) {
            stringLong = stringLong + "&num" + i + "=1";
        }
    }

    @Benchmark
    public void BenchmarkParse_N0(Blackhole blackhole) throws MalformedURLException {
        String string = URLDecoder.decode("http://www.cangjie.com");
        URL url = new URL(string);
        blackhole.consume(url);
    }

    @Benchmark
    public void BenchmarkParse_N1(Blackhole blackhole) throws MalformedURLException {
        String string = URLDecoder.decode("http://1.2.3.4:8888/a");
        URL url = new URL(string);
        blackhole.consume(url);
    }

    @Benchmark
    public void BenchmarkParse_Path_N1(Blackhole blackhole) throws MalformedURLException {
        String string = URLDecoder.decode("http://www.cangjie.com/a");
        URL url = new URL(string);
        blackhole.consume(url);
    }

    @Benchmark
    public void BenchmarkParse_Path_N10(Blackhole blackhole) throws MalformedURLException {
        String string = URLDecoder.decode("http://www.cangjie.com/a/b/c/d/e/f/g/h/i/j");
        URL url = new URL(string);
        blackhole.consume(url);
    }

    @Benchmark
    public void BenchmarkParse_Protocol_Https(Blackhole blackhole) throws MalformedURLException {
        String string = URLDecoder.decode("https://www.cangjie.com");
        URL url = new URL(string);
        blackhole.consume(url);
    }

    @Benchmark
    public void BenchmarkParse_Protocol_File(Blackhole blackhole) throws MalformedURLException {
        String string = URLDecoder.decode("file:///home/cangjie/rabbits");
        URL url = new URL(string);
        blackhole.consume(url);
    }

    @Benchmark
    public void BenchmarkParse_Protocol_Ftp(Blackhole blackhole) throws MalformedURLException {
        String string = URLDecoder.decode("ftp://webmaster@www.cangjie.com/");
        URL url = new URL(string);
        blackhole.consume(url);
    }

    @Benchmark
    public void BenchmarkParse_Query_N1(Blackhole blackhole) throws MalformedURLException {
        String string = URLDecoder.decode("http://www.cangjie.com/search?q=apple");
        URL url = new URL(string);
        blackhole.consume(url);
    }

    @Benchmark
    public void BenchmarkParse_Query_N5(Blackhole blackhole) throws MalformedURLException {
        String string = URLDecoder.decode("http://www.cangjie.com/products?color=red&size=L&brand=nike&type=sneakers&price=50-100");
        URL url = new URL(string);
        blackhole.consume(url);
    }

    @Benchmark
    public void BenchmarkParse_HostName_N5(Blackhole blackhole) throws MalformedURLException {
        String string = URLDecoder.decode("http://www.cangjie.a.b.c.d.com");
        URL url = new URL(string);
        blackhole.consume(url);
    }

    @Benchmark
    public void BenchmarkParse_Chinese_N1(Blackhole blackhole) throws MalformedURLException {
        String string = URLDecoder.decode("http://www.仓颉.一.二.三.四.com");
        URL url = new URL(string);
        blackhole.consume(url);
    }

    @Benchmark
    public void BenchmarkParse_Chinese_N2(Blackhole blackhole) throws MalformedURLException {
        String string = URLDecoder.decode("http://www.cangjie.com/仓颉/一/二/三/四/五/六/七/八/九");
        URL url = new URL(string);
        blackhole.consume(url);
    }

    @Benchmark
    public void BenchmarkParse_Chinese_N3(Blackhole blackhole) throws MalformedURLException {
        String string = URLDecoder.decode("http://www.cangjie.com/产品?颜色=red&大小=L&品牌=nike&类型=sneakers&价格=50-100e");
        URL url = new URL(string);
        blackhole.consume(url);
    }

    @Benchmark
    public void BenchmarkParse_Character_N1(Blackhole blackhole) throws MalformedURLException {
        String string = URLDecoder.decode("http://www.%e4%b8%96%e7%95%8c.com");
        URL url = new URL(string);
        blackhole.consume(url);
    }

    @Benchmark
    public void BenchmarkParse_Long(Blackhole blackhole) throws MalformedURLException {
        String string = URLDecoder.decode(stringLong);
        URL url = new URL(string);
        blackhole.consume(url);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkParse.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
