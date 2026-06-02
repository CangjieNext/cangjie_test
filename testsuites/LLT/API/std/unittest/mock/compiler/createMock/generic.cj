/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../helpers
// EXEC: %compiler %cmp_opt -Woff=all -p helpers --mock=on %compile_lib_opt --output p.%middle
// EXEC: %compiler %cmp_opt -Woff=all p.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import std.mock_test_util.*
import std.unittest.*
import std.unittest.testmacro.*

class PassedBar {}

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

class Foo<K> {
    public func foo(x: PassedBar): ReturnedBar {
        println("original `foo` was called")
        ReturnedBar("original")
    }
    public func bar(x: K): ReturnedBar {
        println("original `foo` was called")
        ReturnedBar("original")
    }
}

@Test
public class TestA {
    public override func afterEach(): Unit {
        clearMatchers()
    }

    @TestCase
    func case1(): Unit {
        let mockedFoo = unsafe { createMock<Foo<String>>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default3FooIG_E3fooHCNY_9PassedBarE",
            [1, "my str", 3],
            ReturnedBar("1")
        )
        println("Return value: " + mockedFoo.foo(PassedBar()).toString())
        println("==============================")
    }

    func makeMock() {
        let x = unsafe { createMock<Foo<String>>(dummyMockingCallHandler) }
        return x
    }

    @TestCase
    func case2(): Unit {
        let mockedFoo = makeMock()
        addMatcher(
            "_CN7default3FooIG_E3fooHCNY_9PassedBarE",
            [1, "my str", 3],
            ReturnedBar("2")
        )
        println("Return value: " + mockedFoo.foo(PassedBar()).toString())
        println("==============================")
    }

    @Frozen
    func makeMockG<T>() {
        unsafe { createMock<Foo<T>>(dummyMockingCallHandler) }
    }

    @TestCase
    func case3(): Unit {
        let mockedFoo = makeMockG<String>()
        addMatcher(
            "_CN7default3FooIG_E3fooHCNY_9PassedBarE",
            [1, "my str", 3],
            ReturnedBar("3")
        )
        println("Return value: " + mockedFoo.foo(PassedBar()).toString())
        println("==============================")
    }

    @Frozen
    func makeMockG2<T>() {
        unsafe { createMock<T>(dummyMockingCallHandler) }
    }

    @TestCase
    func case4(): Unit {
        let mockedFoo = makeMockG<PassedAnotherBar>()
        addMatcher(
            "_CN7default3FooIG_E3barHG_",
            [1, "my str", 3],
            ReturnedBar("4")
        )
        println("Return value: " + mockedFoo.bar(PassedAnotherBar()).toString())
        println("==============================")
    }

    @TestCase
    func case5(): Unit {
        let mockedFoo = makeMockG2<Foo<PassedAnotherBar>>()
        addMatcher(
            "_CN7default3FooIG_E3barHG_",
            [1, "my str", 3],
            ReturnedBar("5")
        )
        println("Return value: " + mockedFoo.bar(PassedAnotherBar()).toString())
        println("==============================")
    }
}

/* SCAN-IN
Actual call: foo([not ToString])
Declared method: foo(x[1, P, ND])[NA, ND, AC, NA, generic.cj:36:17]: Class-ReturnedBar
Declared function name: foo -> _CN7default3FooIG_E3fooHCNY_9PassedBarE
Outer decl name: Foo<std.core:String> -> _CN7default3FooIG_E
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (1)
==============================
Actual call: foo([not ToString])
Declared method: foo(x[1, P, ND])[NA, ND, AC, NA, generic.cj:36:17]: Class-ReturnedBar
Declared function name: foo -> _CN7default3FooIG_E3fooHCNY_9PassedBarE
Outer decl name: Foo<std.core:String> -> _CN7default3FooIG_E
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (2)
==============================
Actual call: foo([not ToString])
Declared method: foo(x[1, P, ND])[NA, ND, AC, NA, generic.cj:36:17]: Class-ReturnedBar
Declared function name: foo -> _CN7default3FooIG_E3fooHCNY_9PassedBarE
Outer decl name: Foo<std.core:String> -> _CN7default3FooIG_E
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (3)
==============================
Actual call: bar("This is AnotherBar")
Declared method: bar(x[1, P, ND])[NA, ND, AC, NA, generic.cj:40:17]: Class-ReturnedBar
Declared function name: bar -> _CN7default3FooIG_E3barHG_
Outer decl name: Foo<default:PassedAnotherBar> -> _CN7default3FooIG_E
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (4)
==============================
Actual call: bar("This is AnotherBar")
Declared method: bar(x[1, P, ND])[NA, ND, AC, NA, generic.cj:40:17]: Class-ReturnedBar
Declared function name: bar -> _CN7default3FooIG_E3barHG_
Outer decl name: Foo<default:PassedAnotherBar> -> _CN7default3FooIG_E
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (5)
==============================
 */
