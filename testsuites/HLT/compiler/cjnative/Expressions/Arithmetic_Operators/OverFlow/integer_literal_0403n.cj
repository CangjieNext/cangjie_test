/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1|compare %f

main(): Int64 {
    var lit02 = -9223372036854775808
    var lit03: Int32 = 4
    var res = lit02 == lit03
    return 0
}
// ASSERT: scan sema_invalid_binary_expr
