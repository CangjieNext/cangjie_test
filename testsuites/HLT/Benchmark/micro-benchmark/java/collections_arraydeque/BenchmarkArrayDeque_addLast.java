/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package collections_arraydeque;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.Blackhole;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.util.ArrayDeque;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkArrayDeque_addLast {
    ArrayDeque<Long> ArrayDeque_Int64 = new ArrayDeque<Long>();
    ArrayDeque<Byte> ArrayDeque_UInt8 = new ArrayDeque<Byte>();
    ArrayDeque<Double> ArrayDeque_Float64 = new ArrayDeque<Double>();
    ArrayDeque<String> ArrayDeque_String = new ArrayDeque<String>();
    ArrayDeque<Long> ArrayDeque_Int64_N24 = new ArrayDeque<Long>();
    ArrayDeque<Long> ArrayDeque_Int64_N192 = new ArrayDeque<Long>();
    ArrayDeque<Long> ArrayDeque_Int64_N1536 = new ArrayDeque<Long>();
    byte aByte = 66;

    @Setup(Level.Invocation)
    public void setup() {
        ArrayDeque_Int64 = new ArrayDeque<Long>(8);
        ArrayDeque_UInt8 = new ArrayDeque<Byte>(8);
        ArrayDeque_Float64 = new ArrayDeque<Double>(8);
        ArrayDeque_String = new ArrayDeque<String>(8);
        ArrayDeque_Int64_N24 = new ArrayDeque<Long>(24);
        ArrayDeque_Int64_N192 = new ArrayDeque<Long>(192);
        ArrayDeque_Int64_N1536 = new ArrayDeque<Long>(1536);
    }

    @Benchmark
    public void BenchmarkArrayDeque_addLast_Int64(Blackhole blackhole) {
        ArrayDeque_Int64.addLast(0L);
    }

    @Benchmark
    public void BenchmarkArrayDeque_addLast_UInt8(Blackhole blackhole) {
        ArrayDeque_UInt8.addLast(aByte);
    }

    @Benchmark
    public void BenchmarkArrayDeque_addLast_Float64(Blackhole blackhole) {
        ArrayDeque_Float64.addLast(3.14d);
    }

    @Benchmark
    public void BenchmarkArrayDeque_addLast_Int64_G16(Blackhole blackhole) {
        for (long i = 0L; i < 16; i++) {
            ArrayDeque_Int64_N24.addLast(i);
        }
    }

    @Benchmark
    public void BenchmarkArrayDeque_addLast_Int64_G128(Blackhole blackhole) {
        for (long i = 0L; i < 128; i++) {
            ArrayDeque_Int64_N192.addLast(i);
        }
    }

    @Benchmark
    public void BenchmarkArrayDeque_addLast_Int64_G1024(Blackhole blackhole) {
        for (long i = 0L; i < 1024; i++) {
            ArrayDeque_Int64_N1536.addLast(i);
        }
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArrayDeque_addLast.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
