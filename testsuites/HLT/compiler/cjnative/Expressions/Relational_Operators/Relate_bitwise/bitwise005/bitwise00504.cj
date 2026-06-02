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
    var b: Int64 = 2 ** 31 - 1
    var c: Int8 = 0
    var d: Int8 = 0
    var e: Int64 = 2147483637
    d = a | b
    if (d != b) {
        return 1
    }
    d = c | b
    if (d != b) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_invalid_binary_expr
