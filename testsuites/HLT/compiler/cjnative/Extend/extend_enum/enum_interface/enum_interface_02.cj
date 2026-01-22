/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan I.foo

enum E<T1> <: I<T1> {
    | EE
}

interface I<T2> {
    func foo(): String {
        "I.foo"
    }
}

main(): Unit {
    E<Int64>.EE.foo() |> println
}
