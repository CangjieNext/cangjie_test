/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package collections_treeset;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.Blackhole;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.util.TreeSet;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkTreeSet_add {
    // 空 TreeSet：用于 G1, G16, G256, G4096（无预填充）
    private TreeSet<Long> emptySet_G1;
    private TreeSet<Long> emptySet_G16;
    private TreeSet<Long> emptySet_G256;
    private TreeSet<Long> emptySet_G4096;

    // 已有内容的 TreeSet：从 0 到 N-1
    private TreeSet<Long> filledSet_16;
    private TreeSet<Long> filledSet_256;
    private TreeSet<Long> filledSet_4096;

    @Setup(Level.Invocation)
    public void setup() {
        emptySet_G1 = new TreeSet<Long>();
        emptySet_G16 = new TreeSet<Long>();
        emptySet_G256 = new TreeSet<Long>();
        emptySet_G4096 = new TreeSet<Long>();
        
        filledSet_16 = new TreeSet<Long>();
        for (long i = 0; i < 16; i++) {
            filledSet_16.add(i);
        }
        filledSet_256 = new TreeSet<Long>();
        for (long i = 0; i < 256; i++) {
            filledSet_256.add(i);
        }

        filledSet_4096 = new TreeSet<Long>();
        for (long i = 0; i < 4096; i++) {
            filledSet_4096.add(i);
        }
    }

    @Benchmark
    public void BenchmarkTreeSet_add_Int64_G1(Blackhole blackhole) {
        TreeSet<Long> set = emptySet_G1;
        set.add(0L);
        blackhole.consume(set);
    }

    @Benchmark
    public void BenchmarkTreeSet_add_Int64_G16(Blackhole blackhole) {
        TreeSet<Long> set = emptySet_G16;
        for (long i = 0; i <= 16; i++) {
            set.add(i);
        }
        blackhole.consume(set);
    }

    @Benchmark
    public void BenchmarkTreeSet_add_Int64_G256(Blackhole blackhole) {
        TreeSet<Long> set = emptySet_G256;
        for (long i = 0; i <= 256; i++) {
            set.add(i);
        }
        blackhole.consume(set);
    }

    @Benchmark
    public void BenchmarkTreeSet_add_Int64_G4096(Blackhole blackhole) {
        TreeSet<Long> set = emptySet_G4096;
        for (long i = 0; i <= 4096; i++) {
            set.add(i);
        }
        blackhole.consume(set);
    }

    @Benchmark
    public void BenchmarkTreeSet_add_Int64_G1_exists(Blackhole blackhole) {
        TreeSet<Long> set = filledSet_16;
        set.add(0L);
        blackhole.consume(set);
    }

    @Benchmark
    public void BenchmarkTreeSet_add_Int64_G16_exists(Blackhole blackhole) {
        TreeSet<Long> set = filledSet_16;
        for (long i = 0; i <= 16; i++) {
            set.add(i);
        }
        blackhole.consume(set);
    }

    @Benchmark
    public void BenchmarkTreeSet_add_Int64_G256_exists(Blackhole blackhole) {
        TreeSet<Long> set = filledSet_256;
        for (long i = 0; i <= 256; i++) {
            set.add(i);
        }
        blackhole.consume(set);
    }

    @Benchmark
    public void BenchmarkTreeSet_add_Int64_G4096_exists(Blackhole blackhole) {
        TreeSet<Long> set = filledSet_4096;
        for (long i = 0; i <= 4096; i++) {
            set.add(i);
        }
        blackhole.consume(set);
    }
    
    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkTreeSet_add.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
