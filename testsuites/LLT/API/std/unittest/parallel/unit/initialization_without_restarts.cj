/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args --parallel=42 --no-color | compare %f
// ASSERT: scan-1 Test1.beforeAll
// ASSERT: scan-1 Test1.afterAll
// ASSERT: scan-3 Test2.beforeAll
// ASSERT: scan-3 Test2.afterAll
// ASSERT: scan-1 PASSED: 5

import std.unittest.*
import std.unittest.testmacro.*

@Test
class Test1 {
    var x: Int64 = 0

    public override func beforeAll() {
        println("Test1.beforeAll")
        x = 1
    }

    public override func afterAll() {
        println("Test1.afterAll")
        if (x != 3) {
            throw Exception()
        }
    }

    @TestCase
    func case11(): Unit {
        @Assert(x, 1)
        x++
    }

    @TestCase
    func case12(): Unit {
        @Assert(x, 2)
        x++
    }
}

@Test
@Parallel
class Test2 {
    var x: Int64 = 0

    public override func beforeAll() {
        println("Test2.beforeAll")
        x = 1
    }

    public override func afterAll() {
        println("Test2.afterAll")
        if (x != 2) {
            throw Exception()
        }
    }

    @TestCase
    func case21(): Unit {
        @Assert(x, 1)
        x++
    }

    @TestCase
    func case22(): Unit {
        @Assert(x, 1)
        x++
    }

    @TestCase
    func case23(): Unit {
        @Assert(x, 1)
        x++
    }
}
