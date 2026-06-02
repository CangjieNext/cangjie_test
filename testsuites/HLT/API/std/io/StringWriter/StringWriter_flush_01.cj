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

main() {
    var outputStream = ByteBuffer()
    var strWriter = StringWriter(outputStream)
    var str = "!!@@!#$#$%^八九十...CangJie,,123213423"
    strWriter.write(str)
    var readArr0: Array<Byte> = readToEnd(outputStream)
    if (String.fromUtf8(readArr0) != "") {
        return 1
    }
    strWriter.flush()
    var readArr: Array<Byte> = readToEnd(outputStream)
    if (String.fromUtf8(readArr) != str) {
        return 2
    }
    return 0
}
