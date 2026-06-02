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
    var arr: Array<Byte> = Array<Byte>(9000, {i => UInt8(i % 256)})
    var inputStream = ByteBuffer()
    inputStream.write(arr)
    var chainedInputStream = ChainedInputStream([inputStream])
    var outputStream = ByteBuffer()
    var tempBuf = Array<Byte>(7000, repeat: 0)
    var readNums = chainedInputStream.read(tempBuf)
    if (tempBuf != arr.slice(0, 7000).toArray()) {
        return 1
    }
    if (readNums != 7000) {
        return 2
    }
    return 0
}
