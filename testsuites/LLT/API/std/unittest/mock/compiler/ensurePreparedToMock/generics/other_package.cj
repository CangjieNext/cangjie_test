/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: otherPackage.cj

// EXEC: %compiler %cmp_opt -Woff=all --mock=on %compile_lib_opt otherPackage.cj -o libotherPackage.%middle 2>&1
// EXEC: %compiler %cmp_opt -Woff=all --test %f libotherPackage.%middle -o %output 2>&1
// EXEC-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

package default

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

import otherPackage.*

@Test
func testGlobalGenericFoo(): Unit {
    @On(genericFoo<Int64>(_)).returns("mocked Int")
    @On(genericFoo<Float64>(_)).returns("mocked Float")
    @On(genericFoo<String>(_)).returns("mocked String")
    @Expect(genericFoo<Int64>(1), "mocked Int")
    @Expect(genericFoo<Float64>(1.0), "mocked Float")
    @Expect(genericFoo<String>("1"), "mocked String")
}

@Test
func testStaticGenericFoo(): Unit {
    @On(OtherClass.genericFoo<Int64>(_)).returns("mocked Int")
    @On(OtherClass.genericFoo<Float64>(_)).returns("mocked Float")
    @On(OtherClass.genericFoo<String>(_)).returns("mocked String")
    @Expect(OtherClass.genericFoo<Int64>(1), "mocked Int")
    @Expect(OtherClass.genericFoo<Float64>(1.0), "mocked Float")
    @Expect(OtherClass.genericFoo<String>("1"), "mocked String")
}

@Test
func testStaticGenericRetGenericFoo(): Unit {
    @On(OtherClass.id<Int64>(_)).returns(1)
    @On(OtherClass.id<Float64>(_)).returns(1.0)
    @On(OtherClass.id<String>(_)).returns("1")
    @Expect(OtherClass.id<Int64>(2), 1)
    @Expect(OtherClass.id<Float64>(2.0), 1.0)
    @Expect(OtherClass.id<String>("2"), "1")
}
