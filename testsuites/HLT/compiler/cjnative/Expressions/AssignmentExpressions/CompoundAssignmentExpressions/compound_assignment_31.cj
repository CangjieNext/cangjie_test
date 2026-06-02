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
    var a = true
    var b = false
}

func f(a: A): A {
    a
}

main(): Int64 {
    var a = Some(A())
    f(a ?? A()).b &&= (a ?? A() |> f).a
    if ((a ?? A()).b) {
        return 1
    }
    f(a ?? A()).a ||= (a ?? A() |> f).b
    if (!(a ?? A()).a) {
        return 2
    }
    f(a ?? A()).a &&= (a ?? A() |> f).b
    if ((a ?? A()).a) {
        return 3
    }
    f(a ?? A()).b ||= !(a ?? A() |> f).a
    if (!(a ?? A()).b) {
        return 4
    }
    return 0
}
