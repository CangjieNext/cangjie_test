// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output

open class A {}

open class B <: A {}

class C <: B {}

interface I<X> {
    static func test<T>(): Unit where T <: B & Equatable<X> {}
}

class D <: I<B> {
    public static func test<T>(): Unit where T <: C & Equatable<B> {}
}

class E <: I<B> {
    public static func test<T>(): Unit where T <: Equatable<C> {}
}

class F <: I<B> {
    public static func test<T>(): Unit where T <: A & Equatable<B> {}
}

main() {}

/* SCAN
error: the constraint of type parameter is not looser than parent's constraint
  ==> generic_constraint_inheritance_06.cj:20:46:
   | 
20 |     public static func test<T>(): Unit where T <: C & Equatable<B> {}
   |                                              ^^^^^^^^^^^^^^^^^^^^^ 
   | 
   # note: parent constraint is 'Class-B & Interface-Equatable<Class-B>'

error: the constraint of type parameter is not looser than parent's constraint
  ==> generic_constraint_inheritance_06.cj:24:46:
   | 
24 |     public static func test<T>(): Unit where T <: Equatable<C> {}
   |                                              ^^^^^^^^^^^^^^^^^ 
   | 
   # note: parent constraint is 'Class-B & Interface-Equatable<Class-B>'

2 errors generated, 2 errors printed.
*/
