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

extend A {
    public func extFunc(x: Int): String {
        return "original"
    }

    public static func extStaticFunc(x: Int): String {
        return "original"
    }

    public func extFuncGeneric<T>(x: T): String {
        return "original"
    }

    public static func extStaticFuncGeneric<T>(x: T): String {
        return "original"
    }
}

@Test
func testExtFuncMock(): Unit {
    let a = mock<A>()
    @On(a.extFunc(_)).returns("mocked").times(1)
    @Expect(a.extFunc(10), "mocked")
}

@Test
func testExtStaticFuncMock(): Unit {
    @On(A.extStaticFunc(_)).returns("mocked").times(1)
    @Expect(A.extStaticFunc(10), "mocked")
}

@Test
func testExtFuncGenericMock(): Unit {
    let a = mock<A>()
    @On(a.extFuncGeneric<Int64>(_)).returns("mocked Int").times(1)
    @On(a.extFuncGeneric<Float64>(_)).returns("mocked Float").times(1)
    @Expect(a.extFuncGeneric<Int64>(1), "mocked Int")
    @Expect(a.extFuncGeneric<Float64>(1.0), "mocked Float")
}

@Test
func testExtStaticFuncGenericMock(): Unit {
    @On(A.extStaticFuncGeneric<Int64>(_)).returns("mocked Int").times(1)
    @On(A.extStaticFuncGeneric<Float64>(_)).returns("mocked Float").times(1)
    @Expect(A.extStaticFuncGeneric<Int64>(1), "mocked Int")
    @Expect(A.extStaticFuncGeneric<Float64>(1.0), "mocked Float")
}
