// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

interface A<T> {
    func quux(x: T): T
}

class Foo<X, Y> <: A<X> {
    func g(a: A<X>, x: X): X {
        a.quux(x)
    }

    func f(foo: Foo<Y, X>, x: X) {
        g(foo, x)
    }

    public func quux(x: X): X { x }
}

main() {
    let foo = Foo<String, (Int64) -> Int64>()
    let oof = Foo<(Int64) -> Int64, String>()
    foo.f(oof, "Hello!")
    0
}

/* SCAN
error: mismatched types
  ==> generic_subtype_runtime_crash.cj:19:11:
   | 
19 |         g(foo, x)
   |           ^^^ expected 'Interface-A<Generics-X>', found 'Class-Foo<Generics-Y, Generics-X>'
   | 

1 error generated, 1 error printed.
*/
