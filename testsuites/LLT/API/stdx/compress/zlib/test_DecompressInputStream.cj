/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./zlib_test.txt
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %set_stdx_path %run %run_opt %output %run_utest_opt

import std.collection.*
import stdx.compress.zlib.*
import std.io.ByteBuffer
import std.fs.*

@Test
class DecompressInputStreamTest {
    @TestCase
    func inputStreamEmptySourceException(): Unit {
        // 空输入不是合法压缩流，read 应报"压缩数据提前结束"，而非返回 0
        var source: ByteBuffer = ByteBuffer()
        var tempBuf: Array<UInt8> = Array<UInt8>(1024, repeat: 0)

        var decompressInputStream: DecompressInputStream = DecompressInputStream(source)
        try {
            decompressInputStream.read(tempBuf)
        } catch (e: ZlibException) {
            @Expect(e.message, "Unexpected end of compressed data.")
            try {
                decompressInputStream.close()
            } catch (e2: ZlibException) {
                @Expect(e2.message, "Unexpected end of compressed data.")
            }
            return
        }

        @Assert(false)
    }

    @TestCase
    func outputBufferEmptyException(): Unit {
        var sourceAllBytes: Array<UInt8> = File.readFrom("./zlib_test.txt")
        var source: ByteBuffer = ByteBuffer()
        source.write(sourceAllBytes)

        var emptyBuf: Array<UInt8> = Array<UInt8>()

        var decompressInputStream: DecompressInputStream = DecompressInputStream(source)

        try {
            decompressInputStream.read(emptyBuf)
        } catch (e: ZlibException) {
            @Expect(e.message, "Buffer for decompressed data cannot be empty.")
            return
        } finally {
            decompressInputStream.close()
        }

        @Assert(false)
    }

    @TestCase
    func InputStreamBuflenException0(): Unit {
        var dest: ByteBuffer = ByteBuffer()
        try {
            var _ = DecompressInputStream(dest, wrap: DeflateFormat, bufLen: 0)
        } catch (e: ZlibException) {
            @Expect(e.message, "Invalid buffer length: '0'.")
            return
        }

        @Assert(false)
    }

    @TestCase
    func InputStreamBuflenException1(): Unit {
        var dest: ByteBuffer = ByteBuffer()

        try {
            var _ = DecompressInputStream(dest, wrap: GzipFormat, bufLen: 0)
        } catch (e: ZlibException) {
            @Expect(e.message, "Invalid buffer length: '0'.")
            return
        }

        @Assert(false)
    }

    @TestCase
    func InputStreamBuflenException2(): Unit {
        var dest: ByteBuffer = ByteBuffer()
        try {
            var _ = DecompressInputStream(dest, wrap: DeflateFormat, bufLen: -1)
        } catch (e: ZlibException) {
            @Expect(e.message, "Invalid buffer length: '-1'.")
            return
        }

        @Assert(false)
    }

    @TestCase
    func InputStreamBuflenException3(): Unit {
        var dest: ByteBuffer = ByteBuffer()
        try {
            var _ = DecompressInputStream(dest, wrap: GzipFormat, bufLen: -1)
        } catch (e: ZlibException) {
            @Expect(e.message, "Invalid buffer length: '-1'.")
            return
        }

        @Assert(false)
    }

    @TestCase
    func InputStreamBuflenException4(): Unit {
        var dest: ByteBuffer = ByteBuffer()
        let maxBuflen: Int64 = -0XCCCCCCCCCCCCCCC
        try {
            var _ = DecompressInputStream(dest, wrap: DeflateFormat, bufLen: maxBuflen)
        } catch (e: ZlibException) {
            @Expect(e.message, "Invalid buffer length: '-922337203685477580'.")
            return
        }

        @Assert(false)
    }

    @TestCase
    func InputStreamBuflenException5(): Unit {
        var dest: ByteBuffer = ByteBuffer()
        let maxBuflen: Int64 = -0XCCCCCCCCCCCCCCC
        try {
            var _ = DecompressInputStream(dest, wrap: GzipFormat, bufLen: maxBuflen)
        } catch (e: ZlibException) {
            @Expect(e.message, "Invalid buffer length: '-922337203685477580'.")
            return
        }

        @Assert(false)
    }

    @TestCase
    func inputSteamDataWrongException(): Unit {
        var source: ByteBuffer = ByteBuffer()
        source.write("This is some wrong compressed data.".toArray())
        var tempBuf: Array<UInt8> = Array<UInt8>(1024, repeat: 0)

        var decompressInputStream: DecompressInputStream = DecompressInputStream(source)

        try {
            decompressInputStream.read(tempBuf)
        } catch (e: ZlibException) {
            @Expect(e.message, "ZLIB_DATA_INVALID: Data format error.")
            return
        } finally {
            decompressInputStream.close()
        }

        decompressInputStream.close()
        @Assert(false)
    }
}
