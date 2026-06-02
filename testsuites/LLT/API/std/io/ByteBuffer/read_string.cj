/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt
import std.io.*

let bytes = "hello world,\n hello cangjie".toArray()
let illegal_utf8: Array<Byte> = [0xe2, 0x28, 0xa2, 0xe2, 0x28, 0xa2]

@Test
class Test_ReadString {
    @TestCase
    func readString(): Unit {
        var stream = ByteBuffer()
        stream.write(bytes)
        var s = readString(stream)
        @Expect(s, "hello world,\n hello cangjie")

        stream.write(bytes)
        let buffer = Array<Byte>(14, repeat: 0)
        @Expect(stream.read(buffer), 14)
        @Expect(readString(stream), "hello cangjie")
        @Expect(readString(stream), "")

        stream.write(illegal_utf8)
        try {
            readString(stream)
            @Assert(false)
        } catch (e: Exception) {
            return
        }
        @Assert(false)
    }

    @TestCase
    func readString_unckecked(): Unit {
        var stream = ByteBuffer()
        stream.write(bytes)
        var s = unsafe { readStringUnchecked(stream) }
        @Expect(s, "hello world,\n hello cangjie")
        stream.write(bytes)

        @Expect(unsafe{readStringUnchecked(stream)}, "hello world,\n hello cangjie")
        @Expect(unsafe{readStringUnchecked(stream)}, "")

        stream.write(illegal_utf8)
        try {
            @Expect(unsafe{readStringUnchecked(stream)}, unsafe{String.fromUtf8Unchecked(illegal_utf8)})
            return
        } catch (e: Exception) {
            @Assert(false)
        }
        @Assert(false)
    }
}
