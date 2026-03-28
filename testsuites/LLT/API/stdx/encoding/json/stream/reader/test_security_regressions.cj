/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt -V %f %cmp_utest_opt -o %output
// EXEC-PIPE:%set_stdx_path %run %run_opt %output %run_utest_opt %run_args

import std.io.*
import std.math.numeric.*
import std.unittest.*
import stdx.encoding.json.stream.*

const MAX_BIGINT_LENGTH: Int64 = 16384
const MAX_JSON_STREAM_STRING_LENGTH: Int64 = 32 * 1024 * 1024

func makeBuffer(jsonStr: String): ByteBuffer {
    let bas = ByteBuffer()
    unsafe { bas.write(jsonStr.rawData()) }
    return bas
}

func makeQuotedDigits(length: Int64): String {
    return ##"""## + ("1" * length) + ##"""##
}

func makeQuotedText(length: Int64): String {
    return ##"""## + ("a" * length) + ##"""##
}

@Test
public class JsonReaderSecurityRegressionTest {
    @TestCase[input in ["\"\\uDC00\\uD800\"", "\"\\uD800\\uD800\"", "\"\\uDC00\\uDC00\""]]
    func rejectIllegalSurrogatePairs(input: String): Unit {
        let reader = JsonReader(makeBuffer(input))
        try {
            reader.readValue<String>()
            @Assert(false)
        } catch (e: IllegalStateException) {
            @Expect(e.message, "Illegal escape character.")
        }
    }

    @TestCase
    func rejectNonFiniteFloatResult(): Unit {
        let reader = JsonReader(makeBuffer("1e999999"))
        try {
            reader.readValue<Float64>()
            @Assert(false)
        } catch (e: IllegalStateException) {
            @Expect(e.message, "Invalid float dectected.")
        }
    }

    @TestCase
    func rejectHugeBigIntString(): Unit {
        let reader = JsonReader(makeBuffer(makeQuotedDigits(MAX_BIGINT_LENGTH + 1)))
        try {
            reader.readValue<BigInt>()
            @Assert(false)
        } catch (e: IllegalStateException) {
            @Expect(e.message, "BigInt length exceeds 16384.")
        }
    }

    @TestCase
    func rejectHugeJsonString(): Unit {
        let reader = JsonReader(makeBuffer(makeQuotedText(MAX_JSON_STREAM_STRING_LENGTH + 1)))
        try {
            reader.readValue<String>()
            @Assert(false)
        } catch (e: IllegalStateException) {
            @Expect(e.message, "Json string length exceeds 33554432.")
        }
    }
}
