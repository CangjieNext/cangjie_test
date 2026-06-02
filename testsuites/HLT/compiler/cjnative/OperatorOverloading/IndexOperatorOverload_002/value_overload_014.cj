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

var x = 0

class A {
    var a: Int64 = 0
    protected operator func [](arg1: Int64): A {
        this.a = arg1
        return this
    }

    protected operator func [](arg1: Int64, value!: A): Unit {
        this.a = arg1 * 2
        x = this.a
    }
}

main(): Int64 {
    if (A()[2].a == 2) {
        A()[A()[A()[A()[A()[A()[A()[A()[A()[A()[2].a].a].a].a].a].a].a].a].a] = A()[2]
        if (x == 4) {
            return 0
        }
    }
    return 1
}
