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

main() {
    var outputStream = ByteBuffer()
    var arr: Array<Byte> = Array<Byte>(1024 * 1024, {i => UInt8(i % 256)})
    let streams: Array<OutputStream> = [outputStream]
    var multiOutputStream = MultiOutputStream(streams)
    multiOutputStream.write(arr)
    multiOutputStream.flush()
    var dataArray = readToEnd(outputStream)
    if (dataArray != arr) {
        return 1
    }
    return 0
}
