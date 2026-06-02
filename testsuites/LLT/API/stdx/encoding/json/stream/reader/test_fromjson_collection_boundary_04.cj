/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE:%set_stdx_path %run %run_opt %output %run_utest_opt %run_args

import stdx.encoding.json.stream.*
import std.io.*
import std.collection.*

func readerOf(json: String): JsonReader {
    var bas = ByteBuffer()
    unsafe { bas.write(json.rawData()) }
    return JsonReader(bas)
}

@Test
class Test_fromjson_collection_boundary_04 {
    @TestCase
    func test_arraylist_empty_and_nonempty(): Unit {
        let empty = ArrayList<Int64>.fromJson(readerOf("[]"))
        @Expect(empty.size, 0)

        let values = ArrayList<Int64>.fromJson(readerOf("[1,2,3]"))
        @Expect(values.size, 3)
        @Expect(values[0], 1)
        @Expect(values[1], 2)
        @Expect(values[2], 3)
    }

    @TestCase
    func test_hashmap_empty_and_nonempty(): Unit {
        let empty = HashMap<String, Int64>.fromJson(readerOf("{}"))
        @Expect(empty.size, 0)

        let values = HashMap<String, Int64>.fromJson(readerOf(##"{"a":1,"b":2}"##))
        @Expect(values.size, 2)
        @Expect(values.get("a").getOrThrow(), 1)
        @Expect(values.get("b").getOrThrow(), 2)
    }

    @TestCase
    func test_nested_container_consumes_final_end_tokens(): Unit {
        let values = HashMap<String, ArrayList<Int64>>.fromJson(readerOf(##"{"left":[1,2],"right":[]}"##))
        @Expect(values.size, 2)
        let left = values.get("left").getOrThrow()
        let right = values.get("right").getOrThrow()
        @Expect(left.size, 2)
        @Expect(left[0], 1)
        @Expect(left[1], 2)
        @Expect(right.size, 0)
    }

    @TestCase
    func test_uint_reader_radix_paths(): Unit {
        @Expect(UInt64.fromJson(readerOf("0b10101")), 21u64)
        @Expect(UInt64.fromJson(readerOf("0o17")), 15u64)
        @Expect(UInt64.fromJson(readerOf("0x2a")), 42u64)
        @Expect(UInt64.fromJson(readerOf("0d33")), 33u64)
    }

    @TestCase
    func test_uint64_decimal_overflow_is_reported(): Unit {
        let e = @AssertThrows[OverflowException](UInt64.fromJson(readerOf("18446744073709551616")))
        @Expect(e.message, "The next number is out of range for UInt64.")
    }

    @TestCase
    func test_number_after_reader_buffer_boundary(): Unit {
        let json = (" " * 8192) + "42"
        @Expect(UInt64.fromJson(readerOf(json)), 42u64)
    }
}
