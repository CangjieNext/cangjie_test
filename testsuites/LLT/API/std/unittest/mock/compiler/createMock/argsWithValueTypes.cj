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

class ReturnedBar <: ToString {
    private let x: String
    init(x: String) {
        this.x = x
    }
    public override func toString() {
        "This is ReturnedBar (${x})"
    }
}

struct MyStruct <: ToString {
    private let x: String
    init(x: String) {
        this.x = x
    }
    public override func toString() {
        "This is MyStruct (${x})"
    }
}

class Foo {
    public func foo1(x: String): ReturnedBar {
        println("original `foo` was called")
        ReturnedBar("original")
    }
    public func foo2(x: Int32): String {
        println("original `foo` was called")
        "original"
    }
    public func foo3(x: MyStruct): Int32 {
        println("original `foo` was called")
        -1
    }
    public func foo4(x: MyStruct, y: Int32, z: String): MyStruct {
        println("original `foo` was called")
        MyStruct("original")
    }
}

@Test
public class TestA {
    public override func afterEach(): Unit {
        clearMatchers()
    }

    @TestCase
    func case1(): Unit {
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default3Foo4foo1HRNat6StringE",
            ["my str 1"],
            ReturnedBar("1")
        )
        println("Return value: " + mockedFoo.foo1("my str 1").toString())
        println("==============================")
    }

    @TestCase
    func case2(): Unit {
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default3Foo4foo2Hi",
            [23],
            "my returned str"
        )
        println("Return value: " + mockedFoo.foo2(23).toString())
        println("==============================")
    }

    @TestCase
    func case3(): Unit {
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default3Foo4foo3HRNY_8MyStructE",
            [MyStruct("my struct")],
            Int32(11)
        )
        println("Return value: " + mockedFoo.foo3(MyStruct("my struct")).toString())
        println("==============================")
    }

    @TestCase
    func case4(): Unit {
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default3Foo4foo4HRNY_8MyStructEiRNat6StringE",
            [MyStruct("my passed struct"), 11, "my str"],
            MyStruct("my returned struct")
        )
        println("Return value: " + mockedFoo.foo4(MyStruct("my passed struct"), 11, "my str").toString())
        println("==============================")
    }
}

/* SCAN-IN
Actual call: foo1("my str 1")
Declared method: foo1(x[1, P, ND])[NA, ND, AC, NA, argsWithValueTypes.cj:38:17]: Class-ReturnedBar
Declared function name: foo1 -> _CN7default3Foo4foo1HRNat6StringE
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (1)
==============================
Actual call: foo2("23")
Declared method: foo2(x[1, P, ND])[NA, D, AC, NA, argsWithValueTypes.cj:42:17]: Struct-String
Declared function name: foo2 -> _CN7default3Foo4foo2Hi
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Return value: my returned str
==============================
Actual call: foo3("This is MyStruct (my struct)")
Declared method: foo3(x[1, P, ND])[NA, D, AC, NA, argsWithValueTypes.cj:46:17]: Int32
Declared function name: foo3 -> _CN7default3Foo4foo3HRNY_8MyStructE
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Return value: 11
==============================
Actual call: foo4("This is MyStruct (my passed struct)", "11", "my str")
Declared method: foo4(x[1, P, ND], y[2, P, ND], z[3, P, ND])[NA, ND, AC, NA, argsWithValueTypes.cj:50:17]: Struct-MyStruct
Declared function name: foo4 -> _CN7default3Foo4foo4HRNY_8MyStructEiRNat6StringE
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is MyStruct (my returned struct)
==============================
 */
