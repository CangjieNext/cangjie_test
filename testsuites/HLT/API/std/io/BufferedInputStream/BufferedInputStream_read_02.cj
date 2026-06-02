/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args

import std.io.*

main() {
    var n: Int64 = 0
    var arr = Array<Byte>(100, {i => UInt8(i % 256)})
    var inputStream = ByteBuffer()
    inputStream.write(arr)
    var inputStream1 = ByteBuffer()
    inputStream1.write(arr)
    var bufferedInputStream = BufferedInputStream(inputStream, 512)
    var bufferedInputStream1 = BufferedInputStream(inputStream1)
    var tempBuf = Array<Byte>()
    try {
        bufferedInputStream.read(tempBuf)
    } catch (e: IllegalArgumentException) {
        n++
    }
    try {
        bufferedInputStream1.read(tempBuf)
    } catch (e: IllegalArgumentException) {
        n++
    }
    if (n != 2) {
        return 1
    }
    return 0
}
