/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: b
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.io.*
import std.fs.*

main(): Int64 {
    var fs = File("./b/b_file_write.txt", ReadWrite)
    var b4 = Array<UInt8>()
    try {
        fs.write(b4.slice(0, 1))
        ()
    } catch (e: IndexOutOfBoundsException) {
        if (e.toString() != "IndexOutOfBoundsException: The size of Array is 0, start is 0, length is 1.") {
            return 1
        }
    }
    return 0
}
