/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../helpers
// DEPENDENCE: ../otherPackageToImport
// (CJNATIVE) EXEC: %compiler %cmp_opt %pkg_opt -Woff=all helpers --mock=on -o libpkg1.%middle %compile_lib_opt
// (CJNATIVE) EXEC: %compiler %cmp_opt %pkg_opt -Woff=all otherPackageToImport --mock=on -o libpkg2.%middle %compile_lib_opt
// (CJNATIVE) EXEC: %compiler %cmp_opt -Woff=all libpkg1.%middle libpkg2.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// (CJNATIVE) EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import otherPackageToImport.*
import std.mock_test_util.*
import std.unittest.testmacro.*

public open class DerivedFooOpenFinalMethodLocalOpen <: FooOpenFinalMethod {
    public open func foo(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        ReturnedBar("0")
    }
}

public class DerivedFooOpenFinalMethodLocal <: FooOpenFinalMethod {
    public open func foo(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        ReturnedBar("0")
    }
}

public class DerivedFooAbstractFinalMethodLocal <: FooAbstractFinalMethod {
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
        let mockedFoo = unsafe { createMock<FooAbstractFinalMethod>(dummyMockingCallHandler) }
        addMatcher(
            "_CN20otherPackageToImport22FooAbstractFinalMethod3fooHCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("1")
        )
        println("Return value: " + mockedFoo.foo(PassedBar(), PassedAnotherBar()).toString())
    }
    @TestCase
    func case2(): Unit {
        let mockedFoo = unsafe { createMock<FooOpenFinalMethod>(dummyMockingCallHandler) }
        addMatcher(
            "_CN20otherPackageToImport18FooOpenFinalMethod3fooHCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("1")
        )
        println("Return value: " + mockedFoo.foo(PassedBar(), PassedAnotherBar()).toString())
    }
    @TestCase
    func case3(): Unit {
        let mockedFoo = unsafe { createMock<DerivedFooOpenFinalMethod>(dummyMockingCallHandler) }
        addMatcher(
            "_CN20otherPackageToImport25DerivedFooOpenFinalMethod3fooHCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("1")
        )
        println("Return value: " + mockedFoo.foo(PassedBar(), PassedAnotherBar()).toString())
    }
    @TestCase
    func case4(): Unit {
        let mockedFoo = unsafe { createMock<DerivedFooAbstractFinalMethod>(dummyMockingCallHandler) }
        addMatcher(
            "_CN20otherPackageToImport29DerivedFooAbstractFinalMethod3fooHCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("1")
        )
        println("Return value: " + mockedFoo.foo(PassedBar(), PassedAnotherBar()).toString())
    }
    @TestCase
    func case5(): Unit {
        let mockedFoo = unsafe { createMock<DerivedFooOpenFinalMethodLocalOpen>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default34DerivedFooOpenFinalMethodLocalOpen3fooHCN20otherPackageToImport9PassedBarECNY4_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("1")
        )
        println("Return value: " + mockedFoo.foo(PassedBar(), PassedAnotherBar()).toString())
    }
    @TestCase
    func case6(): Unit {
        let mockedFoo = unsafe { createMock<DerivedFooOpenFinalMethodLocal>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default30DerivedFooOpenFinalMethodLocal3fooHCN20otherPackageToImport9PassedBarECNY4_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("1")
        )
        println("Return value: " + mockedFoo.foo(PassedBar(), PassedAnotherBar()).toString())
    }
    @TestCase
    func case7(): Unit {
        let mockedFoo = unsafe { createMock<DerivedFooAbstractFinalMethodLocal>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default34DerivedFooAbstractFinalMethodLocal3fooHCN20otherPackageToImport9PassedBarECNY4_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("1")
        )
        println("Return value: " + mockedFoo.foo(PassedBar(), PassedAnotherBar()).toString())
    }
}

/* SCAN-IN
Actual call: foo("This is Bar", "This is AnotherBar")
Declared method: foo(x[1, P, ND], y[2, P, ND])[A, ND, AC, NA, FooAbstractOrOpenClassWithFinalMethod.cj:11:17]: Class-ReturnedBar
Declared function name: foo -> _CN20otherPackageToImport22FooAbstractFinalMethod3fooHCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: FooAbstractFinalMethod -> _CN20otherPackageToImport22FooAbstractFinalMethodE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (1)
Actual call: foo("This is Bar", "This is AnotherBar")
Declared method: foo(x[1, P, ND], y[2, P, ND])[A, ND, AC, NA, FooAbstractOrOpenClassWithFinalMethod.cj:21:22]: Class-ReturnedBar
Declared function name: foo -> _CN20otherPackageToImport18FooOpenFinalMethod3fooHCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: FooOpenFinalMethod -> _CN20otherPackageToImport18FooOpenFinalMethodE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (1)
Actual call: foo("This is Bar", "This is AnotherBar")
Declared method: foo(x[1, P, ND], y[2, P, ND])[A, ND, AC, NA, FooAbstractOrOpenClassWithFinalMethod.cj:30:22]: Class-ReturnedBar
Declared function name: foo -> _CN20otherPackageToImport25DerivedFooOpenFinalMethod3fooHCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: DerivedFooOpenFinalMethod -> _CN20otherPackageToImport25DerivedFooOpenFinalMethodE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (1)
Actual call: foo("This is Bar", "This is AnotherBar")
Declared method: foo(x[1, P, ND], y[2, P, ND])[A, ND, AC, NA, FooAbstractOrOpenClassWithFinalMethod.cj:36:22]: Class-ReturnedBar
Declared function name: foo -> _CN20otherPackageToImport29DerivedFooAbstractFinalMethod3fooHCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: DerivedFooAbstractFinalMethod -> _CN20otherPackageToImport29DerivedFooAbstractFinalMethodE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (1)
Actual call: foo("This is Bar", "This is AnotherBar")
Declared method: foo(x[1, P, ND], y[2, P, ND])[NA, ND, AC, NA, anotherPackageFinalMethod.cj:20:22]: Class-ReturnedBar
Declared function name: foo -> _CN7default34DerivedFooOpenFinalMethodLocalOpen3fooHCN20otherPackageToImport9PassedBarECNY4_16PassedAnotherBarE
Outer decl name: DerivedFooOpenFinalMethodLocalOpen -> _CN7default34DerivedFooOpenFinalMethodLocalOpenE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (1)
Actual call: foo("This is Bar", "This is AnotherBar")
Declared method: foo(x[1, P, ND], y[2, P, ND])[NA, ND, AC, NA, anotherPackageFinalMethod.cj:26:22]: Class-ReturnedBar
Declared function name: foo -> _CN7default30DerivedFooOpenFinalMethodLocal3fooHCN20otherPackageToImport9PassedBarECNY4_16PassedAnotherBarE
Outer decl name: DerivedFooOpenFinalMethodLocal -> _CN7default30DerivedFooOpenFinalMethodLocalE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (1)
Actual call: foo("This is Bar", "This is AnotherBar")
Declared method: foo(x[1, P, ND], y[2, P, ND])[NA, ND, AC, NA, anotherPackageFinalMethod.cj:32:22]: Class-ReturnedBar
Declared function name: foo -> _CN7default34DerivedFooAbstractFinalMethodLocal3fooHCN20otherPackageToImport9PassedBarECNY4_16PassedAnotherBarE
Outer decl name: DerivedFooAbstractFinalMethodLocal -> _CN7default34DerivedFooAbstractFinalMethodLocalE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (1)
 */
