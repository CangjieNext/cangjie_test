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
    var arr = Array<Byte>(2000, {i => UInt8(i % 256)})
    var arr1 = Array<Byte>(10000, {i => UInt8(i % 256)})
    var outputStream = ByteBuffer()
    var outputStream1 = ByteBuffer()
    var outputStream2 = ByteBuffer()
    var outputStream3 = ByteBuffer()
    var bufferedOutputStream = BufferedOutputStream(outputStream)
    var bufferedOutputStream1 = BufferedOutputStream(outputStream1, 5000)
    bufferedOutputStream.write(arr)
    bufferedOutputStream1.write(arr)
    bufferedOutputStream.flush()
    bufferedOutputStream1.flush()
    bufferedOutputStream.reset(outputStream2)
    bufferedOutputStream1.reset(outputStream3)
    bufferedOutputStream.write(arr1)
    bufferedOutputStream1.write(arr1)
    bufferedOutputStream.flush()
    bufferedOutputStream1.flush()
    var dataArray = readToEnd(outputStream)
    var dataArray1 = readToEnd(outputStream1)
    var dataArray2 = readToEnd(outputStream2)
    var dataArray3 = readToEnd(outputStream3)
    if (dataArray != arr) {
        return 1
    }
    if (dataArray1 != arr) {
        return 2
    }
    if (dataArray2 != arr1) {
        return 3
    }
    if (dataArray3 != arr1) {
        return 4
    }
    return 0
}
