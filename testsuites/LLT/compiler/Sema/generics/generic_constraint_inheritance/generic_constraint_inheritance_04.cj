// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output

open class A {}

open class B <: A {}

class C <: B {}

interface I {
    static func test<T>(): Unit where T <: B & Equatable<T> {}
}

class D <: I {
    public static func test<T>(): Unit where T <: C & Equatable<T> {}
}

class E <: I {
    public static func test<T>(): Unit where T <: B {}
}

class F <: I {
    public static func test<T>(): Unit where T <: A & Equatable<T> {}
}

main() {}

/* SCAN
error: the constraint of type parameter is not looser than parent's constraint
  ==> generic_constraint_inheritance_04.cj:20:46:
   | 
20 |     public static func test<T>(): Unit where T <: C & Equatable<T> {}
   |                                              ^^^^^^^^^^^^^^^^^^^^^ 
   | 
   # note: parent constraint is 'Class-B & Interface-Equatable<Generics-T>'

1 error generated, 1 error printed.
*/
