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
    var a: ByteBuffer = ByteBuffer()
    var a1: ByteBuffer = ByteBuffer(10)
    var data = Array<Byte>(3, repeat: 2)
    var data1 = Array<Byte>(12, repeat: 2)
    var buffer1 = Array<Byte>(2, repeat: 1)
    var buffer2 = Array<Byte>(11, repeat: 1)
    var buffer3: Array<Byte> = [2, 2]
    var buffer4: Array<Byte> = [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
    a.write(data)
    a1.write(data1)
    var readNum = a.read(buffer1)
    var readNum1 = a1.read(buffer2)
    if (readNum != 2) {
        return 1
    }
    if (readNum1 != 11) {
        return 2
    }
    if (buffer1 != buffer3) {
        return 3
    }
    if (buffer2 != buffer4) {
        return 4
    }
    return 0
}
