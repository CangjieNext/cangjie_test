/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../helpers
// EXEC: %compiler %cmp_opt -Woff=all -p helpers %compile_lib_opt --output p.%middle
// EXEC-PIPE-1: %compiler %cmp_opt -Woff=all p.%middle %n.cj -o %output --mock=runtime-error 2>&1 | compare %f

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

class Foo {
    public func foo(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        println("original `foo` was called")
        ReturnedBar("original")
    }
}

public class TestA {
    func case1(): Unit {
        let mockedFoo = unsafe {
            try {
                createMock<Foo>(dummyMockingCallHandler)
            } catch (e: IllegalMockCallException) {
                println("1st `IllegalMockCallException` was thrown")
                println("==============================")
                return
            }
        }
        addMatcher(
            "_CN7default3Foo3fooECN7default9PassedBarECN7default16PassedAnotherBarE",
            [1, "my str", 3],
            ReturnedBar("1")
        )
        println("Return value: " + mockedFoo.foo(PassedBar(), PassedAnotherBar()).toString())
        println("==============================")
    }

    @Frozen
    unsafe func createMockWrapper<T>(): T {
        createMock<T>(dummyMockingCallHandler)
    }

    func case2(): Unit {
        try {
            let mockedFoo = unsafe { createMockWrapper<Foo>() }
            println("Return value: " + mockedFoo.foo(PassedBar(), PassedAnotherBar()).toString())
        } catch (e: IllegalMockCallException) {
            println("2nd `IllegalMockCallException` was thrown")
        }
    }
}

main() {
    0
}

/* SCAN-IN
error: mocking features can be used only in the test mode, please pass --test compilation option to compile the package in the test mode
  ==> runtimeErrorNotInTestMode.cj:67:9:
   | 
67 |         createMock<T>(dummyMockingCallHandler)
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 

error: mocking features can be used only in the test mode, please pass --test compilation option to compile the package in the test mode
  ==> runtimeErrorNotInTestMode.cj:49:17:
   | 
49 |                 createMock<Foo>(dummyMockingCallHandler)
   |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 
*/
