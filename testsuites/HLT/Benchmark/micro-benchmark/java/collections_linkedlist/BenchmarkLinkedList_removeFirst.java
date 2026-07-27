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
public class BenchmarkLinkedList_removeFirst {
    private LinkedList<Long> templateInt64_N8;
    private LinkedList<Byte> templateUInt8_N8;
    private LinkedList<String> templateString_N8;
    private LinkedList<Long> templateInt64_N128;
    private LinkedList<Long> templateInt64_N1024;

    @Setup(Level.Invocation)
    public void setup() {
        templateInt64_N8 = createLinkedList(8, 0L);
        templateUInt8_N8 = createLinkedList(8, (byte)0);
        templateString_N8 = createLinkedList(8, "test");
        templateInt64_N128 = createLinkedList(128, 0L);
        templateInt64_N1024 = createLinkedList(1024, 0L);
    }

    private <T> LinkedList<T> createLinkedList(int size, T element) {
        LinkedList<T> list = new LinkedList<T>();
        for (int i = 0; i < size; i++) {
            list.addFirst(element);
        }
        return list;
    }

    @Benchmark
    public void BenchmarkLinkedList_removeFirst_Int64_N8(Blackhole bh) {
        Long value = templateInt64_N8.removeFirst();
        bh.consume(value);
    }

    @Benchmark
    public void BenchmarkLinkedList_removeFirst_UInt8(Blackhole bh) {
        Byte value = templateUInt8_N8.removeFirst();
        bh.consume(value);
    }

    @Benchmark
    public void BenchmarkLinkedList_removeFirst_String(Blackhole bh) {
        String value = templateString_N8.removeFirst();
        bh.consume(value);
    }

    @Benchmark
    public void BenchmarkLinkedList_removeFirst_Int64_N128(Blackhole bh) {
        Long value = templateInt64_N128.removeFirst();
        bh.consume(value);
    }

    @Benchmark
    public void BenchmarkLinkedList_removeFirst_Int64_N1024(Blackhole bh) {
        Long value = templateInt64_N1024.removeFirst();
        bh.consume(value);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkLinkedList_removeFirst.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
