/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %compiler %cmp_opt %f  -o %output 2>&1 | compare %f
// ASSERT: scan sema_upper_bound_must_be_class_or_interface

import define.*

@SAME
class A<X> {
    var i: X
    init(i: X) {
        this.i = i
    }
    A(x: X, y: X) {
        this.i = x
    }
    func foo() {}
    static func s_foo() {}
    operator func +(x: Int64) {
        0
    }
    mut prop x: Int64 {
        get() {
            0
        }
        set(i) {}
    }
    @SAME
    func f<Y>(x: Y): X where Y <: X {
        i
    }
}

main() {
    A<Int64>(0).f<Int64>(1)
}
