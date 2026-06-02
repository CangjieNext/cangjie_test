/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1:%compiler %cmp_opt %f -o %output 2>&1 | compare %f

func foo(x: Int64, y: Int32): Int64 {
    return x + Int64(y)
}

func foo(x: Int64): Int64 {
    return 0
}

main(): Int64 {
    foo()
    return 0
}
// ASSERT: scan sema_wrong_number_of_arguments
