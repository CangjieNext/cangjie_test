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
    var n: Int64 = 0
    var data: Array<UInt8> = Array<UInt8>(1024, repeat: 78)
    var buffer: ByteBuffer = ByteBuffer()
    var a = CompressOutputStream(buffer)
    a.write(data)
    a.flush()
    a.close()
    try {
        var b = a.write(data)
    } catch (e: ZlibException) {
        n++
    }
    a.close()
    var source: ByteBuffer = ByteBuffer()
    var decompressOutputStream: DecompressOutputStream = DecompressOutputStream(source)
    decompressOutputStream.write(readToEnd(buffer))
    decompressOutputStream.close()
    var c = readToEnd(source)
    if (c != data) {
        return 1
    }
    if (n != 1) {
        return 2
    }
    return 0
}
