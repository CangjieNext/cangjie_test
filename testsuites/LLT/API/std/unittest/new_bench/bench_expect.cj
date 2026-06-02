/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt --bench --no-color | compare %f
// ASSERT: scan FAILED: 1
// ASSERT: scan test4
// ASSERT: scan-not test5
// ASSERT: scan-not Exception

import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*

var x = 0

// Tests that @Expect in benches fails immediately
@Test
class FooTest {
    @Bench
    @TestCase
    func test1(): Unit {
        sleep(Duration.millisecond)
        x += 1
        println("test${x}")
        @Expect(x % 5 != 4)
    }
}
