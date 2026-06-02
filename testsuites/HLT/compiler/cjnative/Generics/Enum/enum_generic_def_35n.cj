/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum TimeUnit<T1, T2, T3> {
    Year(T1, T2) | Year(T2, T3)
}

func run(): Int64 {
    var year1 = TimeUnit<Int32, Int64, String>.Year(1, 2)
    var year2 = TimeUnit<Int32, Int64, String>.Year(1, "2")

    var res1: String = match (year1) {
        case Year(x, y) => x.toString() + y.toString()
        case Year(y, z) => y.toString() + z
    }
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_duplicated_item_in_enum
// ASSERT: scan sema_invalid_binary_expr
