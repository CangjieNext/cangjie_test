/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan sema_upper_bound_must_be_class_or_interface

open class C1 {}

class C2 <: C1 {}

enum A<X> where X <: C1 {
    a

    public func test<Y>(x: X) where Y <: C2 & X {
        x
    }
}

main() {
    a<C1>.test<C2>(C2())
    0
}
