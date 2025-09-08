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
        let mockedFoo: Foo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        addMatcher(
            "_CN20otherPackageToImport3Foo3fooHCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("1")
        )
        println("Return value: " + mockedFoo.foo(PassedBar(), PassedAnotherBar()).toString())
        println("==============================")
    }

    @TestCase
    func case2(): Unit {
        let mockedFoo: Foo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        let x: Int32 = 20
        addMatcher(
            "_CN20otherPackageToImport3Foo3barHv",
            [1, "my str", 3],
            x
        )
        println("Return value: " + mockedFoo.bar().toString())
        println("==============================")
    }

    @TestCase
    func case3(): Unit {
        let mockedFoo: Foo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        let x: Int32 = 20
        addMatcher(
            "_CN20otherPackageToImport3Foo10fooDefaultHi",
            [1, "my str", 3],
            "my str"
        )
        println("Return value: " + mockedFoo.fooDefault(x).toString())
        println("==============================")
    }
}

/* SCAN-IN
Actual call: foo("This is Bar", "This is AnotherBar")
Declared method: foo(x[1, P, ND], y[2, P, ND])[A, ND, AC, NA, FooInterface.cj:11:10]: Class-ReturnedBar
Declared function name: foo -> _CN20otherPackageToImport3Foo3fooHCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: Foo -> _CN20otherPackageToImport3FooE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (1)
==============================
Actual call: bar()
Declared method: bar()[A, D, AC, NA, FooInterface.cj:12:10]: Int32
Declared function name: bar -> _CN20otherPackageToImport3Foo3barHv
Outer decl name: Foo -> _CN20otherPackageToImport3FooE
Receiver: [doesn't implement ToString]
------------------------------
Return value: 20
==============================
Actual call: fooDefault("20")
Declared method: fooDefault(x[1, P, ND])[NA, D, AC, NA, FooInterface.cj:13:10]: Struct-String
Declared function name: fooDefault -> _CN20otherPackageToImport3Foo10fooDefaultHi
Outer decl name: Foo -> _CN20otherPackageToImport3FooE
Receiver: [doesn't implement ToString]
------------------------------
Return value: my str
==============================
 */
