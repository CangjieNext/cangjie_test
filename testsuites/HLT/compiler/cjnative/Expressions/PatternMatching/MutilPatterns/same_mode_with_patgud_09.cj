/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_args

enum TimeUnit {
    | Year7(Float32)
    | Month3(Float32, Float32)
}

let oneYear = TimeUnit.Year7(1.0)
var a: Int64 = 10

main(): Int64 {
    if (Int64(match (oneYear) {
        case TimeUnit.Year7(_) | Month3(1.0, 2.0) where (a < 1) => 10.0
        case TimeUnit.Year7(_) | Month3(1.0, 2.0) where (a > 1) => 1.0
        case _ => 0.0
    }) == 1) {
        return 0
    } else {
        return 1
    }
}
