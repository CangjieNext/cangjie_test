/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt -Woff=all --test %f -o %output 2>&1
// EXEC-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

interface I {
    static func foo(): String { "I::foo" }
    static func bar(): String { foo() }
}

open class A1 <: I {
    public static func foo(): String { "A1::foo" }
}

open class A2 <: A1 {
    public static func foo(): String { "A2::foo" }
}

@Test
func test_no_mock() {
    @Assert(A2.bar(), "A2::foo")
}

@Test
func test_mock() {
    @On(A2.foo()).returns("mocked")

    @Assert(A2.bar(), "mocked")
}
