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
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkArrayListAppendTypes {
    // 考虑到java常用int,故未使用long数组
    ArrayList<Integer> arrayList_Int64 = new ArrayList<Integer>();
    ArrayList<Byte> arrayList_UInt8 = new ArrayList<Byte>();
    ArrayList<Double> arrayList_Float64 = new ArrayList<Double>();
    ArrayList<Boolean> arrayList_Boolean = new ArrayList<Boolean>();
    byte aByte = 66;

    @Setup(Level.Invocation)
    public void setup() {
        arrayList_Int64 = new ArrayList<Integer>();
        arrayList_UInt8 = new ArrayList<Byte>();
        arrayList_Float64 = new ArrayList<Double>();
        arrayList_Boolean = new ArrayList<Boolean>();
    }

    @Benchmark
    public void BenchmarkArrayListAppendInt64() {
        arrayList_Int64.add(654321);
    }

    @Benchmark
    public void BenchmarkArrayListAppendUInt8() {
        arrayList_UInt8.add(aByte);
    }

    @Benchmark
    public void BenchmarkArrayListAppendFloat64() {
        arrayList_Float64.add(3.14d);
    }

    @Benchmark
    public void BenchmarkArrayListAppendBoolean() {
        arrayList_Boolean.add(true);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArrayListAppendTypes.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
