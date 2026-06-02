/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../helpers
// (CJNATIVE) EXEC: %compiler %cmp_opt -Woff=all -p helpers --mock=on %compile_lib_opt --output p.%middle
// (CJNATIVE) EXEC: %compiler %cmp_opt -Woff=all p.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// (CJNATIVE) EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import std.mock_test_util.*
import std.unittest.*
import std.unittest.testmacro.*

abstract class BaseFoo {
    protected var f4 = 56
    var f5 = 57
    public func foo(x: String, y: Int32): Int64
}

class Foo <: BaseFoo {
    public let f1 = "str"
    public var f2 = 54
    protected var f3 = 55
    protected let f6: Int64
    let f7: String
    private var f8 = 58
    var f9 = 59

    init(f6: Int64, f7: String) {
        this.f6 = f6
        this.f7 = f7
    }

    public func foo(x: String, y: Int32): Int64 {
        println("original `foo` was called with args: x = ${x} and y = ${y}")
        println("original f1: ${f1.toString()}")
        println("original f2: ${f2.toString()}")
        println("original f3: ${f3.toString()}")
        println("original f4: ${f4.toString()}")
        println("original f5: ${f5.toString()}")
        println("original f6: ${f6.toString()}")
        println("original f7: ${f7.toString()}")
        println("original f8: ${f8.toString()}")
        println("original f9: ${f9.toString()}")
        77
    }
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let foo = Foo(90, "test 31")
        let spiedFoo = unsafe { createSpy(dummyMockingCallHandler, foo) }
        setSpyMode()
        spiedFoo.foo("ald", 90)
        println("f1: ${spiedFoo.f1.toString()}")
        println("f2: ${spiedFoo.f2.toString()}")
        spiedFoo.f2 = 540
        println("f2 after modification: ${spiedFoo.f2.toString()}")
        println("original f2 after modification: ${foo.f2.toString()}")
        println("f5: ${spiedFoo.f5.toString()}")
        println("f7: ${spiedFoo.f7.toString()}")
        println("f9: ${spiedFoo.f9.toString()}")
        spiedFoo.f9 = 590
        println("original f9 after modification: ${foo.f2.toString()}")
        println("f9 after modification: ${spiedFoo.f9.toString()}")
        println("==============================")
    }

    @TestCase
    func case2(): Unit {
        let foo = Foo(91, "test 32")
        let spiedFoo = unsafe { createSpy(dummyMockingCallHandler, foo) }
        setSpyMode()
        spiedFoo.foo("ald 2", 91)
        println("f5: ${spiedFoo.f5.toString()}")
        spiedFoo.f5 = 570
        println("f5 after modification: ${spiedFoo.f5.toString()}")
        println("original f5 after modification: ${foo.f5.toString()}")
        println("==============================")
    }
}

/* SCAN-IN
-------- Called with CallBase --------
Actual call: foo("ald", "90")
Declared method: foo(x[1, P, ND], y[2, P, ND])[NA, D, AC, NA, accessingToFields.cj:37:17]: Int64
Declared function name: foo -> _CN7default3Foo3fooHRNat6StringEi
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
original `foo` was called with args: x = ald and y = 90
original f1: str
original f2: 54
original f3: 55
original f4: 56
original f5: 57
original f6: 90
original f7: test 31
original f8: 58
original f9: 59
-------- Called with CallBase --------
Actual call: f1$get()
Declared field getter: f1()[NA, D, AC, DHS, accessingToFields.cj:24:16]: Struct-String
Declared function name: f1$get -> _CN7default3Foo17f1$get$ToMock_FooHv
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
f1: str
-------- Called with CallBase --------
Actual call: f2$get()
Declared field getter: f2()[NA, D, AC, HS, accessingToFields.cj:25:16]: Int64
Declared function name: f2$get -> _CN7default3Foo17f2$get$ToMock_FooHv
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
f2: 54
-------- Called with CallBase --------
Actual call: f2$set("540")
Declared field setter: f2(newValue[1, P, ND])[NA, D, AC, NA, accessingToFields.cj:25:16]: Unit
Declared function name: f2$set -> _CN7default3Foo17f2$set$ToMock_FooHl
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
-------- Called with CallBase --------
Actual call: f2$get()
Declared field getter: f2()[NA, D, AC, HS, accessingToFields.cj:25:16]: Int64
Declared function name: f2$get -> _CN7default3Foo17f2$get$ToMock_FooHv
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
f2 after modification: 540
original f2 after modification: 540
-------- Called with CallBase --------
Actual call: f5$get()
Declared field getter: f5()[NA, D, AC, HS, accessingToFields.cj:19:9]: Int64
Declared function name: f5$get -> _CN7default7BaseFoo21f5$get$ToMock_BaseFooHv
Outer decl name: BaseFoo -> _CN7default7BaseFooE
Receiver: [doesn't implement ToString]
------------------------------
f5: 57
-------- Called with CallBase --------
Actual call: f7$get()
Declared field getter: f7()[NA, D, AC, DHS, accessingToFields.cj:28:9]: Struct-String
Declared function name: f7$get -> _CN7default3Foo17f7$get$ToMock_FooHv
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
f7: test 31
-------- Called with CallBase --------
Actual call: f9$get()
Declared field getter: f9()[NA, D, AC, HS, accessingToFields.cj:30:9]: Int64
Declared function name: f9$get -> _CN7default3Foo17f9$get$ToMock_FooHv
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
f9: 59
-------- Called with CallBase --------
Actual call: f9$set("590")
Declared field setter: f9(newValue[1, P, ND])[NA, D, AC, NA, accessingToFields.cj:30:9]: Unit
Declared function name: f9$set -> _CN7default3Foo17f9$set$ToMock_FooHl
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
original f9 after modification: 540
-------- Called with CallBase --------
Actual call: f9$get()
Declared field getter: f9()[NA, D, AC, HS, accessingToFields.cj:30:9]: Int64
Declared function name: f9$get -> _CN7default3Foo17f9$get$ToMock_FooHv
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
f9 after modification: 590
==============================
-------- Called with CallBase --------
Actual call: foo("ald 2", "91")
Declared method: foo(x[1, P, ND], y[2, P, ND])[NA, D, AC, NA, accessingToFields.cj:37:17]: Int64
Declared function name: foo -> _CN7default3Foo3fooHRNat6StringEi
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
original `foo` was called with args: x = ald 2 and y = 91
original f1: str
original f2: 54
original f3: 55
original f4: 56
original f5: 57
original f6: 91
original f7: test 32
original f8: 58
original f9: 59
-------- Called with CallBase --------
Actual call: f5$get()
Declared field getter: f5()[NA, D, AC, HS, accessingToFields.cj:19:9]: Int64
Declared function name: f5$get -> _CN7default7BaseFoo21f5$get$ToMock_BaseFooHv
Outer decl name: BaseFoo -> _CN7default7BaseFooE
Receiver: [doesn't implement ToString]
------------------------------
f5: 57
-------- Called with CallBase --------
Actual call: f5$set("570")
Declared field setter: f5(newValue[1, P, ND])[NA, D, AC, NA, accessingToFields.cj:19:9]: Unit
Declared function name: f5$set -> _CN7default7BaseFoo21f5$set$ToMock_BaseFooHl
Outer decl name: BaseFoo -> _CN7default7BaseFooE
Receiver: [doesn't implement ToString]
------------------------------
-------- Called with CallBase --------
Actual call: f5$get()
Declared field getter: f5()[NA, D, AC, HS, accessingToFields.cj:19:9]: Int64
Declared function name: f5$get -> _CN7default7BaseFoo21f5$get$ToMock_BaseFooHv
Outer decl name: BaseFoo -> _CN7default7BaseFooE
Receiver: [doesn't implement ToString]
------------------------------
f5 after modification: 570
original f5 after modification: 570
==============================
 */
