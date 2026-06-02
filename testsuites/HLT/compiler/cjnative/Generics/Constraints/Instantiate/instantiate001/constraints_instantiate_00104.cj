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

interface T<TT> {
    operator func +(b: TT): Unit
}

open class Father {}

extend Father <: T<Child> {
    public operator func +(b: Child): Unit {}
}

class Child <: Father {}

func test<X>(a: X) where X <: T<X> {}

struct R<X> where X <: T<X> {}

enum E<X> where X <: T<X> {
    e
}

class C<X> where X <: T<X> {}

interface I<X> where X <: T<X> {}

extend<X> R<X> <: T<R<X>> where X <: T<X> {
    public operator func +(b: R<X>): Unit {}
}

main(): Int64 {
    test<Child>(Child())
    R<Child>()
    E<Child>.e
    C<Child>()
    func foo(input: I<Child>) {}
    return 0
}
