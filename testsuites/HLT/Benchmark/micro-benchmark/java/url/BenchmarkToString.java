/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package url;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkToString {
    URL url_1;
    URL url_2;
    URL url_3;
    URL url_4;
    URL url_5;
    URL url_6;
    URL url_7;
    URL url_8;
    URL url_9;
    URL url_10;
    URL url_11;
    URL url_12;
    URL url_13;
    URL url_14;
    URL url_15;
    String stringLong = "http://www.cangjie.com";
    static String string = "";

    public URL makeUrl(String str) throws MalformedURLException {
        String string = URLDecoder.decode("http://www.cangjie.com");
        URL url = new URL(string);
        return url;
    }

    @Setup(Level.Trial)
    public void setup() throws MalformedURLException {
        for (int i = 0; i < 100; i++) {
            stringLong = stringLong + "/abc";
        }
        stringLong = stringLong + "?nums";
        for (int i = 0; i < 100; i++) {
            stringLong = stringLong + "&num" + i + "=1";
        }

        url_1 = makeUrl("http://www.cangjie.com");
        url_2 = makeUrl("http://1.2.3.4:8888/a");
        url_3 = makeUrl("http://www.cangjie.com/a");
        url_4 = makeUrl("http://www.cangjie.com/a/b/c/d/e/f/g/h/i/j");
        url_5 = makeUrl("https://www.cangjie.com");
        url_6 = makeUrl("file:///home/cangjie/rabbits");
        url_7 = makeUrl("ftp://webmaster@www.cangjie.com/");
        url_8 = makeUrl("http://www.cangjie.com/search?q=apple");
        url_9 = makeUrl("http://www.cangjie.com/products?color=red&size=L&brand=nike&type=sneakers&price=50-100");
        url_10 = makeUrl("http://www.cangjie.a.b.c.d.com");
        url_11 = makeUrl("http://www.仓颉.一.二.三.四.com");
        url_12 = makeUrl("http://www.cangjie.com/仓颉/一/二/三/四/五/六/七/八/九");
        url_13 = makeUrl("http://www.cangjie.com/产品?颜色=red&大小=L&品牌=nike&类型=sneakers&价格=50-100e");
        url_14 = makeUrl("http://www.%e4%b8%96%e7%95%8c.com");
        url_15 = makeUrl(stringLong);
    }

    @Benchmark
    public String BenchmarkToString_N0() {
        return URLEncoder.encode(url_1.toString());
    }

    @Benchmark
    public String BenchmarkToString_N1() {
        return URLEncoder.encode(url_2.toString());
    }

    @Benchmark
    public String BenchmarkToString_Path_N1() {
        return URLEncoder.encode(url_3.toString());
    }

    @Benchmark
    public String BenchmarkToString_Path_N10() {
        return URLEncoder.encode(url_4.toString());
    }

    @Benchmark
    public String BenchmarkToString_Protocol_Https() {
        return URLEncoder.encode(url_5.toString());
    }

    @Benchmark
    public String BenchmarkToString_Protocol_File() {
        return URLEncoder.encode(url_6.toString());
    }

    @Benchmark
    public String BenchmarkToString_Protocol_Ftp() {
        return URLEncoder.encode(url_7.toString());
    }

    @Benchmark
    public String BenchmarkToString_Query_N1() {
        return URLEncoder.encode(url_8.toString());
    }
    @Benchmark
    public String BenchmarkToString_Query_N5() {
        return URLEncoder.encode(url_9.toString());
    }

    @Benchmark
    public String BenchmarkToString_HostName_N5() {
        return URLEncoder.encode(url_10.toString());
    }

    @Benchmark
    public String BenchmarkToString_Chinese_N1() {
        return URLEncoder.encode(url_11.toString());
    }

    @Benchmark
    public String BenchmarkToString_Chinese_N2() {
        return URLEncoder.encode(url_12.toString());
    }

    @Benchmark
    public String BenchmarkToString_Chinese_N3() {
        return URLEncoder.encode(url_13.toString());
    }

    @Benchmark
    public String BenchmarkToString_Character_N1() {
        return URLEncoder.encode(url_14.toString());
    }

    @Benchmark
    public String BenchmarkToString_Long() {
        return URLEncoder.encode(url_15.toString());
    }


    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkToString.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
