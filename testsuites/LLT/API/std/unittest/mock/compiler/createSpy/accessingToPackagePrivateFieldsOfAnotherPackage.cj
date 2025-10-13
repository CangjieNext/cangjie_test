/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../helpers
// DEPENDENCE: ../otherPackageToImport
// (CJNATIVE) EXEC: %compiler %cmp_opt -Woff=all -p helpers --mock=on %compile_lib_opt --output p1.%middle
// (CJNATIVE) EXEC: %compiler %cmp_opt -Woff=all -p otherPackageToImport --mock=on %compile_lib_opt --output p2.%middle --mock=on
// (CJNATIVE) EXEC: %compiler %cmp_opt -Woff=all p1.%middle p2.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// (CJNATIVE) EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import std.mock_test_util.*
import otherPackageToImport.*
import std.unittest.*
import std.unittest.testmacro.*

class Foo <: FooWithPackagePrivateFields {
    init(f4: Int64, f5: Int64) {
        super(f4, f5)
    }

    public func foo(x: String, y: Int64): Int64 {
        println("original `foo` (from `Foo`) was called with args: x = ${x} and y = ${y}")
        println("original f1: ${f1.toString()}")
        println("original f3: ${f3.toString()}")
        println("original f4: ${f4.toString()}")
        77
    }
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let foo = Foo(90, 91)
        let spiedFoo = unsafe { createSpy<Foo>(dummyMockingCallHandler, foo) }
        setSpyMode()
        spiedFoo.foo("ald", 90)
        spiedFoo.printPackagePrivateFields()
        println("==============================")
    }

    @TestCase
    func case2(): Unit {
        let foo = Foo(90, 91)
        let spiedFoo = unsafe { createSpy<FooWithPackagePrivateFields>(dummyMockingCallHandler, foo) }
        spiedFoo.foo("ald", 90)
        spiedFoo.printPackagePrivateFields()
    }
}

/* SCAN-IN
-------- Called with CallBase --------
Actual call: foo("ald", "90")
Declared method: foo(x[1, P, ND], y[2, P, ND])[NA, D, AC, NA, accessingToPackagePrivateFieldsOfAnotherPackage.cj:25:17]: Int64
Declared function name: foo -> _CN7default3Foo3fooHRNat6StringEl
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
original `foo` (from `Foo`) was called with args: x = ald and y = 90
original f1: 56
original f3: 58
original f4: 90
-------- Called with CallBase --------
Actual call: printPackagePrivateFields()
Declared method: printPackagePrivateFields()[A, D, AC, NA, FooWithFields.cj:25:17]: Unit
Declared function name: printPackagePrivateFields -> _CN20otherPackageToImport27FooWithPackagePrivateFields25printPackagePrivateFieldsHv
Outer decl name: FooWithPackagePrivateFields -> _CN20otherPackageToImport27FooWithPackagePrivateFieldsE
Receiver: [doesn't implement ToString]
------------------------------
original `printPackagePrivateFields` was called
original f2: 57
original f5: 91
==============================
-------- Called with CallBase --------
Actual call: foo("ald", "90")
Declared method: foo(x[1, P, ND], y[2, P, ND])[A, D, AC, NA, FooWithFields.cj:17:22]: Int64
Declared function name: foo -> _CN20otherPackageToImport27FooWithPackagePrivateFields3fooHRNat6StringEl
Outer decl name: FooWithPackagePrivateFields -> _CN20otherPackageToImport27FooWithPackagePrivateFieldsE
Receiver: [doesn't implement ToString]
------------------------------
original `foo` (from `Foo`) was called with args: x = ald and y = 90
original f1: 56
original f3: 58
original f4: 90
-------- Called with CallBase --------
Actual call: printPackagePrivateFields()
Declared method: printPackagePrivateFields()[A, D, AC, NA, FooWithFields.cj:25:17]: Unit
Declared function name: printPackagePrivateFields -> _CN20otherPackageToImport27FooWithPackagePrivateFields25printPackagePrivateFieldsHv
Outer decl name: FooWithPackagePrivateFields -> _CN20otherPackageToImport27FooWithPackagePrivateFieldsE
Receiver: [doesn't implement ToString]
------------------------------
original `printPackagePrivateFields` was called
original f2: 57
original f5: 91
 */
