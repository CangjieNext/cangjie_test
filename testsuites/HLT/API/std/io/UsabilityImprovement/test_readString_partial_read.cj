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

/**
 * 模拟符合 InputStream 契约、但不保证一次读满的流：
 * 每次 read 至多返回 `step` 字节。
 */
class PartialReadStream <: InputStream & Seekable {
    let data: Array<Byte>
    var pos: Int64 = 0
    let step: Int64

    public init(data: Array<Byte>, step: Int64) {
        this.data = data
        this.step = step
    }

    public func read(buffer: Array<Byte>): Int64 {
        if (pos >= data.size) {
            return 0
        }
        var count: Int64 = 0
        while (count < step && pos < data.size && count < buffer.size) {
            buffer[count] = data[pos]
            pos++
            count++
        }
        return count
    }

    public func seek(sp: SeekPosition): Int64 {
        let newPos: Int64 = match (sp) {
            case Current(offset) => pos + offset
            case Begin(offset) => offset
            case End(offset) => data.size + offset
        }
        if (newPos < 0) {
            throw IOException("Position before the beginning of the stream.")
        }
        pos = newPos
        return pos
    }
}

@Test
class Test_readString_partial_read {
    @TestCase
    func readString_step1(): Unit {
        let stream = PartialReadStream("Hello".toArray(), 1)
        @Expect(readString(stream), "Hello")
    }

    @TestCase
    func readString_step2(): Unit {
        let stream = PartialReadStream("Hello".toArray(), 2)
        @Expect(readString(stream), "Hello")
    }

    @TestCase
    func readString_step3(): Unit {
        let stream = PartialReadStream("Hello, World!".toArray(), 3)
        @Expect(readString(stream), "Hello, World!")
    }

    @TestCase
    func readString_multiByteUtf8(): Unit {
        let stream = PartialReadStream("你好，仓颉！".toArray(), 1)
        @Expect(readString(stream), "你好，仓颉！")
    }

    @TestCase
    func readString_empty(): Unit {
        let stream = PartialReadStream(Array<Byte>(), 1)
        @Expect(readString(stream), "")
    }

    @TestCase
    func readString_stepLargerThanData(): Unit {
        let stream = PartialReadStream("Hi".toArray(), 100)
        @Expect(readString(stream), "Hi")
    }

    @TestCase
    func readStringUnchecked_step1(): Unit {
        let stream = PartialReadStream("Hello".toArray(), 1)
        @Expect(unsafe { readStringUnchecked(stream) }, "Hello")
    }

    @TestCase
    func readStringUnchecked_multiByteUtf8(): Unit {
        let stream = PartialReadStream("仓颉".toArray(), 1)
        @Expect(unsafe { readStringUnchecked(stream) }, "仓颉")
    }

    @TestCase
    func readStringUnchecked_empty(): Unit {
        let stream = PartialReadStream(Array<Byte>(), 1)
        @Expect(unsafe { readStringUnchecked(stream) }, "")
    }

    @TestCase
    func readString_afterPartialRead(): Unit {
        let stream = ByteBuffer("abcdef".toArray())
        let first = stream.read(Array<Byte>(2, repeat: 0))
        @Expect(first, 2)
        @Expect(readString(stream), "cdef")
    }
}
