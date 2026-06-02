/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../helpers
// EXEC: %compiler %cmp_opt -Woff=all -p helpers %compile_lib_opt --output p.%middle
// EXEC: %compiler %cmp_opt -Woff=all p.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args

import std.mock_test_util.*
import std.unittest.*
import std.unittest.testmacro.*

class Foo {}

class Bar<T> {}

// case 1
unsafe func createMock1<K>(ch: CallHandler): K {
    return createMock<Foo>(ch) as K ?? throw Exception()
}

// case 2
@Frozen
unsafe func createSpy1<T, K>(ch: CallHandler, k: K) {
    return createSpy<K>(ch, k)
}

// case 3
@Frozen
unsafe func createSpy2<T, K>(ch: CallHandler, k: K) {
    return createSpy<K>(ch, k)
}

@Frozen
unsafe func createSpy3<T, K>(ch: CallHandler, k: T) {
    return createSpy2<K, T>(ch, k)
}

// case 4
unsafe func createSpy4<T, K>(ch: CallHandler, k: K) {
    return createSpy<Foo>(ch, k as Foo ?? throw Exception())
}

unsafe func createSpy5<T, K>(ch: CallHandler, k: T) {
    return createSpy4<K, T>(ch, k)
}

// case 5
@Frozen
unsafe func createMock8<T, K>(ch: CallHandler) {
    return createMock<Bar<K>>(ch)
}

@Frozen
unsafe func createMock9<T, K>(ch: CallHandler) {
    return createMock8<K, Foo>(ch)
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let mockedFoo = unsafe { createMock1<Foo>(dummyMockingCallHandler) }
    }

    @TestCase
    func case2(): Unit {
        let mockedFoo = unsafe { createSpy1<Int64, Foo>(dummyMockingCallHandler, Foo()) }
    }

    @TestCase
    func case3(): Unit {
        let mockedFoo = unsafe { createSpy3<Foo, String>(dummyMockingCallHandler, Foo()) }
    }

    @TestCase
    func case4(): Unit {
        let mockedFoo = unsafe { createSpy5<Foo, String>(dummyMockingCallHandler, Foo()) }
    }

    @TestCase
    func case5(): Unit {
        let mockedFoo = unsafe { createMock9<Foo, String>(dummyMockingCallHandler) }
    }
}
