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
    var fileName = "readToEnd_02.txt"
    var arr: Array<Byte> = Array<Byte>(10000, {i => UInt8(i % 256)})
    var arr1: Array<Byte> = arr.slice(5000, 5000).toArray()
    var file = File(fileName, ReadWrite)
    @Assert(exists(fileName), true)
    file.write(arr)
    file.seek(Begin(5000))
    var dataArray = readToEnd(file)
    file.close()
    remove(fileName)
    if (dataArray != arr1) {
        return 1
    }
    return 0
}
