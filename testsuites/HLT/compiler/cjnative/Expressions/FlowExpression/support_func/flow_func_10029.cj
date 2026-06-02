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

class A {
    public operator func ()(input: Int64): Int64 {
        input
    }
}

main(): Int64 {
    var a = A()
    1 |> a
    a ~> a
    1 |> (a ~> a)

    var f = a ~> a
    1 |> f

    return (1 |> a) - 1
}
