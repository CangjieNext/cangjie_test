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

class Foo {
    public func foo(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        println("original `foo` was called")
        ReturnedBar("original")
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
            "_CN7default3Foo3fooHCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("2")
        )
        let y = mockedFoo.foo(PassedBar(), PassedAnotherBar())
        println("Return value: ${y}")
        println("==============================")
    }

    func makeMock() {
        unsafe { createMock<Foo>(dummyMockingCallHandler) }
    }

    @TestCase
    func case3(): Unit {
        let mockedFoo = makeMock()
        addMatcher(
            "_CN7default3Foo3fooHCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("3")
        )
        let y = mockedFoo.foo(PassedBar(), PassedAnotherBar())
        println("Return value: ${y}")
        println("==============================")
    }

    func callMocked(foo: Foo) {
        foo.foo(PassedBar(), PassedAnotherBar())
    }

    @TestCase
    func case4(): Unit {
        let mockedFoo = makeMock()
        addMatcher(
            "_CN7default3Foo3fooHCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("4")
        )
        let y = callMocked(mockedFoo)
        println("Return value: ${y}")
        println("==============================")
    }

    func printReturnValue(x: Any) {
        match (x) {
            case x: ReturnedBar => println("Return value: ${x}")
            case _ => throw Exception()
        }
    }

    @TestCase
    func case5(): Unit {
        let mockedFoo = makeMock()
        addMatcher(
            "_CN7default3Foo3fooHCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("5")
        )
        let y = callMocked(mockedFoo)
        printReturnValue(y)
        println("==============================")
    }
}

/* SCAN-IN
Actual call: foo("This is Bar", "This is AnotherBar")
Declared method: foo(x[1, P, ND], y[2, P, ND])[NA, ND, AC, NA, basic.cj:40:17]: Class-ReturnedBar
Declared function name: foo -> _CN7default3Foo3fooHCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (1)
==============================
Actual call: foo("This is Bar", "This is AnotherBar")
Declared method: foo(x[1, P, ND], y[2, P, ND])[NA, ND, AC, NA, basic.cj:40:17]: Class-ReturnedBar
Declared function name: foo -> _CN7default3Foo3fooHCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (2)
==============================
Actual call: foo("This is Bar", "This is AnotherBar")
Declared method: foo(x[1, P, ND], y[2, P, ND])[NA, ND, AC, NA, basic.cj:40:17]: Class-ReturnedBar
Declared function name: foo -> _CN7default3Foo3fooHCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (3)
==============================
Actual call: foo("This is Bar", "This is AnotherBar")
Declared method: foo(x[1, P, ND], y[2, P, ND])[NA, ND, AC, NA, basic.cj:40:17]: Class-ReturnedBar
Declared function name: foo -> _CN7default3Foo3fooHCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (4)
==============================
Actual call: foo("This is Bar", "This is AnotherBar")
Declared method: foo(x[1, P, ND], y[2, P, ND])[NA, ND, AC, NA, basic.cj:40:17]: Class-ReturnedBar
Declared function name: foo -> _CN7default3Foo3fooHCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (5)
==============================
 */
