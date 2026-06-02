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
    var b = foo(1, 'a')
    return 0
}

enum TimeUnit {
    foo | foo(Int32) | foo(Int64, String) | foo(Int32, String)
}
// ASSERT: scan sema_no_match_operator_function_call
// ASSERT: scan sema_duplicated_item_in_enum
