/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan The allocation type size exceeds the maximum representable size

main(): Int64 {
    var varr: VArray<Int64, $9223372036854775807> = VArray<Int64, $9223372036854775807> {i => i + 1}
    for (i in 0..10) {
        println(varr[i])
    }
    if (varr.size == 9223372036854775807) {
        return varr[0] - 1
    }
    return 1
}
