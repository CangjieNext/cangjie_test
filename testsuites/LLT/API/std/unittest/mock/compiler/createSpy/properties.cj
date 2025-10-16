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

open class BaseFoo {
    public mut open prop name1: String {
        get() {
            println("original `name1` getter of name was called")
            "123"
        }
        set(v) {
            println("original `name1` setter of name was called with value = " + v)
        }
    }
    public mut open prop name2: String {
        get() {
            println("original `name2` getter of name was called")
            "123"
        }
        set(v) {
            println("original `name2` setter of name was called with value = " + v)
        }
    }
    public open prop anotherName: Int32 {
        get() {
            println("original `anotherName` getter of name was called")
            123
        }
    }
}

open class InterFoo <: BaseFoo {
    public mut open override prop name1: String {
        get() {
            println("original `name1` getter of name was called")
            "123"
        }
        set(v) {
            println("original `name1` setter of name was called with value = " + v)
        }
    }
    public open override prop anotherName: Int32 {
        get() {
            println("original `anotherName` getter of name was called")
            123
        }
    }
}

class DerivedFoo <: InterFoo {
    public mut open override prop name1: String {
        get() {
            println("original `name1` getter of name was called")
            "123"
        }
        set(v) {
            println("original `name1` setter of name was called with value = " + v)
        }
    }
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let mockedFoo = unsafe { createSpy<DerivedFoo>(dummyMockingCallHandler, DerivedFoo()) }
        setSpyMode()
        println("Getter return value: " + mockedFoo.name1)
        println("==============================")
        mockedFoo.name1 = "666"
        println("==============================")
    }

    @TestCase
    func case2(): Unit {
        let mockedFoo = unsafe { createSpy<DerivedFoo>(dummyMockingCallHandler, DerivedFoo()) }
        setSpyMode()
        println("Getter return value: " + mockedFoo.name2)
        println("==============================")
    }

    @TestCase
    func case3(): Unit {
        let mockedFoo = unsafe { createSpy<DerivedFoo>(dummyMockingCallHandler, DerivedFoo()) }
        setSpyMode()
        println("Getter return value: " + mockedFoo.anotherName.toString())
        println("==============================")
    }

    @TestCase
    func case4(): Unit {
        let mockedFoo = unsafe { createSpy<InterFoo>(dummyMockingCallHandler, InterFoo()) }
        setSpyMode()
        println("Getter return value: " + mockedFoo.name1)
        println("==============================")
        mockedFoo.name1 = "666"
        println("==============================")
    }

    @TestCase
    func case5(): Unit {
        let mockedFoo = unsafe { createSpy<InterFoo>(dummyMockingCallHandler, InterFoo()) }
        setSpyMode()
        println("Getter return value: " + mockedFoo.name2)
        println("==============================")
    }

    @TestCase
    func case6(): Unit {
        let mockedFoo = unsafe { createSpy<InterFoo>(dummyMockingCallHandler, InterFoo()) }
        setSpyMode()
        println("Getter return value: " + mockedFoo.anotherName.toString())
        println("==============================")
    }

    @TestCase
    func case7(): Unit {
        let mockedFoo = unsafe { createSpy<BaseFoo>(dummyMockingCallHandler, BaseFoo()) }
        setSpyMode()
        println("Getter return value: " + mockedFoo.name1)
        println("==============================")
        mockedFoo.name1 = "666"
        println("==============================")
    }

    @TestCase
    func case8(): Unit {
        let mockedFoo = unsafe { createSpy<BaseFoo>(dummyMockingCallHandler, BaseFoo()) }
        setSpyMode()
        println("Getter return value: " + mockedFoo.name2)
        println("==============================")
        mockedFoo.name2 = "666"
        println("==============================")
    }

    @TestCase
    func case9(): Unit {
        let mockedFoo = unsafe { createSpy<BaseFoo>(dummyMockingCallHandler, BaseFoo()) }
        setSpyMode()
        println("Getter return value: " + mockedFoo.anotherName.toString())
        println("==============================")
    }
}

/* SCAN-IN
-------- Called with CallBase --------
Actual call: $name1get()
Declared prop getter: name1()[NA, D, AC, HS, properties.cj:64:9]: Struct-String
Declared function name: $name1get -> _CN7default10DerivedFoo5name1pgHv
Outer decl name: DerivedFoo -> _CN7default10DerivedFooE
Receiver: [doesn't implement ToString]
------------------------------
original `name1` getter of name was called
Getter return value: 123
==============================
-------- Called with CallBase --------
Actual call: $name1set("666")
Declared prop setter: name1(v[1, P, ND])[NA, D, AC, NA, properties.cj:68:9]: Unit
Declared function name: $name1set -> _CN7default10DerivedFoo5name1psHRNat6StringE
Outer decl name: DerivedFoo -> _CN7default10DerivedFooE
Receiver: [doesn't implement ToString]
------------------------------
original `name1` setter of name was called with value = 666
==============================
-------- Called with CallBase --------
Actual call: $name2get()
Declared prop getter: name2()[NA, D, AC, HS, properties.cj:28:9]: Struct-String
Declared function name: $name2get -> _CN7default7BaseFoo5name2pgHv
Outer decl name: BaseFoo -> _CN7default7BaseFooE
Receiver: [doesn't implement ToString]
------------------------------
original `name2` getter of name was called
Getter return value: 123
==============================
-------- Called with CallBase --------
Actual call: $anotherNameget()
Declared prop getter: anotherName()[NA, D, AC, DHS, properties.cj:55:9]: Int32
Declared function name: $anotherNameget -> _CN7default8InterFoo11anotherNamepgHv
Outer decl name: InterFoo -> _CN7default8InterFooE
Receiver: [doesn't implement ToString]
------------------------------
original `anotherName` getter of name was called
Getter return value: 123
==============================
-------- Called with CallBase --------
Actual call: $name1get()
Declared prop getter: name1()[NA, D, AC, HS, properties.cj:46:9]: Struct-String
Declared function name: $name1get -> _CN7default8InterFoo5name1pgHv
Outer decl name: InterFoo -> _CN7default8InterFooE
Receiver: [doesn't implement ToString]
------------------------------
original `name1` getter of name was called
Getter return value: 123
==============================
-------- Called with CallBase --------
Actual call: $name1set("666")
Declared prop setter: name1(v[1, P, ND])[NA, D, AC, NA, properties.cj:50:9]: Unit
Declared function name: $name1set -> _CN7default8InterFoo5name1psHRNat6StringE
Outer decl name: InterFoo -> _CN7default8InterFooE
Receiver: [doesn't implement ToString]
------------------------------
original `name1` setter of name was called with value = 666
==============================
-------- Called with CallBase --------
Actual call: $name2get()
Declared prop getter: name2()[NA, D, AC, HS, properties.cj:28:9]: Struct-String
Declared function name: $name2get -> _CN7default7BaseFoo5name2pgHv
Outer decl name: BaseFoo -> _CN7default7BaseFooE
Receiver: [doesn't implement ToString]
------------------------------
original `name2` getter of name was called
Getter return value: 123
==============================
-------- Called with CallBase --------
Actual call: $anotherNameget()
Declared prop getter: anotherName()[NA, D, AC, DHS, properties.cj:55:9]: Int32
Declared function name: $anotherNameget -> _CN7default8InterFoo11anotherNamepgHv
Outer decl name: InterFoo -> _CN7default8InterFooE
Receiver: [doesn't implement ToString]
------------------------------
original `anotherName` getter of name was called
Getter return value: 123
==============================
-------- Called with CallBase --------
Actual call: $name1get()
Declared prop getter: name1()[NA, D, AC, HS, properties.cj:19:9]: Struct-String
Declared function name: $name1get -> _CN7default7BaseFoo5name1pgHv
Outer decl name: BaseFoo -> _CN7default7BaseFooE
Receiver: [doesn't implement ToString]
------------------------------
original `name1` getter of name was called
Getter return value: 123
==============================
-------- Called with CallBase --------
Actual call: $name1set("666")
Declared prop setter: name1(v[1, P, ND])[NA, D, AC, NA, properties.cj:23:9]: Unit
Declared function name: $name1set -> _CN7default7BaseFoo5name1psHRNat6StringE
Outer decl name: BaseFoo -> _CN7default7BaseFooE
Receiver: [doesn't implement ToString]
------------------------------
original `name1` setter of name was called with value = 666
==============================
-------- Called with CallBase --------
Actual call: $name2get()
Declared prop getter: name2()[NA, D, AC, HS, properties.cj:28:9]: Struct-String
Declared function name: $name2get -> _CN7default7BaseFoo5name2pgHv
Outer decl name: BaseFoo -> _CN7default7BaseFooE
Receiver: [doesn't implement ToString]
------------------------------
original `name2` getter of name was called
Getter return value: 123
==============================
-------- Called with CallBase --------
Actual call: $name2set("666")
Declared prop setter: name2(v[1, P, ND])[NA, D, AC, NA, properties.cj:32:9]: Unit
Declared function name: $name2set -> _CN7default7BaseFoo5name2psHRNat6StringE
Outer decl name: BaseFoo -> _CN7default7BaseFooE
Receiver: [doesn't implement ToString]
------------------------------
original `name2` setter of name was called with value = 666
==============================
-------- Called with CallBase --------
Actual call: $anotherNameget()
Declared prop getter: anotherName()[NA, D, AC, DHS, properties.cj:37:9]: Int32
Declared function name: $anotherNameget -> _CN7default7BaseFoo11anotherNamepgHv
Outer decl name: BaseFoo -> _CN7default7BaseFooE
Receiver: [doesn't implement ToString]
------------------------------
original `anotherName` getter of name was called
Getter return value: 123
==============================
 */
