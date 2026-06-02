// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %enableO2 %f -o %n.%suffix 2>&1
// EXEC-0:%run %run_opt %output %run_args | compare %f
// EXEC-PIPE-0: %compiler %f -o %n.%suffix 2>&1
// EXEC-0:%run %run_opt %output %run_args | compare %f
// ASSERT: scan aaaa

open class A<X> {
    open public func test<T>(x: X, y: X): Unit {
        println("aaaa");
    }
}

open class B<X> <: A<X> {
    open public func test<Y>(x: C<Y>, y: C<Y>): Unit {
        println("bbbb");
    }
}

class C<T> {}

main() {
    let x: C<Int64> = C<Int64>()
    B<C<Int64>>().test<Int64>(x, x)
}