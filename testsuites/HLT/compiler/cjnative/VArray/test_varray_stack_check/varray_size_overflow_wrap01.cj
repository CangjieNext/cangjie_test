/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan The allocation type size exceeds the maximum representable size

main(): Int64 {
    var varr: VArray<Int64, $2305843009213693963> = VArray<Int64, $2305843009213693963> {i => i + 1}
    println(varr.size)
    for (i in 0..varr.size) {
        println(varr[i])
    }
    return 0
}
