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

public class PassedBar <: ToString {
    public override func toString() {
        "This is Bar"
    }
}

public class PassedAnotherBar <: ToString {
    public override func toString() {
        "This is AnotherBar"
    }
}

public class ReturnedBar <: ToString {
    private let x: String
    public init(x: String) {
        this.x = x
    }
    public override func toString() {
        "This is ReturnedBar (${x})"
    }
}

public abstract class MyFooAbstractFinalMethod {
    public func foo(x: PassedBar, y: PassedAnotherBar): ReturnedBar
    public open func foo_impl_3(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        ReturnedBar("0")
    }
    public func foo_impl_2(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        ReturnedBar("0")
    }
}

public open class MyFooOpenFinalMethod {
    public open func foo(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        ReturnedBar("0")
    }
    public func foo_impl_3(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        ReturnedBar("0")
    }
}

public open class MyDerivedFooOpenFinalMethod <: MyFooOpenFinalMethod {
    public open func foo(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        ReturnedBar("0")
    }
}

public open class MyDerivedFooAbstractFinalMethod <: MyFooAbstractFinalMethod {
    public open func foo(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
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
        let mockedFoo = unsafe { createMock<MyFooAbstractFinalMethod>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default24MyFooAbstractFinalMethod3fooHCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("1")
        )
        println("Return value: " + mockedFoo.foo(PassedBar(), PassedAnotherBar()).toString())
        println("==============================")
    }

    @TestCase
    func case2(): Unit {
        let mockedFoo = unsafe { createMock<MyFooAbstractFinalMethod>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default24MyFooAbstractFinalMethod10foo_impl_2HCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("2")
        )
        println("Return value: " + mockedFoo.foo_impl_2(PassedBar(), PassedAnotherBar()).toString())
        println("==============================")
    }

    @TestCase
    func case3(): Unit {
        let mockedFoo = unsafe { createMock<MyFooOpenFinalMethod>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default20MyFooOpenFinalMethod10foo_impl_3HCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("3")
        )
        println("Return value: " + mockedFoo.foo_impl_3(PassedBar(), PassedAnotherBar()).toString())
        println("==============================")
    }

    @TestCase
    func case4(): Unit {
        let mockedFoo = unsafe { createMock<MyDerivedFooOpenFinalMethod>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default27MyDerivedFooOpenFinalMethod3fooHCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("4")
        )
        println("Return value: " + mockedFoo.foo(PassedBar(), PassedAnotherBar()).toString())
        println("==============================")
    }

    @TestCase
    func case5(): Unit {
        let mockedFoo = unsafe { createMock<MyDerivedFooAbstractFinalMethod>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default31MyDerivedFooAbstractFinalMethod3fooHCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("5")
        )
        println("Return value: " + mockedFoo.foo(PassedBar(), PassedAnotherBar()).toString())
        println("==============================")
    }
}

/* SCAN-IN
Actual call: foo("This is Bar", "This is AnotherBar")
Declared method: foo(x[1, P, ND], y[2, P, ND])[A, ND, AC, NA, myPackageFinalMethod.cj:40:17]: Class-ReturnedBar
Declared function name: foo -> _CN7default24MyFooAbstractFinalMethod3fooHCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: MyFooAbstractFinalMethod -> _CN7default24MyFooAbstractFinalMethodE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (1)
==============================
Actual call: foo_impl_2("This is Bar", "This is AnotherBar")
Declared method: foo_impl_2(x[1, P, ND], y[2, P, ND])[NA, ND, AC, NA, myPackageFinalMethod.cj:44:17]: Class-ReturnedBar
Declared function name: foo_impl_2 -> _CN7default24MyFooAbstractFinalMethod10foo_impl_2HCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: MyFooAbstractFinalMethod -> _CN7default24MyFooAbstractFinalMethodE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (2)
==============================
Actual call: foo_impl_3("This is Bar", "This is AnotherBar")
Declared method: foo_impl_3(x[1, P, ND], y[2, P, ND])[NA, ND, AC, NA, myPackageFinalMethod.cj:53:17]: Class-ReturnedBar
Declared function name: foo_impl_3 -> _CN7default20MyFooOpenFinalMethod10foo_impl_3HCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: MyFooOpenFinalMethod -> _CN7default20MyFooOpenFinalMethodE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (3)
==============================
Actual call: foo("This is Bar", "This is AnotherBar")
Declared method: foo(x[1, P, ND], y[2, P, ND])[NA, ND, AC, NA, myPackageFinalMethod.cj:59:22]: Class-ReturnedBar
Declared function name: foo -> _CN7default27MyDerivedFooOpenFinalMethod3fooHCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: MyDerivedFooOpenFinalMethod -> _CN7default27MyDerivedFooOpenFinalMethodE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (4)
==============================
Actual call: foo("This is Bar", "This is AnotherBar")
Declared method: foo(x[1, P, ND], y[2, P, ND])[NA, ND, AC, NA, myPackageFinalMethod.cj:65:22]: Class-ReturnedBar
Declared function name: foo -> _CN7default31MyDerivedFooAbstractFinalMethod3fooHCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: MyDerivedFooAbstractFinalMethod -> _CN7default31MyDerivedFooAbstractFinalMethodE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (5)
==============================
 */
