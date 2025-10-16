/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../helpers
// EXEC: %compiler %cmp_opt -Woff=all -p helpers %compile_lib_opt --output p.%middle
// EXEC-PIPE-1: %compiler %cmp_opt -Woff=all p.%middle %n.cj -o %output 2>&1 | compare %f

import std.mock_test_util.*

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

class Foo {
    public func foo(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        println("original `foo` was called")
        ReturnedBar("original")
    }
}

class Bar<T> {
    public func foo(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        println("original `foo` was called")
        ReturnedBar("original")
    }
}

public class TestA {
    func case1(): Unit {
        let mockedFoo = unsafe { createSpy<Foo>(dummyMockingCallHandler, Foo()) }
        addMatcher(
            "_CN7default3Foo3fooECN7default9PassedBarECN7default16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("1")
        )
        println("Return value: " + mockedFoo.foo(PassedBar(), PassedAnotherBar()).toString())
        println("==============================")
    }

    func makeSpy() {
        unsafe { createSpy<Foo>(dummyMockingCallHandler, Foo()) }
    }

    func case2(): Unit {
        let mockedFoo = makeSpy()
        addMatcher(
            "_CN7default3Foo3fooECN7default9PassedBarECN7default16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("2")
        )
        let y = mockedFoo.foo(PassedBar(), PassedAnotherBar())
        println("Return value: ${y}")
        println("==============================")
    }

    @Frozen
    func makeSpyG<T>(i: T) {
        unsafe { createSpy<T>(dummyMockingCallHandler, i) }
    }

    func case3(): Unit {
        let mockedFoo = makeSpyG<Foo>(Foo())
        addMatcher(
            "_CN7default3Foo3fooECN7default9PassedBarECN7default16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("2")
        )
        let y = mockedFoo.foo(PassedBar(), PassedAnotherBar())
        println("Return value: ${y}")
        println("==============================")
    }

    @Frozen
    func makeSpyG2<T>() {
        unsafe { createSpy<Bar<T>>(dummyMockingCallHandler, Bar<T>()) }
    }

    func case4(): Unit {
        let mockedFoo = makeSpyG2<Foo>()
        addMatcher(
            "_CN7default3Foo3fooECN7default9PassedBarECN7default16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("2")
        )
        let y = mockedFoo.foo(PassedBar(), PassedAnotherBar())
        println("Return value: ${y}")
        println("==============================")
    }
}

main() {}

/* SCAN-IN
error: mocking features can be used only in the test mode, please pass --test compilation option to compile the package in the test mode
  ==> disabledMocking.cj:80:18:
   | 
80 |         unsafe { createSpy<T>(dummyMockingCallHandler, i) }
   |                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 

error: mocking features can be used only in the test mode, please pass --test compilation option to compile the package in the test mode
  ==> disabledMocking.cj:97:18:
   | 
97 |         unsafe { createSpy<Bar<T>>(dummyMockingCallHandler, Bar<T>()) }
   |                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 

error: mocking features can be used only in the test mode, please pass --test compilation option to compile the package in the test mode
  ==> disabledMocking.cj:52:34:
   | 
52 |         let mockedFoo = unsafe { createSpy<Foo>(dummyMockingCallHandler, Foo()) }
   |                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 

error: mocking features can be used only in the test mode, please pass --test compilation option to compile the package in the test mode
  ==> disabledMocking.cj:63:18:
   | 
63 |         unsafe { createSpy<Foo>(dummyMockingCallHandler, Foo()) }
   |                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 
*/
