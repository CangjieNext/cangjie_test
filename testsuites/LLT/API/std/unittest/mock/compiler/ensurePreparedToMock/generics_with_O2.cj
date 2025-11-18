/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %enableO2 -Woff=all %n.cj -o %output %cmp_utest_opt --mock=on 2>&1
// EXEC-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

public class A {
    public static func foo<T>(x: T) { "original" }
    public func goo<T>(x: T) { "original" }
}

public func foo<T>(x: T) { "original" }

extend A {
    public static func extend_foo<T>(x: T) { "original" }
    public func extend_goo<T>(x: T) { "original" }
}

@Test
func test_foo() {
    @On(A.foo<Int64>(_)).returns("mocked Int")
    @On(A.foo<String>(_)).returns("mocked String")
    @Assert(A.foo<Int64>(10), "mocked Int")
    @Assert(A.foo<String>("10"), "mocked String")
}

@Test
func test_goo() {
    let a = mock<A>()
    @On(a.goo<Int64>(_)).returns("mocked Int")
    @On(a.goo<String>(_)).returns("mocked String")
    @Assert(a.goo<Int64>(10), "mocked Int")
    @Assert(a.goo<String>("10"), "mocked String")
}

interface I {
    @When[backend == "cjnative"]
    func foo<T>(x: Int64): String {
        return "x=${x}"
    }
}
 
@When[backend == "cjnative"]
@Test
func test_interface_with_generic_func() {
    let i = mock<I>()
    @On(i.foo<Int64>(_)).returns("mocked Int")
    @On(i.foo<String>(_)).returns("mocked String")
    @Expect(i.foo<Int64>(10), "mocked Int")
    @Expect(i.foo<String>(10), "mocked String")
}
