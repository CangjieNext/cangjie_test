/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum E {
    e(Int64) | e(Int64, Int64) | e(Int64, Int64, Int64)
}

main(): Int64 {
    var a: E = e(1)
    match (a) {
        case e(v1) | e(v1, v2) | e(v1, v2, v3) => v1
        case _ => 0
    }
}
// ASSERT: scan sema_var_in_or_pattern
// ASSERT: scan sema_undeclared_identifier
