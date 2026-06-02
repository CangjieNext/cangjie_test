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
import std.fs.*

main() {
    var arr = Array<Byte>(8192, {i => UInt8(i % 256)})
    var outputStream = File("init_02.txt", ReadWrite)
    var bufferedOutputStream = BufferedOutputStream(outputStream)
    bufferedOutputStream.write(arr)
    bufferedOutputStream.flush()
    outputStream.seek(Begin(0))
    var dataArray = readToEnd(outputStream)
    outputStream.close()
    remove("init_02.txt")
    if (dataArray != arr) {
        return 1
    }
    return 0
}
