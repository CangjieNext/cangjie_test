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

@Test
class Test_StringReader_readln {
    var reader = StringReader(ByteBuffer())

    public func beforeAll() {
        let str = "0123456789\r123\n123456\r\n12345\r\rcangjie"
        var bas: ByteBuffer = ByteBuffer()
        bas.write(str.toArray())
        reader = StringReader(bas)
    }

    @TestCase
    func test_readln() {
        if (let Some(v) <- reader.readln()) {
            @Expect(v, "0123456789")
        } else {
            @Expect(false)
        }

        if (let Some(v) <- reader.readln()) {
            @Expect(v, "123")
        } else {
            @Expect(false)
        }

        if (let Some(v) <- reader.readln()) {
            @Expect(v, "123456")
        } else {
            @Expect(false)
        }

        if (let Some(v) <- reader.readln()) {
            @Expect(v, "12345")
        } else {
            @Expect(false)
        }

        if (let Some(v) <- reader.readln()) {
            @Expect(v, "")
        } else {
            @Expect(false)
        }

        if (let Some(v) <- reader.readln()) {
            @Expect(v, "cangjie")
        } else {
            @Expect(false)
        }

        if (let Some(v) <- reader.readln()) {
            @Expect(false)
        } else {
            @Expect(true)
        }
    }

    @TestCase
    func test_read() {
        // 此用例看护，防止无限循环问题
        // 3字节 UTF-8 字符 "中" 的编码：0xE4 0xB8 0xAD
        // 但只提供前2个字节，造成截断
        let truncatedUTF8: Array<Byte> = [0xE4, 0xB8] // 缺少最后一个字节 0xAD

        let input = ByteBuffer(truncatedUTF8)
        let reader = StringReader(input)

        try {
            let ch = reader.read() // 旧代码在这里触发死循环
            println("读到字符: ${ch}")
        } catch (e: Exception) {
            // 期望抛出异常
            @Expect("Input stream finished in the middle of a UTF-8 sequence", e.message)
        }
    }
}
