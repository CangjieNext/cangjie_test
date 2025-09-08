/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../helpers
// DEPENDENCE: ../otherPackageToImport
// EXEC: %compiler %cmp_opt %pkg_opt -Woff=all helpers -o libpkg1.%middle %compile_lib_opt
// EXEC: %compiler %cmp_opt %pkg_opt -Woff=all otherPackageToImport -o libpkg2.%middle %compile_lib_opt
// EXEC-PIPE-1: %compiler %cmp_opt -Woff=all libpkg1.%middle libpkg2.%middle %n.cj -o %output %cmp_utest_opt 2>&1 | compare %f

import otherPackageToImport.*
import std.mock_test_util.*
import std.unittest.testmacro.*

public class TestA {
    func case1(): Unit {
        let mockedFoo = unsafe { createMock<FooFinal>(dummyMockingCallHandler) }
        addMatcher(
            "_CN20otherPackageToImport8FooFinal3fooHCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("1")
        )
        println("Return value: " + mockedFoo.foo(PassedBar(), PassedAnotherBar()).toString())
    }

    func case2(): Unit {
        let mockedFoo = unsafe { createMock<FooGeneric<FooGeneric<Int64>>>(dummyMockingCallHandler) }
        addMatcher(
            "_CN20otherPackageToImport10FooGenericIl3fooHCN20otherPackageToImport9PassedBarE",
            [2, "my str 2", 4],
            ReturnedBar("1")
        )
        println("Return value: " + mockedFoo.foo(PassedBar()).toString())
        println("==============================")
    }
}

main() {
    0
}

/* SCAN-IN
error: 'Class-FooFinal' doesn't support mocking, please be sure that its package 'otherPackageToImport' is mock-compatible (was compiled with --mock=on compilation option)
  ==> anotherPackageFinalClassNotMockingMode.cj:20:34:
   | 
20 |         let mockedFoo = unsafe { createMock<FooFinal>(dummyMockingCallHandler) }
   |                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 

error: 'Class-FooGeneric<Class-FooGeneric<Int64>>' doesn't support mocking, please be sure that its package 'otherPackageToImport' is mock-compatible (was compiled with --mock=on compilation option)
  ==> anotherPackageFinalClassNotMockingMode.cj:30:34:
   | 
30 |         let mockedFoo = unsafe { createMock<FooGeneric<FooGeneric<Int64>>>(dummyMockingCallHandler) }
   |                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   |
 */
