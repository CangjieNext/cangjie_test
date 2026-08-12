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

import java.util.Iterator;
import java.util.LinkedList;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkLinkedList_backward {
    private LinkedList<Long> listInt64_N16;
    private LinkedList<Long> listInt64_N128;
    private LinkedList<Long> listInt64_N4096;

    @Setup(Level.Iteration)
    public void setup() {
        listInt64_N16 = createLinkedList(16, 0L);
        listInt64_N128 = createLinkedList(128, 0L);
        listInt64_N4096 = createLinkedList(4096, 0L);
    }

    private <T> LinkedList<T> createLinkedList(int size, T element) {
        LinkedList<T> list = new LinkedList<T>();
        for (int i = 0; i < size; i++) {
            list.addFirst(element);
        }
        return list;
    }

    @Benchmark
    public void BenchmarkLinkedList_backward_N16(Blackhole bh) {
        Iterator<Long> iter = listInt64_N16.descendingIterator();
        while (iter.hasNext()) {
            iter.next();
        }
    }

    @Benchmark
    public void BenchmarkLinkedList_backward_N128(Blackhole bh) {
        Iterator<Long> iter = listInt64_N128.descendingIterator();
        while (iter.hasNext()) {
            iter.next();
        }
    }

    @Benchmark
    public void BenchmarkLinkedList_backward_N4096(Blackhole bh) {
        Iterator<Long> iter = listInt64_N4096.descendingIterator();
        while (iter.hasNext()) {
            iter.next();
        }
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkLinkedList_backward.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
