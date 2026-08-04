/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package expression;

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
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkWriteArrayOutOfOrderD1 {
    static int num32 = 32;
    static int num256 = 256;
    static int num2048 = 2048;
    static int num16384 = 16384;
    static int num131072 = 131072;
    static int num1048576 = 1048576;

    static int[] targetArr32 = new int[num32];
    static int[] targetArr256 = new int[num256];
    static int[] targetArr2048 = new int[num2048];
    static int[] targetArr16384 = new int[num16384];
    static int[] targetArr131072 = new int[num131072];
    static int[] targetArr1048576 = new int[num1048576];
    
    @Benchmark
    public void BenchmarkWriteArrayOutOfOrderD1_N32() {
        for (int i = 0; i < num32; i += 64) {
            targetArr32[i] = i;
        }
    }

    @Benchmark
    public void BenchmarkWriteArrayOutOfOrderD1_N256() {
        for (int i = 0; i < num256; i += 64) {
            targetArr256[i] = i;
        }
    }

    @Benchmark
    public void BenchmarkWriteArrayOutOfOrderD1_N2048() {
        for (int i = 0; i < num2048; i += 64) {
            targetArr2048[i] = i;
        }
    }

    @Benchmark
    public void BenchmarkWriteArrayOutOfOrderD1_N16384() {
        for (int i = 0; i < num16384; i += 64) {
            targetArr16384[i] = i;
        }
    }

    @Benchmark
    public void BenchmarkWriteArrayOutOfOrderD1_N131072() {
        for (int i = 0; i < num131072; i += 64) {
            targetArr131072[i] = i;
        }
    }

    @Benchmark
    public void BenchmarkWriteArrayOutOfOrderD1_N1048576() {
        for (int i = 0; i < num1048576; i += 64) {
            targetArr1048576[i] = i;
        }
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkWriteArrayOutOfOrderD1.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
