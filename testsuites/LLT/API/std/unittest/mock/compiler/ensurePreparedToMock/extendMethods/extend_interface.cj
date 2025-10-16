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

class A {}

extend A <: ToString {
    public func toString(): String {
        return "A"
    }
}

@Test
func testExtInterfaceMock(): Unit {
    let a = mock<A>()
    @On(a.toString()).returns("B").times(1)
    @Expect(a.toString(), "B")
}

interface I {
    public func ifaceFunc(x: Int64): String
    @When[backend == "cjnative"]
    public func ifaceGenericFunc<T>(x: T): String
    public static func ifaceStaticFunc(x: Int64): String
    public static func ifaceStaticGenericFunc<T>(x: T): String
}

extend A <: I {
    public func ifaceFunc(x: Int64): String {
        return "original"
    }

    @When[backend == "cjnative"]
    public func ifaceGenericFunc<T>(x: T): String {
        return "original"
    }

    public static func ifaceStaticFunc(x: Int64): String {
        return "original"
    }

    public static func ifaceStaticGenericFunc<T>(x: T): String {
        return "original"
    }
}

@Test
func testExtFuncMock(): Unit {
    let a = mock<A>()
    @On(a.ifaceFunc(_)).returns("mocked").times(1)
    @Expect(a.ifaceFunc(10), "mocked")
}

@Test
func testExtStaticFuncMock(): Unit {
    @On(A.ifaceStaticFunc(_)).returns("mocked").times(1)
    @Expect(A.ifaceStaticFunc(10), "mocked")
}

@When[backend == "cjnative"]
@Test
func testExtGenericFuncMock(): Unit {
    let a = mock<A>()
    @On(a.ifaceGenericFunc<Int64>(_)).returns("mocked Int").times(1)
    @On(a.ifaceGenericFunc<Float64>(_)).returns("mocked Float").times(1)
    @Expect(a.ifaceGenericFunc<Int64>(10), "mocked Int")
    @Expect(a.ifaceGenericFunc<Float64>(10.0), "mocked Float")
}

@Test
func testExtStaticGenericFuncMock(): Unit {
    @On(A.ifaceStaticGenericFunc<Int64>(_)).returns("mocked Int").times(1)
    @On(A.ifaceStaticGenericFunc<Float64>(_)).returns("mocked Float").times(1)
    @Expect(A.ifaceStaticGenericFunc<Int64>(10), "mocked Int")
    @Expect(A.ifaceStaticGenericFunc<Float64>(10.0), "mocked Float")
}
