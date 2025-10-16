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

package std.unittest.mock

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
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
    }

    func makeMock() {
        unsafe { createMock<Foo>(dummyMockingCallHandler) }
    }

    func case2(): Unit {
        let mockedFoo = makeMock()
    }

    @Frozen
    func makeMockG<T>() {
        unsafe { createMock<T>(dummyMockingCallHandler) }
    }

    func case3(): Unit {
        let mockedFoo = makeMockG<Foo>()
    }

    @Frozen
    func makeMockG2<T>() {
        unsafe { createMock<Bar<T>>(dummyMockingCallHandler) }
    }

    func case4(): Unit {
        let mockedFoo = makeMockG2<Foo>()
    }
}

main() {
}

/* SCAN-IN
error: mocking features can be used only in the test mode, please pass --test compilation option to compile the package in the test mode
  ==> disabledMocking.cj:67:18:
   | 
67 |         unsafe { createMock<T>(dummyMockingCallHandler) }
   |                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 

error: mocking features can be used only in the test mode, please pass --test compilation option to compile the package in the test mode
  ==> disabledMocking.cj:76:18:
   | 
76 |         unsafe { createMock<Bar<T>>(dummyMockingCallHandler) }
   |                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 

error: mocking features can be used only in the test mode, please pass --test compilation option to compile the package in the test mode
  ==> disabledMocking.cj:54:34:
   | 
54 |         let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
   |                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 

error: mocking features can be used only in the test mode, please pass --test compilation option to compile the package in the test mode
  ==> disabledMocking.cj:58:18:
   | 
58 |         unsafe { createMock<Foo>(dummyMockingCallHandler) }
   |                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 
*/
