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
    var data = Array<Byte>()
    var writeNum = a.write(data)
    var writeNum1 = a1.write(data)
    if (readToEnd(a) != data) {
        return 1
    }
    if (readToEnd(a1) != data) {
        return 2
    }
    return 0
}
