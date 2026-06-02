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
    var str = "abcdefgh"
    var byteArray = str.toArray()
    byteArray[4] = 0b11111111 // Out of unicode point range
    var bas: ByteBuffer = ByteBuffer()
    bas.write(byteArray)
    var strReader = StringReader(bas)
    var sb: StringBuilder = StringBuilder()
    try {
        while (true) {
            var ret = strReader.read()
            match (ret) {
                case Some(c) => sb.append(c)
                case None => break
            }
        }
    } catch (e: ContentFormatException) {
        if (e.message != "Invalid unicode scalar value.") {
            return 1
        }
    }
    if (sb.toString() != "abcd") {
        return 2
    }
    return 0
}
