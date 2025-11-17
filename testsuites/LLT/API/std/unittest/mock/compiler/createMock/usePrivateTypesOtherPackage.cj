/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// SEPARATE-FILE: other.cj
// EXEC-0: %compiler %cmp_opt %compile_lib_opt --mock=on -Woff=all other.cj -o libother.%middle
package other

private class P {}

public class Foo {
    private func foo(p: P): Unit {}

    private mut prop p: P {
        get() { P() }
        set(p) {}
    }

    public func accessFoo(f: Foo): Unit { f.foo(P()) }
    public func accessPSet(f: Foo): Unit { f.p = P() }
    public func accessPGet(f: Foo): Unit { f.p }
}

// SEPARATE-FILE: test.cj
// DEPENDENCE: ../helpers
// EXEC: %compiler %cmp_opt -Woff=all -p helpers --mock=on %compile_lib_opt --output p.%middle
// EXEC: %compiler %cmp_opt -Woff=all p.%middle test.cj libother.%middle -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
package default

import std.mock_test_util.*
import std.unittest.*
import std.unittest.testmacro.*

import other.*

@Test
public class TestA {
    public override func afterEach(): Unit {
        clearMatchers()
    }

    @TestCase
    func case1(): Unit {
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        try {
            Foo().accessFoo(mockedFoo)
        } catch (e: Exception) {
            println(e)
        }
        println("==============================")
    }

    @TestCase
    func case2(): Unit {
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        try {
            Foo().accessPSet(mockedFoo)
        } catch (e: Exception) {
            println(e)
        }
        println("==============================")
    }

    @TestCase
    func case3(): Unit {
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        try {
            Foo().accessPGet(mockedFoo)
        } catch (e: Exception) {
            println(e)
        }
        println("==============================")
    }

    @TestCase
    func case4(): Unit {
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        try {
            Foo().accessFooGeneric(mockedFoo)
        } catch (e: Exception) {
            println(e)
        }
        println("==============================")
    }
}

/* SCAN-IN
NoMockMatchersFoundException: There are no any matchers for method _CN5other3Foo23foo(Class-P)$ToMock_FooHCNat3AnyE
==============================
NoMockMatchersFoundException: There are no any matchers for method _CN5other3Foo25$pset(Class-P)$ToMock_FooHCNat3AnyE
==============================
NoMockMatchersFoundException: There are no any matchers for method _CN5other3Foo18$pget()$ToMock_FooHv
==============================
NoMockMatchersFoundException: There are no any matchers for method _CN5other3Foo33fooGeneric(Generics-T)$ToMock_FooIG_HCNat3AnyE
==============================
*/
