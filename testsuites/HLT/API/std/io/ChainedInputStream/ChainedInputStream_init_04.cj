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
    var arr: Array<Byte> = Array<Byte>(9000, {i => UInt8(i % 256)})
    var inputStream = ByteBuffer()
    var inputStream1 = ByteBuffer()
    var inputStream2 = ByteBuffer()
    inputStream.write(arr.slice(0, 1000).toArray())
    inputStream1.write(arr.slice(1000, 5000).toArray())
    inputStream2.write(arr.slice(6000, 3000).toArray())
    var chainedInputStream = ChainedInputStream([inputStream, inputStream1, inputStream2])
    var outputStream = ByteBuffer()
    var tempBuf = Array<Byte>(1024, repeat: 0)
    while (true) {
        var readNums = chainedInputStream.read(tempBuf)
        if (readNums == 0) {
            break
        }
        outputStream.write(tempBuf.slice(0, readNums).toArray())
    }
    var dataArray = readToEnd(outputStream)
    if (arr != dataArray) {
        return 1
    }
    return 0
}
