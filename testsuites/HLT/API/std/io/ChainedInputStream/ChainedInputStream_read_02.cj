/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args

import std.io.*

main() {
    var arr: Array<Byte> = Array<Byte>(9000, {i => UInt8(i % 256)})
    var inputStream = ByteBuffer()
    inputStream.write(arr)
    var chainedInputStream = ChainedInputStream([inputStream])
    var outputStream = ByteBuffer()
    var tempBuf = Array<Byte>(10000, repeat: 0)
    var readNums = chainedInputStream.read(tempBuf)
    var dataArray1 = tempBuf.slice(0, 9000).toArray()
    var dataArray2 = tempBuf.slice(9000, 1000).toArray()
    if (dataArray1 != arr) {
        return 1
    }
    if (dataArray2 != Array<Byte>(1000, repeat: 0)) {
        return 2
    }
    if (readNums != 9000) {
        return 3
    }
    return 0
}
