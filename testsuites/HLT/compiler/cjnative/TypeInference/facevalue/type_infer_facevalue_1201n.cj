/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
// 两个无类型整型表达式进行类型一致性运算 -> 无类型整型

main(): Int64 {
    var i1 = 1 + 1 // 无类型整型 -> Int64
    var i2 = 3 - 1
    var i3 = 2 * 1
    var i4 = 4 / 2
    var i5 = 5 % 3

    var flag1: Int32 = 2
    var res1 = i1 == flag1
    var res2 = i2 == flag1
    var res3 = i3 == flag1
    var res4 = i4 == flag1
    var res5 = i5 == flag1

    return 0
}
// ASSERT: scan sema_invalid_binary_expr
