/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../helpers
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

class ReturnedBar <: ToString {
    private let x: String
    init(x: String) {
        this.x = x
    }
    public override func toString() {
        "This is ReturnedBar (${x})"
    }
}

abstract class Foo {
    public func foo(x: PassedBar, y: PassedAnotherBar): ReturnedBar
    public func foo_impl(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        ReturnedBar("0")
    }
    public open func foo_impl_2(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        ReturnedBar("0")
    }
}

open class FooDerived <: Foo {
    public open func foo(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        ReturnedBar("0")
    }
    public open func foo_impl_2(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        ReturnedBar("0")
    }
    public open func foo_impl_3(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        ReturnedBar("0")
    }
    public func foo_impl_4(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        ReturnedBar("0")
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
        addMatcher(
            "_CN7default3Foo3fooHCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("1")
        )
        println("Return value: " + mockedFoo.foo(PassedBar(), PassedAnotherBar()).toString())
        println("==============================")
    }

    @TestCase
    func case2(): Unit {
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default3Foo8foo_implHCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("2")
        )
        println("Return value: " + mockedFoo.foo_impl(PassedBar(), PassedAnotherBar()).toString())
        println("==============================")
    }

    @TestCase
    func case3(): Unit {
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default3Foo10foo_impl_2HCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("3")
        )
        println("Return value: " + mockedFoo.foo_impl_2(PassedBar(), PassedAnotherBar()).toString())
        println("==============================")
    }

    @TestCase
    func case4(): Unit {
        let mockedFoo = unsafe { createMock<FooDerived>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default10FooDerived3fooHCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("4")
        )
        println("Return value: " + mockedFoo.foo(PassedBar(), PassedAnotherBar()).toString())
        println("==============================")
    }

    @TestCase
    func case5(): Unit {
        let mockedFoo = unsafe { createMock<FooDerived>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default10FooDerived10foo_impl_2HCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("5")
        )
        println("Return value: " + mockedFoo.foo_impl_2(PassedBar(), PassedAnotherBar()).toString())
        println("==============================")
    }

    @TestCase
    func case6(): Unit {
        let mockedFoo = unsafe { createMock<FooDerived>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default10FooDerived10foo_impl_3HCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("6")
        )
        println("Return value: " + mockedFoo.foo_impl_3(PassedBar(), PassedAnotherBar()).toString())
        println("==============================")
    }

    @TestCase
    func case7(): Unit {
        let mockedFoo = unsafe { createMock<FooDerived>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default10FooDerived10foo_impl_4HCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("7")
        )
        println("Return value: " + mockedFoo.foo_impl_4(PassedBar(), PassedAnotherBar()).toString())
        println("==============================")
    }
}

/* SCAN-IN
Actual call: foo("This is Bar", "This is AnotherBar")
Declared method: foo(x[1, P, ND], y[2, P, ND])[A, ND, AC, NA, abstractClass.cj:40:17]: Class-ReturnedBar
Declared function name: foo -> _CN7default3Foo3fooHCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (1)
==============================
Actual call: foo_impl("This is Bar", "This is AnotherBar")
Declared method: foo_impl(x[1, P, ND], y[2, P, ND])[NA, ND, AC, NA, abstractClass.cj:41:17]: Class-ReturnedBar
Declared function name: foo_impl -> _CN7default3Foo8foo_implHCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (2)
==============================
Actual call: foo_impl_2("This is Bar", "This is AnotherBar")
Declared method: foo_impl_2(x[1, P, ND], y[2, P, ND])[NA, ND, AC, NA, abstractClass.cj:44:22]: Class-ReturnedBar
Declared function name: foo_impl_2 -> _CN7default3Foo10foo_impl_2HCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (3)
==============================
Actual call: foo("This is Bar", "This is AnotherBar")
Declared method: foo(x[1, P, ND], y[2, P, ND])[NA, ND, AC, NA, abstractClass.cj:50:22]: Class-ReturnedBar
Declared function name: foo -> _CN7default10FooDerived3fooHCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: FooDerived -> _CN7default10FooDerivedE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (4)
==============================
Actual call: foo_impl_2("This is Bar", "This is AnotherBar")
Declared method: foo_impl_2(x[1, P, ND], y[2, P, ND])[NA, ND, AC, NA, abstractClass.cj:53:22]: Class-ReturnedBar
Declared function name: foo_impl_2 -> _CN7default10FooDerived10foo_impl_2HCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: FooDerived -> _CN7default10FooDerivedE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (5)
==============================
Actual call: foo_impl_3("This is Bar", "This is AnotherBar")
Declared method: foo_impl_3(x[1, P, ND], y[2, P, ND])[NA, ND, AC, NA, abstractClass.cj:56:22]: Class-ReturnedBar
Declared function name: foo_impl_3 -> _CN7default10FooDerived10foo_impl_3HCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: FooDerived -> _CN7default10FooDerivedE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (6)
==============================
Actual call: foo_impl_4("This is Bar", "This is AnotherBar")
Declared method: foo_impl_4(x[1, P, ND], y[2, P, ND])[NA, ND, AC, NA, abstractClass.cj:59:17]: Class-ReturnedBar
Declared function name: foo_impl_4 -> _CN7default10FooDerived10foo_impl_4HCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: FooDerived -> _CN7default10FooDerivedE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (7)
==============================
 */
