/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: pass1pass2

internal import std.io.*

main() {
    try {
        throw IOException()
    } catch (e: IOException) {
        print("pass1")
    }
    try {
        throw IOException("pass2")
    } catch (e: IOException) {
        print(e.message)
    }
}
