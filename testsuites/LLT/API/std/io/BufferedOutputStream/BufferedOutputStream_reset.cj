/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_args | compare %f
// ASSERT: scan ok

internal import std.io.*

main() {
    var arr = Array<Byte>(8192, {i => UInt8(i % 256)})

    var outputStream1 = ByteBuffer()
    var bufferedOutputStream = BufferedOutputStream(outputStream1)
    bufferedOutputStream.write(arr)
    bufferedOutputStream.flush()

    var outputStream2 = ByteBuffer()
    bufferedOutputStream.reset(outputStream2)
    bufferedOutputStream.write(arr)
    bufferedOutputStream.flush()

    if (readToEnd(outputStream1) != arr) {
        return 1
    }
    if (readToEnd(outputStream2) != arr) {
        return 2
    }
    println("ok")
    return 0
}
