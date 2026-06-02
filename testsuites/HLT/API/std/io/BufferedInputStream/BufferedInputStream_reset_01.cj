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
    var arr = Array<Byte>(10000, {i => UInt8(i % 256)})
    var inputStream = ByteBuffer()
    var inputStream1 = ByteBuffer()
    inputStream.write(arr)
    var bufferedInputStream = BufferedInputStream(inputStream)
    bufferedInputStream.reset(inputStream1)
    var tempBuf = Array<Byte>(1024, repeat: 0)
    var tempBuf1 = Array<Byte>(1024, repeat: 0)
    var readNums = bufferedInputStream.read(tempBuf)
    if (tempBuf != tempBuf1) {
        return 1
    }
    if (readNums != 0) {
        return 2
    }
    return 0
}
