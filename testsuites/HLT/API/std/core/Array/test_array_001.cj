/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.unittest.*
import std.unittest.testmacro.*
import std.core.*
import std.math.*
import std.sort.*

@Test
class test_array {
    public var arr1:Array<Int32> = Array<Int32>()
    public var arr2:Array<Int32> = Array<Int32>(3, repeat: 0)
    public var arr3:Array<Int32> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    public var arr4:Array<String> = ["你好", "，", "世界"]
    public var arr8: Array<Int32> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    public var arr13: Array<Int32> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

    @TestCase
    func contains_1(): Unit {
        @Expect(arr1.contains(0), false)
        @Expect(arr2.contains(0))
        @Expect(arr3.contains(9))
        @Expect(arr3.contains(10),false)
        @Expect(arr4.contains("你好"))
    }

    @TestCase
    func clone_1(): Unit {
        var arr7: Array<Int32> = [0, 1, 2, 3, 4]
        @Expect(arr1.clone(), arr1)
        @Expect(arr2.clone(0..3: 1), arr2)
        @Expect(arr3.clone(0..5: 1), arr7)
        @Expect(arr4.clone(0..2: 1), ["你好", "，"])
        try {
            var arr5 = arr3.clone(0..11 : 1)
            @Expect("parameter out of range", "1")
        } catch (e1: IndexOutOfBoundsException) {
            @Expect(arr3.clone(0..10: 1), arr3)
        }
        var arr6 = arr3.clone(0..10 : 2)
        @Expect(arr6, [0i32, 2i32, 4i32, 6i32, 8i32])
        @Expect(arr3.clone(0..10: 1), arr3)
    }

    @TestCase
    func slice_1(): Unit {
        try {
            arr3[0..10 : 2].fill(3)
            @Expect("Illegal step", "step should be 1")
        } catch (e1: IllegalArgumentException) {
            try {
                arr3[2..11 : 1].fill(Int32(3))
                @Expect("parameter out of range", "1")
            } catch (e2: IndexOutOfBoundsException) {
                arr3[0..5 : 1].fill(Int32(3))
                @Expect(arr3, [3i32, 3i32, 3i32, 3i32, 3i32, 5i32, 6i32, 7i32, 8i32, 9i32])
                arr3[3..6 : 1].fill(Int32(10))
                @Expect(arr3, [3i32, 3i32, 3i32, 10i32, 10i32, 10i32, 6i32, 7i32, 8i32, 9i32])
            }
        }
    }

    @TestCase
    func slice_2(): Unit {
        try {
            arr13[0..10 : 2] = [1i32, 2i32, 3i32, 4i32, 5i32]
            @Expect("Illegal step", "step should be 1")
        } catch (e1: IllegalArgumentException) {
            try {
                arr13[2..11 : 1] = [0i32, 0i32, 0i32, 0i32, 0i32, 0i32, 0i32, 0i32, 0i32]
                @Expect("parameter out of range", "1")
            } catch (e2: IndexOutOfBoundsException) {
                try {
                    arr13[0..4 : 1] = [1i32, 2i32]
                    @Expect("is not equal to array size", "2")
                } catch (e3: IllegalArgumentException) {
                    arr13[0..3 : 1] = [0i32, 0i32, 0i32]
                    @Expect(arr13, [0i32, 0i32, 0i32, 3i32, 4i32, 5i32, 6i32, 7i32, 8i32, 9i32])
                    arr13[6..9 : 1] = [1i32, 1i32, 1i32]
                    @Expect(arr13, [0i32, 0i32, 0i32, 3i32, 4i32, 5i32, 1i32, 1i32, 1i32, 9i32])
                }
            }
        }
    }

    @TestCase
    func reverse_1(): Unit {
        arr1.reverse()
        arr2.reverse()
        arr8.reverse()
        arr4.reverse()
        @Expect(arr1, [])
        @Expect(arr2, [0i32, 0i32, 0i32])
        @Expect(arr8, [9i32, 8i32, 7i32, 6i32, 5i32, 4i32, 3i32, 2i32, 1i32, 0i32])
        @Expect(arr4, ["世界","，","你好"])
    }
}
