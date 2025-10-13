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

private class P {}

class Foo {
    private func foo(p: P): Unit {}

    private mut prop p: P {
        get() { P() }
        set(p) {}
    }

    public func accessFoo(f: Foo): Unit { f.foo(P()) }
    public func accessPSet(f: Foo): Unit { f.p = P() }
    public func accessPGet(f: Foo): Unit { f.p }
}

@When[backend != "cjnative"]
let case1Mn = "_ZN7default3Foo23foo(Class-P)$ToMock_FooEC_ZN8std.core3AnyE"
@When[backend == "cjnative"]
let case1Mn = "_CN7default3Foo23foo(Class-P)$ToMock_FooHCNat3AnyE"

@When[backend != "cjnative"]
let case2Mn = "_ZN7default3Foo25$pset(Class-P)$ToMock_FooEC_ZN8std.core3AnyE"
@When[backend == "cjnative"]
let case2Mn = "_CN7default3Foo25$pset(Class-P)$ToMock_FooHCNat3AnyE"

@When[backend != "cjnative"]
let case3Mn = "_ZN7default3Foo18$pget()$ToMock_FooEv"
@When[backend == "cjnative"]
let case3Mn = "_CN7default3Foo18$pget()$ToMock_FooHv"

@Test
public class TestA {
    public override func afterEach(): Unit {
        clearMatchers()
    }

    @TestCase
    func case1(): Unit {
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        addMatcher(case1Mn, [P()], ())
        Foo().accessFoo(mockedFoo)
        println("==============================")
    }

    @TestCase
    func case2(): Unit {
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        addMatcher(case2Mn, [], P())
        Foo().accessPSet(mockedFoo)
        println("==============================")
    }

    @TestCase
    func case3(): Unit {
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        addMatcher(case3Mn, [P()], ())
        Foo().accessPGet(mockedFoo)
        println("==============================")
    }
}

/* SCAN-IN
Actual call: foo(Class-P)([not ToString])
Declared method: foo(Class-P)(p[1, P, ND])[NA, ND, AC, NA, usePrivateTypes.cj:21:18]: Interface-Any
Declared function name: foo(Class-P) -> _CN7default3Foo23foo(Class-P)$ToMock_FooHCNat3AnyE
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
==============================
Actual call: $pset(Class-P)([not ToString])
Declared method: $pset(Class-P)(p[1, P, ND])[NA, ND, AC, NA, usePrivateTypes.cj:25:9]: Interface-Any
Declared function name: $pset(Class-P) -> _CN7default3Foo25$pset(Class-P)$ToMock_FooHCNat3AnyE
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
==============================
Actual call: $pget()()
Declared method: $pget()()[NA, ND, AC, NA, usePrivateTypes.cj:24:9]: Interface-Any
Declared function name: $pget() -> _CN7default3Foo18$pget()$ToMock_FooHv
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
==============================
*/
