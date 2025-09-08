/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../helpers
// (CJNATIVE) EXEC: %compiler %cmp_opt -Woff=all -p helpers --mock=on %compile_lib_opt --output p.%middle
// (CJNATIVE) EXEC: %compiler %cmp_opt -Woff=all p.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// (CJNATIVE) EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import std.mock_test_util.*
import std.unittest.*
import std.collection.*
import std.unittest.testmacro.*

type MyStr = String

type MyInt = Int32

type MyHashMap<T, K> = HashMap<K, T>

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

class Foo<K> {
    public func foo1(x: PassedBar, y: PassedAnotherBar): MyHashMap<String, String> {
        HashMap<String, String>()
    }
    public func foo2(x: Unit): MyStr {
        return "---"
    }
    public func foo3(x: PassedBar, y: PassedAnotherBar): K {
        HashMap<String, String>() as K ?? throw Exception()
    }
    public func foo4<R>(x: PassedBar, y: PassedAnotherBar): R {
        MyHashMap<String, String>() as R ?? throw Exception()
    }
    public func foo5<R>(x: PassedBar, y: PassedAnotherBar): MyHashMap<R, String> {
        HashMap<String, String>() as MyHashMap<R, String> ?? throw Exception()
    }
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let mockedFoo = unsafe { createMock<Foo<MyStr>>(dummyMockingCallHandler) }
        setReturnDefaultMode()
        println("Return value of foo1: `" + mockedFoo.foo1(PassedBar(), PassedAnotherBar()).toString() + "`")
        println("Return value of foo2: `" + mockedFoo.foo2(()).toString() + "`")
    }

    @TestCase
    func case3(): Unit {
        let mockedFoo = unsafe { createMock<Foo<MyStr>>(dummyMockingCallHandler) }
        setReturnDefaultMode()
        println("Return value of foo5: `" + mockedFoo.foo5<MyInt>(PassedBar(), PassedAnotherBar()).toString() + "`")
    }
}

/* SCAN-IN
-------- Called with ReturnDefault --------
Actual call: foo1("This is Bar", "This is AnotherBar")
Declared method: foo1(x[1, P, ND], y[2, P, ND])[NA, D, AC, NA, typealias.cj:37:17]: Class-HashMap<Struct-String, Struct-String>
Declared function name: foo1 -> _CN7default3FooIG_E4foo1HCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: Foo<std.core:String> -> _CN7default3FooIG_E
Receiver: [doesn't implement ToString]
------------------------------
Return value of foo1: `[]`
-------- Called with ReturnDefault --------
Actual call: foo2("()")
Declared method: foo2(x[1, P, ND])[NA, D, AC, NA, typealias.cj:40:17]: Struct-String
Declared function name: foo2 -> _CN7default3FooIG_E4foo2Hu
Outer decl name: Foo<std.core:String> -> _CN7default3FooIG_E
Receiver: [doesn't implement ToString]
------------------------------
Return value of foo2: ``
-------- Called with ReturnDefault --------
Actual call: foo5<Int32>("This is Bar", "This is AnotherBar")
Declared method: foo5<R>(x[1, P, ND], y[2, P, ND])[NA, D, AC, NA, typealias.cj:49:17]: Class-HashMap<Struct-String, Generics-R>
Declared function name: foo5 -> _CN7default3FooIG_E4foo5IG0_HCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: Foo<std.core:String> -> _CN7default3FooIG_E
Receiver: [doesn't implement ToString]
------------------------------
Return value of foo5: `[]`
 */
