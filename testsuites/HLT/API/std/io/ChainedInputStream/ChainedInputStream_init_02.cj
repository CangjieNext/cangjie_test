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
    var tempBuf = Array<Byte>(1024, repeat: 5)
    var tempBuf1 = Array<Byte>(1024, repeat: 0)
    inputStream.write(tempBuf)
    var chainedInputStream = ChainedInputStream([inputStream])
    var readNums = chainedInputStream.read(tempBuf1)
    if (tempBuf1 != tempBuf) {
        return 1
    }
    return 0
}
