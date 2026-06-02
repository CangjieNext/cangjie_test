/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args

internal import std.sync.*

main(): Int64 {
    try {
        throw IllegalSynchronizationStateException()
    } catch (e: IllegalSynchronizationStateException) {
        println(e.message)
        println(e.printStackTrace())
    }
    return 0
}
