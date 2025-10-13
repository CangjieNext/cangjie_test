/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: classWithoutExtend.cj

// EXEC: %compiler %cmp_opt -Woff=all %compile_lib_opt classWithoutExtend.cj -o libclassWithoutExtend.%middle --mock=on 2>&1
// EXEC: %compiler %cmp_opt -Woff=all --test %f libclassWithoutExtend.%middle -o %output --mock=on 2>&1
// EXEC-0: %run %run_opt %output %run_utest_opt %run_args 2>&1
package classWithoutExtend

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

import classWithoutExtend.classPackage.*

extend A {
    public func extFunc(x: Int): String {
        return "original"
    }

    public static func extStaticFunc(x: Int): String {
        return "original"
    }

    public func extGenericFunc<T>(x: T): String {
        return "original"
    }

    public static func extStaticGenericFunc<T>(x: T): String {
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
func testExtGenericFuncMock(): Unit {
    let a = mock<A>()
    @On(a.extGenericFunc<Int64>(_)).returns("mocked Int").times(1)
    @On(a.extGenericFunc<Float64>(_)).returns("mocked Float").times(1)
    @Expect(a.extGenericFunc<Int64>(10), "mocked Int")
    @Expect(a.extGenericFunc<Float64>(10.0), "mocked Float")
}

@Test
func testExtStaticGenericFuncMock(): Unit {
    @On(A.extStaticGenericFunc<Int64>(_)).returns("mocked Int").times(1)
    @On(A.extStaticGenericFunc<Float64>(_)).returns("mocked Float").times(1)
    @Expect(A.extStaticGenericFunc<Int64>(10), "mocked Int")
    @Expect(A.extStaticGenericFunc<Float64>(10.0), "mocked Float")
}
