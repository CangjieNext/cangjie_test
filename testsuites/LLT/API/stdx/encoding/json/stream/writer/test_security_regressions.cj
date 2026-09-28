/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC:%set_stdx_path %run %run_opt %output %run_utest_opt

import std.io.*
import std.unittest.*
import stdx.encoding.json.stream.*

const MALICIOUS_STREAM_WRITE_DEPTH: Int64 = 600

@Test
public class JsonWriterSecurityRegressionTest {
    @TestCase
    func rejectWriterDepthOverflow(): Unit {
        let output = ByteBuffer()
        let writer = JsonWriter(output)
        try {
            for (_ in 0..MALICIOUS_STREAM_WRITE_DEPTH) {
                writer.startArray()
            }
            @Assert(false)
        } catch (e: IllegalStateException) {
            @Expect(e.message, "Json nested depth exceeds 100.")
        }
    }

    @TestCase
    func rejectNaNSerialization(): Unit {
        let output = ByteBuffer()
        let writer = JsonWriter(output)
        try {
            writer.writeValue(Float64.NaN)
            @Assert(false)
        } catch (e: IllegalStateException) {
            @Expect(e.message, "Failed to serialize JSON float.")
        }
    }

    @TestCase
    func rejectInfinitySerialization(): Unit {
        let output = ByteBuffer()
        let writer = JsonWriter(output)
        try {
            writer.writeValue(Float64.Inf)
            @Assert(false)
        } catch (e: IllegalStateException) {
            @Expect(e.message, "Failed to serialize JSON float.")
        }
    }
}
