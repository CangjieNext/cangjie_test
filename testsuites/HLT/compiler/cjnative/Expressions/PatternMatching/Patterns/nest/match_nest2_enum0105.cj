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
    Year(Int64)
}

var r1 = match (Year(1)) {
    case Year(b: Int64) => 0
    case _ => 1
}

main(): Int64 {
    if (r1 != 0) {
        return 1
    }

    return 0
}
