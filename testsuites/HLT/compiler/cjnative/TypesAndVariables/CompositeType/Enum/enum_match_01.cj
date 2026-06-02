/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum TimeUnit1 {
    Hour
    | Year
}

enum TimeUnit2 {
    Month
}

func run(): Int64 {
    var time = TimeUnit2.Month
    var res: Int32 = match (time) {
        case Month(Hour) => 2020
    }
    if (res == 2020) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_enum_pattern_param_size_error
