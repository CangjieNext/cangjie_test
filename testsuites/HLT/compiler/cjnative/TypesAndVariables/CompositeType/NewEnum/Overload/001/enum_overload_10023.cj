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
package p

enum E {
    | f(Int64)
    | f(Int64, Int64, Int64)
}

func f(a: Int64) {}

func f(a: Int64, b: Int64) {}

main() {
    // f(1) // error
    f(1) // ok
    E.f(1) // ok
    f(1, 2) // ok, find f(a: Int64, b: Int64)
    E.f(1, 2, 3) // ok, find E.f(Int64, Int64, Int64)
    return 0
}
