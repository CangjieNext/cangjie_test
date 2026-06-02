/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class C1 {}

class C2 {}

class A<X> {
    public func f1<Y>(x: X): X where Y <: C1 {
        f2<C2>(x)
    }
    public func f2<Z>(x: X): X where Z <: C2 {
        f1<C1>(x)
    }
}

main() {
    0
}
