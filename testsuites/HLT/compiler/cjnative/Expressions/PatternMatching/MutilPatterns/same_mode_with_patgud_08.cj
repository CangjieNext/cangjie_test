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
    | Year6(Float32)
    | Year6
}

let oneYear = TimeUnit.Year6(1.0)
var y = 1
var howManyHours: Float32 = match (match (oneYear) {
    case TimeUnit.Year6(1.0) | Year6 where (y < 0) => Float32(0.0)
    case TimeUnit.Year6(1.0) | Year6 where (y > 0) => Float32(24.0)
    case _ => Float32(0.0)
}) {
    case _: Float64 | _: TimeUnit => 1.0
    case 0.0 | 24.0 => 48.0
    case _ => 0.0
}

main(): Int64 {
    if (howManyHours == 48.0) {
        return 0
    } else {
        return 1
    }
}
