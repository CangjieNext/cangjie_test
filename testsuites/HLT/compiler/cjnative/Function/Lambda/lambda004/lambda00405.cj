/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func test(): Int64 {
    let test: Int64 = 1
    return 0
}

main(): Int64 {
    let lambda = {a: Int64 => test - a}
    return lambda(1)
}
// ASSERT: scan sema_invalid_binary_expr
