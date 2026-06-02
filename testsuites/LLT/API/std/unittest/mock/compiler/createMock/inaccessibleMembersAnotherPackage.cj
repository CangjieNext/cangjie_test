/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../helpers
// DEPENDENCE: ../otherPackageToImport
// EXEC: %compiler %cmp_opt %pkg_opt -Woff=all helpers --mock=on -o libpkg1.%middle %compile_lib_opt
// EXEC: %compiler %cmp_opt %pkg_opt -Woff=all otherPackageToImport --mock=on -o libpkg2.%middle %compile_lib_opt
// EXEC: %compiler %cmp_opt -Woff=all libpkg1.%middle libpkg2.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import otherPackageToImport.*
import std.mock_test_util.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class TestA {
    public override func afterEach(): Unit {
        clearMatchers()
    }

    @TestCase
    func case1(): Unit {
        let foo = FooInaccessibleMembers()
        let mockedFoo = unsafe { createMock<FooInaccessibleMembers>(dummyMockingCallHandler) }
        try {
            foo.callFoo1(mockedFoo, "s", 22)
        } catch (e: NoMockMatchersFoundException) {
            println("mock accessor for `foo1` was called")
        }
        println("------------------------------")
    }

    @TestCase
    func case2(): Unit {
        let foo = FooInaccessibleMembers()
        let mockedFoo = unsafe { createMock<FooInaccessibleMembers>(dummyMockingCallHandler) }
        try {
            foo.callFoo2(mockedFoo, "s", 22)
        } catch (e: NoMockMatchersFoundException) {
            println("mock accessor for `foo2` was called")
        }
        println("------------------------------")
    }

    @TestCase
    func case3(): Unit {
        let foo = FooInaccessibleMembers()
        let mockedFoo = unsafe { createMock<FooInaccessibleMembers>(dummyMockingCallHandler) }
        try {
            foo.callFoo3(mockedFoo, "s", 22)
        } catch (e: NoMockMatchersFoundException) {
            println("mock accessor for `foo3` was called")
        }
        println("------------------------------")
    }

    @TestCase
    func case4(): Unit {
        let foo = FooInaccessibleMembers()
        let mockedFoo = unsafe { createMock<FooInaccessibleMembers>(dummyMockingCallHandler) }
        try {
            foo.callP1Get(mockedFoo)
        } catch (e: NoMockMatchersFoundException) {
            println("mock accessor for `p1` getter was called")
        }
        println("------------------------------")
    }

    @TestCase
    func case5(): Unit {
        let foo = FooInaccessibleMembers()
        let mockedFoo = unsafe { createMock<FooInaccessibleMembers>(dummyMockingCallHandler) }
        try {
            foo.callP2Get(mockedFoo)
        } catch (e: NoMockMatchersFoundException) {
            println("mock accessor for `p2` getter was called")
        }
        try {
            foo.callP2Set(mockedFoo)
        } catch (e: NoMockMatchersFoundException) {
            println("mock accessor for `p2` setter was called")
        }
        println("------------------------------")
    }

    @TestCase
    func case6(): Unit {
        let foo = FooInaccessibleMembers()
        let mockedFoo = unsafe { createMock<FooInaccessibleMembers>(dummyMockingCallHandler) }
        try {
            foo.callP3Get(mockedFoo)
        } catch (e: NoMockMatchersFoundException) {
            println("mock accessor for `p3` getter was called")
        }
        try {
            foo.callP3Set(mockedFoo)
        } catch (e: NoMockMatchersFoundException) {
            println("mock accessor for `p3` setter was called")
        }
        println("------------------------------")
    }

    @TestCase
    func case7(): Unit {
        let foo = FooInaccessibleMembers()
        let mockedFoo = unsafe { createMock<FooInaccessibleMembers>(dummyMockingCallHandler) }
        try {
            foo.callF1Get(mockedFoo)
        } catch (e: NoMockMatchersFoundException) {
            println("mock accessor for accessing `f1` getter was called")
        }
        println("------------------------------")
    }

    @TestCase
    func case8(): Unit {
        let foo = FooInaccessibleMembers()
        let mockedFoo = unsafe { createMock<FooInaccessibleMembers>(dummyMockingCallHandler) }
        try {
            foo.callF2Get(mockedFoo)
        } catch (e: NoMockMatchersFoundException) {
            println("mock accessor for accessing `f2` getter was called")
        }
        try {
            foo.callF2Set(mockedFoo)
        } catch (e: NoMockMatchersFoundException) {
            println("mock accessor for accessing `f2` setter was called")
        }
        try {
            foo.callF2Get(mockedFoo)
        } catch (e: NoMockMatchersFoundException) {
            println("mock accessor for accessing `f2` getter was called (after modification)")
        }
        println("------------------------------")
    }

    @TestCase
    func case9(): Unit {
        let foo = FooInaccessibleMembers()
        let mockedFoo = unsafe { createMock<FooInaccessibleMembers>(dummyMockingCallHandler) }
        try {
            foo.callF3Get(mockedFoo)
        } catch (e: NoMockMatchersFoundException) {
            println("mock accessor for accessing `f3` getter was called")
        }
        try {
            foo.callF3Set(mockedFoo)
        } catch (e: NoMockMatchersFoundException) {
            println("mock accessor for accessing `f3` setter was called")
        }
        try {
            foo.callF3Get(mockedFoo)
        } catch (e: NoMockMatchersFoundException) {
            println("mock accessor for accessing `f3` getter was called (after modification)")
        }
        println("------------------------------")
    }
}

/* SCAN-IN
mock accessor for `foo1` was called
------------------------------
mock accessor for `foo2` was called
------------------------------
mock accessor for `foo3` was called
------------------------------
mock accessor for `p1` getter was called
------------------------------
mock accessor for `p2` getter was called
mock accessor for `p2` setter was called
------------------------------
mock accessor for `p3` getter was called
mock accessor for `p3` setter was called
------------------------------
mock accessor for accessing `f1` getter was called
------------------------------
mock accessor for accessing `f2` getter was called
mock accessor for accessing `f2` setter was called
mock accessor for accessing `f2` getter was called (after modification)
------------------------------
mock accessor for accessing `f3` getter was called
mock accessor for accessing `f3` setter was called
mock accessor for accessing `f3` getter was called (after modification)
------------------------------
 */
