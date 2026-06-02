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
    var arr: Array<Byte> = Array<Byte>(1000, {i => UInt8(i % 256)})
    var fileName = "init_06.txt"
    var outputStream = ByteBuffer()
    var outputStream1 = File(fileName, Write)
    var outputStream2 = ByteBuffer()
    let streams: Array<OutputStream> = [outputStream, outputStream1, outputStream2]
    var multiOutputStream = MultiOutputStream(streams)
    multiOutputStream.write(arr)
    multiOutputStream.flush()
    outputStream1.close()
    var dataArray = readToEnd(outputStream)
    var dataArray1 = File.readFrom(fileName)
    var dataArray2 = readToEnd(outputStream2)
    remove("init_06.txt")
    if (dataArray != arr) {
        return 1
    }
    if (dataArray1 != arr) {
        return 2
    }
    if (dataArray2 != arr) {
        return 3
    }
    return 0
}
