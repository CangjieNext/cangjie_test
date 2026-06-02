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

interface I<X> {
    public func goo1() {
        println("goo1-------------")
    }
    public func goo2() {
        println("goo2-------------")
    }
    public func test<T>(x: X, y: X): Unit {
        foo(1)
    }
    public static func foo<R>(x: R): Unit {
        println("iiii");
    }
}

open class A<X> {
    open public func test<T>(x: X, y: X): Unit {
        foo(1)
    }
    public static func foo<R>(x: R): Unit {
        println("aaaa");
    }
}

extend<R> A<R> <: I<R> {}

open class B<X> <: A<X> {
    
}

class C<T> {}

main() {
    let x = B<Int32>()
    x.test<Bool>(1, 2)
}