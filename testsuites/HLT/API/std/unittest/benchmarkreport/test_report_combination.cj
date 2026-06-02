/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args --bench --report-format=Csv --report-path=./
// (not Windows) RUN-EXEC: ls ./benchmarks/bench-default.Test_Report_Combination.csv
// (Windows): EXEC: dir ./benchmarks/bench-default.Test_Report_Combination.csv

import std.collection.*
import std.time.*

@Test
@Configure[minDuration: Duration.second * 1, measurement: TimeNow(TimeUnit.Nanos)]
@Configure[warmup: Duration.second]
public class Test_Report_Combination {
    @TestCase
    func test_fake_case(): Unit {
    }

    static var idx: Int64 = 0
    static var arr = Array<String>()
    @Strategy[len in [ 16, 256 ], 
 place in [ "start", "end" ] 
]
    func dataStrategyInt64(len: Int64, place: String): GenerateEachInputProvider<ArrayList<Int64>> {
        idx = match (place) {
            case "start" => 0
            case _ => len
        }

        GenerateEachInputProvider {
            => ArrayList<Int64>(len, {index: Int64 => index})
        }
    }

    @Bench[x in dataStrategyInt64]
    func BenchmarkDataInStrategy(x: ArrayList<Int64>): Unit {
        x.add(888, at: idx)
    }

    @Bench[x in [ 16, 256 ], 
 y in [ "a", "A" ] 
]
    func BenchmarkBenchDSL(x: Int64, y: String): Unit {
        arr = Array<String>(x, repeat: y)
    }
}
