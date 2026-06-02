/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-0: %compiler %cmp_opt -o %n.%suffix %f
// EXEC-PIPE-0: %run %run_opt %n.%suffix %run_args | compare %f
// ASSERT: scan 32
// ASSERT: scan OverflowException: The maximum value for capacity expansion cannot exceed the maximum value of Int64.

internal import std.io.ByteBuffer
internal import std.math.*

main() {
    try {
        var bas = ByteBuffer()
        println(bas.capacity)
        bas.reserve(Int64.Max)
        println(bas.capacity)
    } catch (e: Exception) {
        println(e.toString())
        return 0
    }
    return 1
}
