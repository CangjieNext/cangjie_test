/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    if (case01(1, 2).foo() != 20) {
        return 4
    }
    if (case01(2, 1).foo() != 10) {
        return 4
    }
    return 0
}

func case01(a: Int32, b: Int32): A {
    if (a > b) {
        return A()
    } else {
        return B()
    }
}

func case02(a: Int32, b: Int32) {
    if (a > b) {
        A()
    }
}

open class A {
    public open func foo() {
        return 10
    }
}

class B <: A {
    public override func foo() {
        return 20
    }
}
