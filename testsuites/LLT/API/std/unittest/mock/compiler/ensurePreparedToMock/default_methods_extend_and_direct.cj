/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
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

interface I1 {
    func foo(): String {
        "I1::foo"
    }
}

interface I2 <: I1 {
    func foo(): String {
        "I2::foo"
    }
}


class A <: I1 {}

extend A <: I2 {}

@Test
func test() {
    let a = A()
    @Assert(a.foo(), "I1::foo")
}

@Test
func test_mocked() {
    let a = mock<A>()
    @On(a.foo()).returns("mocked")
    @Assert(a.foo(), "mocked")
}
