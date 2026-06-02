/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    var i: Int32 = 91
    var result = match (i) {
        case good => good = 60
    }
    if (result == 60) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_cannot_assign_to_immutable
// ASSERT: scan sema_invalid_binary_expr
