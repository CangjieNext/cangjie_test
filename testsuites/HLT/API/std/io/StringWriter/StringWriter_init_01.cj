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
import std.fs.*

main() {
    var outputStream = File("init_01.txt", ReadWrite)
    var strWriter = StringWriter(outputStream)
    var str = "一二三四五六七八九十...CangJie,,123"
    strWriter.write(str)
    strWriter.flush()
    outputStream.seek(Begin(0))
    var readArr: Array<Byte> = readToEnd(outputStream)
    outputStream.close()
    remove("init_01.txt")
    if (String.fromUtf8(readArr) != str) {
        return 1
    }
    return 0
}
