/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping --no-sub-pkg %cmp_utest_opt -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run %run_opt %output %run_utest_opt %run_args --bench --no-color
// TIMEOUT: 1800

import std.time.*
import std.collection.*


@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second, batchSize: 1]
public class Test_ArrayList_Remove { 
    @Strategy
    func strategyBuilder_Int64(): BatchSizeOneInputProvider<ArrayList<Int64>> {
        BatchSizeOneInputProvider { =>
            ArrayList<Int64>(256, {index: Int64 => index})
        }   
    }

    @Strategy
    func strategyBuilder_String(): BatchSizeOneInputProvider<ArrayList<String>> {
        BatchSizeOneInputProvider { =>
            ArrayList<String>(256, {index: Int64 => index.toString()})
        }   
    }

    @Bench[x in strategyBuilder_Int64]
    func BenchmarkArrayListRemove_Int64_start(x: ArrayList<Int64>): Unit {
        x.remove(at: 0)
    }

    @Bench[x in strategyBuilder_Int64]
    func BenchmarkArrayListRemove_Int64_mid(x: ArrayList<Int64>): Unit {
        x.remove(at: 128)
    }

    @Bench[x in strategyBuilder_Int64]
    func BenchmarkArrayListRemove_Int64_end(x: ArrayList<Int64>): Unit {
        x.remove(at: 255)
    }

    @Bench[x in strategyBuilder_String]
    func BenchmarkArrayListRemove_String_start(x: ArrayList<String>): Unit {
        x.remove(at: 0)
    }

    @Bench[x in strategyBuilder_String]
    func BenchmarkArrayListRemove_String_mid(x: ArrayList<String>): Unit {
        x.remove(at: 128)
    }

    @Bench[x in strategyBuilder_String]
    func BenchmarkArrayListRemove_String_end(x: ArrayList<String>): Unit {
        x.remove(at: 255)
    }
}
