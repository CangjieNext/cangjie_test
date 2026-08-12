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
public class BenchmarkLinkedList_last {
    // Int64测试数据
    private LinkedList<Long> listInt64_N8;
    private LinkedList<Long> listInt64_N128;
    private LinkedList<Long> listInt64_N1024;

    // UInt8测试数据 (Java中使用Byte表示)
    private LinkedList<Byte> listUInt8_N8;

    // String测试数据
    private LinkedList<String> listString_N8;

    @Setup(Level.Iteration)
    public void setup() {
        // 初始化Int64测试数据
        listInt64_N8 = createLinkedList(8, 0L);
        listInt64_N128 = createLinkedList(128, 0L);
        listInt64_N1024 = createLinkedList(1024, 0L);

        // 初始化UInt8测试数据
        listUInt8_N8 = createLinkedList(8, (byte)0);

        // 初始化String测试数据
        listString_N8 = createLinkedList(8, "test");
    }

    private <T> LinkedList<T> createLinkedList(int size, T element) {
        LinkedList<T> list = new LinkedList<T>();
        for (int i = 0; i < size; i++) {
            list.addFirst(element); // 使用addlast构建链表
        }
        return list;
    }

    // Int64基准测试
    @Benchmark
    public void BenchmarkLinkedList_last_Int64(Blackhole bh) {
        Long value = listInt64_N8.getLast();
        bh.consume(value);
    }

    @Benchmark
    public void BenchmarkLinkedList_last_Int64_N128(Blackhole bh) {
        Long value = listInt64_N128.getLast();
        bh.consume(value);
    }

    @Benchmark
    public void BenchmarkLinkedList_last_Int64_N1024(Blackhole bh) {
        Long value = listInt64_N1024.getLast();
        bh.consume(value);
    }

    // UInt8基准测试 (Java中使用Byte)
    @Benchmark
    public void BenchmarkLinkedList_last_UInt8(Blackhole bh) {
        Byte value = listUInt8_N8.getLast();
        bh.consume(value);
    }

    // String基准测试
    @Benchmark
    public void BenchmarkLinkedList_last_String(Blackhole bh) {
        String value = listString_N8.getLast();
        bh.consume(value);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkLinkedList_last.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
