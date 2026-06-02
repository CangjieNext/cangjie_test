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
    var data = Array<Byte>(7, repeat: 1)
    var data1 = Array<Byte>(10, repeat: 1)
    var data2 = Array<Byte>(3, repeat: 1)
    var data3 = Array<Byte>(6, repeat: 1)
    var buffer = Array<Byte>(4, repeat: 1)
    a.write(data)
    a1.write(data1)
    a.read(buffer)
    a1.read(buffer)
    if (readToEnd(a) != data2) {
        return 1
    }

    if (readToEnd(a1) != data3) {
        return 2
    }
    return 0
}
