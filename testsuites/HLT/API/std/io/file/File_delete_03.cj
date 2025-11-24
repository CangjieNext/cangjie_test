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
    var fileName = "./a/delete_no_exit_03.txt"
    var a = exists(fileName)
    try {
        var b = remove(fileName)
    } catch (e: FSException) {
        println(e.message)
        if (!e.toString().contains("Failed to remove")) {
            return 3
        }
    }
    var a1 = exists(fileName)
    if (a != false) {
        return 1
    }
    if (a1 != false) {
        return 2
    }
    return 0
}
