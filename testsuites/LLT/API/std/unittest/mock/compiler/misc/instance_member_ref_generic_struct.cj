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

struct S<T> {
    S(public var x: Int64) {}
}

class A<T> {
    public var x: S<T> = S(1)
}

extend<G> A<G> {
    public func foo() {
        x = S(20)
    }

    public func bar(): S<G> {
        x
    }
}

@Test
func test_assign() {
    unsafe {
        let a = mock<A<String>>()
        @On(a.x = _).throws(Exception())
        @AssertThrows[Exception](a.foo())
    }
}

@Test
func test_get() {
    unsafe {
        let a = mock<A<String>>()
        @On(a.x).returns(S<String>(20))

        @Assert(a.bar().x, 20)
    }
}
