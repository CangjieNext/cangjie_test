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
    var buffer = Array<Byte>(10, repeat: 1)
    var readNum = a.read(buffer)
    var readNum1 = a1.read(buffer)
    if (readNum != 0) {
        return 1
    }
    if (readNum1 != 0) {
        return 2
    }
    return 0
}
