/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../helpers
// (CJNATIVE) EXEC: %compiler %cmp_opt -Woff=all -p helpers --mock=on %compile_lib_opt --output p.%middle
// (CJNATIVE) EXEC: %compiler %cmp_opt -Woff=all p.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// (CJNATIVE) EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import std.mock_test_util.*
import std.unittest.*
import std.unittest.testmacro.*

class PassedBar <: ToString {
    public override func toString() {
        "This is Bar"
    }
}

class PassedAnotherBar <: ToString {
    public override func toString() {
        "This is AnotherBar"
    }
}

class Foo {
    public func foo1(x: PassedBar, y: PassedAnotherBar): Int64 {
        1
    }
    public func foo2(): Int32 {
        2
    }
    public func foo3(y: PassedAnotherBar): Int16 {
        3
    }
    public func foo4(x: PassedBar, y: PassedAnotherBar): Int8 {
        4
    }
    public func bar1(x: PassedBar): Float64 {
        5.0
    }
    public func bar2(y: PassedAnotherBar): Float32 {
        6.1
    }
    public func bar3(): Float16 {
        7.2
    }
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        setReturnDefaultMode()
        println("Return value of foo1: `" + mockedFoo.foo1(PassedBar(), PassedAnotherBar()).toString() + "`")
        println("Return value of foo2: `" + mockedFoo.foo2().toString() + "`")
        println("Return value of foo3: `" + mockedFoo.foo3(PassedAnotherBar()).toString() + "`")
        println("Return value of foo4: `" + mockedFoo.foo4(PassedBar(), PassedAnotherBar()).toString() + "`")
    }

    @TestCase
    func case2(): Unit {
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        setReturnDefaultMode()
        println("Return value of bar1: `" + mockedFoo.bar1(PassedBar()).toString() + "`")
        println("Return value of bar2: `" + mockedFoo.bar2(PassedAnotherBar()).toString() + "`")
        println("Return value of bar3: `" + mockedFoo.bar3().toString() + "`")
    }
}

/* SCAN-IN
-------- Called with ReturnDefault --------
Actual call: foo1("This is Bar", "This is AnotherBar")
Declared method: foo1(x[1, P, ND], y[2, P, ND])[NA, D, AC, NA, numbers.cj:30:17]: Int64
Declared function name: foo1 -> _CN7default3Foo4foo1HCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Return value of foo1: `0`
-------- Called with ReturnDefault --------
Actual call: foo2()
Declared method: foo2()[NA, D, AC, NA, numbers.cj:33:17]: Int32
Declared function name: foo2 -> _CN7default3Foo4foo2Hv
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Return value of foo2: `0`
-------- Called with ReturnDefault --------
Actual call: foo3("This is AnotherBar")
Declared method: foo3(y[1, P, ND])[NA, D, AC, NA, numbers.cj:36:17]: Int16
Declared function name: foo3 -> _CN7default3Foo4foo3HCNY_16PassedAnotherBarE
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Return value of foo3: `0`
-------- Called with ReturnDefault --------
Actual call: foo4("This is Bar", "This is AnotherBar")
Declared method: foo4(x[1, P, ND], y[2, P, ND])[NA, D, AC, NA, numbers.cj:39:17]: Int8
Declared function name: foo4 -> _CN7default3Foo4foo4HCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Return value of foo4: `0`
-------- Called with ReturnDefault --------
Actual call: bar1("This is Bar")
Declared method: bar1(x[1, P, ND])[NA, D, AC, NA, numbers.cj:42:17]: Float64
Declared function name: bar1 -> _CN7default3Foo4bar1HCNY_9PassedBarE
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Return value of bar1: `0.000000`
-------- Called with ReturnDefault --------
Actual call: bar2("This is AnotherBar")
Declared method: bar2(y[1, P, ND])[NA, D, AC, NA, numbers.cj:45:17]: Float32
Declared function name: bar2 -> _CN7default3Foo4bar2HCNY_16PassedAnotherBarE
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Return value of bar2: `0.000000`
-------- Called with ReturnDefault --------
Actual call: bar3()
Declared method: bar3()[NA, D, AC, NA, numbers.cj:48:17]: Float16
Declared function name: bar3 -> _CN7default3Foo4bar3Hv
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Return value of bar3: `0.000000`
 */
