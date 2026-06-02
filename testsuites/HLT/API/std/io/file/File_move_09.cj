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
import std.fs.*

main() {
    var fileName1 = "./b/move91.txt"
    var fileName2 = "./move92.txt"
    try {
        var a = rename(fileName1, to: fileName2, overwrite: false)
    } catch (e: FSException) {
    }
    var b = exists(fileName1)
    var b1 = exists(fileName2)
    if (b != false) {
        return 3
    }
    if (b1 != false) {
        return 4
    }
    return 0
}
