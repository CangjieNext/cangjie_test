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
    var outputStream = ByteBuffer()
    var strWriter = StringWriter(outputStream)
    var m: HashMap<String, Int64> = HashMap<String, Int64>()
    var arr: Array<(String, Int64)> = [("d", 11), ("e", 12)]
    m.add(all: arr)
    strWriter.write(m)
    strWriter.flush()
    var readArr: Array<Byte> = readToEnd(outputStream)
    if (String.fromUtf8(readArr) != "[(d, 11), (e, 12)]") {
        return 1
    }
    return 0
}
