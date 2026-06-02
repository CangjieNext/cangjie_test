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

@Frozen
unsafe func createMock1<K>(ch: CallHandler) {
    return createMock<K>(ch)
}

@Frozen
unsafe func createMock2<K>(ch: CallHandler) {
    return createMock1<K>(ch)
}

@Frozen
unsafe func createSpy1<K>(ch: CallHandler, k: K) {
    return createSpy<K>(ch, k)
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let mockedFoo = unsafe { createMock2<Foo>(dummyMockingCallHandler) }
    }

    @TestCase
    func case2(): Unit {
        let mockedFoo = unsafe { createMock1<Foo>(dummyMockingCallHandler) }
    }

    @TestCase
    func case3(): Unit {
        let mockedFoo = unsafe { createSpy1<Foo>(dummyMockingCallHandler, Foo()) }
    }
}
