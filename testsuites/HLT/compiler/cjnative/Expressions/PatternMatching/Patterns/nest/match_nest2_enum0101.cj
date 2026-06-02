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

enum TimeUnit {
    Year(Float32)
    | Month((Float32, Float32))
}

var r1 = match (Month((1.0, 2.0))) {
    case Month((b, c)) => c - b - 1.0
    case _ => Float32(1)
}

main(): Int64 {
    if (r1 != 0.0) {
        return 1
    }
    return 0
}
