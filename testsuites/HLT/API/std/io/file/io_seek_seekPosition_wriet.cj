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

main() {
    var a: ArrayList<String> = ArrayList<String>()
    var b: ArrayList<String> = ArrayList<String>(["01234567aaa", "01bbb567aaa", "01bbb567aaccc"])
    var fileName = "read_01.txt"
    var file = File(fileName, ReadWrite)
    @Assert(exists(fileName), true)
    file.write("0123456789".toArray())
    file.seek(End(-2))
    file.write("aaa".toArray())
    file.seek(Begin(0))
    a.add(String.fromUtf8(readToEnd(file)))
    file.seek(Begin(2))
    file.write("bbb".toArray())
    file.seek(Begin(0))
    a.add(String.fromUtf8(readToEnd(file)))
    file.seek(Current(-1))
    file.write("ccc".toArray())
    file.seek(Begin(0))
    a.add(String.fromUtf8(readToEnd(file)))
    file.close()
    remove(fileName)
    if (a != b) {
        return 1
    }
    return 0
}
