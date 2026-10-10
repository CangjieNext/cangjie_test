/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan The value type size exceeds the maximum representable size

var hugeGlobalU32: VArray<UInt32, $4611686018427387904> = VArray<UInt32, $4611686018427387904> {i => UInt32(i)}

main(): Int64 {
    println(hugeGlobalU32.size)
    for (i in 0..hugeGlobalU32.size) {
        println(hugeGlobalU32[i])
    }
    return 0
}
