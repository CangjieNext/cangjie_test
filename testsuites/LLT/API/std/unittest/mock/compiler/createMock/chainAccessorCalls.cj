/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../helpers
// (CJNATIVE) EXEC: %compiler %cmp_opt %pkg_opt -Woff=all -p helpers --mock=on %compile_lib_opt --output p.%middle
// (CJNATIVE) EXEC: %compiler %cmp_opt -Woff=all p.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// (CJNATIVE) EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import std.mock_test_util.*
import std.unittest.*
import std.unittest.testmacro.*

open class OC {}

class Foo {
    var x = OC()
    func test1(): Bar {
        Bar()
    }
}

class Bar <: OC {
    var x: Foo = Foo()
    func test2(): Foo {
        Foo()
    }
}

@Test
public class TestA {
    public override func afterEach(): Unit {
        clearMatchers()
    }

    @TestCase
    func case1(): Unit {
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        let mockedBar = unsafe { createMock<Bar>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default3Foo16test1$ToMock_FooHv",
            [1, "my str", 3],
            mockedBar
        )
        addMatcher(
            "_CN7default3Bar16test2$ToMock_BarHv",
            [1, "my str", 3],
            mockedFoo
        )
        mockedFoo.test1().test2()
        println("==============================")
    }

    @TestCase
    func case2(): Unit {
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        let mockedBar = unsafe { createMock<Bar>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default3Foo16x$get$ToMock_FooHv",
            [1, "my str", 3],
            mockedBar
        )
        addMatcher(
            "_CN7default3Bar16x$get$ToMock_BarHv",
            [1, "my str", 3],
            mockedFoo
        )
        mockedBar.x.x
        println("==============================")
    }

    @TestCase
    func case3(): Unit {
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        let mockedBar = unsafe { createMock<Bar>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default3Foo16x$get$ToMock_FooHv",
            [1, "my str", 3],
            mockedBar
        )
        addMatcher(
            "_CN7default3Bar16x$get$ToMock_BarHv",
            [1, "my str", 3],
            mockedFoo
        )
        addMatcher(
            "_CN7default3Foo16test1$ToMock_FooHv",
            [1, "my str", 3],
            mockedBar
        )
        addMatcher(
            "_CN7default3Bar16test2$ToMock_BarHv",
            [1, "my str", 3],
            mockedFoo
        )
        mockedBar.x.test1().x.test1().test2().test1().x.x
        println("==============================")
    }
}

/* SCAN-IN
Actual call: test1()
Declared method: test1()[NA, ND, AC, NA, chainAccessorCalls.cj:21:10]: Class-Bar
Declared function name: test1 -> _CN7default3Foo16test1$ToMock_FooHv
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Actual call: test2()
Declared method: test2()[NA, ND, AC, NA, chainAccessorCalls.cj:28:10]: Class-Foo
Declared function name: test2 -> _CN7default3Bar16test2$ToMock_BarHv
Outer decl name: Bar -> _CN7default3BarE
Receiver: [doesn't implement ToString]
------------------------------
==============================
Actual call: x$get()
Declared field getter: x()[NA, ND, AC, HS, chainAccessorCalls.cj:27:9]: Class-Foo
Declared function name: x$get -> _CN7default3Bar16x$get$ToMock_BarHv
Outer decl name: Bar -> _CN7default3BarE
Receiver: [doesn't implement ToString]
------------------------------
Actual call: x$get()
Declared field getter: x()[NA, ND, AC, HS, chainAccessorCalls.cj:20:9]: Class-OC
Declared function name: x$get -> _CN7default3Foo16x$get$ToMock_FooHv
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
==============================
Actual call: x$get()
Declared field getter: x()[NA, ND, AC, HS, chainAccessorCalls.cj:27:9]: Class-Foo
Declared function name: x$get -> _CN7default3Bar16x$get$ToMock_BarHv
Outer decl name: Bar -> _CN7default3BarE
Receiver: [doesn't implement ToString]
------------------------------
Actual call: test1()
Declared method: test1()[NA, ND, AC, NA, chainAccessorCalls.cj:21:10]: Class-Bar
Declared function name: test1 -> _CN7default3Foo16test1$ToMock_FooHv
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Actual call: x$get()
Declared field getter: x()[NA, ND, AC, HS, chainAccessorCalls.cj:27:9]: Class-Foo
Declared function name: x$get -> _CN7default3Bar16x$get$ToMock_BarHv
Outer decl name: Bar -> _CN7default3BarE
Receiver: [doesn't implement ToString]
------------------------------
Actual call: test1()
Declared method: test1()[NA, ND, AC, NA, chainAccessorCalls.cj:21:10]: Class-Bar
Declared function name: test1 -> _CN7default3Foo16test1$ToMock_FooHv
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Actual call: test2()
Declared method: test2()[NA, ND, AC, NA, chainAccessorCalls.cj:28:10]: Class-Foo
Declared function name: test2 -> _CN7default3Bar16test2$ToMock_BarHv
Outer decl name: Bar -> _CN7default3BarE
Receiver: [doesn't implement ToString]
------------------------------
Actual call: test1()
Declared method: test1()[NA, ND, AC, NA, chainAccessorCalls.cj:21:10]: Class-Bar
Declared function name: test1 -> _CN7default3Foo16test1$ToMock_FooHv
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Actual call: x$get()
Declared field getter: x()[NA, ND, AC, HS, chainAccessorCalls.cj:27:9]: Class-Foo
Declared function name: x$get -> _CN7default3Bar16x$get$ToMock_BarHv
Outer decl name: Bar -> _CN7default3BarE
Receiver: [doesn't implement ToString]
------------------------------
Actual call: x$get()
Declared field getter: x()[NA, ND, AC, HS, chainAccessorCalls.cj:20:9]: Class-OC
Declared function name: x$get -> _CN7default3Foo16x$get$ToMock_FooHv
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
==============================
 */
