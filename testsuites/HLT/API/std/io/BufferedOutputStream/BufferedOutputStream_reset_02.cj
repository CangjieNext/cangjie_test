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
    var arr1 = Array<Byte>()
    var outputStream = ByteBuffer()
    var outputStream1 = ByteBuffer()
    outputStream1.write(arr)
    var bufferedOutputStream = BufferedOutputStream(outputStream)
    bufferedOutputStream.reset(outputStream1)
    bufferedOutputStream.write(arr)
    bufferedOutputStream.flush()
    var dataArray = readToEnd(outputStream)
    var dataArray1 = readToEnd(outputStream1)
    if (dataArray1.slice(0, 2000).toArray() != arr) {
        return 1
    }
    if (dataArray1.slice(2000, 2000).toArray() != arr) {
        return 2
    }
    if (dataArray != arr1) {
        return 2
    }
    return 0
}
