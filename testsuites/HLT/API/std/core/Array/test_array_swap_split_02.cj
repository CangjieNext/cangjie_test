/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args 

@Test
class Test_array_swap_split_02 {
    @TestCase
    func test_swap_split_string_01(): Unit {
        let arr = Array(10, {i: Int64 => "${i}"})
        let arr1 = Array<String>(9, repeat: "0")
        let e = @AssertThrows[IllegalArgumentException](arr.copyTo(arr1))
        @Expect(e.message.contains("Dst size is less than the size of this array"))
    }

    @TestCase
    func test_swap_split_string_02(): Unit {
        let arr = Array(10, {i: Int64 => "${i + 1}"})
        let arr1 = Array<String>(10, repeat: "0")
        arr.copyTo(arr1)
        @Expect(arr1.first, Some("1"))
        @Expect(arr1.last, Some("10"))
        let arr2 = arr1.splitAt(0)
        @Expect(arr2[0], Array<String>())
        @Expect(arr2[1], arr1)
        arr2[1].swap(1, 9)
        @Expect(arr2[1], ["1", "10", "3", "4", "5", "6", "7", "8", "9", "2"])
    }

    @TestCase
    func test_swap_split_string_03(): Unit {
        let arr = Array(10, {i: Int64 => "${i + 1}"})
        let arr1 = Array<String>(12, repeat: "0")
        arr.copyTo(arr1)
        @Expect(arr1.first, Some("1"))
        @Expect(arr1.last, Some("0"))
        let arr2 = arr1.splitAt(12)
        @Expect(arr2[0], arr1)
        @Expect(arr2[1], Array<String>())
        let e = @AssertThrows[IllegalArgumentException](arr2[1].swap(-1, 9))
        @Expect(e.message.contains("Index1 is less than 0 or not less than the size of this array"))
        let e1 = @AssertThrows[IllegalArgumentException](arr2[0].swap(0, 12))
        @Expect(e1.message.contains("Index2 is less than 0 or not less than the size of this array."))
    }

    @TestCase
    func test_swap_split_string_04(): Unit {
        let arr = Array(10, {i: Int64 => "${i + 1}"})
        let arr1 = Array<String>(12, repeat: "0")
        arr.copyTo(arr1)
        let arr2 = arr1.splitAt(12)
        @Expect(arr2[0], arr1)
        @Expect(arr2[1], Array<String>())
        arr2[0].swap(0, 0)
        @Expect(arr2[0], arr1)
        arr2[0].swap(5, 5)
        @Expect(arr2[0], arr1)
        arr2[0].swap(11, 11)
        @Expect(arr2[0], arr1)
    }

    @TestCase
    func test_swap_split_string_05(): Unit {
        let arr = Array(10, {i: Int64 => "${i + 1}"})
        let arr1 = Array<String>(12, repeat: "0")
        arr.copyTo(arr1)
        @Expect(arr1.first, Some("1"))
        @Expect(arr1.last, Some("0"))
        let arr2 = arr1.splitAt(12)
        @Expect(arr2[0], arr1)
        @Expect(arr2[1], Array<String>())
        arr2[0].swap(5, 6)
        @Expect(arr2[0], ["1", "2", "3", "4", "5", "7", "6", "8", "9", "10", "0", "0"])
        arr2[0].swap(0, 11)
        @Expect(arr2[0], ["0", "2", "3", "4", "5", "7", "6", "8", "9", "10", "0", "1"])
    }

    @TestCase
    func test_swap_split_string_06(): Unit {
        let arr = Array(10, {i: Int64 => "${i + 1}"})
        let arr1 = Array<String>(12, repeat: "0")
        arr.copyTo(arr1)
        let e = @AssertThrows[IllegalArgumentException](arr1.splitAt(-1))
        @Expect(e.message.contains("Mid is less than 0 or not less than the size of this array"))
        let e1 = @AssertThrows[IllegalArgumentException](arr1.splitAt(13))
        @Expect(e1.message.contains("Mid is less than 0 or not less than the size of this array"))
    }
}
