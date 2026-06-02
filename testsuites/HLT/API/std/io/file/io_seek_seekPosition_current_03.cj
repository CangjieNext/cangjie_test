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
import std.collection.*
import std.fs.*

@When[os == "Linux"]
let b: ArrayList<Int64> = ArrayList<Int64>([1, 100, -1])
@When[os != "Linux"]
let b: ArrayList<Int64> = ArrayList<Int64>([1, 100, 9223372036854775806])

main() {
    var a: ArrayList<Int64> = ArrayList<Int64>()

    var arr: Array<Byte> = Array<Byte>(100, {i => UInt8(i % 256)})
    var fileName = "current_03.txt"
    var file = File(fileName, ReadWrite)
    @Assert(exists(fileName), true)
    a.add(file.seek(Current(1)))
    file.write(arr)
    a.add(file.seek(Current(-1)))
    try {
        a.add(file.seek(Current(9223372036854775706)))
    } catch (e: FSException) {
        a.add(-1)
    }
    file.close()
    remove(fileName)
    println(a)
    println(b)
    if (a != b) {
        return 1
    }
    return 0
}
