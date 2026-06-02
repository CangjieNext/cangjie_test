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
    case01()
    return 0
}

func case01() {
    let intList: Array<TimeUnit> = [Year(1), Year(2)]
    var a: Float32 = 0
    let b: Float32 = 1
    for (Year(1.0) in intList) {
        a = a + b
    }
    a
}

enum TimeUnit {
    Year(Float32)
    | Month
}
// ASSERT: scan sema_cannot_convert_literal
// ASSERT: scan sema_forin_pattern_must_be_irrefutable
