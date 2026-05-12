/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// (not Windows) EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// (not Windows) RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.runtime.*

let sig_nums: Array<Int32> = [
    -1,
    0,
    32,
    Int32.Max,
    Int32.Min
]
let func_1 = {
    i: Int32 =>
        println("hello, cangjie${i}");
        true
}

@Test
class Test_Signal_Illegal {
    @TestCase
    func test_sig_01(): Unit {
        for (signal in sig_nums) {
            @AssertThrows[IllegalArgumentException](registerSignalHandler(Signal(signal, "${signal}"), func_1))
        }
    }

    @TestCase
    func test_sig_02(): Unit {
        for (signal in sig_nums) {
            @AssertThrows[IllegalArgumentException](unregisterSignalHandler(Signal(signal, "${signal}"), func_1))
        }
    }

    @TestCase
    func test_sig_03(): Unit {
        for (signal in sig_nums) {
            @AssertThrows[IllegalArgumentException](resetSignalHandler([Signal(signal, "${signal}")]))
        }
    }
}
