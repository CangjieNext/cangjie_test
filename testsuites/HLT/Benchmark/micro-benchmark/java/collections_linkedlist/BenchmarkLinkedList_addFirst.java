/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package collections_linkedlist;

import org.openjdk.jmh.annotations.*;
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
public class BenchmarkLinkedList_addFirst {
    private LinkedList<Long> listInt64 = new LinkedList<Long>();;
    private LinkedList<Byte> listUInt8 = new LinkedList<Byte>();
    private LinkedList<Double> listFloat64 = new LinkedList<Double>();
    private LinkedList<String> listString = new LinkedList<String>();
    private LinkedList<Long> listInt64_G16 = new LinkedList<Long>();
    private LinkedList<Long> listInt64_G128 = new LinkedList<Long>();
    private LinkedList<Long> listInt64_G1024 = new LinkedList<Long>();

    @Setup(Level.Invocation)
    public void setup() {
        listInt64 = new LinkedList<Long>();
        listUInt8 = new LinkedList<Byte>();
        listFloat64 = new LinkedList<Double>();
        listString = new LinkedList<String>();
        listInt64_G16 = new LinkedList<Long>();
        listInt64_G128 = new LinkedList<Long>();
        listInt64_G1024 = new LinkedList<Long>();
    }

    @Benchmark
    public void BenchmarkLinkedList_addFirst_Int64() {
        listInt64.addFirst(0L);
    }

    @Benchmark
    public void BenchmarkLinkedList_addFirst_UInt8() {
        listUInt8.addFirst((byte)0);
    }

    @Benchmark
    public void BenchmarkLinkedList_addFirst_Float64() {
        listFloat64.addFirst(3.14);
    }

    @Benchmark
    public void BenchmarkLinkedList_addFirst_String() {
        listString.addFirst("test");
    }

    // 批量添加操作基准测试
    @Benchmark
    public void BenchmarkLinkedList_addFirst_Int64_G16() {
        for (long i = 0; i < 16; i++) {
            listInt64_G16.addFirst(i);
        }
    }

    @Benchmark
    public void BenchmarkLinkedList_addFirst_Int64_G128() {
        for (long i = 0; i < 128; i++) {
            listInt64_G128.addFirst(i);
        }
    }

    @Benchmark
    public void BenchmarkLinkedList_addFirst_Int64_G1024() {
        for (long i = 0; i < 1024; i++) {
            listInt64_G1024.addFirst(i);
        }
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkLinkedList_addFirst.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
