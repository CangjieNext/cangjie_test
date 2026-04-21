// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %f %compile_lib_opt 2>&1 | compare %f

interface A<T> {}

class Foo<X, Y> <: A<X> {
    func g(a: A<X>): Unit {}

    func f(foo: Foo<Y, X>) {
        g(foo)
    }
}

/* SCAN
error: mismatched types
  ==> generic_subtype_soundness_reject.cj:15:11:
   | 
15 |         g(foo)
   |           ^^^ expected 'Interface-A<Generics-X>', found 'Class-Foo<Generics-Y, Generics-X>'
   | 

1 error generated, 1 error printed.
*/
