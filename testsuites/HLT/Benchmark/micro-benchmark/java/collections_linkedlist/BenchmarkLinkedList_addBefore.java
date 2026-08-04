/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package collections_linkedlist;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.Blackhole;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.util.LinkedList;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkLinkedList_addBefore {
    private LinkedList<Long> templateInt64_N16;
    private LinkedList<Long> templateInt64_N256;

    @Setup(Level.Invocation)
    public void setup() {
        templateInt64_N16 = createLinkedList(16, 0L);
        templateInt64_N256 = createLinkedList(256, 0L);
    }

    private <T> LinkedList<T> createLinkedList(int size, T element) {
        LinkedList<T> list = new LinkedList<T>();
        for (int i = 0; i < size; i++) {
            list.addFirst(element);
        }
        return list;
    }

    @Benchmark
    public void BenchmarkLinkedList_addBefore_N16_p1(Blackhole bh) {
        templateInt64_N16.add(0, 0L);
    }

    @Benchmark
    public void BenchmarkLinkedList_addBefore_N16_p2(Blackhole bh) {
        templateInt64_N16.add(7, 0L);
    }

    @Benchmark
    public void BenchmarkLinkedList_addBefore_N16_p3(Blackhole bh) {
        templateInt64_N16.add(15, 0L);
    }

    @Benchmark
    public void BenchmarkLinkedList_addBefore_N256_p1(Blackhole bh) {
        templateInt64_N256.add(0, 0L);
    }

    @Benchmark
    public void BenchmarkLinkedList_addBefore_N256_p2(Blackhole bh) {
        templateInt64_N256.add(127, 0L);
    }

    @Benchmark
    public void BenchmarkLinkedList_addBefore_N256_p3(Blackhole bh) {
        templateInt64_N256.add(255, 0L);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkLinkedList_addBefore.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
