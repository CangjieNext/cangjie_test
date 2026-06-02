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
    a.reserve(33)
    a1.reserve(11)
    if (a.capacity != 65) {
        return 1
    }
    if (a1.capacity != 21) {
        return 2
    }
    return 0
}
