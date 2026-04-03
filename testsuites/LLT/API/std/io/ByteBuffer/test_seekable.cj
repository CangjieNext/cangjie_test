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
public class SeekAbleTest {
    let bs = ByteBuffer()

    @TestCase
    func seekTest(): Unit {
        @Expect(bs.length, 0)
        @Expect(bs.remainLength, 0)
        @Expect(bs.position, 0)

        bs.write("hello,world!".toArray())
        @Expect(bs.length, 12)
        @Expect(bs.remainLength, 12)
        @Expect(bs.position, 0)

        bs.seek(Current(5))
        @Expect(bs.length, 12)
        @Expect(bs.remainLength, 7)
        @Expect(bs.position, 5)

        var arr = Array<Byte>(1, repeat: 0)
        var index = bs.read(arr)
        @Expect(String.fromUtf8(arr[0..index]), ",")
        @Expect(bs.length, 12)
        @Expect(bs.remainLength, 6)
        @Expect(bs.position, 6)

        var data = readToEnd(bs)
        @Expect(String.fromUtf8(data), "world!")
        @Expect(bs.length, 12)
        @Expect(bs.remainLength, 0)
        @Expect(bs.position, 12)

        bs.write("hello,world!".toArray())
        @Expect(bs.length, 24)
        @Expect(bs.remainLength, 12)
        @Expect(bs.position, 12)

        bs.seek(Begin(0))
        @Expect(bs.length, 24)
        @Expect(bs.remainLength, 24)
        @Expect(bs.position, 0)

        bs.seek(End(-12))
        @Expect(bs.length, 24)
        @Expect(bs.remainLength, 12)
        @Expect(bs.position, 12)

        try {
            bs.seek(Begin(-1))
            @Assert(false)
        } catch (e: IOException) {
            @Expect(e.message, "Can't move the position before the beginning of the stream.")
        }

        try {
            bs.seek(Current(-13))
            @Assert(false)
        } catch (e: IOException) {
            @Expect(e.message, "Can't move the position before the beginning of the stream.")
        }

        try {
            bs.seek(End(-25))
            @Assert(false)
        } catch (e: IOException) {
            @Expect(e.message, "Can't move the position before the beginning of the stream.")
        }

        //流内部有数据不为空
        bs.seek(End(0))
        @Expect(bs.length != 0)
        bs.seek(Current(-24))
        @Expect(String.fromUtf8(readToEnd(bs)), "hello,world!hello,world!")

        //流清空后数据为空
        bs.clear()
        @Expect(bs.length, 0)
        bs.seek(Current(1))
        bs.write([65])
        bs.seek(Begin(0))
        var bytes = bs.bytes()
        @Expect(String.fromUtf8(bytes), "\0A")

        //修改缓冲区会导致切片无效
        bs.clear()
        @Expect(String.fromUtf8(bytes), "\0\0")

        //切片修改也会影响缓冲区
        bs.write([65, 65])
        @Expect(String.fromUtf8(readToEnd(bs)), "AA")
        @Expect(String.fromUtf8(bytes), "AA")
        bytes[1] = 66
        bs.seek(End(-2))
        @Expect(String.fromUtf8(readToEnd(bs)), "AB")
        @Expect(String.fromUtf8(bytes), "AB")

        bs.seek(Current(4096))
        bs.write("success".toArray())
    }

    @TestCase
    func seekTestMax(): Unit {
        let buffer = ByteBuffer()

        // 1. 先写入一些数据，让 start 可以移动
        buffer.write("Hello".toArray())

        // 2. seek 到一个较大的位置（但不是最大）
        // 注意：seek 会改变 start 和 _length
        buffer.seek(Begin(100))

        // 3. 再 seek 一个大的 offset，尝试触发溢出
        // 如果 start = 100, offset = Int64.Max - 50
        // start + offset = Int64.Max + 50，溢出变成负数
        try {
            let largeOffset = Int64.Max - 50
            buffer.seek(Current(largeOffset))

            // 4. 检查状态是否损坏
            // 如果溢出，start 可能是负数或很小的值
            // 后续操作可能异常

            // 5. 尝试写入数据
            buffer.write("test".toArray())
        } catch (e: IOException) {
            @Expect("Can't seek beyond the maximum position of the stream.", e.message)
        }
    }

    @TestCase
    func seekTestMaxLength(): Unit {
        let malicious = MaliciousStream()
        let data = readToEnd(malicious)
    }
}

class MaliciousStream <: InputStream & Seekable {
    public prop length: Int64 {
        get() {
            return Int64.Max // 直接返回极大值
        }
    }

    public func read(buffer: Array<Byte>): Int64 {
        return 0 // 不实际读取数据
    }

    public func seek(sp: SeekPosition): Int64 {
        return 0
    }
}
