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
    print(case01(1.0).toString())
    case02(1.0)
    return 0
}

func case01(x: Float32) {
    let a: Float32 = 1.0
    let b: Float32 = 0.0
    var result: Int64 = match (TimeUnit.Year(x)) {
        case _ where (false) => 1
    }
    return result
}

func case02(x: Float32) {
    let a: Float32 = 1.0
    let b: Float32 = 0.0
    var result: Int64 = match (TimeUnit.Year(x)) {
        case _ where (x != 1.0) => 1
    }
    return result
}

enum TimeUnit {
    Year(Float32)
}
// ASSERT: scan sema_nonexhuastive_patterns
