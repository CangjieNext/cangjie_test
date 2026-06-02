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
 * Test API: public func write(buffer: Array<Byte>): Unit
 */

internal import std.io.*

main() {
    try {
        var bas = ByteBuffer()
        var bufferedOutputStream = BufferedOutputStream(bas)
        var buff = Array<Byte>()
        bufferedOutputStream.write(buff)
    } catch (e: Exception) {
        return -1
    }

    return 0
}
