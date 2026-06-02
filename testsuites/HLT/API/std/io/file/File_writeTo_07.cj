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
    var fileName = "writeTo_no_exit_07.txt"
    var arr: Array<Byte> = Array<Byte>(10000, {i => UInt8(i % 256)})
    File.appendTo(fileName, arr.slice(0, 4000).toArray())
    File.appendTo(fileName, arr.slice(4000, 6000).toArray())
    var readArr = File.readFrom(fileName)
    remove(fileName)
    if (readArr != arr) {
        return 1
    }
    return 0
}
