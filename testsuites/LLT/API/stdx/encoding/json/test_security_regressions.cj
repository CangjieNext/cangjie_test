/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %set_stdx_path %run %run_opt %output %run_utest_opt

import std.unittest.*
import stdx.encoding.json.*

const MALICIOUS_WRITE_DEPTH: Int64 = 101

func makeDeepJsonArray(depth: Int64): JsonArray {
    let root = JsonArray()
    var current = root
    for (_ in 0..depth) {
        let next = JsonArray()
        current.add(next)
        current = next
    }
    current.add(JsonInt(1))
    return root
}

func makeLargeObjectJson(fieldCount: Int64): String {
    let builder = StringBuilder()
    builder.append("{")
    for (i in 0..fieldCount) {
        if (i > 0) {
            builder.append(",")
        }
        builder.append("\"k${i}\":0")
    }
    builder.append("}")
    return builder.toString()
}

@Test
public class JsonSecurityRegressionTest {
    @TestCase[input in ["[", "{\"k\":", "\"\\", "tru", "nul"]]
    func malformedInputsFailSafely(input: String): Unit {
        try {
            JsonValue.fromStr(input)
            @Assert(false)
        } catch (_ : JsonException) {
            @Assert(true)
        }
    }

    @TestCase[input in ["\"\\uDC00\\uD800\"", "\"\\uD800\\uD800\"", "\"\\uDC00\\uDC00\""]]
    func rejectIllegalSurrogatePairs(input: String): Unit {
        try {
            JsonValue.fromStr(input)
            @Assert(false)
        } catch (_ : JsonException) {
            @Assert(true)
        }
    }

    @TestCase
    func rejectNonFiniteFloatResult(): Unit {
        try {
            JsonValue.fromStr("1e999999")
            @Assert(false)
        } catch (_ : JsonException) {
            @Assert(true)
        }
    }

    @TestCase
    func rejectExcessiveWriteDepth(): Unit {
        let arr = makeDeepJsonArray(MALICIOUS_WRITE_DEPTH)
        try {
            arr.toJsonString()
            @Assert(false)
        } catch (e: JsonException) {
            @Expect(e.message, "Json nested depth exceeds 100.")
        }
    }

    @TestCase
    func largeObjectStillParses(): Unit {
        let jsonStr = makeLargeObjectJson(2000)
        let value = JsonValue.fromStr(jsonStr)
        @Expect(value.asObject().size(), 2000)
    }
}
