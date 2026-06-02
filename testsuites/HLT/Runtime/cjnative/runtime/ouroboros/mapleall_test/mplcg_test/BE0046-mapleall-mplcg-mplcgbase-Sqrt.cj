/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 1.1090540.058310111.108071

import std.math.*

func test(i: Float64): Unit {
    print(sqrt(i).toString())
}

main(): Int64 {
    test(1.23)
    test(0.0034)
    test(12345.0034)
    return 0
}
