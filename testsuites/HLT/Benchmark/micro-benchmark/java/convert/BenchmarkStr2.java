/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package convert;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkStr2 {
    @Benchmark
    public Byte BenchmarkStr2Int8() throws NumberFormatException{
        return Byte.parseByte("100");
    }

    @Benchmark
    public Short BenchmarkStr2Int16() throws NumberFormatException{
        return Short.parseShort("100");
    }

    @Benchmark
    public Integer BenchmarkStr2Int32() throws NumberFormatException{
        return Integer.parseInt("100");
    }

    @Benchmark
    public Long BenchmarkStr2Int64() throws NumberFormatException{
        return Long.parseLong("100");
    }

    // java 无此类型，仅提供基线
    @Benchmark
    public Byte BenchmarkStr2UInt8() throws NumberFormatException{
        return Byte.parseByte("100");
    }

    @Benchmark
    public Short BenchmarkStr2UInt16() throws NumberFormatException{
        return Short.parseShort("100");
    }

    @Benchmark
    public Integer BenchmarkStr2UInt32() throws NumberFormatException{
        return Integer.parseInt("100");
    }

    @Benchmark
    public Long BenchmarkStr2UInt64() throws NumberFormatException{
        return Long.parseLong("100");
    }

    @Benchmark
    public float BenchmarkStr2Float16() throws NumberFormatException{
        return Float.parseFloat("100.100");
    }
    //

    @Benchmark
    public Float BenchmarkStr2Float32() throws NumberFormatException{
        return Float.parseFloat("100.100");
    }

    @Benchmark
    public Double BenchmarkStr2Float64() throws NumberFormatException{
        return Double.parseDouble("100.100");
    }

    @Benchmark
    public Boolean BenchmarkStr2Bool_true() throws NumberFormatException{
        return Boolean.parseBoolean("true");
    }

    @Benchmark
    public Boolean BenchmarkStr2Bool_false() throws NumberFormatException{
        return Boolean.parseBoolean("false");
    }

    @Benchmark
    public Character BenchmarkStr2Char() throws NumberFormatException{
        return "'a'".charAt(1);
    }


    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(convert.BenchmarkStr2.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}