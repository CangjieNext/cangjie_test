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
public class BenchmarkArrayListAppendAllLinkedList {
    static ArrayList<Integer> arrayList = new ArrayList<Integer>();
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

    @Setup(Level.Invocation)
    public void setupArray() {
        arrayList = new ArrayList<Integer>(16);
    }

    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListAppendAllLinkedList_N16() {
        arrayList.addAll(linkedList_16);
        return arrayList;
    }

    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListAppendAllLinkedList_N128() {
        arrayList.addAll(linkedList_128);
        return arrayList;
    }

    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListAppendAllLinkedList_N1024() {
        arrayList.addAll(linkedList_1024);
        return arrayList;
    }

    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListAppendAllLinkedList_N8192() {
        arrayList.addAll(linkedList_8192);
        return arrayList;
    }

    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListAppendAllLinkedList_N65536() {
        arrayList.addAll(linkedList_65536);
        return arrayList;
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArrayListAppendAllLinkedList.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
