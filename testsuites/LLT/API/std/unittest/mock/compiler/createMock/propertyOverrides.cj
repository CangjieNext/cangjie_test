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
            println("original getter of name was called")
            "123"
        }
        set(v) {
            println("original setter of name was called")
        }
    }
    public mut open prop name2: String {
        get() {
            println("original getter of name was called")
            "123"
        }
        set(v) {
            println("original setter of name was called")
        }
    }
    public open prop anotherName: Int32 {
        get() {
            println("original getter of name was called")
            123
        }
    }
}

open class InterFoo <: BaseFoo {
    public mut open override prop name1: String {
        get() {
            println("original getter of name was called")
            "123"
        }
        set(v) {
            println("original setter of name was called")
        }
    }
    public open override prop anotherName: Int32 {
        get() {
            println("original getter of name was called")
            123
        }
    }
}

class DerivedFoo <: InterFoo {
    public mut open override prop name1: String {
        get() {
            println("original getter of name was called")
            "123"
        }
        set(v) {
            println("original setter of name was called")
        }
    }
}

@Test
public class TestA {
    public override func afterEach(): Unit {
        clearMatchers()
    }

    @TestCase
    func case1(): Unit {
        let mockedFoo = unsafe { createMock<DerivedFoo>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default10DerivedFoo5name1pgHv",
            [],
            "987"
        )
        addMatcher(
            "_CN7default10DerivedFoo5name1psHRNat6StringE",
            ["222"],
            ()
        )
        println("Getter return value: " + mockedFoo.name1)
        println("==============================")
        mockedFoo.name1 = "666"
        println("==============================")
    }

    @TestCase
    func case2(): Unit {
        let mockedFoo = unsafe { createMock<DerivedFoo>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default7BaseFoo5name2pgHv",
            [],
            "987"
        )
        println("Getter return value: " + mockedFoo.name2)
        println("==============================")
    }

    @TestCase
    func case3(): Unit {
        let mockedFoo = unsafe { createMock<DerivedFoo>(dummyMockingCallHandler) }
        let i: Int32 = 345
        addMatcher(
            "_CN7default8InterFoo11anotherNamepgHv",
            [],
            i
        )
        println("Getter return value: " + mockedFoo.anotherName.toString())
        println("==============================")
    }

    @TestCase
    func case4(): Unit {
        let mockedFoo = unsafe { createMock<InterFoo>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default8InterFoo5name1pgHv",
            [],
            "987"
        )
        addMatcher(
            "_CN7default8InterFoo5name1psHRNat6StringE",
            ["222"],
            ()
        )
        println("Getter return value: " + mockedFoo.name1)
        println("==============================")
        mockedFoo.name1 = "666"
        println("==============================")
    }

    @TestCase
    func case5(): Unit {
        let mockedFoo = unsafe { createMock<InterFoo>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default7BaseFoo5name2pgHv",
            [],
            "987"
        )
        println("Getter return value: " + mockedFoo.name2)
        println("==============================")
    }

    @TestCase
    func case6(): Unit {
        let i: Int32 = 345
        let mockedFoo = unsafe { createMock<InterFoo>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default8InterFoo11anotherNamepgHv",
            [],
            i
        )
        println("Getter return value: " + mockedFoo.anotherName.toString())
        println("==============================")
    }

    @TestCase
    func case7(): Unit {
        let mockedFoo = unsafe { createMock<BaseFoo>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default7BaseFoo5name1pgHv",
            [],
            "987"
        )
        addMatcher(
            "_CN7default7BaseFoo5name1psHRNat6StringE",
            ["222"],
            ()
        )
        println("Getter return value: " + mockedFoo.name1)
        println("==============================")
        mockedFoo.name1 = "666"
        println("==============================")
    }

    @TestCase
    func case8(): Unit {
        let mockedFoo = unsafe { createMock<BaseFoo>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default7BaseFoo5name2pgHv",
            [],
            "987"
        )
        addMatcher(
            "_CN7default7BaseFoo5name2psHRNat6StringE",
            ["222"],
            ()
        )
        println("Getter return value: " + mockedFoo.name2)
        println("==============================")
        mockedFoo.name2 = "666"
        println("==============================")
    }

    @TestCase
    func case9(): Unit {
        let i: Int32 = 345
        let mockedFoo = unsafe { createMock<BaseFoo>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default7BaseFoo11anotherNamepgHv",
            [],
            i
        )
        println("Getter return value: " + mockedFoo.anotherName.toString())
        println("==============================")
    }
}

/* SCAN-IN
Actual call: $name1get()
Declared prop getter: name1()[NA, D, AC, HS, propertyOverrides.cj:64:9]: Struct-String
Declared function name: $name1get -> _CN7default10DerivedFoo5name1pgHv
Outer decl name: DerivedFoo -> _CN7default10DerivedFooE
Receiver: [doesn't implement ToString]
------------------------------
Getter return value: 987
==============================
Actual call: $name1set("666")
Declared prop setter: name1(v[1, P, ND])[NA, D, AC, NA, propertyOverrides.cj:68:9]: Unit
Declared function name: $name1set -> _CN7default10DerivedFoo5name1psHRNat6StringE
Outer decl name: DerivedFoo -> _CN7default10DerivedFooE
Receiver: [doesn't implement ToString]
------------------------------
==============================
Actual call: $name2get()
Declared prop getter: name2()[NA, D, AC, HS, propertyOverrides.cj:28:9]: Struct-String
Declared function name: $name2get -> _CN7default7BaseFoo5name2pgHv
Outer decl name: BaseFoo -> _CN7default7BaseFooE
Receiver: [doesn't implement ToString]
------------------------------
Getter return value: 987
==============================
Actual call: $anotherNameget()
Declared prop getter: anotherName()[NA, D, AC, DHS, propertyOverrides.cj:55:9]: Int32
Declared function name: $anotherNameget -> _CN7default8InterFoo11anotherNamepgHv
Outer decl name: InterFoo -> _CN7default8InterFooE
Receiver: [doesn't implement ToString]
------------------------------
Getter return value: 345
==============================
Actual call: $name1get()
Declared prop getter: name1()[NA, D, AC, HS, propertyOverrides.cj:46:9]: Struct-String
Declared function name: $name1get -> _CN7default8InterFoo5name1pgHv
Outer decl name: InterFoo -> _CN7default8InterFooE
Receiver: [doesn't implement ToString]
------------------------------
Getter return value: 987
==============================
Actual call: $name1set("666")
Declared prop setter: name1(v[1, P, ND])[NA, D, AC, NA, propertyOverrides.cj:50:9]: Unit
Declared function name: $name1set -> _CN7default8InterFoo5name1psHRNat6StringE
Outer decl name: InterFoo -> _CN7default8InterFooE
Receiver: [doesn't implement ToString]
------------------------------
==============================
Actual call: $name2get()
Declared prop getter: name2()[NA, D, AC, HS, propertyOverrides.cj:28:9]: Struct-String
Declared function name: $name2get -> _CN7default7BaseFoo5name2pgHv
Outer decl name: BaseFoo -> _CN7default7BaseFooE
Receiver: [doesn't implement ToString]
------------------------------
Getter return value: 987
==============================
Actual call: $anotherNameget()
Declared prop getter: anotherName()[NA, D, AC, DHS, propertyOverrides.cj:55:9]: Int32
Declared function name: $anotherNameget -> _CN7default8InterFoo11anotherNamepgHv
Outer decl name: InterFoo -> _CN7default8InterFooE
Receiver: [doesn't implement ToString]
------------------------------
Getter return value: 345
==============================
Actual call: $name1get()
Declared prop getter: name1()[NA, D, AC, HS, propertyOverrides.cj:19:9]: Struct-String
Declared function name: $name1get -> _CN7default7BaseFoo5name1pgHv
Outer decl name: BaseFoo -> _CN7default7BaseFooE
Receiver: [doesn't implement ToString]
------------------------------
Getter return value: 987
==============================
Actual call: $name1set("666")
Declared prop setter: name1(v[1, P, ND])[NA, D, AC, NA, propertyOverrides.cj:23:9]: Unit
Declared function name: $name1set -> _CN7default7BaseFoo5name1psHRNat6StringE
Outer decl name: BaseFoo -> _CN7default7BaseFooE
Receiver: [doesn't implement ToString]
------------------------------
==============================
Actual call: $name2get()
Declared prop getter: name2()[NA, D, AC, HS, propertyOverrides.cj:28:9]: Struct-String
Declared function name: $name2get -> _CN7default7BaseFoo5name2pgHv
Outer decl name: BaseFoo -> _CN7default7BaseFooE
Receiver: [doesn't implement ToString]
------------------------------
Getter return value: 987
==============================
Actual call: $name2set("666")
Declared prop setter: name2(v[1, P, ND])[NA, D, AC, NA, propertyOverrides.cj:32:9]: Unit
Declared function name: $name2set -> _CN7default7BaseFoo5name2psHRNat6StringE
Outer decl name: BaseFoo -> _CN7default7BaseFooE
Receiver: [doesn't implement ToString]
------------------------------
==============================
Actual call: $anotherNameget()
Declared prop getter: anotherName()[NA, D, AC, DHS, propertyOverrides.cj:37:9]: Int32
Declared function name: $anotherNameget -> _CN7default7BaseFoo11anotherNamepgHv
Outer decl name: BaseFoo -> _CN7default7BaseFooE
Receiver: [doesn't implement ToString]
------------------------------
Getter return value: 345
==============================
 */
