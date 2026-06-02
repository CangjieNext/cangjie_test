/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    // 无类型表达式和有类型表达式 -> 有类型表达式
    var num: Int32 = 2
    let x: Float64 = 1.0 + 3
    let y: Float32 = 1.0 + 3
    let z: Float32 = 2 + 3
    let w: Int32 = 2.0 + 3
    let u: Float32 = num + 3

    return 0
}
// ASSERT: scan sema_invalid_binary_expr
// ASSERT: scan sema_mismatched_types
