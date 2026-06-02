/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 
import std.io.*

let illegal_utf8: Array<Byte> = [0xa2, 0xe2, 0x28]

@Test
class Test_from_readString {
    @TestCase
    func fromString_case01(): Unit {
        let a = ""
        let stream = ByteBuffer(a.toArray())
        @Expect(readString(stream), "")
    }

    @TestCase
    func fromString_case02(): Unit {
        let a = " "
        let stream = ByteBuffer(a.toArray())
        @Expect(readString(stream), " ")
    }

    @TestCase
    func fromString_case03(): Unit {
        let stream = ByteBuffer("你好，仓颉！123".toArray())
        @Expect(readString(stream), "你好，仓颉！123")
    }

    @TestCase
    func fromString_case04(): Unit {
        let stream = ByteBuffer("●★".toArray())
        @Expect(readString(stream), "●★")
    }

    @TestCase
    func fromString_case05(): Unit {
        let string = "h"
        let stream = ByteBuffer(string.toArray())
        @Expect(readString(stream), "h")
    }

    @TestCase
    func readString_case06(): Unit {
        var stream = ByteBuffer()
        stream.write(illegal_utf8)
        try {
            readString(stream)
            @Expect(false)
        } catch (e: ContentFormatException) {
            @Expect(e.message, "Invalid utf8 byte sequence.")
        }
    }

    @TestCase
    func readStringUnchecked_case07(): Unit {
        var stream = ByteBuffer()
        stream.write(illegal_utf8)
        try {
            @Expect(unsafe{readStringUnchecked(stream)}, unsafe{String.fromUtf8Unchecked(illegal_utf8)})
        } catch (e: ContentFormatException) {
            @Expect(false)
        }
    }

    @TestCase
    func readStringUnchecked_case08(): Unit {
        let a = ""
        let stream = ByteBuffer(a.toArray())
        @Expect(unsafe{readStringUnchecked(stream)}, "")
    }

    @TestCase
    func readStringUnchecked_case09(): Unit {
        let a = " "
        let stream = ByteBuffer(a.toArray())
        @Expect(unsafe{readStringUnchecked(stream)}, " ")
    }

    @TestCase
    func readStringUnchecked_case10(): Unit {
        let a = " ☀⭐"
        let stream = ByteBuffer(a.toArray())
        @Expect(unsafe{readStringUnchecked(stream)}, " ☀⭐")
    }

    @TestCase
    func readStringUnchecked_case11(): Unit {
        let a = "x"
        let stream = ByteBuffer(a.toArray())
        @Expect(unsafe{readStringUnchecked(stream)}, "x")
    }
}
