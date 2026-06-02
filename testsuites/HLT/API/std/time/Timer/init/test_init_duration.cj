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

var cnt1 = 0
var cnt2 = 0
var cnt3 = 0

@Test
class Test_init_duration {
    @TestCase
    func test_init_duration_01(): Unit {
        let duration = Duration.nanosecond * -1 // 时间间隔为负，timer立即执行
        var timer = Timer.once(duration) {=> cnt1 += 1}
        sleep(Duration.millisecond)
        @Expect(cnt1, 1)
    }

    @TestCase
    func test_init_duration_02(): Unit {
        let duration = Duration.Zero // 时间间隔为负，timer立即执行
        var timer = Timer.once(duration) {=> cnt2 += 1}
        sleep(Duration.millisecond)
        @Expect(cnt2, 1)
    }

    @TestCase
    func test_init_duration_03(): Unit {
        let duration = Duration.millisecond * 1000 // 时间间隔为正，timer经过duration后执行
        var timer = Timer.once(duration) {=> cnt3 += 1}
        @Expect(cnt3, 0)
        sleep(Duration.millisecond * 500)
        @Expect(cnt3, 0)
        sleep(Duration.millisecond * 1000)
        @Expect(cnt3, 1)
    }
}
