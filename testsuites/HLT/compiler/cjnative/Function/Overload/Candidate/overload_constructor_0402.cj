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
    var c = match (TimeUnit.goo(1)) {
        case foo => 1
        case _ => 0
    }
    return 0
}

enum TimeUnit {
    foo | foo(Int32) | goo
}
// ASSERT: scan sema_no_match_operator_function_call
