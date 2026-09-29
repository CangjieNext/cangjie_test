/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %set_stdx_path %run %run_opt %output %run_utest_opt

import stdx.compress.zlib.*
import std.io.ByteBuffer

func makeGzip(source: String): Array<UInt8> {
    let compressor = CompressInputStream(ByteBuffer(source.toArray()), wrap: GzipFormat)
    let buf = Array<UInt8>(1024, repeat: 0)
    let n = compressor.read(buf)
    compressor.close()
    return buf.slice(0, n)
}

func makeDeflate(source: String): Array<UInt8> {
    let compressor = CompressInputStream(ByteBuffer(source.toArray()), wrap: DeflateFormat)
    let buf = Array<UInt8>(1024, repeat: 0)
    let n = compressor.read(buf)
    compressor.close()
    return buf.slice(0, n)
}

@Test
class DecompressTruncatedInputTest {
    @TestCase
    func truncatedGzipReadException(): Unit {
        let full = makeGzip("truncated input test")
        let truncated = full.slice(0, full.size - 1)
        let decompressor = DecompressInputStream(ByteBuffer(truncated), wrap: GzipFormat, bufLen: 16)
        let out = Array<UInt8>(1024, repeat: 0)
        try {
            let n = decompressor.read(out)
            @Assert(false)
        } catch (e: ZlibException) {
            @Expect(e.message, "Unexpected end of compressed data.")
        }
        // 异常后再次 read 报告同一错误；close 不重复报错，仅释放资源
        try {
            decompressor.read(out)
            @Assert(false)
        } catch (e: ZlibException) {
            @Expect(e.message, "Unexpected end of compressed data.")
        }
        decompressor.close()
    }

    @TestCase
    func truncatedGzipCloseAfterPartialRead(): Unit {
        // 部分明文读出后直接 close：与主流语言(Java/Go/Python)一致，close 仅释放资源不报错；
        // 完整性由 read 路径保证(数据截断时 read 抛异常)
        let full = makeGzip("truncated input test")
        let truncated = full.slice(0, full.size - 1)
        let decompressor = DecompressInputStream(ByteBuffer(truncated), wrap: GzipFormat, bufLen: 16)
        let out = Array<UInt8>(4, repeat: 0)
        let n = decompressor.read(out)
        @Assert(n > 0)
        decompressor.close()
    }

    @TestCase
    func emptyInputReadException(): Unit {
        let decompressor = DecompressInputStream(ByteBuffer(Array<UInt8>()), wrap: GzipFormat)
        let out = Array<UInt8>(64, repeat: 0)
        try {
            let n = decompressor.read(out)
            @Assert(false)
        } catch (e: ZlibException) {
            @Expect(e.message, "Unexpected end of compressed data.")
        }
        decompressor.close()
    }

    @TestCase
    func truncatedDeflateReadException(): Unit {
        let full = makeDeflate("truncated input test")
        let truncated = full.slice(0, full.size - 1)
        let decompressor = DecompressInputStream(ByteBuffer(truncated), wrap: DeflateFormat, bufLen: 16)
        let out = Array<UInt8>(1024, repeat: 0)
        try {
            decompressor.read(out)
            @Assert(false)
        } catch (e: ZlibException) {
            @Expect(e.message, "Unexpected end of compressed data.")
        }
        decompressor.close()
    }

    @TestCase
    func truncatedGzipOutputStreamCloseException(): Unit {
        let full = makeGzip("truncated output stream test")
        let truncated = full.slice(0, full.size - 1)
        let dest = ByteBuffer()
        let decompressor = DecompressOutputStream(dest, wrap: GzipFormat, bufLen: 16)
        decompressor.write(truncated)
        try {
            decompressor.close()
            @Assert(false)
        } catch (e: ZlibException) {
            @Expect(e.message, "Unexpected end of compressed data.")
        }
    }

    @TestCase
    func emptyInputOutputStreamCloseException(): Unit {
        let dest = ByteBuffer()
        let decompressor = DecompressOutputStream(dest, wrap: GzipFormat, bufLen: 16)
        try {
            decompressor.close()
            @Assert(false)
        } catch (e: ZlibException) {
            @Expect(e.message, "Unexpected end of compressed data.")
        }
    }

    @TestCase
    func normalCompletionUnaffected(): Unit {
        // 回归保护：完整数据解压路径不变
        let full = makeGzip("normal completion test")
        let decompressor = DecompressInputStream(ByteBuffer(full), wrap: GzipFormat, bufLen: 16)
        let out = Array<UInt8>(1024, repeat: 0)
        let n1 = decompressor.read(out)
        @Expect(String.fromUtf8(out.slice(0, n1)), "normal completion test")
        let n2 = decompressor.read(out)
        @Expect(n2, 0)
        decompressor.close()
    }
}
