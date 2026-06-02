/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %overflow_wrapping %import-cangjie-stdx %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run_stdx %output %run_args

import std.collection.*
import std.io.*
import std.random.*
import std.unittest.*
import std.unittest.testmacro.*
import stdx.compress.zlib.*

class testZlib {
    private var src: Array<UInt8>
    private var inputStream: ByteBuffer
    private var outputStream: ByteBuffer

    private var wrap: WrapType
    private var compressLevel: CompressLevel
    private var bufLen: Int64

    public init(len: Int64, wrap: WrapType, compressLevel: CompressLevel, bufLen: Int64) {
        src = Array<UInt8>(len) {i => UInt8(i % 256)}
        inputStream = ByteBuffer(len)
        outputStream = ByteBuffer(len)
        inputStream.write(src)
        this.wrap = wrap
        this.compressLevel = compressLevel
        this.bufLen = bufLen
    }

    public func test(): Unit {
        let len = Int64(Random().nextUInt16())
        var compressStream: CompressInputStream = CompressInputStream(inputStream, wrap: wrap,
            compressLevel: compressLevel, bufLen: bufLen)
        var tempStremp: ByteBuffer = ByteBuffer()
        var buffer: Array<UInt8> = Array<UInt8>(len, repeat: 0)

        while (true) {
            var readNum = compressStream.read(buffer)
            if (readNum == 0) {
                break
            }
            tempStremp.write(buffer[0..readNum])
        }

        var decompressStream: DecompressOutputStream = DecompressOutputStream(outputStream, wrap: wrap, bufLen: bufLen)
        decompressStream.write(readToEnd(tempStremp))
        compressStream.close()
        decompressStream.close()

        assertEqual<Array<UInt8>>("input", "output", src, readToEnd(outputStream))
    }
}

func createZlibCase(len: Int64, wrap: WrapType, compressLevel: CompressLevel, bufLen: Int64): UnitTestCase {
    UnitTestCase.create("ZLibCase") {
        testZlib(len, wrap, compressLevel, bufLen).test()
    }
}

main() {
    let suite = TestSuite
        .builder("zlib_suite")
        .add(createZlibCase(1024, DeflateFormat, BestSpeed, 1))
        .add(createZlibCase(1024, DeflateFormat, DefaultCompression, 1))
        .add(createZlibCase(1024, DeflateFormat, BestCompression, 1))
        .add(createZlibCase(1, DeflateFormat, BestSpeed, 1024))
        .add(createZlibCase(1024, DeflateFormat, DefaultCompression, 1024))
        .add(createZlibCase(1024, DeflateFormat, BestCompression, 1024))
        .add(createZlibCase(1024, DeflateFormat, BestSpeed, 1024 * 1024))
        .add(createZlibCase(1, DeflateFormat, DefaultCompression, 1024 * 1024))
        .add(createZlibCase(1024, DeflateFormat, BestCompression, 1024 * 1024))
        .add(createZlibCase(1024, GzipFormat, BestSpeed, 1))
        .add(createZlibCase(1024, GzipFormat, DefaultCompression, 1))
        .add(createZlibCase(1, GzipFormat, BestCompression, 1))
        .add(createZlibCase(1024, GzipFormat, BestSpeed, 1024))
        .add(createZlibCase(1024 * 1024, GzipFormat, DefaultCompression, 1024))
        .add(createZlibCase(1024, GzipFormat, BestCompression, 1024))
        .add(createZlibCase(1024, GzipFormat, BestSpeed, 1024 * 1024))
        .add(createZlibCase(1024, GzipFormat, DefaultCompression, 1024 * 1024))
        .add(createZlibCase(1024 * 1024, GzipFormat, BestCompression, 1024 * 1024))
        .build()
    let report = suite.runTests()
    report.reportTo(ConsoleReporter(colored: false))
    return report.errorCount + report.failedCount
}
