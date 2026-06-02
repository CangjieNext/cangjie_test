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
    strWriter.writeln(Int64.Max)
    strWriter.writeln(Int64(-1))
    strWriter.writeln(Int64(0))
    strWriter.writeln(Int64(1))
    strWriter.writeln(Int64.Min)
    strWriter.flush()
    var readArr: Array<Byte> = readToEnd(outputStream)
    if (String.fromUtf8(readArr) != "9223372036854775807\n-1\n0\n1\n-9223372036854775808\n") {
        return 1
    }
    return 0
}
