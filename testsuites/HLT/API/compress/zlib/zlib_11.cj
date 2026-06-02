/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: zlib_lessthen1M.txt
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %f -o %output
// RUN-EXEC: %run_stdx %output %run_args

import stdx.compress.zlib.*
import std.io.*
import std.fs.*

main() {
    if (testzlibWrite("./zlib_lessthen1M.txt", GzipFormat) != 0 ||
        testzlibWrite("./zlib_lessthen1M.txt", DeflateFormat) != 0) {
        return 1
    }
    return 0
}

public func testzlibWrite(path: String, wraptype: WrapType): Int64 {
    var sourceAllBytes: Array<UInt8> = File.readFrom(path)
    var source: ByteBuffer = ByteBuffer()
    source.write(sourceAllBytes)
    var dest1: ByteBuffer = ByteBuffer()

    var tempBuf: Array<UInt8> = Array<UInt8>(256, {i => UInt8(i)})
    var compressInputStream: CompressInputStream = CompressInputStream(source, wrap: wraptype)
    while (true) {
        var result1 = compressInputStream.read(tempBuf)
        if (result1 == 0) {
            break
        }
        dest1.write(tempBuf[0..result1])
    }
    compressInputStream.close()

    var dest2: ByteBuffer = ByteBuffer()
    var tempBuf2: Array<UInt8> = Array<UInt8>(256, {i => UInt8(i)})
    var decompressOutputStream: DecompressOutputStream = DecompressOutputStream(dest2, wrap: wraptype)
    while (dest1.remainLength != 0) {
        var readNum = dest1.read(tempBuf)
        decompressOutputStream.write(tempBuf[0..readNum])
        tempBuf2 = tempBuf
    }
    decompressOutputStream.close()
    try {
        var result3 = decompressOutputStream.write(tempBuf2[0..2])
    } catch (e: ZlibException) {
        decompressOutputStream.close()
        return 0
    }
    return 1
}
