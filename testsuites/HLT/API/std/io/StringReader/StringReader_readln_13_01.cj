/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ./test_readln_13_01.txt
// (not Windows) EXEC: %compiler %cmp_opt -o %output %f
// (not Windows) RUN-EXEC: %run %run_opt %output %run_args

import std.io.*
import std.fs.*
import std.collection.*

main() {
    var inputStream = File("./test_readln_13_01.txt", ReadWrite)
    var strReader = StringReader(inputStream)
    var sb: StringBuilder = StringBuilder()
    var count: Int64 = 0
    while (count < 4) {
        var ret = strReader.readln()
        sb.append(ret ?? "$")
        count++
    }
    var str1 = "AAAAAAAAAAAABBBBBBBBBBBBCCCCCCCCCCCCDDDDDDDDDDDD"
    if (sb.toString() != str1) {
        return 1
    }
    inputStream.close()
    try {
        while (true) {
            var res = strReader.readln()
            match (res) {
                case Some(a) => sb.append(a)
                case None => break
            }
        }
    } catch (e: FSException) {
        if (e.message != "The file not opened, can not to read.") {
            return 2
        }
    }
    if (sb.toString() != "AAAAAAAAAAAABBBBBBBBBBBBCCCCCCCCCCCCDDDDDDDDDDDDEEEEEEEEEEEEFFFFFFFFFFFFGGGGGGGGGGGG") {
        return 3
    }
    return 0
}
