/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan IndexOutOfBoundsException
// (not O2) ASSERT: scan throwable_20010.cj:21
import std.collection.*

main() {
    var a = ArrayList<Int64>([1, 2, 3])
    var res = 3

    try {
        a[res - 10]
    } catch (e: Exception) {
        e.printStackTrace()
        return 0
    } finally {
        res = 0
        return res
    }
    res = 4
    return res
}
