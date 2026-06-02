/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1:%compiler %cmp_opt %f -o %output 2>&1 | compare %f

func foo(x: Int64): Int64 {
    var i = x
    i = a
    var b = i + 1
    return b
}

main(): Int64 {
    var res = foo(1) - 1
    return 0
}
// ASSERT: scan sema_undeclared_identifier
