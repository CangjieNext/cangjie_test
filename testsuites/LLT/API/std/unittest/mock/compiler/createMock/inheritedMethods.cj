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

abstract class AbstractFoo1 {
    public func foo(x: PassedBar, y: PassedAnotherBar): ReturnedBar
}

abstract class AbstractFoo2 <: AbstractFoo1 {
    public func bar(x: PassedBar, y: PassedAnotherBar): ReturnedBar
}

open class OpenBar {
    public open func foo(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        println("original `foo` was called")
        ReturnedBar("original")
    }
}

class Bar <: OpenBar {
    public func bar(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        println("original `foo` was called")
        ReturnedBar("original")
    }
}

interface Boo1 {
    func foo(x: PassedBar, y: PassedAnotherBar): ReturnedBar
}

interface Boo2 <: Boo1 {
    func bar(x: PassedBar, y: PassedAnotherBar): ReturnedBar
}

@Test
public class TestA {
    public override func afterEach(): Unit {
        clearMatchers()
    }

    @TestCase
    func case1(): Unit {
        let mockedFoo = unsafe { createMock<AbstractFoo2>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default12AbstractFoo13fooHCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("1")
        )
        println("Return value: " + mockedFoo.foo(PassedBar(), PassedAnotherBar()).toString())
        println("==============================")
    }

    @TestCase
    func case2(): Unit {
        let mockedFoo = unsafe { createMock<AbstractFoo2>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default12AbstractFoo23barHCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("2")
        )
        let y = mockedFoo.bar(PassedBar(), PassedAnotherBar())
        println("Return value: ${y}")
        println("==============================")
    }

    @TestCase
    func case3(): Unit {
        let mockedFoo = unsafe { createMock<Bar>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default7OpenBar3fooHCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("3")
        )
        let y = mockedFoo.foo(PassedBar(), PassedAnotherBar())
        println("Return value: ${y}")
        println("==============================")
    }

    @TestCase
    func case4(): Unit {
        let mockedFoo = unsafe { createMock<Bar>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default3Bar3barHCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("4")
        )
        let y = mockedFoo.bar(PassedBar(), PassedAnotherBar())
        println("Return value: ${y}")
        println("==============================")
    }

    @TestCase
    func case5(): Unit {
        let mockedFoo = unsafe { createMock<Boo2>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default4Boo13fooHCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("5")
        )
        let y = mockedFoo.foo(PassedBar(), PassedAnotherBar())
        println("Return value: ${y}")
        println("==============================")
    }

    @TestCase
    func case6(): Unit {
        let mockedFoo = unsafe { createMock<Boo2>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default4Boo23barHCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("6")
        )
        let y = mockedFoo.bar(PassedBar(), PassedAnotherBar())
        println("Return value: ${y}")
        println("==============================")
    }
}

/* SCAN-IN
Actual call: foo("This is Bar", "This is AnotherBar")
Declared method: foo(x[1, P, ND], y[2, P, ND])[A, ND, AC, NA, inheritedMethods.cj:40:17]: Class-ReturnedBar
Declared function name: foo -> _CN7default12AbstractFoo13fooHCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: AbstractFoo1 -> _CN7default12AbstractFoo1E
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (1)
==============================
Actual call: bar("This is Bar", "This is AnotherBar")
Declared method: bar(x[1, P, ND], y[2, P, ND])[A, ND, AC, NA, inheritedMethods.cj:44:17]: Class-ReturnedBar
Declared function name: bar -> _CN7default12AbstractFoo23barHCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: AbstractFoo2 -> _CN7default12AbstractFoo2E
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (2)
==============================
Actual call: foo("This is Bar", "This is AnotherBar")
Declared method: foo(x[1, P, ND], y[2, P, ND])[NA, ND, AC, NA, inheritedMethods.cj:48:22]: Class-ReturnedBar
Declared function name: foo -> _CN7default7OpenBar3fooHCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: OpenBar -> _CN7default7OpenBarE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (3)
==============================
Actual call: bar("This is Bar", "This is AnotherBar")
Declared method: bar(x[1, P, ND], y[2, P, ND])[NA, ND, AC, NA, inheritedMethods.cj:55:17]: Class-ReturnedBar
Declared function name: bar -> _CN7default3Bar3barHCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: Bar -> _CN7default3BarE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (4)
==============================
Actual call: foo("This is Bar", "This is AnotherBar")
Declared method: foo(x[1, P, ND], y[2, P, ND])[A, ND, AC, NA, inheritedMethods.cj:62:10]: Class-ReturnedBar
Declared function name: foo -> _CN7default4Boo13fooHCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: Boo1 -> _CN7default4Boo1E
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (5)
==============================
Actual call: bar("This is Bar", "This is AnotherBar")
Declared method: bar(x[1, P, ND], y[2, P, ND])[A, ND, AC, NA, inheritedMethods.cj:66:10]: Class-ReturnedBar
Declared function name: bar -> _CN7default4Boo23barHCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: Boo2 -> _CN7default4Boo2E
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (6)
==============================
 */
