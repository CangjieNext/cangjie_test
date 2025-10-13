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

class Another <: ToString {
    let x1: Int64
    init(x: Int64) {
        this.x1 = x
    }
    public override func toString() {
        "Another" + x1.toString()
    }
}

class Foo1 {
    public let x1 = 1
    public var x2 = "Stf"
    private var x3: Another
    let x4: Int64
    protected var x5: String
    init(myx3: Another, myx4: Int64, myx5: String) {
        this.x3 = myx3
        this.x4 = myx4
        this.x5 = myx5
    }
    public func foo(x: String, y: Int64): Int32 {
        println("original `foo` was called");
        23
    }
    public func checkFields(foo: Foo1) {
        println("x1: " + foo.x1.toString())
        println("==============================")
        println("x2: " + foo.x2)
        println("==============================")
        println("x3: " + foo.x3.toString())
        println("==============================")
        println("x4: " + foo.x4.toString())
        println("==============================")
        println("x5: " + foo.x5.toString())
        println("==============================")
    }
}

class Bar {
    var x: String
    init(myx: String) {
        this.x = myx
    }
}

@Test
public class TestA {
    public override func afterEach(): Unit {
        clearMatchers()
    }

    @TestCase
    func case1(): Unit {
        let foo = Foo1(Another(1), 99, "999")
        let mockedFoo = unsafe { createMock<Foo1>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default4Foo118x1$get$ToMock_Foo1Hv",
            [1, "my str", 3],
            32
        )
        addMatcher(
            "_CN7default4Foo118x2$get$ToMock_Foo1Hv",
            [1, "my str", 3],
            "my Stf"
        )
        addMatcher(
            "_CN7default4Foo118x3$get$ToMock_Foo1Hv",
            [1, "my str", 3],
            Another(2)
        )
        addMatcher(
            "_CN7default4Foo118x4$get$ToMock_Foo1Hv",
            [1, "my str", 3],
            943
        )
        addMatcher(
            "_CN7default4Foo118x5$get$ToMock_Foo1Hv",
            [1, "my str", 3],
            "some str"
        )
        foo.checkFields(mockedFoo)
    }

    @TestCase
    func case2(): Unit {
        let mockedFoo = unsafe { createMock<Bar>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default3Bar16x$get$ToMock_BarHv",
            [1, "my str", 3],
            "013"
        )
        addMatcher(
            "_CN7default3Bar16x$set$ToMock_BarHRNat6StringE",
            [1, "my str", 3],
            ()
        )
        mockedFoo.x = "012"
        println(mockedFoo.x)
    }
}

/* SCAN-IN
Actual call: x1$get()
Declared field getter: x1()[NA, D, AC, DHS, mockFields.cj:28:16]: Int64
Declared function name: x1$get -> _CN7default4Foo118x1$get$ToMock_Foo1Hv
Outer decl name: Foo1 -> _CN7default4Foo1E
Receiver: [doesn't implement ToString]
------------------------------
x1: 32
==============================
Actual call: x2$get()
Declared field getter: x2()[NA, D, AC, HS, mockFields.cj:29:16]: Struct-String
Declared function name: x2$get -> _CN7default4Foo118x2$get$ToMock_Foo1Hv
Outer decl name: Foo1 -> _CN7default4Foo1E
Receiver: [doesn't implement ToString]
------------------------------
x2: my Stf
==============================
Actual call: x3$get()
Declared field getter: x3()[NA, ND, AC, HS, mockFields.cj:30:17]: Class-Another
Declared function name: x3$get -> _CN7default4Foo118x3$get$ToMock_Foo1Hv
Outer decl name: Foo1 -> _CN7default4Foo1E
Receiver: [doesn't implement ToString]
------------------------------
x3: Another2
==============================
Actual call: x4$get()
Declared field getter: x4()[NA, D, AC, DHS, mockFields.cj:31:9]: Int64
Declared function name: x4$get -> _CN7default4Foo118x4$get$ToMock_Foo1Hv
Outer decl name: Foo1 -> _CN7default4Foo1E
Receiver: [doesn't implement ToString]
------------------------------
x4: 943
==============================
Actual call: x5$get()
Declared field getter: x5()[NA, D, AC, HS, mockFields.cj:32:19]: Struct-String
Declared function name: x5$get -> _CN7default4Foo118x5$get$ToMock_Foo1Hv
Outer decl name: Foo1 -> _CN7default4Foo1E
Receiver: [doesn't implement ToString]
------------------------------
x5: some str
==============================
Actual call: x$set("012")
Declared field setter: x(newValue[1, P, ND])[NA, D, AC, NA, mockFields.cj:57:9]: Unit
Declared function name: x$set -> _CN7default3Bar16x$set$ToMock_BarHRNat6StringE
Outer decl name: Bar -> _CN7default3BarE
Receiver: [doesn't implement ToString]
------------------------------
Actual call: x$get()
Declared field getter: x()[NA, D, AC, HS, mockFields.cj:57:9]: Struct-String
Declared function name: x$get -> _CN7default3Bar16x$get$ToMock_BarHv
Outer decl name: Bar -> _CN7default3BarE
Receiver: [doesn't implement ToString]
------------------------------
013
 */
