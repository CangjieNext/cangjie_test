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
import std.fs.*

main() {
    var outputStream = ByteBuffer()
    var fileName = "copyTo_02.txt"
    var arr: Array<Byte> = Array<Byte>(10000, {i => UInt8(i % 256)})
    var arr1: Array<Byte> = Array<Byte>()
    var file = File(fileName, ReadWrite)
    file.write(arr)
    file.seek(End(0))
    copy(file, to: outputStream)
    var dataArray = readToEnd(outputStream)
    file.close()
    remove(fileName)
    if (dataArray != arr1) {
        return 1
    }
    return 0
}
