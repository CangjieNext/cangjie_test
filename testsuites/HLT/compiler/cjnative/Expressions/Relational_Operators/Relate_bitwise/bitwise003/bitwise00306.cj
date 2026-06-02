/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

main(): Int64 {
    var a: Int16 = 10
    var b: Int64 = 9223372036854775808
    var c: Int8 = 0
    var d: Int8 = 0
    d = a & b
    if (d != c) {
        return 1
    }
    d = b & c
    if (d != c) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_exceed_num_value_range
// ASSERT: scan sema_invalid_binary_expr
