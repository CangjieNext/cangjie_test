/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../helpers
// DEPENDENCE: ../otherPackageToImport
// EXEC: %compiler %cmp_opt %pkg_opt -Woff=all helpers --mock=on -o libpkg1.%middle %compile_lib_opt
// EXEC: %compiler %cmp_opt %pkg_opt -Woff=all otherPackageToImport --mock=on -o libpkg2.%middle %compile_lib_opt
// EXEC: %compiler %cmp_opt -Woff=all libpkg1.%middle libpkg2.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import otherPackageToImport.*
import std.mock_test_util.*
import std.unittest.*

@Test
public class TestA {
    public override func afterEach(): Unit {
        clearMatchers()
    }

    @TestCase
    func case1(): Unit {
        let mockedFoo = unsafe { createMock<FooGeneric<Int32>>(dummyMockingCallHandler) }
        addMatcher(
            "_CN20otherPackageToImport10FooGenericIG_E3barHG_",
            [1, "my str", 3],
            ReturnedBar("1")
        )
        println("Return value: " + mockedFoo.bar(11).toString())
        println("==============================")
        makeTypeInstanceOfFooAndCallBar(mockedFoo)
        println("==============================")
    }

    @TestCase
    func case2(): Unit {
        let mockedFoo = unsafe { createMock<FooGeneric<Array<Int64>>>(dummyMockingCallHandler) }
        addMatcher(
            "_CN20otherPackageToImport10FooGenericIG_E3beeIG0_G1_HG_G0_",
            [1, "my str", 3],
            2
        )
        println("Return value: " + mockedFoo.bee<String, Int64>([1, 4], "11").toString())
        println("==============================")
        makeTypeInstanceOfFooAndCallBee(mockedFoo)
        println("==============================")
    }
}

/* SCAN-IN
Actual call: bar("11")
Declared method: bar(x[1, P, ND])[A, ND, AC, NA, FooGeneric.cj:15:17]: Class-ReturnedBar
Declared function name: bar -> _CN20otherPackageToImport10FooGenericIG_E3barHG_
Outer decl name: FooGeneric<Int32> -> _CN20otherPackageToImport10FooGenericIG_E
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (1)
==============================
Actual call: bar("12")
Declared method: bar(x[1, P, ND])[A, ND, AC, NA, FooGeneric.cj:15:17]: Class-ReturnedBar
Declared function name: bar -> _CN20otherPackageToImport10FooGenericIG_E3barHG_
Outer decl name: FooGeneric<Int32> -> _CN20otherPackageToImport10FooGenericIG_E
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (1)
==============================
Actual call: bee<std.core:String, Int64>("[1, 4]", "11")
Declared method: bee<T, R>(x[1, P, ND], y[2, P, ND])[A, ND, AC, NA, FooGeneric.cj:23:17]: Generics-R
Declared function name: bee -> _CN20otherPackageToImport10FooGenericIG_E3beeIG0_G1_HG_G0_
Outer decl name: FooGeneric<std.core:Array<Int64>> -> _CN20otherPackageToImport10FooGenericIG_E
Receiver: [doesn't implement ToString]
------------------------------
Return value: 2
==============================
Actual call: bee<std.core:String, Int64>("[2, 5]", "12")
Declared method: bee<T, R>(x[1, P, ND], y[2, P, ND])[A, ND, AC, NA, FooGeneric.cj:23:17]: Generics-R
Declared function name: bee -> _CN20otherPackageToImport10FooGenericIG_E3beeIG0_G1_HG_G0_
Outer decl name: FooGeneric<std.core:Array<Int64>> -> _CN20otherPackageToImport10FooGenericIG_E
Receiver: [doesn't implement ToString]
------------------------------
Return value: 2
==============================
 */
