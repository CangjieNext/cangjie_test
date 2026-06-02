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
public class Utf8SequenceTest {
    func checkValidUtf8Bytes(arr: Array<Byte>): Bool {
        try {
            let arrlist = ArrayList<Byte>()
            arrlist.add(b'"')
            arrlist.add(all: arr)
            arrlist.add(b'"')
            let reader = JsonReader(ByteBuffer(arrlist.toArray()))
            reader.readValue<String>()
            return true
        } catch (_: Exception) {
            return false
        }
    }

    @TestCase
    func rejectFiveByteUtf8Sequence(): Unit {
        @Expect(false, checkValidUtf8Bytes([0b11111000, 0b10000000, 0b10000000, 0b10000000, 0b10000000]))
    }

    @TestCase
    func rejectSixByteUtf8Sequence(): Unit {
        @Expect(false, checkValidUtf8Bytes(
            [0b11111100, 0b10000000, 0b10000000, 0b10000000, 0b10000000, 0b10000000]))
    }
}
