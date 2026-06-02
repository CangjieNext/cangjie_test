/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f -o %output 2>&1 | compare %f

enum TimeUnit {
    Day
    | Hour
    | YearMonth
}

func run(): Int64 {
    var time = TimeUnit.YearMonth()
}
// ASSERT: scan sema_mismatched_types
// ASSERT: scan sema_no_match_operator_function_call
