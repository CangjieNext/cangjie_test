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
    var outputStream = ByteBuffer()
    var bufferedOutputStream1 = BufferedOutputStream(outputStream, 6000)
    var arr: Array<Byte> = Array<Byte>(1000, {i => UInt8(i % 256)})
    var multiOutputStream = MultiOutputStream([bufferedOutputStream1])
    multiOutputStream.write(arr)
    var dataArray = readToEnd(outputStream)
    multiOutputStream.flush()
    var dataArray1 = readToEnd(outputStream)
    if (dataArray != Array<Byte>()) {
        return 1
    }
    if (dataArray1 != arr) {
        return 2
    }
    return 0
}
