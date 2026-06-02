/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../helpers
// DEPENDENCE: ../otherPackageToImport
// DEPENDENCE: ../otherPackageToImport3
// DEPENDENCE: ../otherPackageToImport2
// EXEC: %compiler %cmp_opt %pkg_opt -Woff=all helpers -o libpkg1.%middle %compile_lib_opt
// EXEC: %compiler %cmp_opt %pkg_opt -Woff=all otherPackageToImport3 -o libpkg2.%middle %compile_lib_opt
// EXEC: %compiler %cmp_opt %pkg_opt -Woff=all libpkg2.%middle otherPackageToImport2 -o libpkg3.%middle %compile_lib_opt --mock=on
// EXEC: %compiler %cmp_opt %pkg_opt -Woff=all otherPackageToImport -o libpkg4.%middle %compile_lib_opt --mock=on
// EXEC: %compiler %cmp_opt -Woff=all libpkg1.%middle libpkg3.%middle libpkg4.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import otherPackageToImport.FooFinal
import otherPackageToImport.PassedBar
import otherPackageToImport.PassedAnotherBar
import otherPackageToImport.ReturnedBar
import otherPackageToImport2.Foo
import std.mock_test_util.*
import std.unittest.testmacro.*

/* IMPORTANT NOTE:
 * this test just fixes the current behaviour according to the fact
 * that cjc for now doesn't support conflicting dependency resolution.
 * Possibly, it will be fixed, or at least some compilation time error would be reported for mocking purposes only
 */
@Test
public class TestA {
    public override func afterEach(): Unit {
        clearMatchers()
    }

    @TestCase
    func case1(): Unit {
        let mockedFoo = unsafe { createMock<FooFinal>(dummyMockingCallHandler) }
        addMatcher(
            "_CN20otherPackageToImport8FooFinal20foo4$ToMock_FooFinalECN20otherPackageToImport9PassedBarECN20otherPackageToImport16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("1")
        )
        Foo().foo(mockedFoo)
    }
}

/* SCAN-IN
Original `foo` of `FooFinal` was called
 */
