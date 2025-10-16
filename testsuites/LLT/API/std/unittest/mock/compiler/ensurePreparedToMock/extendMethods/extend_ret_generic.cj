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
    public func extFunc<T>(x: T): T {
        return x
    }

    public static func extStaticFunc<T>(x: T): T {
        return x
    }
}

@Test
func testExtFuncGenericMock(): Unit {
    let a = mock<A>()
    @On(a.extFunc<Int64>(_)).returns(10).times(1)
    @On(a.extFunc<Float64>(_)).returns(10.0).times(1)
    @Expect(a.extFunc<Int64>(1), 10)
    @Expect(a.extFunc<Float64>(1.0), 10.0)
}

@Test
func testExtStaticFuncGenericMock(): Unit {
    @On(A.extStaticFunc<Int64>(_)).returns(10).times(1)
    @On(A.extStaticFunc<Float64>(_)).returns(10.0).times(1)
    @Expect(A.extStaticFunc<Int64>(1), 10)
    @Expect(A.extStaticFunc<Float64>(1.0), 10.0)
}
