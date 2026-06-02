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
var cnt4 = 0

@Test
class Test_after {
    @TestCase
    func test_after_01(): Unit {
        var timer = Timer.after(
            Duration.Zero,
            {
                =>
                cnt1 += 1
                Option<Duration>.None
            }
        )
        sleep(Duration.millisecond * 200)
        @Expect(cnt1, 1)
    }

    @TestCase
    func test_after_02(): Unit {
        var timer = Timer.after(
            Duration.Zero,
            {
                =>
                let ret = if (cnt2 < 5) {
                    Some(Duration.millisecond * 100)
                } else {
                    Option<Duration>.None
                }
                cnt2 += 1
                ret
            }
        )
        sleep(Duration.millisecond * 1000)
        @Expect(cnt2, 6)
    }

    @TestCase
    func test_after_03(): Unit {
        var timer = Timer.after(
            Duration.Zero,
            {
                =>
                cnt3 += 1
                Some(Duration.millisecond * 1000)
            }
        )
        sleep(Duration.millisecond * 10900)
        @Expect(cnt3, 11)
        timer.cancel()
        sleep(Duration.millisecond * 10000)
        @Expect(cnt3, 11)
    }

    @TestCase
    func test_after_04(): Unit {
        var timer = Timer.after(
            Duration.Zero,
            {
                =>
                cnt4 += 1
                Some(Duration.nanosecond * -1)
            }
        )
        sleep(Duration.millisecond * 1000)
    }
}
