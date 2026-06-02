/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

type f64 = Float64

extend f64 {
    public operator func |(b: f64): Int64 {
        1
    }
}

func a(): Int64 {
    return 3.00001 | 2.1
}

main(): Int64 {
    if (a() == 1) {
        return 0
    } else {
        return 1
    }
}
