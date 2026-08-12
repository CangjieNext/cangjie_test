/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler    %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args

package std.unittest.test

import std.unittest.common.*

@Test
class Test_jsonvalue_parse_fastpath_01 {
    @TestCase
    func test_int64_fast_path_bounds(): Unit {
        @Expect(JsonValue.fromStr("0").asInt().getValue(), 0)
        @Expect(JsonValue.fromStr("9223372036854775807").asInt().getValue(), Int64.Max)
        @Expect(JsonValue.fromStr("-9223372036854775808").asInt().getValue(), Int64.Min)
    }

    @TestCase
    func test_number_slow_path_variants(): Unit {
        @Expect(JsonValue.fromStr("12.5").asFloat().getValue(), 12.5)
        @Expect(JsonValue.fromStr("1.25e2").asFloat().getValue(), 125.0)
        @Expect(JsonValue.fromStr("0b10101").asInt().getValue(), 21)
        @Expect(JsonValue.fromStr("0o17").asInt().getValue(), 15)
        @Expect(JsonValue.fromStr("0x2a").asInt().getValue(), 42)
    }

    @TestCase
    func test_invalid_integer_forms_keep_parse_errors(): Unit {
        let leadingZero = @AssertThrows[JsonException](JsonValue.fromStr("01"))
        @Expect(leadingZero.toString().contains("Non-standard"))

        let overflowPositive = @AssertThrows[JsonException](JsonValue.fromStr("9223372036854775808"))
        @Expect(overflowPositive.toString().contains("Non-standard"))

        let overflowNegative = @AssertThrows[JsonException](JsonValue.fromStr("-9223372036854775809"))
        @Expect(overflowNegative.toString().contains("Non-standard"))
    }

    @TestCase
    func test_string_fast_and_escape_paths_do_not_cross_contaminate(): Unit {
        let json = ##"{"plain":"abcdefghijk","escaped":"line\nquote\"slash\\","plain2":"tail"}"##
        let obj = JsonValue.fromStr(json).asObject()
        @Expect(obj.get("plain").getOrThrow().asString().getValue(), "abcdefghijk")
        @Expect(obj.get("escaped").getOrThrow().asString().getValue(), "line\nquote\"slash\\")
        @Expect(obj.get("plain2").getOrThrow().asString().getValue(), "tail")
    }

    @TestCase
    func test_trailing_whitespace_is_allowed_but_extra_payload_is_rejected(): Unit {
        @Expect(JsonValue.fromStr("42 \n\t").asInt().getValue(), 42)

        let extraPayload = @AssertThrows[JsonException](JsonValue.fromStr("42 \n\ttrue"))
        @Expect(extraPayload.toString().contains("Unexpected character: 't'."))
    }

    @TestCase
    func test_array_growth_keeps_values_after_initial_capacity(): Unit {
        let arr = JsonValue.fromStr("[0,1,2,3,4,5,6,7,8,9,10,11]").asArray()
        @Expect(arr.size(), 12)
        @Expect(arr.get(0).getOrThrow().asInt().getValue(), 0)
        @Expect(arr.get(7).getOrThrow().asInt().getValue(), 7)
        @Expect(arr.get(11).getOrThrow().asInt().getValue(), 11)
    }
}
