/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// * 后数值溢出
main(): Int64 {
    var s1 = "仓颉" * -9223372036854775809
    var s2 = "仓颉" * 9223372036854775808
    return 0
}
// ASSERT: scan sema_exceed_num_value_range
