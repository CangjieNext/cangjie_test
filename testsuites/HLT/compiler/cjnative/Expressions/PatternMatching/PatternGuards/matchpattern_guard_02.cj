/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    if (case01(1.0) != 0) {
        return 1
    }
    if (case02(1.0) != 0) {
        return 1
    }
    return 0
}

func case01(x: Float32) {
    let a: Float32 = 1.0
    let b: Float32 = 0.0
    var result: Int64 = match (Year(x)) {
        case Year(x) where x != 1.0 => 1
        case Year(x) where x == 1.0 => 0
        case _ => 2
    }
    return result
}

func case02(x: Float32) {
    let a: Float32 = 1.0
    let b: Float32 = 0.0
    var result: Int64 = match (Year(x)) {
        case _ where x != 1.0 => 1
        case _ where x == 1.0 => 0
        case _ => 2
    }
    return result
}

enum TimeUnit {
    Year(Float32)
}
