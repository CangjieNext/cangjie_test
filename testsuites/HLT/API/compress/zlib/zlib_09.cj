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
    if (testzlibRead("./zlib_lessthen1M.txt", GzipFormat) != 0 || testzlibRead("./zlib_lessthen1M.txt", DeflateFormat) !=
        0) {
        return 1
    }
    return 0
}

public func testzlibRead(path: String, wraptype: WrapType): Int64 {
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
    var decompressInputStream: DecompressInputStream = DecompressInputStream(dest1, wrap: wraptype)
    while (true) {
        var result2 = decompressInputStream.read(tempBuf)
        if (result2 == 0) {
            break
        }
        dest2.write(tempBuf[0..result2])
    }
    decompressInputStream.close()
    var result3 = decompressInputStream.read(tempBuf)
    if (result3 != 0) {
        return 1
    }
    decompressInputStream.close()
    return 0
}
