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
    var str1 = """
0123456789
abcde"""
    var str2 = """
fg
ABCDE"""
    var str3 = """
FG"""
    var bas: ByteBuffer = ByteBuffer()
    bas.write(str.toArray())
    var strReader = StringReader(bas)
    var res: Option<String> = strReader.readUntil(r'e')
    if ((res ?? "@") != str1) {
        return 1
    }
    var res1: Option<String> = strReader.readUntil(r'E')
    if ((res1 ?? "@") != str2) {
        return 2
    }
    var res2: Option<String> = strReader.readUntil(r'E')
    if ((res2 ?? "@") != str3) {
        return 3
    }
    var res3: Option<String> = strReader.readUntil(r'E')
    if ((res3 ?? "@") != "@") {
        return 4
    }
    return 0
}
