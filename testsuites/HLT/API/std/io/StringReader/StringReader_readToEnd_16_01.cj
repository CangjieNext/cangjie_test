/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ./test_readToEnd_16_01.txt
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args

import std.io.*
import std.fs.*
import std.collection.*
import std.regex.*

main() {
    var inputStream = File("./test_readToEnd_16_01.txt", ReadWrite)
    var strReader = StringReader(inputStream)
    var sb: StringBuilder = StringBuilder()
    inputStream.close()
    try {
        var ret = strReader.readToEnd()
        sb.append(ret)
    } catch (e: FSException) {
        if (!Regex("^FSException: The file `.+` not opened, can not to read.$").matches(e.toString())) {
            return 1
        }
    }
    if (sb.toString() != "") {
        return 2
    }
    return 0
}
