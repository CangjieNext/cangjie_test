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

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkLinkedList_Init {
    // Int64测试数据
    private ArrayList<Long> arrInt64_N16;
    private ArrayList<Long> arrInt64_N256;
    private ArrayList<Long> arrInt64_N2048;
    private ArrayList<Long> arrInt64_N16384;
    private ArrayList<Long> arrInt64_N131072;
    private ArrayList<Long> arrInt64_N1048576;

    // String测试数据
    private ArrayList<String> arrString_N16;
    private ArrayList<String> arrString_N256;
    private ArrayList<String> arrString_N2048;
    private ArrayList<String> arrString_N16384;
    private ArrayList<String> arrString_N131072;
    private ArrayList<String> arrString_N1048576;

    @Setup(Level.Iteration)
    public void setup() {
        // 初始化Int64测试数据
        arrInt64_N16 = createArrayList(16, 0L);
        arrInt64_N256 = createArrayList(256, 0L);
        arrInt64_N2048 = createArrayList(2048, 0L);
        arrInt64_N16384 = createArrayList(16384, 0L);
        arrInt64_N131072 = createArrayList(131072, 0L);
        arrInt64_N1048576 = createArrayList(1048576, 0L);

        // 初始化String测试数据
        arrString_N16 = createArrayList(16, "test");
        arrString_N256 = createArrayList(256, "test");
        arrString_N2048 = createArrayList(2048, "test");
        arrString_N16384 = createArrayList(16384, "test");
        arrString_N131072 = createArrayList(131072, "test");
        arrString_N1048576 = createArrayList(1048576, "test");
    }

    private <T> ArrayList<T> createArrayList(int size, T element) {
        ArrayList<T> list = new ArrayList<T>(size);
        for (int i = 0; i < size; i++) {
            list.add(element);
        }
        return list;
    }

    @Benchmark
    public void BenchmarkLinkedList_Init_Int64_N16(Blackhole bh) {
        LinkedList<Long> linkedList = new LinkedList<Long>(arrInt64_N16);
        bh.consume(linkedList);
    }

    @Benchmark
    public void BenchmarkLinkedList_Init_Int64_N256(Blackhole bh) {
        LinkedList<Long> linkedList = new LinkedList<Long>(arrInt64_N256);
        bh.consume(linkedList);
    }

    @Benchmark
    public void BenchmarkLinkedList_Init_Int64_N2048(Blackhole bh) {
        LinkedList<Long> linkedList = new LinkedList<Long>(arrInt64_N2048);
        bh.consume(linkedList);
    }

    @Benchmark
    public void BenchmarkLinkedList_Init_Int64_N16384(Blackhole bh) {
        LinkedList<Long> linkedList = new LinkedList<Long>(arrInt64_N16384);
        bh.consume(linkedList);
    }

    @Benchmark
    public void BenchmarkLinkedList_Init_Int64_N131072(Blackhole bh) {
        LinkedList<Long> linkedList = new LinkedList<Long>(arrInt64_N131072);
        bh.consume(linkedList);
    }

    @Benchmark
    public void BenchmarkLinkedList_Init_Int64_N1048576(Blackhole bh) {
        LinkedList<Long> linkedList = new LinkedList<Long>(arrInt64_N1048576);
        bh.consume(linkedList);
    }

    // String基准测试
    @Benchmark
    public void BenchmarkLinkedList_Init_String_N16(Blackhole bh) {
        LinkedList<String> linkedList = new LinkedList<String>(arrString_N16);
        bh.consume(linkedList);
    }

    @Benchmark
    public void BenchmarkLinkedList_Init_String_N256(Blackhole bh) {
        LinkedList<String> linkedList = new LinkedList<String>(arrString_N256);
        bh.consume(linkedList);
    }

    @Benchmark
    public void BenchmarkLinkedList_Init_String_N2048(Blackhole bh) {
        LinkedList<String> linkedList = new LinkedList<String>(arrString_N2048);
        bh.consume(linkedList);
    }

    @Benchmark
    public void BenchmarkLinkedList_Init_String_N16384(Blackhole bh) {
        LinkedList<String> linkedList = new LinkedList<String>(arrString_N16384);
        bh.consume(linkedList);
    }

    @Benchmark
    public void BenchmarkLinkedList_Init_String_N131072(Blackhole bh) {
        LinkedList<String> linkedList = new LinkedList<String>(arrString_N131072);
        bh.consume(linkedList);
    }

    @Benchmark
    public void BenchmarkLinkedList_Init_String_N1048576(Blackhole bh) {
        LinkedList<String> linkedList = new LinkedList<String>(arrString_N1048576);
        bh.consume(linkedList);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkLinkedList_Init.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
