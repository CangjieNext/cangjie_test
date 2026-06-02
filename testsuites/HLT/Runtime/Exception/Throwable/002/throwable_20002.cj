/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not O2) EXEC: %compiler %cmp_opt %f -o %output
// (not O2) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// (not O2) ASSERT: scan catch!
// (not O2) ASSERT: scan IndexOutOfBoundsException
// (not O2) ASSERT: scan throwable_20002.cj:21
import std.collection.*

main() {
    var n = ArrayList<Int64>([1, 2, 3])
    var res = 3
    try {
        n[4] = 4
        ()
    } catch (e: Exception) {
        print("catch!");
        e.printStackTrace()
    } finally {
        res = 0
    }
    return res
}
