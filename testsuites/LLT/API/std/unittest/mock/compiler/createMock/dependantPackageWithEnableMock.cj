/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../helpers
// DEPENDENCE: ../otherPackageToImport
// (not Windows) EXEC: %compiler %cmp_opt %pkg_opt -Woff=all helpers --mock=on -o libpkg1.%middle --output-type=dylib
// (not Windows) EXEC: %compiler %cmp_opt %pkg_opt -Woff=all otherPackageToImport --mock=on -o libpkg2.%middle --output-type=dylib %cmp_utest_opt --mock=on
// (not Windows) EXEC: %compiler %cmp_opt -Woff=all libpkg1.%middle libpkg2.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// (not Windows) EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

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
        let mockedFoo = unsafe { createMock<FooGeneric<Int64>>(dummyMockingCallHandler) }
        addMatcher(
            "_CN20otherPackageToImport10FooGenericIG_E3fooHCNY_9PassedBarE",
            [2, "my str 2", 4],
            ReturnedBar("1")
        )
        println("Return value: " + mockedFoo.foo(PassedBar()).toString())
        println("==============================")
    }
}

/* SCAN-IN
Actual call: foo("This is Bar")
Declared method: foo(x[1, P, ND])[A, ND, AC, NA, FooGeneric.cj:11:17]: Class-ReturnedBar
Declared function name: foo -> _CN20otherPackageToImport10FooGenericIG_E3fooHCNY_9PassedBarE
Outer decl name: FooGeneric<Int64> -> _CN20otherPackageToImport10FooGenericIG_E
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (1)
==============================
 */
