/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class C1 {}

class C2 {}

class A<X> {
    public func foo<Y>(x: X) where Y <: C1 {
        x
    }
}

main() {
    A<C1>().foo<C2>(C1())
    0
}
// ASSERT: scan sema_generic_type_argument_not_match_constraint
