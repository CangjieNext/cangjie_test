/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./zlib_test.txt
// DEPENDENCE: ./zlib_test2.txt
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// (Unix) EXEC-PIPE: export cjHeapSize=16GB && %set_stdx_path %run %run_opt %output %run_utest_opt %run_args
// (Windows) EXEC-PIPE: (set cjHeapSize=16GB) && %set_stdx_path %run %run_opt %output %run_utest_opt %run_args

import std.collection.*
import stdx.compress.zlib.*
import std.io.ByteBuffer
import std.fs.*
import std.io.*

let BIG_BUF_SIZE: Int64 = 4 * 1024 * 1024

@Test
class CompressDecompressBigBufferTest {
    @TestCase
    func compressInputToDecompressOutput(): Unit {
        var source = File("./zlib_test.txt", Read)
        var tempBuf: Array<UInt8> = Array<UInt8>(BIG_BUF_SIZE, repeat: 0)

        var dest1: ByteBuffer = ByteBuffer()
        var compressOutputStream: CompressOutputStream = CompressOutputStream(dest1, bufLen: BIG_BUF_SIZE)
        while (true) {
            var readNum = source.read(tempBuf)
            if (readNum == 0) {
                break
            }
            compressOutputStream.write(tempBuf.slice(0, readNum).toArray())
        }
        compressOutputStream.close()
        source.close()

        @Assert(dest1.length != 0)

        var decompressInputStream: DecompressInputStream = DecompressInputStream(dest1, bufLen: BIG_BUF_SIZE)
        var dest2: ByteBuffer = ByteBuffer()
        while (true) {
            var readNum = decompressInputStream.read(tempBuf)
            if (readNum > 0) {
                dest2.write(tempBuf.slice(0, readNum).toArray())
            } else {
                break
            }
        }
        decompressInputStream.close()

        @Assert(dest2.length != 0)

        var sourceAllBytes = File.readFrom("./zlib_test.txt")
        var destAllBytes: Array<UInt8> = readToEnd(dest2)
        @Assert(sourceAllBytes == destAllBytes)
    }

    @TestCase
    func compressOutputToDecompressInput(): Unit {
        var source = File("./zlib_test.txt", Read)
        var tempBuf: Array<UInt8> = Array<UInt8>(BIG_BUF_SIZE, repeat: 0)

        var dest1: ByteBuffer = ByteBuffer()
        var compressOutputStream: CompressOutputStream = CompressOutputStream(dest1, bufLen: BIG_BUF_SIZE)
        while (true) {
            var readNum = source.read(tempBuf)
            if (readNum == 0) {
                break
            }
            compressOutputStream.write(tempBuf.slice(0, readNum).toArray())
        }
        compressOutputStream.close()
        source.close()

        @Assert(dest1.length != 0)

        var decompressInputStream: DecompressInputStream = DecompressInputStream(dest1, bufLen: BIG_BUF_SIZE)
        var dest2: ByteBuffer = ByteBuffer()
        while (true) {
            var readNum = decompressInputStream.read(tempBuf)
            if (readNum > 0) {
                dest2.write(tempBuf.slice(0, readNum).toArray())
            } else {
                break
            }
        }
        decompressInputStream.close()

        @Assert(dest2.length != 0)

        var sourceAllBytes = File.readFrom("./zlib_test.txt")
        var destAllBytes: Array<UInt8> = readToEnd(dest2)
        @Assert(sourceAllBytes == destAllBytes)
    }
}
