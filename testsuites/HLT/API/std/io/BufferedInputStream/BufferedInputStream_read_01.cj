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
    var inputStream = ByteBuffer()
    var bufferedInputStream = BufferedInputStream(inputStream)
    var bufferedInputStream1 = BufferedInputStream(inputStream, 100)
    var tempBuf = Array<Byte>(1024, repeat: 0)
    var tempBuf1 = Array<Byte>(1024, repeat: 0)
    var tempBuf2 = Array<Byte>(1024, repeat: 0)
    var readNums = bufferedInputStream.read(tempBuf1)
    var readNums1 = bufferedInputStream1.read(tempBuf2)
    if (tempBuf1 != tempBuf) {
        return 1
    }
    if (readNums != 0) {
        return 2
    }
    if (tempBuf2 != tempBuf) {
        return 3
    }
    if (readNums1 != 0) {
        return 4
    }
    return 0
}
