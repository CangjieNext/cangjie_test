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
    var arr = Array<Byte>()
    var outputStream = ByteBuffer()
    var outputStream1 = ByteBuffer()
    var bufferedOutputStream = BufferedOutputStream(outputStream)
    var bufferedOutputStream1 = BufferedOutputStream(outputStream1, 1)
    bufferedOutputStream.write(arr)
    bufferedOutputStream1.write(arr)
    bufferedOutputStream.flush()
    bufferedOutputStream1.flush()
    var dataArray = readToEnd(outputStream)
    var dataArray1 = readToEnd(outputStream1)
    if (dataArray != arr) {
        return 1
    }
    if (dataArray1 != arr) {
        return 2
    }
    return 0
}
