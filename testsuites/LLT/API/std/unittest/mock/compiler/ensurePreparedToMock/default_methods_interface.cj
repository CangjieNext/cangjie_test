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
import std.unittest.mock.*
import std.unittest.testmacro.*
import std.unittest.mock.mockmacro.*

interface I {
    public static func foo(): String { "original" }

    public static func use_ref_call(): String {
        return foo()
    }

    public static func use_ref(): String {
        let f = foo
        return f()
    }
}

func use_ma_call(): String {
    return I.foo()
}

func use_ma(): String {
    let f = I.foo
    return f()
}

class A <: I {}

@Test
func test(): Unit {
    @On(I.foo()).returns("mocked")
    @Expect(use_ma_call(), "mocked")
    @Expect(use_ma(), "mocked")
    @Expect(I.use_ref_call(), "mocked")
    @Expect(I.use_ref(), "mocked")
}

@Test
func test_mock_A(): Unit {
    @On(I.foo()).returns("mocked")
    @On(A.foo()).returns("mocked A")
    @Expect(A.foo(), "mocked A")
    @Expect(I.foo(), "mocked")
}

