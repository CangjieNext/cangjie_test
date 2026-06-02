/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

func test<T1, T2, T3, T4, T5>(a: T1, f1: (T1) -> T2, f2: (T1, T2) -> T3, f3: (T1, T2, T3) -> T4, f4: (T1, T2, T3, T4) -> T5): T5 {
    var v1 = f1(a)
    var v2 = f2(a, v1)
    var v3 = f3(a, v1, v2)
    var v4 = f4(a, v1, v2, v3)
    v4
}

main() {
    test(1, {x1 => x1}, {x1, x2 => x1 + x2}, {x1, x2, x3 => x1 + x2 + x3}, {x1, x2, x3, x4 => x1 + x2 + x3 + x4})
    return 0
}
