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
    var n: Int64 = 0
    var a: ByteBuffer = ByteBuffer()
    var a1: ByteBuffer = ByteBuffer(10)
    try {
        a.reserve(-1)
    } catch (e: IllegalArgumentException) {
        n++
    }
    try {
        a1.reserve(-1)
    } catch (e: IllegalArgumentException) {
        n++
    }
    if (n != 2) {
        return 1
    }
    return 0
}
