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
// EXEC: %set_stdx_path %run %run_opt %output %run_utest_opt

import std.collection.*
import stdx.compress.zlib.*
import std.io.ByteBuffer
import std.fs.*
import std.io.*
import std.runtime.*

var sourceArrayGC = Array<Byte>(10, repeat: 1)
var compressedArrayGC = Array<Byte>(50, repeat: 0)
var sourceStreamGC = ByteBuffer()
var destStreamGC = ByteBuffer()
var readNumGC: Int64 = 0

func compressFileInputStream(srcFileName: String, destFileName: String, wrapType: WrapType, outputBuflen: Int64): Int64 {
    var count: Int64 = 0
    var tempBuf: Array<UInt8> = Array<UInt8>(outputBuflen, repeat: 0)
    var srcFile: File = File(srcFileName, Read)

    var compressInputStream: CompressInputStream = CompressInputStream(srcFile, wrap: wrapType)
    var destFile: File = File(destFileName, ReadWrite)
    while (true) {
        var readNum = compressInputStream.read(tempBuf)
        if (readNum > 0) {
            destFile.write(tempBuf.slice(0, readNum).toArray())
        } else {
            break
        }
        count += readNum
    }
    compressInputStream.close()
    srcFile.close()
    destFile.close()
    return count
}

func decompressFileOutputStream(srcFileName: String, destFileName: String, wrapType: WrapType, outputBuflen: Int64): Int64 {
    var count: Int64 = 0
    var srcFile: File = File(srcFileName, Read)
    var destFile: File = File(destFileName, ReadWrite)

    var tempBuf: Array<UInt8> = Array<UInt8>(outputBuflen, repeat: 0)
    var decompressOutputStream: DecompressOutputStream = DecompressOutputStream(destFile, wrap: wrapType)
    while (true) {
        var readNum = srcFile.read(tempBuf)
        if (readNum > 0) {
            decompressOutputStream.write(tempBuf.slice(0, readNum).toArray())
        } else {
            break
        }
        count += readNum
    }
    decompressOutputStream.close()
    srcFile.close()
    destFile.close()

    return count
}

func compareFile(fileName1: String, fileName2: String): Bool {
    return File.readFrom(fileName1) == File.readFrom(fileName2)
}

@Test
class CompressInputToDecompressOutputTest {
    @TestCase
    func defaultFile(): Unit {
        let fileNames = ["./zlib_test.txt", "./zlib_test2.txt"]
        for (i in 0..fileNames.size) {
            var sourceAllBytes: Array<UInt8> = File.readFrom(fileNames[i])
            var source: ByteBuffer = ByteBuffer()
            source.write(sourceAllBytes)

            var tempBuf: Array<UInt8> = Array<UInt8>(1024, repeat: 0)

            var compressInputStream: CompressInputStream = CompressInputStream(source)
            var dest1: ByteBuffer = ByteBuffer()
            while (true) {
                var readNum = compressInputStream.read(tempBuf)
                if (readNum > 0) {
                    dest1.write(tempBuf.slice(0, readNum).toArray())
                } else {
                    break
                }
            }
            compressInputStream.close()

            @Assert(dest1.remainLength != 0)

            var dest2: ByteBuffer = ByteBuffer()
            var decompressOutputStream: DecompressOutputStream = DecompressOutputStream(dest2)
            while (dest1.remainLength != 0) {
                var readNum = dest1.read(tempBuf)
                decompressOutputStream.write(tempBuf.slice(0, readNum).toArray())
            }
            decompressOutputStream.close()

            @Assert(dest2.remainLength != 0)

            var destAllBytes: Array<UInt8> = readToEnd(dest2)
            @Assert(sourceAllBytes == destAllBytes)
        }
    }

    @TestCase
    func deflateBuflenLessThanEight(): Unit {
        let smallBuflen = 8
        for (outputBuflen in 1..smallBuflen) {
            @Expect(compressFileInputStream("./zlib_test.txt", "./zlib_copmressed.zlib", DeflateFormat, outputBuflen) > 0)

            @Expect(decompressFileOutputStream("./zlib_copmressed.zlib", "./zlib_decopmressed.txt", DeflateFormat, outputBuflen) > 0)

            @Expect(compareFile("./zlib_test.txt", "./zlib_decopmressed.txt"))

            remove("./zlib_copmressed.zlib")
            remove("./zlib_decopmressed.txt")
        }
    }

    @TestCase
    func gzipBuflenLessThanEight(): Unit {
        let smallBuflen = 8
        for (outputBuflen in 1..smallBuflen) {
            @Expect(compressFileInputStream("./zlib_test.txt", "./zlib_copmressed.zlib", GzipFormat, outputBuflen) > 0)
            @Expect(decompressFileOutputStream("./zlib_copmressed.zlib", "./zlib_decopmressed.txt", GzipFormat, outputBuflen) > 0)
            @Expect(compareFile("./zlib_test.txt", "./zlib_decopmressed.txt"))

            remove("./zlib_copmressed.zlib")
            remove("./zlib_decopmressed.txt")
        }
    }

    @TestCase
    func closeThreeTimes(): Unit {
        var sourceAllBytes: Array<UInt8> = File.readFrom("./zlib_test.txt")
        var source: ByteBuffer = ByteBuffer()
        source.write(sourceAllBytes)

        var tempBuf: Array<UInt8> = Array<UInt8>(1024, repeat: 0)

        var compressInputStream: CompressInputStream = CompressInputStream(source)
        var dest1: ByteBuffer = ByteBuffer()
        while (true) {
            var readNum = compressInputStream.read(tempBuf)
            if (readNum > 0) {
                dest1.write(tempBuf.slice(0, readNum).toArray())
            } else {
                break
            }
        }
        compressInputStream.close()

        // Test repeated close
        for (_ in 0..3) {
            compressInputStream.close()
        }
        // Test repeated read
        for (_ in 0..3) {
            @Assert(compressInputStream.read(tempBuf) == 0)
        }

        @Assert(dest1.remainLength != 0)

        var dest2: ByteBuffer = ByteBuffer()
        var decompressOutputStream: DecompressOutputStream = DecompressOutputStream(dest2)
        while (dest1.remainLength != 0) {
            var readNum = dest1.read(tempBuf)
            decompressOutputStream.write(tempBuf.slice(0, readNum).toArray())
        }
        decompressOutputStream.close()

        // Test repeated close
        for (_ in 0..3) {
            decompressOutputStream.close()
        }
        // Test repeated write
        for (_ in 0..3) {
            try {
                decompressOutputStream.write(tempBuf)
                @Assert(false)
                break
            } catch (e: ZlibException) {
                continue
            }
        }

        @Assert(dest2.remainLength != 0)

        var destAllBytes: Array<UInt8> = readToEnd(dest2)
        @Assert(sourceAllBytes == destAllBytes)
    }

    @TestCase
    func bufLen(): Unit {
        let tempBuflens = [1024, 1024, 1024, 1024]
        let streamBuflens1 = [256, 10000, 256, 10000]
        let streamBuflens2 = [256, 10000, 10000, 256]
        for (i in 0..tempBuflens.size) {
            var tempBuf: Array<UInt8> = Array<UInt8>(tempBuflens[i], repeat: 0)
            var sourceAllBytes: Array<UInt8> = File.readFrom("./zlib_test.txt")
            var source: ByteBuffer = ByteBuffer()
            source.write(sourceAllBytes)

            var compressInputStream: CompressInputStream = CompressInputStream(source, bufLen: streamBuflens1[i])
            var dest1: ByteBuffer = ByteBuffer()
            while (true) {
                var readNum = compressInputStream.read(tempBuf)
                if (readNum > 0) {
                    dest1.write(tempBuf.slice(0, readNum))
                } else {
                    break
                }
            }
            compressInputStream.close()

            @Assert(dest1.remainLength != 0)

            var dest2: ByteBuffer = ByteBuffer()
            var decompressOutputStream: DecompressOutputStream = DecompressOutputStream(dest2, bufLen: streamBuflens2[i])
            while (dest1.remainLength != 0) {
                var readNum = dest1.read(tempBuf)
                decompressOutputStream.write(tempBuf.slice(0, readNum))
            }
            decompressOutputStream.close()

            @Assert(dest2.remainLength != 0)

            var destAllBytes: Array<UInt8> = readToEnd(dest2)
            @Assert(sourceAllBytes == destAllBytes)
        }
    }

    @TestCase
    func compressLevel(): Unit {
        let levelArr = [BestSpeed, DefaultCompression, BestCompression]
        for (level in levelArr) {
            var sourceAllBytes: Array<UInt8> = File.readFrom("./zlib_test.txt")
            var source: ByteBuffer = ByteBuffer()
            source.write(sourceAllBytes)

            var tempBuf: Array<UInt8> = Array<UInt8>(1024, repeat: 0)

            var compressInputStream: CompressInputStream = CompressInputStream(source, compressLevel: level)
            var dest1: ByteBuffer = ByteBuffer()
            while (true) {
                var readNum = compressInputStream.read(tempBuf)
                if (readNum > 0) {
                    dest1.write(tempBuf.slice(0, readNum).toArray())
                } else {
                    break
                }
            }
            compressInputStream.close()

            @Assert(dest1.remainLength != 0)

            var dest2: ByteBuffer = ByteBuffer()
            var decompressOutputStream: DecompressOutputStream = DecompressOutputStream(dest2)
            while (dest1.remainLength != 0) {
                var readNum = dest1.read(tempBuf)
                decompressOutputStream.write(tempBuf.slice(0, readNum).toArray())
            }
            decompressOutputStream.close()

            @Assert(dest2.remainLength != 0)

            var destAllBytes: Array<UInt8> = readToEnd(dest2)
            @Assert(sourceAllBytes == destAllBytes)
        }
    }
    @TestCase
    func closeAndGC(): Unit {
        sourceArrayGC = Array<Byte>(10, repeat: 1)
        spawn {
            sourceStreamGC.write(sourceArrayGC)
            var compressInputStream = CompressInputStream(sourceStreamGC, bufLen: 50)
            readNumGC = compressInputStream.read(compressedArrayGC)
            @Assert(readNumGC != 0)
            compressInputStream.close()

            var decompressOutputStream = DecompressOutputStream(destStreamGC, bufLen: 50)
            decompressOutputStream.write(compressedArrayGC[0..readNumGC])
            decompressOutputStream.close()
            @Assert(sourceArrayGC == readToEnd(destStreamGC))
        }
        sleep(Duration.second)
        GC()
        sleep(Duration.second)
    }

    @TestCase
    func noCloseButGC(): Unit {
        sourceArrayGC = Array<Byte>(10, repeat: 1)
        spawn {
            var destStream = ByteBuffer()
            var decompressOutputStream = DecompressOutputStream(destStream, bufLen: 50)
            try {
                decompressOutputStream.write(sourceArrayGC)
                decompressOutputStream.close()
            } catch (e: ZlibException) {
                @Assert(e.message, "ZLIB_DATA_INVALID: Data format error.")
            }
        }
        spawn {
            var sourceStream = ByteBuffer()
            sourceStream.write(sourceArrayGC)
            var destArray = Array<Byte>(50, repeat: 0)
            var compressInputStream = CompressInputStream(sourceStream, bufLen: 50)
            var readNum = compressInputStream.read(destArray)
            @Assert(readNum != 0)
        }
        sleep(Duration.second)
        GC()
        sleep(Duration.second)
    }
}
