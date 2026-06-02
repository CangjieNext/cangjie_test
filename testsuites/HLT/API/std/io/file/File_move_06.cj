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
    var fileName1 = "./move61.txt"
    var fileName2 = "./move62.txt"
    var file1 = File(fileName1, ReadWrite)
    var file2 = File(fileName2, ReadWrite)
    var arr: Array<Byte> = Array<Byte>(10000, {i => UInt8(i % 256)})
    var arr1: Array<Byte> = Array<Byte>(5000, {i => UInt8(i % 256)})
    file1.write(arr)
    file2.write(arr1)
    file1.close()
    file2.close()
    try {
        var a = rename(fileName1, to: fileName2, overwrite: false)
    } catch (e: FSException) {
    }
    var dataArray = File.readFrom(fileName1)
    var dataArray1 = File.readFrom(fileName2)
    var b = exists(fileName1)
    var b1 = exists(fileName2)
    remove(fileName1)
    remove(fileName2)
    if (dataArray != arr) {
        return 1
    }
    if (dataArray != arr) {
        return 2
    }
    if (b != true) {
        return 4
    }
    if (b1 != true) {
        return 5
    }
    return 0
}
