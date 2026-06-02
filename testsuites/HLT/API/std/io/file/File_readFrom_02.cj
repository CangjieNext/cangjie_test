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
    var fileName = "readFrom_02.txt"
    var file = File.create(fileName)
    @Assert(exists(fileName), true)
    var arr: Array<Byte> = Array<Byte>(10000, {i => UInt8(i % 256)})
    file.write(arr)
    file.close()
    var dataArray = File.readFrom(fileName)
    remove(fileName)
    if (dataArray != arr) {
        return 1
    }
    return 0
}
