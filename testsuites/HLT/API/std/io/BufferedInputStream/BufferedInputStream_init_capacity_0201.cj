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
    var arr = Array<Byte>(10000, {i => UInt8(i % 256)})
    var inputStream = ByteBuffer()
    inputStream.write(arr)
    var tempBuf = Array<Byte>(1024, repeat: 0)
    var outputStream1 = ByteBuffer()
    var bufferedInputStream = BufferedInputStream(inputStream, 20000)
    while (true) {
        var readNums = bufferedInputStream.read(tempBuf)
        if (readNums == 0) {
            break
        }
        outputStream1.write(tempBuf.slice(0, readNums).toArray())
    }

    if (arr != readToEnd(outputStream1)) {
        return 1
    }
    return 0
}
