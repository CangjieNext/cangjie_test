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

struct A {
    public A(let a: Int64) {}
    public operator func |(inputB: A): A {
        var output = A(this.a | inputB.a)
        return output
    }
}

main(): Int64 {
    var a = A(1)
    var b = A(-1)
    a |= b

    return (a.a + 1)
}
