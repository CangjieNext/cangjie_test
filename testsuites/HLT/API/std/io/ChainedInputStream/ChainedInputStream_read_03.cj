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
    var arr1 = arr.slice(0, 5000).toArray()
    var arr2 = arr.slice(5000, 4000).toArray()
    var inputStream = ByteBuffer()
    var inputStream1 = ByteBuffer()
    var inputStream2 = ByteBuffer()
    inputStream.write(arr1)
    inputStream2.write(arr2)
    var chainedInputStream = ChainedInputStream([inputStream, inputStream1, inputStream2])
    var tempBuf = Array<Byte>(10000, repeat: 2)
    var readNums = chainedInputStream.read(tempBuf)
    var dataArray1 = tempBuf.slice(0, 5000).toArray()
    var dataArray2 = tempBuf.slice(5000, 5000).toArray()
    var tempBuf1 = Array<Byte>(10000, repeat: 2)
    var readNums1 = chainedInputStream.read(tempBuf1)
    var dataArray3 = tempBuf1.slice(0, 4000).toArray()
    var dataArray4 = tempBuf1.slice(4000, 6000).toArray()
    if (dataArray1 != arr1) {
        return 1
    }
    if (dataArray2 != Array<Byte>(5000, repeat: 2)) {
        return 2
    }
    if (readNums != 5000) {
        return 3
    }
    if (dataArray3 != arr2) {
        return 4
    }
    if (dataArray4 != Array<Byte>(6000, repeat: 2)) {
        return 5
    }
    if (readNums1 != 4000) {
        return 6
    }
    return 0
}
