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
import std.math.*

main() {
    var outputStream = ByteBuffer()
    var strWriter = StringWriter(outputStream)
    strWriter.writeln(UInt16.Max)
    strWriter.writeln(UInt16(35535))
    strWriter.writeln(UInt16.Min)
    strWriter.flush()
    var readArr: Array<Byte> = readToEnd(outputStream)
    if (String.fromUtf8(readArr) != "65535\n35535\n0\n") {
        return 1
    }
    return 0
}
