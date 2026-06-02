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
import std.collection.*

main() {
    var str = """
0123456789
abcdefg
ABCDEFG"""
    var bas: ByteBuffer = ByteBuffer()
    bas.write(str.toArray())
    var strReader = StringReader(bas)
    var sb: StringBuilder = StringBuilder()
    while (true) {
        var ret = strReader.readln()
        match (ret) {
            case Some(s) => sb.append(s)
            case None => break
        }
    }
    if (sb.toString() != "0123456789abcdefgABCDEFG") {
        return 1
    }
    return 0
}
