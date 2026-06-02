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
    var bas: ByteBuffer = ByteBuffer()
    bas.write(byteArray)
    var strReader = StringReader(bas)
    var sb: StringBuilder = StringBuilder()
    while (true) {
        var ret = strReader.read()
        match (ret) {
            case Some(c) => sb.append(c)
            case None => break
        }
    }
    if (sb.toString() != "abcdefgh") {
        return 1
    }
    var res = strReader.read()
    if ((res ?? r'@') != r'@') {
        return 2
    }
    return 0
}
