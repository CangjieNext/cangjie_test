/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

import std.collection.*

@Test
class Test_arraylist_slice_01 {
    public func PreData(a: Int64): (Int64, Int64) {
        let x: (Int64, Int64) = (a, a + 1)
        return x
    }
    @TestCase
    func test_slice_01(): Unit {
        var arr = ArrayList<Int64>([2, 4, 6, 8])
        var range: Range<Int64> = Range<Int64>(2, 2, 1, false, false, true)
        var newArr1 = arr.slice(range)
        @Expect(arr, newArr1)
    }

    @TestCase
    func test_slice_02(): Unit {
        let buf = ArrayList<String>()
        let e = @AssertThrows[IndexOutOfBoundsException](buf[0..1])
        @Expect(e.message, "The opened end of the range 1 is greater than the size 0.")
    }

    @TestCase
    func test_slice_03(): Unit {
        var arr = ArrayList<Int64>([2, 4, 6, 8])
        var arr1 = ArrayList<Int64>([])
        @Expect(arr.get(2).getOrThrow().toString(),"6")
        var a1 = Range<Int64>(1, 3, 1, false, false, false)
        arr.remove(a1)
        arr.reserve(1)
        arr.clear()
        @Expect(arr.clone(),arr1)
        @Expect(arr.isEmpty(),true)
        @Expect(arr.iterator().count(),0)
        @Expect(arr==arr1,true)
        @Expect(arr!=arr1,false)
    }
}
