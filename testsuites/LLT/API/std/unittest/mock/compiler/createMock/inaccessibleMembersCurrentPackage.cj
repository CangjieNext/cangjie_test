/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../helpers
// EXEC: %compiler %cmp_opt -Woff=all -p helpers --mock=on %compile_lib_opt --output p.%middle
// EXEC: %compiler %cmp_opt -Woff=all p.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import std.mock_test_util.*
import std.unittest.*
import std.unittest.testmacro.*

class Foo {
    private let f1 = 1
    protected var f2 = 2
    protected prop p1: String {
        get() {
            println("original getter of p1 was called")
            "123"
        }
    }
    private mut prop p2: String {
        get() {
            println("original getter of name was called")
            "123"
        }
        set(x) {
            println("original setter of name was called")
            "123"
        }
    }
    private func foo1(x: String, y: Int64): String {
        println("original `foo1` was called")
        "my str"
    }
    protected func foo2(x: String, y: Int64): String {
        println("original `foo2` was called")
        "my str"
    }

    public func callFoo1(foo: Foo, x: String, y: Int64) {
        foo.foo1(x, y)
    }

    public func callFoo2(foo: Foo, x: String, y: Int64) {
        foo.foo2(x, y)
    }

    public func callP1Get(foo: Foo) {
        foo.p1
    }

    public func callP2Get(foo: Foo) {
        foo.p2
    }

    public func callP2Set(foo: Foo) {
        foo.p2 = "dsgf"
    }

    public func callF1Get(foo: Foo) {
        foo.f1
    }

    public func callF2Get(foo: Foo) {
        foo.f2
    }

    public func callF2Set(foo: Foo) {
        foo.f2 = 244
    }
}

@Test
public class TestA {
    public override func afterEach(): Unit {
        clearMatchers()
    }

    @TestCase
    func case1(): Unit {
        let foo = Foo()
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        try {
            foo.callFoo1(mockedFoo, "s", 22)
        } catch (e: NoMockMatchersFoundException) {
            println("mock accessor for `foo1` was called")
        }
        println("------------------------------")
    }

    @TestCase
    func case2(): Unit {
        let foo = Foo()
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        try {
            foo.callFoo2(mockedFoo, "s", 22)
        } catch (e: NoMockMatchersFoundException) {
            println("mock accessor for `foo2` was called")
        }
        println("------------------------------")
    }

    @TestCase
    func case3(): Unit {
        let foo = Foo()
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        try {
            foo.callP1Get(mockedFoo)
        } catch (e: NoMockMatchersFoundException) {
            println("mock accessor for `p1` getter was called")
        }
        println("------------------------------")
    }

    @TestCase
    func case4(): Unit {
        let foo = Foo()
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        try {
            foo.callP2Get(mockedFoo)
        } catch (e: NoMockMatchersFoundException) {
            println("mock accessor for `p2` getter was called")
        }
        try {
            foo.callP2Set(mockedFoo)
        } catch (e: NoMockMatchersFoundException) {
            println("mock accessor for `p2` setter was called")
        }
        println("------------------------------")
    }

    @TestCase
    func case5(): Unit {
        let foo = Foo()
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        try {
            foo.callF1Get(mockedFoo)
        } catch (e: NoMockMatchersFoundException) {
            println("mock accessor for accessing `f1` getter was called")
        }
        println("------------------------------")
    }

    @TestCase
    func case6(): Unit {
        let foo = Foo()
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        try {
            foo.callF2Get(mockedFoo)
        } catch (e: NoMockMatchersFoundException) {
            println("mock accessor for accessing `f2` getter was called")
        }
        try {
            foo.callF2Set(mockedFoo)
        } catch (e: NoMockMatchersFoundException) {
            println("mock accessor for accessing `f2` setter was called")
        }
        try {
            foo.callF2Get(mockedFoo)
        } catch (e: NoMockMatchersFoundException) {
            println("mock accessor for accessing `f2` getter was called (after modification)")
        }
        println("------------------------------")
    }
}

/* SCAN-IN
mock accessor for `foo1` was called
------------------------------
mock accessor for `foo2` was called
------------------------------
mock accessor for `p1` getter was called
------------------------------
mock accessor for `p2` getter was called
mock accessor for `p2` setter was called
------------------------------
mock accessor for accessing `f1` getter was called
------------------------------
mock accessor for accessing `f2` getter was called
mock accessor for accessing `f2` setter was called
mock accessor for accessing `f2` getter was called (after modification)
------------------------------
 */
