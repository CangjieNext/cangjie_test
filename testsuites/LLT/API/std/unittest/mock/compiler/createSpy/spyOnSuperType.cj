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

open class Foo {
    public func foo(x: String, y: Int32): Int64 {
        println("original `foo` was called with args: x = ${x} and y = ${y}")
        77
    }
    public open func bar(x: String, y: Int32): Int64 {
        println("original `foo` was called with args: x = ${x} and y = ${y}")
        77
    }
}

interface I {
    func foo2(x: String, y: Int32): Int64 {
        println("original `foo` was called with args: x = ${x} and y = ${y}")
        771
    }

    open func bar2(x: String, y: Int32): Int64 {
        println("original `foo` was called with args: x = ${x} and y = ${y}")
        772
    }

    open func boo2(x: String, y: Int32): Int64
}

class DerivedFoo <: Foo & I {
    public open override func bar(x: String, y: Int32): Int64 {
        println("original `foo` was called with args: x = ${x} and y = ${y}")
        881
    }
    public open override func bar2(x: String, y: Int32): Int64 {
        println("original `foo` was called with args: x = ${x} and y = ${y}")
        882
    }
    public open override func boo2(x: String, y: Int32): Int64 {
        println("original `foo` was called with args: x = ${x} and y = ${y}")
        883
    }
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let foo = DerivedFoo()
        let spiedFoo = unsafe { createSpy<Foo>(dummyMockingCallHandler, foo) }
        setSpyMode()
        println("returned value: ${spiedFoo.foo("my str", 99)}")
        println("==============================")
    }

    @TestCase
    func case2(): Unit {
        let foo = DerivedFoo()
        let spiedFoo = unsafe { createSpy<Foo>(dummyMockingCallHandler, foo) }
        setSpyMode()
        println("returned value: ${spiedFoo.bar("my str", 99)}")
        println("==============================")
    }

    @TestCase
    func case3(): Unit {
        let foo = DerivedFoo()
        let spiedFoo = unsafe { createSpy<I>(dummyMockingCallHandler, foo) }
        setSpyMode()
        println("returned value: ${spiedFoo.foo2("my str", 99)}")
        println("==============================")
    }

    @TestCase
    func case4(): Unit {
        let foo = DerivedFoo()
        let spiedFoo = unsafe { createSpy<I>(dummyMockingCallHandler, foo) }
        setSpyMode()
        println("returned value: ${spiedFoo.bar2("my str", 99)}")
        println("==============================")
    }

    @TestCase
    func case5(): Unit {
        let foo = DerivedFoo()
        let spiedFoo = unsafe { createSpy<I>(dummyMockingCallHandler, foo) }
        setSpyMode()
        println("returned value: ${spiedFoo.boo2("my str", 99)}")
        println("==============================")
    }
}

/* SCAN-IN
-------- Called with CallBase --------
Actual call: foo("my str", "99")
Declared method: foo(x[1, P, ND], y[2, P, ND])[NA, D, AC, NA, spyOnSuperType.cj:18:17]: Int64
Declared function name: foo -> _CN7default3Foo3fooHRNat6StringEi
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
original `foo` was called with args: x = my str and y = 99
returned value: 77
==============================
-------- Called with CallBase --------
Actual call: bar("my str", "99")
Declared method: bar(x[1, P, ND], y[2, P, ND])[NA, D, AC, NA, spyOnSuperType.cj:22:22]: Int64
Declared function name: bar -> _CN7default3Foo3barHRNat6StringEi
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
original `foo` was called with args: x = my str and y = 99
returned value: 881
==============================
-------- Called with CallBase --------
Actual call: foo2("my str", "99")
Declared method: foo2(x[1, P, ND], y[2, P, ND])[NA, D, AC, NA, spyOnSuperType.cj:29:10]: Int64
Declared function name: foo2 -> _CN7default1I4foo2HRNat6StringEi
Outer decl name: I -> _CN7default1IE
Receiver: [doesn't implement ToString]
------------------------------
original `foo` was called with args: x = my str and y = 99
returned value: 771
==============================
-------- Called with CallBase --------
Actual call: bar2("my str", "99")
Declared method: bar2(x[1, P, ND], y[2, P, ND])[NA, D, AC, NA, spyOnSuperType.cj:34:15]: Int64
Declared function name: bar2 -> _CN7default1I4bar2HRNat6StringEi
Outer decl name: I -> _CN7default1IE
Receiver: [doesn't implement ToString]
------------------------------
original `foo` was called with args: x = my str and y = 99
returned value: 882
==============================
-------- Called with CallBase --------
Actual call: boo2("my str", "99")
Declared method: boo2(x[1, P, ND], y[2, P, ND])[A, D, AC, NA, spyOnSuperType.cj:39:15]: Int64
Declared function name: boo2 -> _CN7default1I4boo2HRNat6StringEi
Outer decl name: I -> _CN7default1IE
Receiver: [doesn't implement ToString]
------------------------------
original `foo` was called with args: x = my str and y = 99
returned value: 883
==============================
 */
