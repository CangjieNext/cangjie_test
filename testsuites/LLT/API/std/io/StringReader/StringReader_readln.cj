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
        // 3字节 UTF-8 字符 "中" 的编码：0xE4 0xB8 0xAD
        // 但只提供前2个字节，造成截断
        let truncatedUTF8: Array<Byte> = [0xE4, 0xB8] // 缺少最后一个字节 0xAD

        let input = ByteBuffer(truncatedUTF8)
        let reader = StringReader(input)

        // 尝试读取字符，会进入 ensureAvailable 的无限循环
        // 因为：
        // 1. readCharFromInbuf 发现需要3字节，但只有2字节
        // 2. ensureAvailable(3) 被调用
        // 3. while (3 > 2) 进入循环
        // 4. read() 返回 0（流结束）
        // 5. BUG: if (0 < 0) 为 false，不抛异常！
        // 6. availLen 不变，循环继续...
        try {
            let ch = reader.read() // 无限循环！
            println("读到字符: ${ch}")
        } catch (e: Exception) {
            @Expect("Input stream finished in the middle of a UTF-8 sequence", e.message)
        }
    }
}
