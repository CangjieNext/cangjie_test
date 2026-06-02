/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_args

/*
 * Test description:This test case is designed to test the hard-to-reach branches of the code.
 * Test API: public func read(buffer: Array<Byte>): Int64
 *           public prop length: Int64
 */

internal import std.io.*

main() {
    var bas = ByteBuffer()
    var bufferedInputStream = BufferedInputStream(bas, 1)
    var buff = Array<Byte>()
    var readLen = 0
    try {
        readLen = bufferedInputStream.read(buff)
    } catch (e: Exception) {
        if (e.message != "The buffer cannot be empty: `buffer.size() = 0`!") {
            return 1
        }
    }

    buff = [1]
    readLen = bufferedInputStream.read(buff)
    readLen = bufferedInputStream.read(buff)
    if (readLen != 0) {
        return 2
    }

    if (bufferedInputStream.length != 0) {
        return 3
    }

    return 0
}
