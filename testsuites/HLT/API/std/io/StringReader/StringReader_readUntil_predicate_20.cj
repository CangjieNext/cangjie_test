/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args

import std.io.*
import std.collection.*

var f: (Rune) -> Bool = {
    c: Rune => return if (c == r'E' || c == r'e') {
        true
    } else {
        false
    }
}

main() {
    var str = """
0123456789
abcdefg
ABCDEFG"""
    var str1 = """
0123456789
abcde"""
    var str2 = """
fg
ABCDE"""
    var bas: ByteBuffer = ByteBuffer()
    bas.write(str.toArray())
    var strReader = StringReader(bas)
    var res: Option<String> = strReader.readUntil(f)
    if ((res ?? "@") != str1) {
        return 1
    }
    var res1: Option<String> = strReader.readUntil(f)
    if ((res1 ?? "@") != str2) {
        return 2
    }
    return 0
}
