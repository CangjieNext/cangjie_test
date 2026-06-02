/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %f -o %output
// RUN-EXEC: %run_stdx %output %run_args

import stdx.compress.zlib.*
import std.io.*

main() {
    var a2 = createOutputStream1(DeflateFormat, BestSpeed)
    var a3 = createOutputStream1(DeflateFormat, DefaultCompression)
    var a4 = createOutputStream1(DeflateFormat, BestCompression)
    var a6 = createOutputStream1(GzipFormat, BestSpeed)
    var a7 = createOutputStream1(GzipFormat, DefaultCompression)
    var a8 = createOutputStream1(GzipFormat, BestCompression)
    if (a2[1] != 1) {
        return 2
    }
    if (a3[1] != 1) {
        return 3
    }
    if (a4[1] != 1) {
        return 4
    }
    if (a6[1] != 1) {
        return 6
    }
    if (a7[1] != 1) {
        return 7
    }
    if (a8[1] != 1) {
        return 8
    }
    if (a3[0] > a2[0]) {
        return 10
    }
    if (a4[0] > a3[0]) {
        return 11
    }
    if (a7[0] > a6[0]) {
        return 13
    }
    if (a8[0] > a7[0]) {
        return 14
    }
    return 0
}

func createOutputStream1(wrap1: WrapType, compressLevel1: CompressLevel): (Int64, Int64) {
    var n: Int64 = 0
    var data: Array<UInt8> = Array<UInt8>(1024 * 1024, {i => UInt8(i % 256)})
    var buffer: ByteBuffer = ByteBuffer()
    var a = CompressOutputStream(buffer, wrap: wrap1, compressLevel: compressLevel1)
    var c = a.write(data)
    a.flush()
    a.close()
    var m = buffer.length
    var source: ByteBuffer = ByteBuffer()
    var decompressOutputStream: DecompressOutputStream = DecompressOutputStream(source, wrap: wrap1)
    decompressOutputStream.write(readToEnd(buffer))
    decompressOutputStream.close()
    var d = readToEnd(source)
    if (d == data) {
        n = 1
    }
    return (m, n)
}
