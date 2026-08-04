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
public class BenchmarkWriteArrayOutOfOrderD2 {
    static int num32 = 32;
    static int num256 = 256;
    static int num2048 = 2048;
    static int num16384 = 16384;

    static int[][] targetArr32 = new int[num32][num32];
    static int[][] targetArr256 = new int[num256][num256];
    static int[][] targetArr2048 = new int[num2048][num2048];
    static int[][] targetArr16384 = new int[num16384][num16384];

    @Benchmark
    public void BenchmarkWriteArrayOutOfOrderD2_N32() {
        for (int j = 0; j < num32; j += 64) {
            for (int i = 0; i < num32; i += 64) {
                targetArr32[j][i] = i;
            }
        }

    }

    @Benchmark
    public void BenchmarkWriteArrayOutOfOrderD2_N256() {
        for (int j = 0; j < num256; j += 64) {
            for (int i = 0; i < num256; i += 64) {
                targetArr256[j][i] = i;
            }
        }

    }

    @Benchmark
    public void BenchmarkWriteArrayOutOfOrderD2_N2048() {
        for (int j = 0; j < num2048; j += 64) {
            for (int i = 0; i < num2048; i += 64) {
                targetArr2048[j][i] = i;
            }
        }

    }

    @Benchmark
    public void BenchmarkWriteArrayOutOfOrderD2_N16384() {
        for (int j = 0; j < num16384; j += 64) {
            for (int i = 0; i < num16384; i += 64) {
                targetArr16384[j][i] = i;
            }
        }

    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkWriteArrayOutOfOrderD2.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
