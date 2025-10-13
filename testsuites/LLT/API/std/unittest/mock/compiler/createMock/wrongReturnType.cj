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
import std.collection.*
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
    public func foo1(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        println("original `foo` was called")
        ReturnedBar("original")
    }
    public func foo2(x: PassedBar, y: PassedAnotherBar): HashMap<String, ArrayList<Int64>> {
        println("original `foo` was called")
        HashMap<String, ArrayList<Int64>>()
    }
}

class Bar<K> where K <: Equatable<K> {
    public func foo2<R>(x: R, y: K): HashMap<R, ArrayList<K>> where R <: Hashable & Equatable<R> {
        println("original `foo` was called")
        HashMap<R, ArrayList<K>>()
    }
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default3Foo4foo1HCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            "1"
        )
        try {
            mockedFoo.foo1(PassedBar(), PassedAnotherBar())
        } catch (e: MockReturnValueTypeMismatchException) {
            println(e.message)
        }
        println("==============================")
    }

    @TestCase
    func case2(): Unit {
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default3Foo4foo2HCNY_9PassedBarECNY_16PassedAnotherBarE",
            [1, "my str", 3],
            HashMap<String, ArrayList<Int32>>()
        )
        try {
            mockedFoo.foo2(PassedBar(), PassedAnotherBar())
        } catch (e: MockReturnValueTypeMismatchException) {
            println(e.message)
        }
        println("==============================")
    }

    @TestCase
    func case3(): Unit {
        let mockedFoo = unsafe { createMock<Bar<String>>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default3BarIG_E4foo2IG0_HG0_G_",
            [1, "my str", 3],
            HashMap<Int8, ArrayList<String>>()
        )
        try {
            mockedFoo.foo2<Int16>(1, "aaa")
        } catch (e: MockReturnValueTypeMismatchException) {
            println(e.message)
        }
        println("==============================")
    }

    @TestCase
    func case4(): Unit {
        let mockedFoo = unsafe { createMock<Bar<String>>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default3BarIG_E4foo2IG0_HG0_G_",
            [1, "my str", 3],
            HashMap<Int16, ArrayList<Int8>>()
        )
        try {
            mockedFoo.foo2<Int16>(33, "bbb")
        } catch (e: MockReturnValueTypeMismatchException) {
            println(e.message)
        }
        println("==============================")
    }
}

/* SCAN-IN
Actual call: foo1("This is Bar", "This is AnotherBar")
Declared method: foo1(x[1, P, ND], y[2, P, ND])[NA, ND, AC, NA, wrongReturnType.cj:41:17]: Class-ReturnedBar
Declared function name: foo1 -> _CN7default3Foo4foo1HCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Type of the stub's return value doesn't match the corresponding declaration's return type. Please make sure that type in stub is `Class-ReturnedBar`
==============================
Actual call: foo2("This is Bar", "This is AnotherBar")
Declared method: foo2(x[1, P, ND], y[2, P, ND])[NA, D, AC, NA, wrongReturnType.cj:45:17]: Class-HashMap<Struct-String, Class-ArrayList<Int64>>
Declared function name: foo2 -> _CN7default3Foo4foo2HCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Type of the stub's return value doesn't match the corresponding declaration's return type. Please make sure that type in stub is `Class-HashMap<Struct-String, Class-ArrayList<Int64>>`
==============================
Actual call: foo2<Int16>("1", "aaa")
Declared method: foo2<R>(x[1, P, ND], y[2, P, ND])[NA, D, AC, NA, wrongReturnType.cj:52:17]: Class-HashMap<Generics-R, Class-ArrayList<Generics-K>>
Declared function name: foo2 -> _CN7default3BarIG_E4foo2IG0_HG0_G_
Outer decl name: Bar<std.core:String> -> _CN7default3BarIG_E
Receiver: [doesn't implement ToString]
------------------------------
Type of the stub's return value doesn't match the corresponding declaration's return type. Please make sure that type in stub is `Class-HashMap<Generics-R, Class-ArrayList<Generics-K>>`
==============================
Actual call: foo2<Int16>("33", "bbb")
Declared method: foo2<R>(x[1, P, ND], y[2, P, ND])[NA, D, AC, NA, wrongReturnType.cj:52:17]: Class-HashMap<Generics-R, Class-ArrayList<Generics-K>>
Declared function name: foo2 -> _CN7default3BarIG_E4foo2IG0_HG0_G_
Outer decl name: Bar<std.core:String> -> _CN7default3BarIG_E
Receiver: [doesn't implement ToString]
------------------------------
Type of the stub's return value doesn't match the corresponding declaration's return type. Please make sure that type in stub is `Class-HashMap<Generics-R, Class-ArrayList<Generics-K>>`
==============================
 */
