/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.runtime.*

var cnt = 0

@Test
class Test_operator {
    @TestCase
    func test_equal_01(): Unit {
        var timer1 = Timer.once(Duration.millisecond * 100) {=> cnt += 1}
        var timer2 = timer1
        var flag = timer1 == timer2
        @Expect(flag, true)
    }

    @TestCase
    func test_equal_02(): Unit {
        var timer1 = Timer.once(Duration.millisecond * 100) {=> cnt += 1}
        var timer2 = Timer.once(Duration.millisecond * 100) {=> cnt += 1}
        var flag = timer1 == timer2
        @Expect(flag, false)
    }

    @TestCase
    func test_notequal_01(): Unit {
        var timer1 = Timer.once(Duration.millisecond * 100) {=> cnt += 1}
        var timer2 = timer1
        var flag = timer1 != timer2
        @Expect(flag, false)
    }

    @TestCase
    func test_notequal_02(): Unit {
        var timer1 = Timer.once(Duration.millisecond * 100) {=> cnt += 1}
        var timer2 = Timer.once(Duration.millisecond * 100) {=> cnt += 1}
        var flag = timer1 != timer2
        @Expect(flag, true)
    }
}
