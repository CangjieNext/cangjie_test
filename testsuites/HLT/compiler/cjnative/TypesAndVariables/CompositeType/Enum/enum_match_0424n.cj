/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

enum TimeUnit {
    Year(Int32) | Month(Int32)
}

main(): Int64 {
    var time = TimeUnit.Year(8)
    var res: Int32 = match (time) {
        case Year(x) => 2020
    }

    if (res == 2020) {
        return 0
    } else {
        return 1
    }
}
// ASSERT: scan sema_nonexhuastive_patterns
