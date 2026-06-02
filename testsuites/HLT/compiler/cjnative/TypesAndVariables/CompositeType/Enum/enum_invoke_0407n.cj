/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output   2>&1 | compare %f

enum TimeUnit {
    Year(Int32)
}

enum TimeUnit2 {
    Year(Int32)
}

func run(): Int64 {
    var time = Year(2020)
    var res: Int32 = match (time) {
        case Year(x) => x
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
// ASSERT: scan sema_multiple_constructor_in_enum
