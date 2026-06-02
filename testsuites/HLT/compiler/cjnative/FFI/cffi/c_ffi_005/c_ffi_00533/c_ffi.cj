/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan sema_upper_bound_must_be_class_or_interface

enum A<X, Y> where X <: CType, Y <: CType {
    a
    | a(X)
    | a(X, Y)

    func f() {}
    static func s_f() {}
    operator func +(x: Int64) {}
    prop Z: Int64 {
        get() {
            1
        }
    }
    func test<Z>(x: Z) where Z <: X & Y {
        x
    }
}

main() {}
