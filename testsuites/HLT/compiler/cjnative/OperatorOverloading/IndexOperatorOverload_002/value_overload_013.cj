/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_args

class A {
    var a: Int64 = 0

    init(a: Int64) {
        this.a = a
    }

    protected operator func [](arg1: Int64): A {
        this.a = arg1
        return this
    }

    protected operator func +(arg1: A): A {
        return A(a + arg1.a)
    }
}

main(): Int64 {
    if ((A(1)[2] + A(1)[2]).a == 4) {
        return 0
    } else {
        return 1
    }
}
