/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
// 两个无类型浮点型类型的表达式 -> 无类型浮点型

main(): Int64 {
    var p1 = 1.1 + 0.9 // 无类型浮点型 -> Float64
    var p2 = 2.1 - 0.1
    var p3 = 2.0 * 1.0
    var p4 = 4.4 / 2.2
    var p5 = 5.0 % 3.0

    var flag2: Float32 = 2.0
    var res11 = p1 == flag2
    var res12 = p2 == flag2
    var res13 = p3 == flag2
    var res14 = p4 == flag2
    var res15 = p5 == flag2

    return 0
}
// ASSERT: scan sema_invalid_binary_expr
