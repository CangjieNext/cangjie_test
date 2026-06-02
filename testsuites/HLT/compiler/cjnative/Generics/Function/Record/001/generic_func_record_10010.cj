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
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_macro_opt %run_args

import define.*

@SAME
open class C1 {}

@SAME
class C2 <: C1 {}

@SAME
struct A<T> {
    var x: T
    init(i: T) {
        x = i
    }
    A(i: T, j: T) {
        x = i
    }
    public func a() {}
    private func b() {}
    static func c() {}
    operator func +(x: Int64) {
        0
    }
    mut prop d: Int64 {
        get() {
            1
        }
        set(i) {}
    }
    @SAME
    func test<T>(x: T) where T <: T {
        x
    }
}

@SAME
interface I {}

@SAME
extend<T> A<T> <: I {}

@SAME
main() {
    A<C1>(C1()).test(C2())
    return 0
}
