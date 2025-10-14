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

var obj = Object()
var arr = [1]

class FieldReordering {
    let f1: Int8 = 0
    let f2: Int64 = 0
    let f3: Int8 = 0
}

class RefSize {
    let f = obj
}

class ArrSize {
    let f = arr
}

@Test
@Measure[Runtime(AllocatedMemory)]
public class Test_Bench_Mem {
    @Bench
    @Configure[warmup: 100, minDuration: 1 * Duration.second]
    func boxInt64(): Unit {
        obj = Box(Int64(0))
    }

    @Bench
    @Configure[warmup: 100, minDuration: 0.1 * Duration.second]
    func boxInt8(): Unit {
        obj = Box(Int8(8))
    }

    @Bench
    @Configure[warmup: 100, minDuration: 0.1 * Duration.second]
    func atomicInt(): Unit {
        obj = AtomicInt64(0)
    }

    @Bench
    @Configure[warmup: 100, minDuration: 0.1 * Duration.second]
    func array(): Unit {
        arr = [1,2,3,4]
    }

    @Bench
    @Configure[warmup: 100, minDuration: 0.1 * Duration.second]
    func object(): Unit {
        obj = Object()
    }

    @Bench
    @Configure[warmup: 100, minDuration: 0.1 * Duration.second]
    func fieldReordering(): Unit {
        obj = FieldReordering()
    }

    @Bench
    @Configure[warmup: 100, minDuration: 0.1 * Duration.second]
    func refSize(): Unit {
        obj = RefSize()
    }

    @Bench
    @Configure[warmup: 100, minDuration: 0.1 * Duration.second]
    func arrSize(): Unit {
        obj = ArrSize()
    }
     
    @TestCase[data in csv("./benchmarks/bench-default.Test_Bench_Mem.csv")]
    func test_time_assertion_bench_1(data: HashMap<String, String>) {
        let time_median = Float64.parse(data["Median"])

        match (data["Case"]) {
            case "boxInt64" => @Expect(abs(time_median - 16.0) < 1.0)
            case "boxInt8" => @Expect(abs(time_median - 16.0) < 1.0)
            case "atomicInt" => @Expect(abs(time_median - 16.0) < 1.0)
            case "array" => @Expect(abs(time_median - 48.0) < 1.0)
            case "object" => @Expect(abs(time_median - 8.0) < 1.0)
            case "fieldReordering" => @Expect(abs(time_median - 32.0) < 1.0)
            case "refSize" => @Expect(abs(time_median - 16.0) < 1.0)
            case "arrSize" => @Expect(abs(time_median - 32.0) < 1.0)
            case _ => @FailExpect("Uncovered case")
        }
        
    }

}

