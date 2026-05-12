/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: ./benchtest
// EXEC: %compiler %cmp_opt %cmp_utest_opt ./benchtest/time_bench_* -o time_bench.%suffix
// RUN-EXEC: %run %run_opt time_bench.%suffix %run_args %run_utest_opt --bench --reportFormat=csv --reportPath=.
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.fs.*
import std.convert.*
import std.collection.*
import stdx.unittest.data.*

@Test
public class Time_Bench_Assertion {
    @TestCase[data in csv("./benchmarks/bench-default.Test_Time_Bench_Configure.csv")]
    func test_time_assertion_bench_1(data: HashMap<String, String>) {
        let time_median = Float64.parse(data["Median"])
        @Expect(time_median < 120000000.0 && time_median > 80000000.0)
    }

    @TestCase[data in csv("./benchmarks/bench-default.Test_Time_Bench_Strategy.csv")]
    func test_time_assertion_bench_2(data: HashMap<String, String>) {
        let time_median = Float64.parse(data["Median"])
        @Expect(time_median < 120000000.0 && time_median > 80000000.0)
    }

    @TestCase[data in csv("./benchmarks/bench-default.Test_Time_Bench_Types.csv")]
    func test_time_assertion_bench_3(data: HashMap<String, String>) {
        let time_median = Float64.parse(data["Median"])
        @Expect(time_median < 120000000.0 && time_median > 80000000.0)
    }
}
