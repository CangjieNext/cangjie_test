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
    if (case02(0.0, 1.0) != 0) {
        print(case02(0.0, 1.0).toString())
        return 2
    }
    return 0
}

func case02(x: Float32, y: Float32) {
    let a: Float32 = 1.0
    let b: Float32 = 0.0
    match ((Year(x), Year(y))) {
        case _ where (x < y) => 0
        case _ => 1
    }
}

enum TimeUnit {
    Year(Float32)
}

enum TimeUnit3 {
    Year(TimeUnit)
}
