// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// @Issue #748: 错误接受用例（soundness bug）—— Foo<Y,X> 不应被视为 A<X> 的子类型，必须拒绝
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
  ==> issue748_generic_subtype_soundness_reject.cj:16:11:
   | 
16 |         g(foo)
   |           ^^^ expected 'Interface-A<Generics-X>', found 'Class-Foo<Generics-Y, Generics-X>'
   | 

1 error generated, 1 error printed.
*/
