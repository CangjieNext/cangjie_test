/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package array;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@Fork(1)
public class BenchmarkArrayCopyToD1 {
    static int num32 = 32;
    static long[] targetArr32 = new long[num32];
    static long[] srcArr32 = new long[num32];

    static {
        for (int i = 0; i < num32; i++) {
            srcArr32[i] = i;
        }
    }

    static String[] targetArr_String_32 = new String[num32];
    static String[] srcArr_String_32 = new String[num32];

    static {
        for (int i = 0; i < num32; i++) {
            srcArr_String_32[i] = String.valueOf(i);
        }
    }

    @Benchmark
    public void BenchmarkArrayCopyTo_long64_D1_N32() {
        System.arraycopy(targetArr32, 0, srcArr32, 0, num32);
    }

    @Benchmark
    public void BenchmarkArrayCopyTo_String_D1_N32() {
        System.arraycopy(targetArr_String_32, 0, srcArr_String_32, 0, num32);
    }

    static int num2048 = 2048;
    static long[] targetArr2048 = new long[num2048];
    static long[] srcArr2048 = new long[num2048];

    static {
        for (int i = 0; i < num2048; i++) {
            srcArr2048[i] = i;
        }
    }

    static String[] targetArr_String_2048 = new String[num2048];
    static String[] srcArr_String_2048 = new String[num2048];

    static {
        for (int i = 0; i < num2048; i++) {
            srcArr_String_2048[i] = String.valueOf(i);
        }
    }

    @Benchmark
    public void BenchmarkArrayCopyTo_String_D1_N2048() {
        System.arraycopy(targetArr_String_2048, 0, srcArr_String_2048, 0, num2048);
    }

    @Benchmark
    public void BenchmarkArrayCopyTo_long64_D1_N2048() {
        System.arraycopy(targetArr2048, 0, srcArr2048, 0, num2048);
    }

    static int num131072 = 131072;
    static long[] targetArr131072 = new long[num131072];
    static long[] srcArr131072 = new long[num131072];

    static {
        for (int i = 0; i < num131072; i++) {
            srcArr131072[i] = i;
        }
    }

    static String[] targetArr_String_131072 = new String[num131072];
    static String[] srcArr_String_131072 = new String[num131072];

    static {
        for (int i = 0; i < num131072; i++) {
            srcArr_String_131072[i] = String.valueOf(i);
        }
    }

    @Benchmark
    public void BenchmarkArrayCopyTo_String_D1_N131072() {
        System.arraycopy(targetArr_String_131072, 0, srcArr_String_131072, 0, num131072);
    }


    @Benchmark
    public void BenchmarkArrayCopyTo_long64_D1_N131072() {
        System.arraycopy(targetArr131072, 0, srcArr131072, 0, num131072);
    }

    static int num8388608 = 8388608;
    static long[] targetArr8388608 = new long[num8388608];
    static long[] srcArr8388608 = new long[num8388608];

    static {
        for (int i = 0; i < num8388608; i++) {
            srcArr8388608[i] = i;
        }
    }

    static String[] targetArr_String_8388608 = new String[num8388608];
    static String[] srcArr_String_8388608 = new String[num8388608];

    static {
        for (int i = 0; i < num8388608; i++) {
            srcArr_String_8388608[i] = String.valueOf(i);
        }
    }

    @Benchmark
    public void BenchmarkArrayCopyTo_String_D1_N8388608() {
        System.arraycopy(targetArr_String_8388608, 0, srcArr_String_8388608, 0, num8388608);
    }

    @Benchmark
    public void BenchmarkArrayCopyTo_long64_D1_N8388608() {
        System.arraycopy(targetArr8388608, 0, srcArr8388608, 0, num8388608);

    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(array.BenchmarkArrayCopyToD1.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
