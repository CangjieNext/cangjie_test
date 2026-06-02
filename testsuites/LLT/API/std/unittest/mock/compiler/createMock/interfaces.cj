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

class PassedBar <: ToString {
    public override func toString() {
        "This is Bar"
    }
}

class PassedAnotherBar <: ToString {
    public override func toString() {
        "This is AnotherBar"
    }
}

class ReturnedBar <: ToString {
    private let x: String
    init(x: String) {
        this.x = x
    }
    public override func toString() {
        "This is ReturnedBar (${x})"
    }
}

interface Foo {
    func foo(x: PassedBar, y: PassedAnotherBar): ReturnedBar
    func bar(): Int32
    func fooDefault(x: Int32): String {
        "not my str"
    }
}

@Test
public class TestA {
    public override func afterEach(): Unit {
        clearMatchers()
    }

    @TestCase
    func case1(): Unit {
        let mockedFoo: Foo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default3Foo3fooHCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("1")
        )
        println("Return value: " + mockedFoo.foo(PassedBar(), PassedAnotherBar()).toString())
        println("==============================")
    }

    @TestCase
    func case2(): Unit {
        let mockedFoo: Foo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        let x: Int32 = 20
        addMatcher(
            "_CN7default3Foo3barHv",
            [1, "my str", 3],
            x
        )
        println("Return value: " + mockedFoo.bar().toString())
        println("==============================")
    }

    @TestCase
    func case3(): Unit {
        let mockedFoo: Foo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        let x: Int32 = 20
        addMatcher(
            "_CN7default3Foo10fooDefaultHi",
            [1, "my str", 3],
            "my str"
        )
        println("Return value: " + mockedFoo.fooDefault(x).toString())
        println("==============================")
    }
}

/* SCAN-IN
Actual call: foo("This is Bar", "This is AnotherBar")
Declared method: foo(x[1, P, ND], y[2, P, ND])[A, ND, AC, NA, interfaces.cj:40:10]: Class-ReturnedBar
Declared function name: foo -> _CN7default3Foo3fooHCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (1)
==============================
Actual call: bar()
Declared method: bar()[A, D, AC, NA, interfaces.cj:41:10]: Int32
Declared function name: bar -> _CN7default3Foo3barHv
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Return value: 20
==============================
Actual call: fooDefault("20")
Declared method: fooDefault(x[1, P, ND])[NA, D, AC, NA, interfaces.cj:42:10]: Struct-String
Declared function name: fooDefault -> _CN7default3Foo10fooDefaultHi
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Return value: my str
==============================
 */
