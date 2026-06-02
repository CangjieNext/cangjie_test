/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-0: %compiler %cmp_opt -o %n.%suffix %f
// EXEC-PIPE-0: %run %run_opt %n.%suffix %run_args | compare %f
// ASSERT: scan IllegalArgumentException: The capacity must be greater than or equal to 0: -1.

internal import std.io.ByteBuffer

main() {
    try {
        var bas = ByteBuffer(-1)
        println(bas.capacity)
    } catch (e: Exception) {
        println(e.toString())
        return 0
    }
    return 1
}
