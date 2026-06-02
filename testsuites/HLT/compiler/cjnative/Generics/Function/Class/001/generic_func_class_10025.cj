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
    public func f1<Y>(x: X): X where Y <: Z {
        f2<X>(x)
    }
    public func f2<Z>(x: X): X where Z <: Y {
        f1<X>(x)
    }
}

main() {
    0
}
// ASSERT: scan sema_undeclared_type_name
