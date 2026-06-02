/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.io.*
import std.fs.*

main() {
    var fileName = "readToEnd_01.txt"
    var arr: Array<Byte> = Array<Byte>()
    var file = File(fileName, ReadWrite)
    @Assert(exists(fileName), true)
    file.seek(Begin(0))
    var dataArray = readToEnd(file)
    file.close()
    remove(fileName)
    if (dataArray != arr) {
        return 1
    }
    return 0
}
