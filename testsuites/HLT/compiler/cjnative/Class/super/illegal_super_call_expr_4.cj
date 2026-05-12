/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan sema_assignment_of_member_variable_cannot_use_this_or_super

// 多级继承
open class Z {
    let x: Int64 = 123
}

open class A <: Z {
    let ax: Int64
    public A(x: Int64) {
        this.ax = x
    }
}

class B <: A {
    public B() {
        super(this.x)
    }
}

main(): Int64 {
    let b = B()
    let a = b.x
    return 0
}
