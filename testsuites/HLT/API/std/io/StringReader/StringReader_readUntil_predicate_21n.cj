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
    var bas: ByteBuffer = ByteBuffer()
    var byteArr: Array<Byte> = str.toArray()
    byteArr[byteArr.size / 2] = 0b10110000
    bas.write(byteArr)
    var strReader = StringReader(bas)
    try {
        var res: Option<String> = strReader.readUntil(f)
    } catch (e: ContentFormatException) {
        if (e.message != "Invalid utf8 byte sequence.") {
            return 1
        }
    }
    return 0
}
