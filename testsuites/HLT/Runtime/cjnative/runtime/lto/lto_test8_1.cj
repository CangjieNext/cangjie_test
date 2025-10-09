/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt %cmp_utest_opt --lto=full %f -o %output
// (Linux and CJNATIVE) RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.unittest.*
import std.unittest.testmacro.*
import std.core.*
import std.math.*
import std.sort.*

@Test
class test_array_1 {
    public var arr1 = Array<Int32>()
    public var arr2 = Array<Int32>(3, repeat: 0)
    public var arr3: Array<Int32> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

    @TestCase
    func get_1(): Unit {
        var a1 = arr2.get(-1)
        var a2 = arr3.get(10)
        @Expect(a1, None)
        @Expect(a2, None)
    }

    @TestCase
    func set_1(): Unit {
        try {
            arr2.set(3, Int32(0))
            @Expect("1", "2")
        } catch (e: IndexOutOfBoundsException) {
            arr2.set(0, Int32(1))
            @Expect(arr2, [1i32, 0i32, 0i32])
        }
    }

    @TestCase
    func rangeSlice_1(): Unit {
        try {
            var a3 = arr2[0..3 : 3]
            @Expect("Illegal step", "step should be 1")
        } catch (e: IllegalArgumentException) {}
    }
}
