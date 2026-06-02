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
    var fileName = "openInReadOnly_01.txt"
    var arr: Array<Byte> = Array<Byte>(10000, {i => UInt8(i % 256)})
    var file = File(fileName, ReadWrite)
    file.write(arr)
    file.close()
    var file1 = File(fileName, Read)
    var dataArray = readToEnd(file1)
    var a = file1.canWrite()
    file1.close()
    remove(fileName)
    if (dataArray != arr) {
        return 1
    }
    if (a != false) {
        return 2
    }
    return 0
}
