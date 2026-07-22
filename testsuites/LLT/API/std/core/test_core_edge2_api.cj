/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt


import std.core.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class CoreEdgeBranchTest {

    // ==================== Array: trimStart/trimEnd/removePrefix/removeSuffix ====================

    @TestCase
    func test_array_trimstart_set_match(): Unit {
        var arr = Array<Int64>(5, repeat: 0)
        arr[0] = 1; arr[1] = 2; arr[2] = 3; arr[3] = 4; arr[4] = 5
        var trimSet = Array<Int64>(1, repeat: 1)
        let result = arr.trimStart(trimSet)
        @Expect(result[0], 2)
    }

    @TestCase
    func test_array_trimstart_set_no_match(): Unit {
        var arr = Array<Int64>(3, repeat: 0)
        arr[0] = 5; arr[1] = 6; arr[2] = 7
        var trimSet = Array<Int64>(1, repeat: 1)
        let result = arr.trimStart(trimSet)
        @Expect(result.size, 3)
    }

    @TestCase
    func test_array_trimstart_all_match(): Unit {
        var arr = Array<Int64>(3, repeat: 5)
        var trimSet = Array<Int64>(1, repeat: 5)
        let result = arr.trimStart(trimSet)
        @Expect(result.size, 0)
    }

    @TestCase
    func test_array_trimstart_empty_arr(): Unit {
        var arr = Array<Int64>(0, repeat: 0)
        var trimSet = Array<Int64>(1, repeat: 1)
        let result = arr.trimStart(trimSet)
        @Expect(result.size, 0)
    }

    @TestCase
    func test_array_trimend_set_match(): Unit {
        var arr = Array<Int64>(5, repeat: 0)
        arr[0] = 1; arr[1] = 2; arr[2] = 3; arr[3] = 4; arr[4] = 5
        var trimSet = Array<Int64>(1, repeat: 5)
        let result = arr.trimEnd(trimSet)
        @Expect(result[result.size - 1], 4)
    }

    @TestCase
    func test_array_trimend_set_no_match(): Unit {
        var arr = Array<Int64>(3, repeat: 0)
        arr[0] = 5; arr[1] = 6; arr[2] = 7
        var trimSet = Array<Int64>(1, repeat: 1)
        let result = arr.trimEnd(trimSet)
        @Expect(result.size, 3)
    }

    @TestCase
    func test_array_trimend_all_match(): Unit {
        var arr = Array<Int64>(3, repeat: 5)
        var trimSet = Array<Int64>(1, repeat: 5)
        let result = arr.trimEnd(trimSet)
        @Expect(result.size, 0)
    }

    @TestCase
    func test_array_trimstart_predicate(): Unit {
        var arr = Array<Int64>(5, repeat: 0)
        arr[0] = 1; arr[1] = 2; arr[2] = 3; arr[3] = 4; arr[4] = 5
        let result = arr.trimStart({ x: Int64 => x < 3 })
        @Expect(result[0], 3)
    }

    @TestCase
    func test_array_trimstart_predicate_all_match(): Unit {
        var arr = Array<Int64>(3, repeat: 5)
        let result = arr.trimStart({ x: Int64 => x > 0 })
        @Expect(result.size, 0)
    }

    @TestCase
    func test_array_trimend_predicate(): Unit {
        var arr = Array<Int64>(5, repeat: 0)
        arr[0] = 1; arr[1] = 2; arr[2] = 3; arr[3] = 4; arr[4] = 5
        let result = arr.trimEnd({ x: Int64 => x > 3 })
        @Expect(result[result.size - 1], 3)
    }

    @TestCase
    func test_array_removeprefix_match(): Unit {
        var arr = Array<Int64>(5, repeat: 0)
        arr[0] = 1; arr[1] = 2; arr[2] = 3; arr[3] = 4; arr[4] = 5
        var prefix = Array<Int64>(2, repeat: 0)
        prefix[0] = 1; prefix[1] = 2
        let result = arr.removePrefix(prefix)
        @Expect(result[0], 3)
    }

    @TestCase
    func test_array_removeprefix_no_match(): Unit {
        var arr = Array<Int64>(3, repeat: 0)
        arr[0] = 1; arr[1] = 2; arr[2] = 3
        var prefix = Array<Int64>(2, repeat: 0)
        prefix[0] = 9; prefix[1] = 8
        let result = arr.removePrefix(prefix)
        @Expect(result.size, 3)
    }

    @TestCase
    func test_array_removeprefix_too_short(): Unit {
        var arr = Array<Int64>(2, repeat: 0)
        arr[0] = 1; arr[1] = 2
        var prefix = Array<Int64>(3, repeat: 0)
        prefix[0] = 1; prefix[1] = 2; prefix[2] = 3
        let result = arr.removePrefix(prefix)
        @Expect(result.size, 2)
    }

    @TestCase
    func test_array_removeprefix_empty(): Unit {
        var arr = Array<Int64>(3, repeat: 0)
        arr[0] = 1; arr[1] = 2; arr[2] = 3
        var prefix = Array<Int64>(0, repeat: 0)
        let result = arr.removePrefix(prefix)
        @Expect(result.size, 3)
    }

    @TestCase
    func test_array_removesuffix_match(): Unit {
        var arr = Array<Int64>(5, repeat: 0)
        arr[0] = 1; arr[1] = 2; arr[2] = 3; arr[3] = 4; arr[4] = 5
        var suffix = Array<Int64>(2, repeat: 0)
        suffix[0] = 4; suffix[1] = 5
        let result = arr.removeSuffix(suffix)
        @Expect(result[result.size - 1], 3)
    }

    @TestCase
    func test_array_removesuffix_no_match(): Unit {
        var arr = Array<Int64>(3, repeat: 0)
        arr[0] = 1; arr[1] = 2; arr[2] = 3
        var suffix = Array<Int64>(2, repeat: 0)
        suffix[0] = 9; suffix[1] = 8
        let result = arr.removeSuffix(suffix)
        @Expect(result.size, 3)
    }

    @TestCase
    func test_array_removesuffix_too_short(): Unit {
        var arr = Array<Int64>(2, repeat: 0)
        arr[0] = 1; arr[1] = 2
        var suffix = Array<Int64>(3, repeat: 0)
        suffix[0] = 1; suffix[1] = 2; suffix[2] = 3
        let result = arr.removeSuffix(suffix)
        @Expect(result.size, 2)
    }

    @TestCase
    func test_array_removesuffix_empty(): Unit {
        var arr = Array<Int64>(3, repeat: 0)
        arr[0] = 1; arr[1] = 2; arr[2] = 3
        var suffix = Array<Int64>(0, repeat: 0)
        let result = arr.removeSuffix(suffix)
        @Expect(result.size, 3)
    }

    // ==================== Array: indexOf variants ====================

    @TestCase
    func test_array_indexof_element_found(): Unit {
        var arr = Array<Int64>(5, repeat: 0)
        arr[0] = 10; arr[1] = 20; arr[2] = 30; arr[3] = 40; arr[4] = 50
        match (arr.indexOf(30)) {
            case Some(idx) => @Expect(idx, 2)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_array_indexof_element_not_found(): Unit {
        var arr = Array<Int64>(3, repeat: 0)
        arr[0] = 10; arr[1] = 20; arr[2] = 30
        match (arr.indexOf(99)) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_array_indexof_subarray_found(): Unit {
        var arr = Array<Int64>(5, repeat: 0)
        arr[0] = 10; arr[1] = 20; arr[2] = 30; arr[3] = 40; arr[4] = 50
        var sub = Array<Int64>(2, repeat: 0)
        sub[0] = 30; sub[1] = 40
        match (arr.indexOf(sub)) {
            case Some(idx) => @Expect(idx, 2)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_array_indexof_subarray_not_found(): Unit {
        var arr = Array<Int64>(3, repeat: 0)
        arr[0] = 10; arr[1] = 20; arr[2] = 30
        var sub = Array<Int64>(2, repeat: 0)
        sub[0] = 99; sub[1] = 88
        match (arr.indexOf(sub)) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_array_lastindexof_element_found(): Unit {
        var arr = Array<Int64>(5, repeat: 0)
        arr[0] = 10; arr[1] = 20; arr[2] = 30; arr[3] = 20; arr[4] = 50
        match (arr.lastIndexOf(20)) {
            case Some(idx) => @Expect(idx, 3)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_array_lastindexof_element_not_found(): Unit {
        var arr = Array<Int64>(3, repeat: 0)
        arr[0] = 10; arr[1] = 20; arr[2] = 30
        match (arr.lastIndexOf(99)) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_array_lastindexof_subarray_found(): Unit {
        var arr = Array<Int64>(6, repeat: 0)
        arr[0] = 10; arr[1] = 20; arr[2] = 30; arr[3] = 10; arr[4] = 20; arr[5] = 30
        var sub = Array<Int64>(2, repeat: 0)
        sub[0] = 20; sub[1] = 30
        match (arr.lastIndexOf(sub)) {
            case Some(idx) => @Expect(idx, 4)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_array_indexof_from_index(): Unit {
        var arr = Array<Int64>(5, repeat: 0)
        arr[0] = 10; arr[1] = 20; arr[2] = 30; arr[3] = 20; arr[4] = 50
        match (arr.indexOf(20, 2)) {
            case Some(idx) => @Expect(idx, 3)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_array_contains(): Unit {
        var arr = Array<Int64>(3, repeat: 0)
        arr[0] = 10; arr[1] = 20; arr[2] = 30
        @Assert(arr.contains(20))
        @Assert(!arr.contains(99))
    }

    @TestCase
    func test_array_equals(): Unit {
        var a = Array<Int64>(3, repeat: 0)
        a[0] = 1; a[1] = 2; a[2] = 3
        var b = Array<Int64>(3, repeat: 0)
        b[0] = 1; b[1] = 2; b[2] = 3
        @Assert(a == b)
        b[2] = 4
        @Assert(a != b)
    }

    // ==================== Float fromBits/toBits ====================

    @TestCase
    func test_float64_frombits_tobits(): Unit {
        let f = Float64(3.14)
        let bits = f.toBits()
        let restored = Float64.fromBits(bits)
        @Assert(restored == f)
    }

    @TestCase
    func test_float32_frombits_tobits(): Unit {
        let f = Float32(3.14)
        let bits = f.toBits()
        let restored = Float32.fromBits(bits)
        @Assert(restored == f)
    }

    @TestCase
    func test_float16_frombits_tobits(): Unit {
        let f = Float16(3.14)
        let bits = f.toBits()
        let restored = Float16.fromBits(bits)
        @Assert(restored == f)
    }

    @TestCase
    func test_float64_frombits_nan(): Unit {
        let nan = Float64.fromBits(0x7FF8000000000000u64)
        @Assert(nan.isNaN())
    }

    @TestCase
    func test_float64_frombits_inf(): Unit {
        let inf = Float64.fromBits(0x7FF0000000000000u64)
        @Assert(inf > Float64(0.0))
    }

    // ==================== Range ====================

    @TestCase
    func test_range_iterator_forward(): Unit {
        var sum = 0
        for (i in 1..6) {
            sum += i
        }
        @Expect(sum, 15)
    }

    @TestCase
    func test_range_iterator_single(): Unit {
        var count = 0
        for (i in 5..6) {
            count++
        }
        @Expect(count, 1)
    }

    @TestCase
    func test_range_iterator_empty(): Unit {
        var count = 0
        for (i in 5..3) {
            count++
        }
        @Expect(count, 0)
    }

    // ==================== Thread ====================


    @TestCase
    func test_thread_current_id(): Unit {
        let id = Thread.currentThread.id
        @Assert(id >= 0)
    }

    @TestCase
    func test_thread_has_pending_cancellation_false(): Unit {
        @Assert(!Thread.currentThread.hasPendingCancellation)
    }



}
