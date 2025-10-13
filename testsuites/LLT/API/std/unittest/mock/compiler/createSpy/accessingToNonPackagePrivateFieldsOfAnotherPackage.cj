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

class Foo <: FooWithNonPackagePrivateFields {
    init(f3: Int64, f4: Int64) {
        super(f3, f4)
    }

    public func foo(x: String, y: Int64): Int64 {
        println("original `foo` was called with args: x = ${x} and y = ${y}")
        println("original f1: ${f1.toString()}")
        println("original f2: ${f2.toString()}")
        println("original f3: ${f3.toString()}")
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
        println("f2: ${spiedFoo.f2.toString()}")
        spiedFoo.f2 = 580
        println("f2 after modification: ${spiedFoo.f2.toString()}")
        println("original f2 after modification: ${foo.f2.toString()}")
        println("f3: ${spiedFoo.f3.toString()}")
        spiedFoo.f3 = 590
        println("f3 after modification: ${spiedFoo.f3.toString()}")
        println("original f3 after modification: ${foo.f3.toString()}")
        println("==============================")
    }

    @TestCase
    func case2(): Unit {
        let foo = Foo(90, 91)
        let spiedFoo = unsafe { createSpy<FooWithNonPackagePrivateFields>(dummyMockingCallHandler, foo) }
        setSpyMode()
        spiedFoo.bar("ald", 90)
        println("f2: ${spiedFoo.f2.toString()}")
        spiedFoo.f2 = 580
        println("f2 after modification: ${spiedFoo.f2.toString()}")
        println("original f2 after modification: ${foo.f2.toString()}")
        println("f3: ${spiedFoo.f3.toString()}")
        spiedFoo.f3 = 590
        println("f3 after modification: ${spiedFoo.f3.toString()}")
        println("original f3 after modification: ${foo.f3.toString()}")
        println("==============================")
    }
}

/* SCAN-IN
-------- Called with CallBase --------
Actual call: foo("ald", "90")
Declared method: foo(x[1, P, ND], y[2, P, ND])[NA, D, AC, NA, accessingToNonPackagePrivateFieldsOfAnotherPackage.cj:25:17]: Int64
Declared function name: foo -> _CN7default3Foo3fooHRNat6StringEl
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
original `foo` was called with args: x = ald and y = 90
original f1: 56
original f2: 58
original f3: 90
-------- Called with CallBase --------
Actual call: f2$get()
Declared field getter: f2()[A, D, AC, HS, FooWithFields.cj:39:16]: Int64
Declared function name: f2$get -> _CN20otherPackageToImport30FooWithNonPackagePrivateFields44f2$get$ToMock_FooWithNonPackagePrivateFieldsHv
Outer decl name: FooWithNonPackagePrivateFields -> _CN20otherPackageToImport30FooWithNonPackagePrivateFieldsE
Receiver: [doesn't implement ToString]
------------------------------
f2: 58
-------- Called with CallBase --------
Actual call: f2$set("580")
Declared field setter: f2(newValue[1, P, ND])[A, D, AC, NA, FooWithFields.cj:39:16]: Unit
Declared function name: f2$set -> _CN20otherPackageToImport30FooWithNonPackagePrivateFields44f2$set$ToMock_FooWithNonPackagePrivateFieldsHl
Outer decl name: FooWithNonPackagePrivateFields -> _CN20otherPackageToImport30FooWithNonPackagePrivateFieldsE
Receiver: [doesn't implement ToString]
------------------------------
-------- Called with CallBase --------
Actual call: f2$get()
Declared field getter: f2()[A, D, AC, HS, FooWithFields.cj:39:16]: Int64
Declared function name: f2$get -> _CN20otherPackageToImport30FooWithNonPackagePrivateFields44f2$get$ToMock_FooWithNonPackagePrivateFieldsHv
Outer decl name: FooWithNonPackagePrivateFields -> _CN20otherPackageToImport30FooWithNonPackagePrivateFieldsE
Receiver: [doesn't implement ToString]
------------------------------
f2 after modification: 580
original f2 after modification: 580
-------- Called with CallBase --------
Actual call: f3$get()
Declared field getter: f3()[A, D, AC, HS, FooWithFields.cj:40:16]: Int64
Declared function name: f3$get -> _CN20otherPackageToImport30FooWithNonPackagePrivateFields44f3$get$ToMock_FooWithNonPackagePrivateFieldsHv
Outer decl name: FooWithNonPackagePrivateFields -> _CN20otherPackageToImport30FooWithNonPackagePrivateFieldsE
Receiver: [doesn't implement ToString]
------------------------------
f3: 90
-------- Called with CallBase --------
Actual call: f3$set("590")
Declared field setter: f3(newValue[1, P, ND])[A, D, AC, NA, FooWithFields.cj:40:16]: Unit
Declared function name: f3$set -> _CN20otherPackageToImport30FooWithNonPackagePrivateFields44f3$set$ToMock_FooWithNonPackagePrivateFieldsHl
Outer decl name: FooWithNonPackagePrivateFields -> _CN20otherPackageToImport30FooWithNonPackagePrivateFieldsE
Receiver: [doesn't implement ToString]
------------------------------
-------- Called with CallBase --------
Actual call: f3$get()
Declared field getter: f3()[A, D, AC, HS, FooWithFields.cj:40:16]: Int64
Declared function name: f3$get -> _CN20otherPackageToImport30FooWithNonPackagePrivateFields44f3$get$ToMock_FooWithNonPackagePrivateFieldsHv
Outer decl name: FooWithNonPackagePrivateFields -> _CN20otherPackageToImport30FooWithNonPackagePrivateFieldsE
Receiver: [doesn't implement ToString]
------------------------------
f3 after modification: 590
original f3 after modification: 590
==============================
-------- Called with CallBase --------
Actual call: bar("ald", "90")
Declared method: bar(x[1, P, ND], y[2, P, ND])[A, D, AC, NA, FooWithFields.cj:43:22]: Int64
Declared function name: bar -> _CN20otherPackageToImport30FooWithNonPackagePrivateFields3barHRNat6StringEl
Outer decl name: FooWithNonPackagePrivateFields -> _CN20otherPackageToImport30FooWithNonPackagePrivateFieldsE
Receiver: [doesn't implement ToString]
------------------------------
original `bar` was called with args: x = ald and y = 90
original f1: 56
original f2: 58
original f3: 90
original f4: 91
-------- Called with CallBase --------
Actual call: f2$get()
Declared field getter: f2()[A, D, AC, HS, FooWithFields.cj:39:16]: Int64
Declared function name: f2$get -> _CN20otherPackageToImport30FooWithNonPackagePrivateFields44f2$get$ToMock_FooWithNonPackagePrivateFieldsHv
Outer decl name: FooWithNonPackagePrivateFields -> _CN20otherPackageToImport30FooWithNonPackagePrivateFieldsE
Receiver: [doesn't implement ToString]
------------------------------
f2: 58
-------- Called with CallBase --------
Actual call: f2$set("580")
Declared field setter: f2(newValue[1, P, ND])[A, D, AC, NA, FooWithFields.cj:39:16]: Unit
Declared function name: f2$set -> _CN20otherPackageToImport30FooWithNonPackagePrivateFields44f2$set$ToMock_FooWithNonPackagePrivateFieldsHl
Outer decl name: FooWithNonPackagePrivateFields -> _CN20otherPackageToImport30FooWithNonPackagePrivateFieldsE
Receiver: [doesn't implement ToString]
------------------------------
-------- Called with CallBase --------
Actual call: f2$get()
Declared field getter: f2()[A, D, AC, HS, FooWithFields.cj:39:16]: Int64
Declared function name: f2$get -> _CN20otherPackageToImport30FooWithNonPackagePrivateFields44f2$get$ToMock_FooWithNonPackagePrivateFieldsHv
Outer decl name: FooWithNonPackagePrivateFields -> _CN20otherPackageToImport30FooWithNonPackagePrivateFieldsE
Receiver: [doesn't implement ToString]
------------------------------
f2 after modification: 580
original f2 after modification: 580
-------- Called with CallBase --------
Actual call: f3$get()
Declared field getter: f3()[A, D, AC, HS, FooWithFields.cj:40:16]: Int64
Declared function name: f3$get -> _CN20otherPackageToImport30FooWithNonPackagePrivateFields44f3$get$ToMock_FooWithNonPackagePrivateFieldsHv
Outer decl name: FooWithNonPackagePrivateFields -> _CN20otherPackageToImport30FooWithNonPackagePrivateFieldsE
Receiver: [doesn't implement ToString]
------------------------------
f3: 90
-------- Called with CallBase --------
Actual call: f3$set("590")
Declared field setter: f3(newValue[1, P, ND])[A, D, AC, NA, FooWithFields.cj:40:16]: Unit
Declared function name: f3$set -> _CN20otherPackageToImport30FooWithNonPackagePrivateFields44f3$set$ToMock_FooWithNonPackagePrivateFieldsHl
Outer decl name: FooWithNonPackagePrivateFields -> _CN20otherPackageToImport30FooWithNonPackagePrivateFieldsE
Receiver: [doesn't implement ToString]
------------------------------
-------- Called with CallBase --------
Actual call: f3$get()
Declared field getter: f3()[A, D, AC, HS, FooWithFields.cj:40:16]: Int64
Declared function name: f3$get -> _CN20otherPackageToImport30FooWithNonPackagePrivateFields44f3$get$ToMock_FooWithNonPackagePrivateFieldsHv
Outer decl name: FooWithNonPackagePrivateFields -> _CN20otherPackageToImport30FooWithNonPackagePrivateFieldsE
Receiver: [doesn't implement ToString]
------------------------------
f3 after modification: 590
original f3 after modification: 590
==============================
 */
