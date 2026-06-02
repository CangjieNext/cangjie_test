/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./zlib_test.txt
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args

import std.collection.*
import stdx.compress.zlib.*
import std.io.ByteBuffer
import std.fs.*

@Test
class CompressInputStreamTest {
    @TestCase
    func inputStreamEmptyOutPutBufferEmpty(): Unit {
        var source: ByteBuffer = ByteBuffer()

        var tempBuf: Array<UInt8> = Array<UInt8>(1024, repeat: 0)
        var compressInputStream: CompressInputStream = CompressInputStream(source)
        var dest: ByteBuffer = ByteBuffer()
        while (true) {
            var readNum = compressInputStream.read(tempBuf)
            if (readNum > 0) {
                dest.write(tempBuf.slice(0, readNum).toArray())
            } else {
                break
            }
        }
        compressInputStream.close()

        @Expect(dest.length, 0)
    }

    @TestCase
    func outputBufferEmptyException(): Unit {
        var sourceAllBytes: Array<UInt8> = File.readFrom("./zlib_test.txt")
        var source: ByteBuffer = ByteBuffer()
        source.write(sourceAllBytes)

        var emptyBuf: Array<UInt8> = Array<UInt8>()
        var compressInputStream: CompressInputStream = CompressInputStream(source)

        try {
            compressInputStream.read(emptyBuf)
        } catch (e: ZlibException) {
            println(e)
            @Expect(e.message, "The buffer for storing compressed data cannot be empty.")
            return
        } finally {
            compressInputStream.close()
        }

        compressInputStream.close()
        @Assert(false)
    }

    @TestCase
    func outputBufferSmallSuccess(): Unit {
        var sourceAllBytes: Array<UInt8> = File.readFrom("./zlib_test.txt")
        var source: ByteBuffer = ByteBuffer()
        source.write(sourceAllBytes)

        var tempBuf: Array<UInt8> = Array<UInt8>(5, repeat: 0)

        var compressInputStream: CompressInputStream = CompressInputStream(source, bufLen: 256)
        var dest: ByteBuffer = ByteBuffer()
        while (true) {
            var readNum = compressInputStream.read(tempBuf)
            if (readNum > 0) {
                dest.write(tempBuf.slice(0, readNum).toArray())
            } else {
                break
            }
        }
        compressInputStream.close()

        @Expect(dest.remainLength != 0)
    }
}
