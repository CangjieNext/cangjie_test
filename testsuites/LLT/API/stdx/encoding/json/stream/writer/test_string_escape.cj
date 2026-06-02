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
import stdx.encoding.json.stream.*

func jsonEscapeString(str: String): String {
    var input = ByteBuffer()
    var jw = JsonWriter(input)

    func toString(): String {
        jw.flush()
        return String.fromUtf8(readToEnd(input))
    }

    jw.writeValue(str)

    return toString()
}

@Test
class Test_String_Escape {
    @TestCase
    func test_nullchar() {
        let str = "\0"
        let res = jsonEscapeString(str)
        let except = #""\u0000""#
        @Expect(except, res)
    }

    @TestCase
    func test_tab() {
        let str = "\t"
        let res = jsonEscapeString(str)
        let except = #""\t""#
        @Expect(except, res)
    }

    @TestCase
    func test_quato() {
        let str = #"\"\""#
        let res = jsonEscapeString(str)
        let except = #""\\\"\\\"""#
        @Expect(except, res)
    }

    @TestCase
    func test_writeStringoob(){
        let arr = Array<UInt8>(128, {i => UInt8(i)})
        let str = String.fromUtf8(arr)
        try {
            let ret = jsonEscapeString(str)
            println(ret)
            @Expect(ret.endsWith("\\u007f\""), true)
        } catch (e: Exception) {
            @Expect(false)
        }
    }
}
