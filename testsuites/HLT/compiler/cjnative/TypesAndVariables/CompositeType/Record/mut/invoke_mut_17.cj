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
    A(var a!: Int64 = 9) {}
}

struct R {
    public var a = A()
    public mut func c(b: A): A {
        a = b
        return a
    }
}

main() {
    var b = R()
    b.c(A(a: 20))
    return b.a.a - 20
}
