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
    private var value: Int64 = 0
    public mut prop i: Int64 {
        get() {
            value
        }
        set(v) {
            value = v
        }
    }
}

struct B {
    private var value: Int64 = 0
    public mut prop i: Int64 {
        get() {
            value
        }
        set(v) {
            value = v
        }
    }
}

main() {
    let a0 = A()
    a0.i++
    var b0 = B()
    b0.i++
    if (a0.i != 1 && b0.i != 1) {
        return 1
    }
    a0.i--
    b0.i--
    if (a0.i != 0 && b0.i != 0) {
        return 2
    }
    0
}
