/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan Failed to read data!

/*
 * Test the funcs for failing to read InputStream.
 * Test API: public func read(buffer: Array<Byte>): Int64
 */

internal import std.io.*

public class TestInputStream <: InputStream {
    public func read(buffer: Array<Byte>): Int64 {
        return -1
    }
}

main(): Int64 {
    try {
        var a = TestInputStream()
        var b = ChainedInputStream(Array<InputStream>(2, repeat: a))
        var arr = Array<Byte>(6, repeat: 0)
        var c = b.read(arr)
    } catch (e: IOException) {
        println(e.message)
    }
    return 0
}
