/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_args | compare %f
// ASSERT: scan ok

import std.io.*

let buffer = Array<Byte>(32, repeat: 0)

main() {
    var arr = Array<Byte>(8192, {i => UInt8(i % 256)})
    var inputStream1 = ByteBuffer()
    inputStream1.write(arr)

    var tempBuf = Array<Byte>(1024, repeat: 0)

    var outputStream1 = ByteBuffer()
    var bufferedInputStream = BufferedInputStream(inputStream1, buffer)
    while (true) {
        var readNums = bufferedInputStream.read(tempBuf)
        if (readNums == 0) {
            break
        }
        outputStream1.write(tempBuf.slice(0, readNums).toArray())
    }

    var inputStream2 = outputStream1
    bufferedInputStream.reset(inputStream2)
    var outputStream2 = ByteBuffer()
    while (true) {
        var readNums = bufferedInputStream.read(tempBuf)
        if (readNums == 0) {
            break
        }
        outputStream2.write(tempBuf.slice(0, readNums).toArray())
    }

    if (arr != readToEnd(outputStream2)) {
        return 1
    }
    println("ok")
    return 0
}
