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
    var n: Int64 = 0
    try {
        var chainedInputStream = ChainedInputStream(Array<InputStream>())
    } catch (e: IllegalArgumentException) {
        n++
    }
    if (n != 1) {
        return 1
    }
    return 0
}
