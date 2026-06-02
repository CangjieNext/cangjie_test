/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class C1 {}

open class C2 <: C1 {}

class C3 <: C2 {}

func f(a: C1, b: C2, c: C1): Int64 {
    return 1
}

func f(a: C3, b: C3, c: C2): Int64 {
    return 2
}

func f(a: C3, b: C2, c: C1): Int64 {
    return 3
}

main() {
    var x = f(C3(), C3(), C3()) // func f(a: C3, b: C3, c: C2) {...}
    if (x == 2) {
        return 0
    }
    return 1
}
