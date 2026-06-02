/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*

@Test
class Test_UnsupportedException {
    @TestCase
    func test1(): Unit {
        let e1 = UnsupportedException()
        let e2 = UnsupportedException("UnsupportedException")
        @Expect(e1.message, "")
        @Expect(e2.message, "UnsupportedException")
        @Expect(e1.toString(), "UnsupportedException")
        @Expect(e2.toString(), "UnsupportedException: UnsupportedException")
    }

    @TestCase
    func test2(): Unit {
        try {
            throw UnsupportedException()
        } catch (e: UnsupportedException) {
            @Expect(e.message, "")
        }
    }

    @TestCase
    func test3(): Unit {
        try {
            throw UnsupportedException("this is test exception")
        } catch (e: UnsupportedException) {
            @Expect(e.message, "this is test exception")
        }
    }
}
