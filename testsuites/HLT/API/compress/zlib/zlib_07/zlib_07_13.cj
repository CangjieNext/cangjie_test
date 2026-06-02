/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: zlib_1M.txt
// TIMEOUT: 200
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %f -o %output
// RUN-EXEC: %run_stdx %output %run_args

import std.io.*
import std.fs.*
import stdx.compress.zlib.*

class testZlib {
    public var inputStream: ByteBuffer
    public var outputStream: ByteBuffer

    public var wrap: WrapType
    public var compressLevel: CompressLevel
    public var bufLen: Int64 = 0
    public var volumeAfterCompression: Int64 = 0

    public init(srcFilePath: String, wrap: WrapType, compressLevel: CompressLevel, bufLen: Int64) {
        inputStream = ByteBuffer()
        outputStream = ByteBuffer()
        inputStream.write(File.readFrom(srcFilePath))
        this.wrap = wrap
        this.compressLevel = compressLevel
        this.bufLen = bufLen
    }

    public func test(): Int64 {
        var compressStream: CompressInputStream = CompressInputStream(inputStream, wrap: wrap,
            compressLevel: compressLevel, bufLen: bufLen)
        var tempStremp: ByteBuffer = ByteBuffer()
        var buffer: Array<UInt8> = Array<UInt8>(1024, repeat: 0)
        while (true) {
            var readNum = compressStream.read(buffer)
            if (readNum == 0) {
                break
            }
            tempStremp.write(buffer[0..readNum])
        }
        compressStream.close()
        volumeAfterCompression = tempStremp.length
        return 0
    }
}

main() {
    var case01 = testZlib("./zlib_1M.txt", DeflateFormat, BestSpeed, 1)
    var case02 = testZlib("./zlib_1M.txt", DeflateFormat, DefaultCompression, 1)
    var case03 = testZlib("./zlib_1M.txt", DeflateFormat, BestCompression, 1)
    let cases: Array<testZlib> = [case01, case02, case03]
    for (testcase in cases) {
        var testresult = testcase.test()
        if (testresult != 0) {
            return 1
        }
    }
    if (case02.volumeAfterCompression >= case01.volumeAfterCompression || case03.volumeAfterCompression >= case02
        .volumeAfterCompression) {
        return 2
    }
    0
}
