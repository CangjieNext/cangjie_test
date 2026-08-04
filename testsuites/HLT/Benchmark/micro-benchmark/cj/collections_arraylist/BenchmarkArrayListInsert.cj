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
@Configure[warmup: Duration.second]
public class Test_ArrayList_Insert { 

    static var idx: Int64 = 0

    @Strategy[
        len in [16, 256, 131072],
        place in ["start", "mid", "end"]
    ]
    func dataStrategyInt64(len: Int64, place: String): GenerateEachInputProvider<ArrayList<Int64>> {
        idx = match (place) {
            case "start" => 0
            case "mid" => len/2
            case _ => len
        }

        GenerateEachInputProvider{ =>
            ArrayList<Int64>(len, {index: Int64 => index})
        }
    }

    @Bench[x in dataStrategyInt64]
    func BenchmarkArrayListInsert_Int64_N(x: ArrayList<Int64>): Unit {
        x.add(888, at: idx)
    }

    
    @Strategy[
        len in [16, 256, 131072],
        place in ["start", "mid", "end"]
    ]
    func dataStrategyString(len: Int64, place: String): GenerateEachInputProvider<ArrayList<String>> {
        idx = match (place) {
            case "start" => 0
            case "mid" => len/2
            case _ => len
        }

        GenerateEachInputProvider{ =>
            ArrayList<String>(len, {index: Int64 => index.toString()})
        }
    }

    @Bench[x in dataStrategyString]
    func BenchmarkArrayListInsert_String_N(x: ArrayList<String>): Unit {
        x.add("a", at: idx)
    }

}
