/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// 自增减不支持非数值类型
main(): Int64 {
    var a1 = 'a'
    a1++
    var a2 = "a"
    a2++
    var a3 = true
    a3++
    var a4 = ()
    a4++
    //var a5 =  // TBD:bottom
    var a6: Array<Int32> = [1]
    a6++
    var a9 = (3.14, "PIE")
    a9[0] += 1
    var a: Int32 = 1;
    var b: Int32 = 1
    var a10 = (a + b, a - b)
    a10[0] += 1
    var a11 = ((2, 3), 4)
    a11[0] += 1
    var a12 = 0..10 : 1
    a12++

    return 0;
}
// ASSERT: scan sema_mismatched_types
// ASSERT: scan sema_unqualified_left_value_assigned
