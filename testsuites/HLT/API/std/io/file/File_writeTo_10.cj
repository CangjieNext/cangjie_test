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
    var fileName = "writeTo_no_exit_10.txt"
    var arr: Array<Byte> = Array<Byte>(10000, {i => UInt8(i % 256)})
    try {
        File.writeTo(fileName, arr)
    } catch (e: FSException) {
        if (e.toString() != "FSException: The file does not exist or permission denied!") {
            return 1
        }
    }
    return 0
}
