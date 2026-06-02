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
    if (goo(foo2(1) {x: Int64 => x + 1}) != 2) {
        return 1
    }
    if (goo(foo1 {x: Int64 => x + 1}) != 3) {
        return 1
    }
    return 0
}

func goo(x: Int64) {
    return x
}

func foo2(a: Int64, fn: (Int64) -> Int64) {
    return fn(a)
}

func foo1(fn: (Int64) -> Int64) {
    return fn(1) + 1
}
