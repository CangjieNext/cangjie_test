/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %f -o %output --test
// RUN-EXEC-PIPE-0:%set_stdx_path %run %run_opt %output %run_args 

import std.io.*
import stdx.encoding.json.stream.*
import std.collection.*

@Test
class Test_Utf8_Check {
    var arr = Array<Byte>()

    func checkValid(arr: Array<Byte>): Bool {
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
    func test_1_byte() {
        // 测试长度为1的UTF8-String
        @Expect(true, checkValid([0x31]))

        // 测试长度为1、首字节是0b10xxxxxx的UTF8-String
        @Expect(false, checkValid([0b10000000]))

        // 测试长度为1、首字节是0b1110xxxx的UTF8-String
        @Expect(false, checkValid([0b11100000]))

        // 测试长度为1、首字节是0b11110xxx的UTF8-String
        @Expect(false, checkValid([0b11110000]))
    }

    @TestCase
    func test_2_byte() {
        // 测试长度为2、首字节是0b10xxxxxx
        @Expect(false, checkValid([0b10000000, 0x80]))

        // 测试长度为2、首字节是0b10xxxxxx
        @Expect(false, checkValid([0b10111111, 0x80]))

        // 测试长度为2、首字节是0b110xxxxx、非法范围的UTF8-String
        @Expect(false, checkValid([0b11000000, 0x80]))

        // 测试长度为2、首字节是0b110xxxxx、且数值范围合理的UTF8-String
        @Expect(true, checkValid([0b11011111, 0x80]))

        // 测试长度为2、首字节是0b1110xxxx的UTF8-String
        @Expect(false, checkValid([0b11100000, 0b10000000]))

        // 测试长度为2、首字节是0b11110xxx的UTF8-String
        @Expect(false, checkValid([0b11110000, 0b10000000]))
    }

    @TestCase
    func test_3_byte() {
        // 测试长度为3、首字节是0b1110xxxx、且非法范围的UTF8-String
        @Expect(false, checkValid([0b11100000, 0b10000000, 0b10000000]))

        // 测试长度为3、首字节是0b1110xxxx、且非法范围的UTF8-String
        @Expect(false, checkValid([0b11101101, 0b10100000, 0b10000000]))

        // 测试长度为3、首字节是0b1110xxxx、且数值范围合理的UTF8-String
        @Expect(true, checkValid([0b11100000, 0b10111111, 0b10111111]))

        // 测试长度为3、首字节是0b11110xxx的UTF8-String
        @Expect(false, checkValid([0b11110000, 0b10000000, 0b10000000]))
    }

    @TestCase
    func test_4_byte() {
        // 测试长度为4、首字节是0b11110xxx的、且非法范围修UTF8-String
        @Expect(false, checkValid([0b11110111, 0b10000000, 0b10000000, 0b10000000]))

        // 测试长度为4、首字节是0b11110xxx的、且非法范围UTF8-String
        @Expect(false, checkValid([0b11110000, 0b10000000, 0b10000000, 0b10000000]))

        // 测试长度为4、首字节是0b11110xxx的、且非法范围UTF8-String
        @Expect(false, checkValid([0b11110100, 0b10110000, 0b10000000, 0b10000000]))

        // 测试长度为4、首字节是0b11110xxx的、且数值范围合理的UTF8-String
        @Expect(true, checkValid([0b11110011, 0b10000000, 0b10000000, 0b10000000]))
    }
}
