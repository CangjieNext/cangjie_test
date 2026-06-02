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
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class TestA {
    public override func afterEach(): Unit {
        clearMatchers()
    }

    @TestCase
    func case1(): Unit {
        let mockedFoo = unsafe { createMock<FooAbstract>(dummyMockingCallHandler) }
        addMatcher(
            "_CN20otherPackageToImport11FooAbstract3fooHCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("1")
        )
        println("Return value: " + mockedFoo.foo(PassedBar(), PassedAnotherBar()).toString())
        println("==============================")
    }

    @TestCase
    func case2(): Unit {
        let mockedFoo = unsafe { createMock<FooAbstract>(dummyMockingCallHandler) }
        addMatcher(
            "_CN20otherPackageToImport11FooAbstract8foo_implHCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("2")
        )
        println("Return value: " + mockedFoo.foo_impl(PassedBar(), PassedAnotherBar()).toString())
        println("==============================")
    }

    @TestCase
    func case3(): Unit {
        let mockedFoo = unsafe { createMock<FooAbstract>(dummyMockingCallHandler) }
        addMatcher(
            "_CN20otherPackageToImport11FooAbstract10foo_impl_2HCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("3")
        )
        println("Return value: " + mockedFoo.foo_impl_2(PassedBar(), PassedAnotherBar()).toString())
        println("==============================")
    }

    @TestCase
    func case4(): Unit {
        let mockedFoo = unsafe { createMock<FooOpen>(dummyMockingCallHandler) }
        addMatcher(
            "_CN20otherPackageToImport7FooOpen3fooHCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("4")
        )
        println("Return value: " + mockedFoo.foo(PassedBar(), PassedAnotherBar()).toString())
        println("==============================")
    }

    @TestCase
    func case5(): Unit {
        let mockedFoo = unsafe { createMock<FooOpen>(dummyMockingCallHandler) }
        addMatcher(
            "_CN20otherPackageToImport7FooOpen10foo_impl_2HCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("5")
        )
        println("Return value: " + mockedFoo.foo_impl_2(PassedBar(), PassedAnotherBar()).toString())
        println("==============================")
    }

    @TestCase
    func case6(): Unit {
        let mockedFoo = unsafe { createMock<FooOpen>(dummyMockingCallHandler) }
        addMatcher(
            "_CN20otherPackageToImport7FooOpen10foo_impl_3HCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("6")
        )
        println("Return value: " + mockedFoo.foo_impl_3(PassedBar(), PassedAnotherBar()).toString())
        println("==============================")
    }
}

/* SCAN-IN
Actual call: foo("This is Bar", "This is AnotherBar")
Declared method: foo(x[1, P, ND], y[2, P, ND])[A, ND, AC, NA, FooAbstractAndOpenClass.cj:11:17]: Class-ReturnedBar
Declared function name: foo -> _CN20otherPackageToImport11FooAbstract3fooHCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: FooAbstract -> _CN20otherPackageToImport11FooAbstractE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (1)
==============================
Actual call: foo_impl("This is Bar", "This is AnotherBar")
Declared method: foo_impl(x[1, P, ND], y[2, P, ND])[A, ND, AC, NA, FooAbstractAndOpenClass.cj:12:22]: Class-ReturnedBar
Declared function name: foo_impl -> _CN20otherPackageToImport11FooAbstract8foo_implHCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: FooAbstract -> _CN20otherPackageToImport11FooAbstractE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (2)
==============================
Actual call: foo_impl_2("This is Bar", "This is AnotherBar")
Declared method: foo_impl_2(x[1, P, ND], y[2, P, ND])[A, ND, AC, NA, FooAbstractAndOpenClass.cj:15:22]: Class-ReturnedBar
Declared function name: foo_impl_2 -> _CN20otherPackageToImport11FooAbstract10foo_impl_2HCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: FooAbstract -> _CN20otherPackageToImport11FooAbstractE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (3)
==============================
Actual call: foo("This is Bar", "This is AnotherBar")
Declared method: foo(x[1, P, ND], y[2, P, ND])[A, ND, AC, NA, FooAbstractAndOpenClass.cj:21:22]: Class-ReturnedBar
Declared function name: foo -> _CN20otherPackageToImport7FooOpen3fooHCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: FooOpen -> _CN20otherPackageToImport7FooOpenE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (4)
==============================
Actual call: foo_impl_2("This is Bar", "This is AnotherBar")
Declared method: foo_impl_2(x[1, P, ND], y[2, P, ND])[A, ND, AC, NA, FooAbstractAndOpenClass.cj:24:22]: Class-ReturnedBar
Declared function name: foo_impl_2 -> _CN20otherPackageToImport7FooOpen10foo_impl_2HCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: FooOpen -> _CN20otherPackageToImport7FooOpenE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (5)
==============================
Actual call: foo_impl_3("This is Bar", "This is AnotherBar")
Declared method: foo_impl_3(x[1, P, ND], y[2, P, ND])[A, ND, AC, NA, FooAbstractAndOpenClass.cj:27:22]: Class-ReturnedBar
Declared function name: foo_impl_3 -> _CN20otherPackageToImport7FooOpen10foo_impl_3HCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: FooOpen -> _CN20otherPackageToImport7FooOpenE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (6)
==============================
 */
