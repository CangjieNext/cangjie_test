/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %cmp_utest_opt %enableO2 %f -o %output
// RUN-EXEC: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args --bench --reportFormat=csv --reportPath=.
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args

import std.time.*
import std.sync.*
import std.fs.*
import std.convert.*
import std.collection.*
import stdx.unittest.data.*
import std.math.*
import std.runtime.*

@Test
public class Test_Bench_GC {

    @Bench
    @Configure[warmup: 10, minDuration: 1.0 * Duration.second]
    func sleep(): Unit {
        sleep(Duration.millisecond*20)
    }

     
    @TestCase[data in csv("./benchmarks/bench-default.Test_Bench_GC.csv")]
    func test_time_assertion_bench_1(data: HashMap<String, String>) {
        let result = Float64.parse(data["Mean"])

        match (data["Case"]) {
            case "sleep" => @Expect(abs(result - 20000000.0) < 2000000.0)
            case _ => @FailExpect("Uncovered case")
        }
        
    }
}

