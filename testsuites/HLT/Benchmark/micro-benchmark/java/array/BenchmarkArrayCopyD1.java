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
public class BenchmarkArrayCopyD1 {
    static int num32 = 32;
    static long[] targetArr32 = new long[num32];
    static long[] srcArr32 = new long[num32];

    static {
        for (int i = 0; i < num32; i++) {
            srcArr32[i] = i;
        }
    }

    @Benchmark
    public void BenchmarkArrayCopyD1_N32() {
        System.arraycopy(targetArr32, 0, srcArr32, 0, num32);
    }

    static int num256 = 256;
    static long[] targetArr256 = new long[num256];
    static long[] srcArr256 = new long[num256];

    static {
        for (int i = 0; i < num256; i++) {
            srcArr256[i] = i;
        }
    }

    @Benchmark
    public void BenchmarkArrayCopyD1_N256() {
        System.arraycopy(targetArr256, 0, srcArr256, 0, num256);
    }

    static int num2048 = 2048;
    static long[] targetArr2048 = new long[num2048];
    static long[] srcArr2048 = new long[num2048];

    static {
        for (int i = 0; i < num2048; i++) {
            srcArr2048[i] = i;
        }
    }

    @Benchmark
    public void BenchmarkArrayCopyD1_N2048() {
        System.arraycopy(targetArr2048, 0, srcArr2048, 0, num2048);
    }

    static int num16384 = 16384;
    static long[] targetArr16384 = new long[num16384];
    static long[] srcArr16384 = new long[num16384];

    static {
        for (int i = 0; i < num16384; i++) {
            srcArr16384[i] = i;
        }
    }

    @Benchmark
    public void BenchmarkArrayCopyD1_N16384() {
        System.arraycopy(targetArr16384, 0, srcArr16384, 0, num16384);
    }


    static int num131072 = 131072;
    static long[] targetArr131072 = new long[num131072];
    static long[] srcArr131072 = new long[num131072];

    static {
        for (int i = 0; i < num131072; i++) {
            srcArr131072[i] = i;
        }
    }

    @Benchmark
    public void BenchmarkArrayCopyD1_N131072() {
        System.arraycopy(targetArr131072, 0, srcArr131072, 0, num131072);
    }

    static int num1048576 = 1048576;
    static long[] targetArr1048576 = new long[num1048576];
    static long[] srcArr1048576 = new long[num1048576];

    static {
        for (int i = 0; i < num1048576; i++) {
            srcArr1048576[i] = i;
        }
    }

    @Benchmark
    public void BenchmarkArrayCopyD1_N1048576() {
        System.arraycopy(targetArr1048576, 0, srcArr1048576, 0, num1048576);
    }

    static int num8388608 = 8388608;
    static long[] targetArr8388608 = new long[num8388608];
    static long[] srcArr8388608 = new long[num8388608];

    static {
        for (int i = 0; i < num8388608; i++) {
            srcArr8388608[i] = i;
        }
    }

    @Benchmark
    public void BenchmarkArrayCopyD1_N8388608() {
        System.arraycopy(targetArr8388608, 0, srcArr8388608, 0, num8388608);

    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArrayCopyD1.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
