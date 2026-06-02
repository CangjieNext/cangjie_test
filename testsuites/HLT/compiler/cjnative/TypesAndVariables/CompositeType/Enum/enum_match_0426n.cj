/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt  %f -o %output  2>&1 | compare %f

enum TimeUnit {
    Hour
    | Day(Int32, Int32)
}

func run(): Int64 {
    var time = TimeUnit.Day(2020, 2022)
    var res: Int32 = match (time) {
        case Hour => 2021
        case Day(x, y, z) => x + y + z
    }

    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_enum_pattern_param_size_error
// ASSERT: scan sema_undeclared_identifier
