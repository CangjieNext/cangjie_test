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

class Foo {
    public mut prop name: String {
        get() {
            println("original getter of name was called")
            "123"
        }
        set(v) {
            println("original setter of name was called")
        }
    }
    prop anotherName: Int32 {
        get() {
            println("original getter of name was called")
            123
        }
    }

    public func foo(x: String, y: Int64): Int32 {
        println("original `foo` was called");
        23
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
            "_CN7default3Foo4namepgHv",
            [],
            "987"
        )
        addMatcher(
            "_CN7default3Foo4namepsHRNat6StringE",
            ["222"],
            ()
        )
        println("Getter return value: " + mockedFoo.name)
        println("==============================")
        mockedFoo.name = "666"
        println("==============================")
    }

    @TestCase
    func case2(): Unit {
        let myX: Int32 = 753
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default3Foo26$anotherNameget$ToMock_FooHv",
            [],
            myX
        )
        println("Getter return value: " + mockedFoo.anotherName.toString())
        println("==============================")
    }
}

/* SCAN-IN
Actual call: $nameget()
Declared prop getter: name()[NA, D, AC, HS, gettersAndSetters.cj:19:9]: Struct-String
Declared function name: $nameget -> _CN7default3Foo4namepgHv
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Getter return value: 987
==============================
Actual call: $nameset("666")
Declared prop setter: name(v[1, P, ND])[NA, D, AC, NA, gettersAndSetters.cj:23:9]: Unit
Declared function name: $nameset -> _CN7default3Foo4namepsHRNat6StringE
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
==============================
Actual call: $anotherNameget()
Declared prop getter: anotherName()[NA, D, AC, DHS, gettersAndSetters.cj:28:9]: Int32
Declared function name: $anotherNameget -> _CN7default3Foo26$anotherNameget$ToMock_FooHv
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Getter return value: 753
==============================
 */
