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
    var data = Array<Byte>(1, repeat: 1)
    var data1 = Array<Byte>(10, repeat: 1)
    a.write(data)
    a1.write(data1)
    var b: ByteBuffer = a.clone()
    var b1: ByteBuffer = a1.clone()
    if (readToEnd(b) != data) {
        return 1
    }
    if (readToEnd(b1) != data1) {
        return 2
    }
    return 0
}
