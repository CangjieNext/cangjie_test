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
        let mockedFoo = unsafe { createMock<FooGeneric<Int64>>(dummyMockingCallHandler) }
        addMatcher(
            "_CN20otherPackageToImport10FooGenericIG_E3fooHCNY_9PassedBarE",
            [2, "my str 2", 4],
            ReturnedBar("1")
        )
        println("Return value: " + mockedFoo.foo(PassedBar()).toString())
        println("==============================")
    }

    @TestCase
    func case2(): Unit {
        let mockedFoo = unsafe { createMock<FooGeneric<String>>(dummyMockingCallHandler) }
        addMatcher(
            "_CN20otherPackageToImport10FooGenericIG_E3barHG_",
            [2, "my str 2", 4],
            ReturnedBar("2")
        )
        println("Return value: " + mockedFoo.bar("test").toString())
        println("==============================")
    }

    @TestCase
    func case3(): Unit {
        let mockedFoo = unsafe { createMock<FooGeneric<Int64>>(dummyMockingCallHandler) }
        addMatcher(
            "_CN20otherPackageToImport10FooGenericIG_E3booIG0_HG_G0_",
            [2, "my str 2", 4],
            ReturnedBar("3")
        )
        println("Return value: " + mockedFoo.boo(435, "adsf").toString())
        println("==============================")
    }

    @TestCase
    func case4(): Unit {
        let mockedFoo = unsafe { createMock<FooGeneric<Int64>>(dummyMockingCallHandler) }
        addMatcher(
            "_CN20otherPackageToImport10FooGenericIG_E3beeIG0_G1_HG_G0_",
            [2, "my str 2", 4],
            ReturnedBar("4")
        )
        let r: ReturnedBar = mockedFoo.bee<Int64, ReturnedBar>(435, 11)
        println("Return value: " + r.toString())
        println("==============================")
    }

    @TestCase
    func case5(): Unit {
        let mockedFoo = unsafe { createMock<FooGeneric<PassedBar>>(dummyMockingCallHandler) }
        addMatcher(
            "_CN20otherPackageToImport10FooGenericIG_E15callGenericBee2IG0_G1_HG_G0_",
            [2, "my str 2", 4],
            ReturnedBar("5")
        )
        let r = mockedFoo.callGenericBee2<Int64, ReturnedBar>(PassedBar(), -999)
        println("Return value: " + r.toString())
        println("==============================")
    }

    @TestCase
    func case6(): Unit {
        let mockedFoo = unsafe { createMock<FooGeneric<String>>(dummyMockingCallHandler) }
        addMatcher(
            "_CN20otherPackageToImport10FooGenericIG_E16callSpecificBee2HG_",
            [2, "my str 2", 4],
            ReturnedBar("6")
        )
        let r: ReturnedBar = mockedFoo.callSpecificBee2("abc")
        println("Return value: " + r.toString())
        println("==============================")
    }

    @TestCase
    func case7(): Unit {
        let mockedFoo = unsafe { createMock<FooGeneric<String>>(dummyMockingCallHandler) }
        addMatcher(
            "_CN20otherPackageToImport10FooGenericIG_E16callSpecificBoo2Hv",
            [2, "my str 2", 4],
            ReturnedBar("7")
        )
        let r: ReturnedBar = mockedFoo.callSpecificBoo2()
        println("Return value: " + r.toString())
        println("==============================")
    }

    @TestCase
    func case8(): Unit {
        let mockedFoo = unsafe { createMock<FooGeneric<String>>(dummyMockingCallHandler) }
        addMatcher(
            "_CN20otherPackageToImport10FooGenericIG_E15callSpecificBeeHG_",
            [2, "my str 2", 4],
            ReturnedBar("8")
        )
        let r: ReturnedBar = mockedFoo.callSpecificBee("x")
        println("Return value: " + r.toString())
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
Actual call: bar("test")
Declared method: bar(x[1, P, ND])[A, ND, AC, NA, FooGeneric.cj:15:17]: Class-ReturnedBar
Declared function name: bar -> _CN20otherPackageToImport10FooGenericIG_E3barHG_
Outer decl name: FooGeneric<std.core:String> -> _CN20otherPackageToImport10FooGenericIG_E
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (2)
==============================
Actual call: boo<std.core:String>("435", "adsf")
Declared method: boo<T>(x[1, P, ND], y[2, P, ND])[A, ND, AC, NA, FooGeneric.cj:19:17]: Class-ReturnedBar
Declared function name: boo -> _CN20otherPackageToImport10FooGenericIG_E3booIG0_HG_G0_
Outer decl name: FooGeneric<Int64> -> _CN20otherPackageToImport10FooGenericIG_E
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (3)
==============================
Actual call: bee<Int64, otherPackageToImport:ReturnedBar>("435", "11")
Declared method: bee<T, R>(x[1, P, ND], y[2, P, ND])[A, ND, AC, NA, FooGeneric.cj:23:17]: Generics-R
Declared function name: bee -> _CN20otherPackageToImport10FooGenericIG_E3beeIG0_G1_HG_G0_
Outer decl name: FooGeneric<Int64> -> _CN20otherPackageToImport10FooGenericIG_E
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (4)
==============================
Actual call: callGenericBee2<Int64, otherPackageToImport:ReturnedBar>("This is Bar", "-999")
Declared method: callGenericBee2<T, R>(x[1, P, ND], y[2, P, ND])[A, ND, AC, NA, FooGeneric.cj:36:17]: Generics-R
Declared function name: callGenericBee2 -> _CN20otherPackageToImport10FooGenericIG_E15callGenericBee2IG0_G1_HG_G0_
Outer decl name: FooGeneric<otherPackageToImport:PassedBar> -> _CN20otherPackageToImport10FooGenericIG_E
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (5)
==============================
Actual call: callSpecificBee2("abc")
Declared method: callSpecificBee2(x[1, P, ND])[A, ND, AC, NA, FooGeneric.cj:40:17]: Class-ReturnedBar
Declared function name: callSpecificBee2 -> _CN20otherPackageToImport10FooGenericIG_E16callSpecificBee2HG_
Outer decl name: FooGeneric<std.core:String> -> _CN20otherPackageToImport10FooGenericIG_E
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (6)
==============================
Actual call: callSpecificBoo2()
Declared method: callSpecificBoo2()[A, ND, AC, NA, FooGeneric.cj:44:17]: Class-ReturnedBar
Declared function name: callSpecificBoo2 -> _CN20otherPackageToImport10FooGenericIG_E16callSpecificBoo2Hv
Outer decl name: FooGeneric<std.core:String> -> _CN20otherPackageToImport10FooGenericIG_E
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (7)
==============================
Actual call: callSpecificBee("x")
Declared method: callSpecificBee(x[1, P, ND])[A, ND, AC, NA, FooGeneric.cj:48:17]: Class-ReturnedBar
Declared function name: callSpecificBee -> _CN20otherPackageToImport10FooGenericIG_E15callSpecificBeeHG_
Outer decl name: FooGeneric<std.core:String> -> _CN20otherPackageToImport10FooGenericIG_E
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (8)
==============================
 */
