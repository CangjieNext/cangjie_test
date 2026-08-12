/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package collections_arraylist;

import org.openjdk.jmh.annotations.*;
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
public class BenchmarkArrayListInitFromLinkedList {
    static LinkedList<Integer> linkedList_16 = new LinkedList<Integer>();
    static LinkedList<Integer> linkedList_128 = new LinkedList<Integer>();
    static LinkedList<Integer> linkedList_1024 = new LinkedList<Integer>();
    static LinkedList<Integer> linkedList_8192 = new LinkedList<Integer>();
    static LinkedList<Integer> linkedList_65536 = new LinkedList<Integer>();

    @Setup(Level.Trial)
    public void setup() {
        for (int i = 0; i < 16; i++) {
            linkedList_16.add(i);
        }
        for (int i = 0; i < 128; i++) {
            linkedList_128.add(i);
        }
        for (int i = 0; i < 1024; i++) {
            linkedList_1024.add(i);
        }
        for (int i = 0; i < 8192; i++) {
            linkedList_8192.add(i);
        }
        for (int i = 0; i < 65536; i++) {
            linkedList_65536.add(i);
        }
    }

    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListInitFromLinkedList_N16() {
        return new ArrayList<Integer>(linkedList_16);
    }

    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListInitFromLinkedList_N128() {
        return new ArrayList<Integer>(linkedList_128);
    }
    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListInitFromLinkedList_N1024() {
        return new ArrayList<Integer>(linkedList_1024);
    }
    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListInitFromLinkedList_N8192() {
        return new ArrayList<Integer>(linkedList_8192);
    }

    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListInitFromLinkedList_N65536() {
        return new ArrayList<Integer>(linkedList_65536);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArrayListInitFromLinkedList.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
