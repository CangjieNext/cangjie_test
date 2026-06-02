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
class TestOptionIsNone {
    @TestCase
    func normalTest(): Unit {
        let a: ?String = None
        let b: ?String = "hello"
        var c = Option<String>.None
        var d = Option<String>.Some("test")

        @Expect(a.isNone())
        @Expect(!b.isNone())
        @Expect(c.isNone())
        @Expect(!d.isNone())
    }

    @TestCase
    func expandTest(): Unit {
        let a: ?A = None
        let b: ?A = A(2023)

        @Expect(a.isNone())
        @Expect(!b.isNone())
    }
}

class A {
    public A(let a: Int64) {}
}
