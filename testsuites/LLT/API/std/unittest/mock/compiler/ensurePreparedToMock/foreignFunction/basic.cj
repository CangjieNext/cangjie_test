/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: test.c

// EXEC: %clang %clang_shared_opt test.c -o libtest.%dylib_suffix
// EXEC: %compiler %cmp_opt -L./ -ltest -Woff=all %f -o %output %cmp_utest_opt --mock=on 2>&1
// EXEC-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

foreign func get_c_a(): UInt8

foreign func get_c_b(): UInt8

func getCA() {
    unsafe {
        return get_c_a()
    }
}

func getCB() {
    unsafe {
        return get_c_b()
    }
}

func getCARef(useA: Bool) {
    let f = if (useA) {
        get_c_a
    } else {
        get_c_b
    }
    unsafe {
        return f()
    }
}

foreign func double_c(arg: Int32): Int32

func doubleDouble(arg: Int32): Int32 {
    unsafe {
        return double_c(double_c(arg))
    }
}

@Test
public class TestA {
    @TestCase
    func caseNoMock(): Unit {
        unsafe {
            @Expect(get_c_a(), 42)
            @Expect(get_c_b(), 54)
        }
        @Expect(getCA(), 42)
        @Expect(getCB(), 54)
    }

    @TestCase
    func caseMock(): Unit {
        unsafe {
            @On(get_c_a()).returns(1).times(2)
            @On(get_c_b()).returns(2).times(2)
            @Expect(get_c_a(), 1)
            @Expect(get_c_b(), 2)
        }
        @Expect(getCA(), 1)
        @Expect(getCB(), 2)
    }

    @TestCase
    func caseMockRef(): Unit {
        unsafe {
            @On(get_c_a()).returns(1)
            @On(get_c_b()).returns(2)
        }
        @Expect(getCARef(true), 1)
        @Expect(getCARef(false), 2)
    }

    @TestCase
    func caseNestedForeignCall(): Unit {
        unsafe {
            @On(double_c(8i32)).returns(15)
            @On(double_c(15i32)).returns(29)
        }
        @Expect(doubleDouble(8), 29)
    }
}
