/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: p1 p2
// EXEC: %compiler %cmp_opt %compile_lib_opt p1/a.cj -o p1.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt p2/a.cj -o p2.%middle
// EXEC: %compiler %cmp_opt %f p1.%middle p2.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import p1.test as f
import p2.test as f

func f(a: Int64, b: Int64) {
    return a - b
}

main(): Int64 {
    return f(1, 1)
}
