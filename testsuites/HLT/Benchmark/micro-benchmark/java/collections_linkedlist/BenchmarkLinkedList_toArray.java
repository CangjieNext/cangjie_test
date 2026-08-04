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
public class BenchmarkLinkedList_toArray {
    private LinkedList<Long> listN8;
    private LinkedList<Long> listN64;
    private LinkedList<Long> listN256;
    private LinkedList<Long> listN1024;

    @Setup(Level.Iteration)
    public void setup() {
        listN8 = createLinkedList(8);
        listN64 = createLinkedList(64);
        listN256 = createLinkedList(256);
        listN1024 = createLinkedList(1024);
    }

    private LinkedList<Long> createLinkedList(int size) {
        LinkedList<Long> list = new LinkedList<Long>();
        // 使用addFirst构建链表，保持与原始测试一致
        for (long i = 0; i < size; i++) {
            list.addFirst(i);
        }
        return list;
    }

    // 基准测试方法
    @Benchmark
    public void BenchmarkLinkedList_toArray_Int64_N8(Blackhole bh) {
        Object[] array = listN8.toArray();
        bh.consume(array);
    }

    @Benchmark
    public void BenchmarkLinkedList_toArray_Int64_N64(Blackhole bh) {
        Object[] array = listN64.toArray();
        bh.consume(array);
    }

    @Benchmark
    public void BenchmarkLinkedList_toArray_Int64_N256(Blackhole bh) {
        Object[] array = listN256.toArray();
        bh.consume(array);
    }

    @Benchmark
    public void BenchmarkLinkedList_toArray_Int64_N1024(Blackhole bh) {
        Object[] array = listN1024.toArray();
        bh.consume(array);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkLinkedList_toArray.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
