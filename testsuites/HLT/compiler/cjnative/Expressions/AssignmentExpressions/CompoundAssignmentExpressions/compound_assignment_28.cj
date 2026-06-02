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
    static var a = true
    static var b = false
}

func f(x: Bool): Bool {
    x
}

main(): Int64 {
    A.b &&= A.a |> f
    if (A.b) {
        return 1
    }
    A.a ||= A.b |> f
    if (!A.a) {
        return 2
    }
    A.a &&= A.b |> f
    if (A.a) {
        return 3
    }
    A.b ||= (!A.a) |> f
    if (!A.b) {
        return 4
    }
    return 0
}
