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
import stdx.encoding.json.stream.*

const MALICIOUS_NESTING_DEPTH = 600

func makeDeepArrayJson(depth: Int64): String {
    return "[" * depth + "0" + "]" * depth
}

func makeDeepObjectJson(depth: Int64): String {
    return "{\"k\":" * depth + "0" + "}" * depth
}

@Test
public class JsonReaderNestingLimitTest {
    @TestCase
    func readValueBytesRejectsDeepArray(): Unit {
        let jsonStr = makeDeepArrayJson(MALICIOUS_NESTING_DEPTH)
        let bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        let reader = JsonReader(bas)
        try {
            reader.readValueBytes()
            @Assert(false)
        } catch (e: IllegalStateException) {
            @Expect(e.message, "Json nested depth exceeds 100.")
        }
    }

    @TestCase
    func readValueBytesRejectsDeepObject(): Unit {
        let jsonStr = makeDeepObjectJson(MALICIOUS_NESTING_DEPTH)
        let bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        let reader = JsonReader(bas)
        try {
            reader.readValueBytes()
            @Assert(false)
        } catch (e: IllegalStateException) {
            @Expect(e.message, "Json nested depth exceeds 100.")
        }
    }
}
