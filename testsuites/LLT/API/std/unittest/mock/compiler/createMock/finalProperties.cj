/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../helpers
// DEPENDENCE: ../otherPackageToImport
// EXEC: %compiler %cmp_opt -Woff=all -p helpers --mock=on %compile_lib_opt --output libpkg1.%middle
// EXEC: %compiler %cmp_opt %pkg_opt -Woff=all otherPackageToImport --mock=on -o libpkg2.%middle %compile_lib_opt
// EXEC: %compiler %cmp_opt -Woff=all libpkg1.%middle libpkg2.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import otherPackageToImport.*
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
    protected prop name2: String {
        get() {
            println("original `name1` getter of name was called")
            "123"
        }
    }
    public prop anotherName: Int32 {
        get() {
            println("original `anotherName` getter of name was called")
            123
        }
    }
}

open class DerivedFoo <: BaseFoo {
    public mut override prop name1: String {
        get() {
            println("original `name1` getter of name was called")
            "123"
        }
        set(v) {
            println("original `name1` setter of name was called with value = " + v)
        }
    }
    private prop anotherName2: Int32 {
        get() {
            println("original `anotherName` getter of name was called")
            123
        }
    }

    func callName2(mockedFoo: DerivedFoo) {
        println("Getter return value: " + mockedFoo.name2)
    }

    func callAnotherName2(mockedFoo: DerivedFoo) {
        println("Getter return value: " + mockedFoo.anotherName2.toString())
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
            [1, "my str", 3],
            "11"
        )
        addMatcher(
            "_CN7default10DerivedFoo5name1psHRNat6StringE",
            [1, "my str", 3],
            ()
        )
        println("Getter return value: " + mockedFoo.name1)
        println("==============================")
        mockedFoo.name1 = "666"
        println("==============================")
    }

    @TestCase
    func case2(): Unit {
        let foo = DerivedFoo()
        let mockedFoo = unsafe { createMock<DerivedFoo>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default7BaseFoo5name2pgHv",
            [1, "my str", 3],
            "12"
        )
        foo.callName2(mockedFoo)
        println("==============================")
    }

    @TestCase
    func case3(): Unit {
        let a: Int32 = 13
        let mockedFoo = unsafe { createMock<DerivedFoo>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default7BaseFoo11anotherNamepgHv",
            [1, "my str", 3],
            a
        )
        println("Getter return value: " + mockedFoo.anotherName.toString())
        println("==============================")
    }

    @TestCase
    func case4(): Unit {
        let a: Int32 = 14
        let foo = DerivedFoo()
        let mockedFoo = unsafe { createMock<DerivedFoo>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default10DerivedFoo34$anotherName2get$ToMock_DerivedFooHv",
            [1, "my str", 3],
            a
        )
        foo.callAnotherName2(mockedFoo)
        println("==============================")
    }

    @TestCase
    func case5(): Unit {
        let mockedFoo = unsafe { createMock<DerivedFooWithProperties>(dummyMockingCallHandler) }
        addMatcher(
            "_CN20otherPackageToImport24DerivedFooWithProperties5name1pgHv",
            [1, "my str", 3],
            "15"
        )
        addMatcher(
            "_CN20otherPackageToImport24DerivedFooWithProperties5name1psHRNat6StringE",
            [1, "my str", 3],
            ()
        )
        println("Getter return value: " + mockedFoo.name1)
        println("==============================")
        mockedFoo.name1 = "666"
        println("==============================")
    }

    @TestCase
    func case6(): Unit {
        let foo = DerivedFooWithProperties()
        let mockedFoo = unsafe { createMock<DerivedFooWithProperties>(dummyMockingCallHandler) }
        addMatcher(
            "_CN20otherPackageToImport17FooWithProperties5name2pgHv",
            [1, "my str", 3],
            "16"
        )
        foo.callName2(mockedFoo)
        println("==============================")
    }

    @TestCase
    func case7(): Unit {
        let a: Int32 = 17
        let mockedFoo = unsafe { createMock<DerivedFooWithProperties>(dummyMockingCallHandler) }
        addMatcher(
            "_CN20otherPackageToImport17FooWithProperties11anotherNamepgHv",
            [1, "my str", 3],
            a
        )
        println("Getter return value: " + mockedFoo.anotherName.toString())
        println("==============================")
    }

    @TestCase
    func case8(): Unit {
        let a: Int32 = 18
        let foo = DerivedFooWithProperties()
        let mockedFoo = unsafe { createMock<DerivedFooWithProperties>(dummyMockingCallHandler) }
        addMatcher(
            "_CN20otherPackageToImport24DerivedFooWithProperties48$anotherName2get$ToMock_DerivedFooWithPropertiesHv",
            [1, "my str", 3],
            a
        )
        foo.callAnotherName2(mockedFoo)
        println("==============================")
    }
}

/* SCAN-IN
Actual call: $name1get()
Declared prop getter: name1()[NA, D, AC, HS, finalProperties.cj:46:9]: Struct-String
Declared function name: $name1get -> _CN7default10DerivedFoo5name1pgHv
Outer decl name: DerivedFoo -> _CN7default10DerivedFooE
Receiver: [doesn't implement ToString]
------------------------------
Getter return value: 11
==============================
Actual call: $name1set("666")
Declared prop setter: name1(v[1, P, ND])[NA, D, AC, NA, finalProperties.cj:50:9]: Unit
Declared function name: $name1set -> _CN7default10DerivedFoo5name1psHRNat6StringE
Outer decl name: DerivedFoo -> _CN7default10DerivedFooE
Receiver: [doesn't implement ToString]
------------------------------
==============================
Actual call: $name2get()
Declared prop getter: name2()[NA, D, AC, DHS, finalProperties.cj:31:9]: Struct-String
Declared function name: $name2get -> _CN7default7BaseFoo5name2pgHv
Outer decl name: BaseFoo -> _CN7default7BaseFooE
Receiver: [doesn't implement ToString]
------------------------------
Getter return value: 12
==============================
Actual call: $anotherNameget()
Declared prop getter: anotherName()[NA, D, AC, DHS, finalProperties.cj:37:9]: Int32
Declared function name: $anotherNameget -> _CN7default7BaseFoo11anotherNamepgHv
Outer decl name: BaseFoo -> _CN7default7BaseFooE
Receiver: [doesn't implement ToString]
------------------------------
Getter return value: 13
==============================
Actual call: $anotherName2get()
Declared prop getter: anotherName2()[NA, D, AC, DHS, finalProperties.cj:55:9]: Int32
Declared function name: $anotherName2get -> _CN7default10DerivedFoo34$anotherName2get$ToMock_DerivedFooHv
Outer decl name: DerivedFoo -> _CN7default10DerivedFooE
Receiver: [doesn't implement ToString]
------------------------------
Getter return value: 14
==============================
Actual call: $name1get()
Declared prop getter: name1()[A, D, AC, HS, FooWithProperties.cj:36:9]: Struct-String
Declared function name: $name1get -> _CN20otherPackageToImport24DerivedFooWithProperties5name1pgHv
Outer decl name: DerivedFooWithProperties -> _CN20otherPackageToImport24DerivedFooWithPropertiesE
Receiver: [doesn't implement ToString]
------------------------------
Getter return value: 15
==============================
Actual call: $name1set("666")
Declared prop setter: name1(v[1, P, ND])[A, D, AC, NA, FooWithProperties.cj:40:9]: Unit
Declared function name: $name1set -> _CN20otherPackageToImport24DerivedFooWithProperties5name1psHRNat6StringE
Outer decl name: DerivedFooWithProperties -> _CN20otherPackageToImport24DerivedFooWithPropertiesE
Receiver: [doesn't implement ToString]
------------------------------
==============================
Actual call: $name2get()
Declared prop getter: name2()[A, D, NAC, DHS, FooWithProperties.cj:21:9]: Struct-String
Declared function name: $name2get -> _CN20otherPackageToImport17FooWithProperties5name2pgHv
Outer decl name: FooWithProperties -> _CN20otherPackageToImport17FooWithPropertiesE
Receiver: [doesn't implement ToString]
------------------------------
Getter return value: 16
==============================
Actual call: $anotherNameget()
Declared prop getter: anotherName()[A, D, AC, DHS, FooWithProperties.cj:27:9]: Int32
Declared function name: $anotherNameget -> _CN20otherPackageToImport17FooWithProperties11anotherNamepgHv
Outer decl name: FooWithProperties -> _CN20otherPackageToImport17FooWithPropertiesE
Receiver: [doesn't implement ToString]
------------------------------
Getter return value: 17
==============================
Actual call: $anotherName2get()
Declared prop getter: anotherName2()[A, D, AC, DHS, FooWithProperties.cj:45:9]: Int32
Declared function name: $anotherName2get -> _CN20otherPackageToImport24DerivedFooWithProperties48$anotherName2get$ToMock_DerivedFooWithPropertiesHv
Outer decl name: DerivedFooWithProperties -> _CN20otherPackageToImport24DerivedFooWithPropertiesE
Receiver: [doesn't implement ToString]
------------------------------
Getter return value: 18
==============================
 */
