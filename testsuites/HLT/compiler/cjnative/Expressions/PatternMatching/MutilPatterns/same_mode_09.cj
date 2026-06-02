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
    | Year4(Float32)
    | Month(Float32, Float32)
}

let oneYear = TimeUnit.Year4(1.0)
var tu: (Float32, Float32) = (match (oneYear) {
        case TimeUnit.Year4(_) | Month(1.0, 2.0) | TimeUnit.Year4(_: Float32) => 1.0
        case _ => 0.0
    }, 2.0)

main(): Int64 {
    if (tu[0] == 1.0) {
        return 0
    } else {
        return 1
    }
}
