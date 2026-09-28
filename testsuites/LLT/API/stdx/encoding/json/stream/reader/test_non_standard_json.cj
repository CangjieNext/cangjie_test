/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE:%set_stdx_path %run %run_opt %output %run_utest_opt %run_args

import std.collection.*
import std.io.*
import stdx.encoding.json.stream.*

@Test
public class NonStandardJsonTest {

    @TestCase
    func rejectUnquotedTopLevelValue(): Unit {
        let jsonStr = ##"abc"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        let reader = JsonReader(bas)
        try {
            reader.readValue<String>()
            @Expect(false)
        } catch (e: IllegalStateException) {
            @Expect(e.message, "Character not expected: 'a'.")
        }
    }

    @TestCase
    func rejectUnquotedObjectName(): Unit {
        let jsonStr = ##"{key: "value"}"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        let reader = JsonReader(bas)
        reader.startObject()
        try {
            reader.readName()
            @Expect(false)
        } catch (e: IllegalStateException) {
            @Expect(e.message, "The next Token is not JSON String.")
        }
    }

    @TestCase
    func stringStillReadsStandardJsonScalars(): Unit {
        let jsonStr = ##"[1,true,false,null]"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        let reader = JsonReader(bas)
        reader.startArray()
        @Expect(reader.readValue<String>(), "1")
        @Expect(reader.readValue<String>(), "true")
        @Expect(reader.readValue<String>(), "false")
        @Expect(reader.readValue<String>(), "null")
        reader.endArray()
    }

}
