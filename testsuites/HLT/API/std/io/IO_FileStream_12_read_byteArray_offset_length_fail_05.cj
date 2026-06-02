/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE:
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.io.*
import std.fs.*
import std.regex.*

main(): Int64 {
    var fs2 = File("b_file_bcz_01.txt", Write)
    var b = Array<UInt8>(10, {i => 1})
    try {
        var readnum10 = fs2.read(b.slice(2, 3))
        ()
    } catch (e: FSException) {
        if (!Regex("^FSException: The file `.+` does not have the read permission.$").matches(e.toString())) {
            return 1
        }
    }
    return 0
}
