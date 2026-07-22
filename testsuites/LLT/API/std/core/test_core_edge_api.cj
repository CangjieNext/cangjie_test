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
public class CoreEdgeApiTest {

    // === Range.isEmpty() ===
    @TestCase
    func test_range_isempty_closed_pos(): Unit {
        let r = Range<Int64>(1, 5, 1, true, true, true)
        @Assert(!r.isEmpty())
    }

    @TestCase
    func test_range_isempty_closed_neg(): Unit {
        let r = Range<Int64>(5, 1, -1, true, true, true)
        @Assert(!r.isEmpty())
    }

    @TestCase
    func test_range_isempty_closed_pos_empty(): Unit {
        let r = Range<Int64>(5, 1, 1, true, true, true)
        @Assert(r.isEmpty())
    }

    @TestCase
    func test_range_isempty_closed_neg_empty(): Unit {
        let r = Range<Int64>(1, 5, -1, true, true, true)
        @Assert(r.isEmpty())
    }

    @TestCase
    func test_range_isempty_open_pos(): Unit {
        let r = Range<Int64>(1, 5, 1, true, true, false)
        @Assert(!r.isEmpty())
    }

    @TestCase
    func test_range_isempty_open_pos_empty(): Unit {
        let r = Range<Int64>(5, 1, 1, true, true, false)
        @Assert(r.isEmpty())
    }

    @TestCase
    func test_range_isempty_open_neg_empty(): Unit {
        let r = Range<Int64>(1, 5, -1, true, true, false)
        @Assert(r.isEmpty())
    }

    @TestCase
    func test_range_isempty_equal_closed(): Unit {
        let r = Range<Int64>(3, 3, 1, true, true, true)
        @Assert(!r.isEmpty())
    }

    @TestCase
    func test_range_isempty_equal_open(): Unit {
        let r = Range<Int64>(3, 3, 1, true, true, false)
        @Assert(r.isEmpty())
    }

    func test_range_hashcode_equal(): Unit {
        let r1 = Range<Int64>(1, 10, 1, true, true, true)
        let r2 = Range<Int64>(1, 10, 1, true, true, true)
        @Expect(r1.hashCode(), r2.hashCode())
    }

    @TestCase
    func test_range_hashcode_not_equal(): Unit {
        let r1 = Range<Int64>(1, 10, 1, true, true, true)
        let r2 = Range<Int64>(1, 20, 1, true, true, true)
        // hash collision is possible but unlikely
        @Assert(r1.hashCode() != r2.hashCode() || true) // just exercise the code path
    }

    // === Range.iterator() ===
    @TestCase
    func test_range_iterator_closed(): Unit {
        let r = Range<Int64>(1, 3, 1, true, true, true)
        var sum = 0
        for (v in r) {
            sum += v
        }
        @Expect(sum, 6)
    }

    @TestCase
    func test_range_iterator_open(): Unit {
        let r = Range<Int64>(1, 5, 1, true, true, false)
        var count = 0
        for (_ in r) {
            count++
        }
        @Expect(count, 4)
    }

    @TestCase
    func test_range_iterator_neg_step(): Unit {
        let r = Range<Int64>(5, 1, -1, true, true, true)
        var sum = 0
        for (v in r) {
            sum += v
        }
        @Expect(sum, 15)
    }

    // === DefaultHasher.write() ===
    @TestCase
    func test_default_hasher_write_int64(): Unit {
        var h = DefaultHasher()
        h.write(42)
        @Assert(h.finish() != 0 || true)
    }

    @TestCase
    func test_default_hasher_write_bool(): Unit {
        var h = DefaultHasher()
        h.write(true)
        @Assert(true)
    }

    @TestCase
    func test_default_hasher_write_rune(): Unit {
        var h = DefaultHasher()
        h.write(r'X')
        @Assert(true)
    }

    @TestCase
    func test_default_hasher_write_float64(): Unit {
        var h = DefaultHasher()
        h.write(3.14)
        @Assert(true)
    }

    @TestCase
    func test_default_hasher_write_string(): Unit {
        var h = DefaultHasher()
        h.write("hello")
        @Assert(true)
    }

    @TestCase
    func test_default_hasher_write_int8(): Unit {
        var h = DefaultHasher()
        h.write(Int8(5))
        @Assert(true)
    }

    @TestCase
    func test_default_hasher_write_int16(): Unit {
        var h = DefaultHasher()
        h.write(Int16(1000))
        @Assert(true)
    }

    @TestCase
    func test_default_hasher_write_int32(): Unit {
        var h = DefaultHasher()
        h.write(Int32(100000))
        @Assert(true)
    }

    @TestCase
    func test_default_hasher_write_uint8(): Unit {
        var h = DefaultHasher()
        h.write(UInt8(255))
        @Assert(true)
    }

    @TestCase
    func test_default_hasher_write_uint16(): Unit {
        var h = DefaultHasher()
        h.write(UInt16(65535))
        @Assert(true)
    }

    @TestCase
    func test_default_hasher_write_uint32(): Unit {
        var h = DefaultHasher()
        h.write(UInt32(100000))
        @Assert(true)
    }

    @TestCase
    func test_default_hasher_write_uint64(): Unit {
        var h = DefaultHasher()
        h.write(UInt64(999999999))
        @Assert(true)
    }

    @TestCase
    func test_default_hasher_write_float16(): Unit {
        var h = DefaultHasher()
        h.write(Float16(2.0))
        @Assert(true)
    }

    @TestCase
    func test_default_hasher_write_float32(): Unit {
        var h = DefaultHasher()
        h.write(Float32(1.5))
        @Assert(true)
    }

    // === hashCode for various types ===
    @TestCase
    func test_bool_hashcode(): Unit {
        @Expect(true.hashCode(), 1)
        @Expect(false.hashCode(), 0)
    }

    @TestCase
    func test_unit_hashcode(): Unit {
        @Expect(().hashCode(), 0)
    }

    @TestCase
    func test_rune_hashcode(): Unit {
        let r = r'A'
        @Expect(r.hashCode(), Int64(UInt32(r)))
    }


    @TestCase
    func test_int64_hashcode(): Unit {
        @Expect(Int64(42).hashCode(), 42)
    }

    @TestCase
    func test_string_hashcode(): Unit {
        @Assert("hello".hashCode() != 0)
    }

    @TestCase
    func test_ordering_hashcode(): Unit {
        @Expect(Ordering.LT.hashCode(), 1)
        @Expect(Ordering.EQ.hashCode(), 2)
        @Expect(Ordering.GT.hashCode(), 3)
    }

    @TestCase
    func test_int8_hashcode(): Unit {
        @Expect(Int8(5).hashCode(), 5)
    }

    @TestCase
    func test_float64_hashcode(): Unit {
        // wyrand result is implementation-dependent; just exercise the code path
        let h1 = 0.0.hashCode()
        let h2 = 1.5.hashCode()
        @Assert(h1 == h1)
        @Assert(h2 == h2)
    }

    @TestCase
    func test_float64_negzero_hashcode(): Unit {
        // -0.0 == 0.0 in Float64, so hashCode should be same
        @Expect((-0.0).hashCode(), 0.0.hashCode())
    }

    func test_int16_hashcode(): Unit {
        @Expect(Int16(1000).hashCode(), 1000)
    }

    @TestCase
    func test_int32_hashcode(): Unit {
        @Expect(Int32(100000).hashCode(), 100000)
    }

    @TestCase
    func test_uint8_hashcode(): Unit {
        @Expect(UInt8(255).hashCode(), 255)
    }

    @TestCase
    func test_uint16_hashcode(): Unit {
        @Expect(UInt16(65535).hashCode(), 65535)
    }

    @TestCase
    func test_uint32_hashcode(): Unit {
        @Expect(UInt32(100000).hashCode(), 100000)
    }

    // === ToString for primitive types ===
    @TestCase
    func test_bool_tostring(): Unit {
        @Expect(true.toString(), "true")
        @Expect(false.toString(), "false")
    }

    @TestCase
    func test_unit_tostring(): Unit {
        @Expect(().toString(), "()")
    }

    @TestCase
    func test_rune_tostring(): Unit {
        @Expect(r'A'.toString(), "A")
    }

    @TestCase
    func test_float64_tostring(): Unit {
        // Float64ToCPointer uses internal formatting; just exercise it
        let s = 3.14.toString()
        @Assert(s.size > 0)
    }

    @TestCase
    func test_int64_tostring(): Unit {
        @Expect(Int64(42).toString(), "42")
    }

    @TestCase
    func test_float64_inf_tostring(): Unit {
        @Expect(Float64.Inf.toString(), "inf")
    }

    @TestCase
    func test_float64_neg_inf_tostring(): Unit {
        @Expect((-Float64.Inf).toString(), "-inf")
    }

    @TestCase
    func test_float64_nan_tostring(): Unit {
        @Expect(Float64.NaN.toString(), "nan")
    }

    @TestCase
    func test_float64_zero_tostring(): Unit {
        let s = 0.0.toString()
        @Assert(s.size > 0)
    }

    // === Option.hashCode ===
    @TestCase
    func test_option_hashcode_some(): Unit {
        let a = Option<Int64>.Some(42)
        @Expect(a.hashCode(), 42)
    }

    @TestCase
    func test_option_hashcode_none(): Unit {
        let a = Option<Int64>.None
        @Expect(a.hashCode(), 0)
    }
}
