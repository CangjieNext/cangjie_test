// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output

open class A {}

open class B <: A {}

open class C <: B {}

open class Base {
    static func f<T>(a: T): Unit where T <: B {}
    static func g<T>(): Unit where T <: B {}
    static func p<T>(): Unit {}
}

class D <: Base {
    static redef func f<T>(a: T): Unit where T <: C {} // Error，stricter constraint
    static redef func g<T>(): Unit where T <: C {} // Error，stricter constraint
    static redef func p<T>(): Unit where T <: C {} // Error，stricter constraint
}

class E <: Base {
    static redef func f<T>(a: T): Unit where T <: A {} // OK, looser constraint
    static redef func g<T>(): Unit where T <: A {} // OK, looser constraint
}

class F <: Base {
    static redef func f<T>(a: T): Unit where T <: B {} // OK，same constraint
    static redef func g<T>(): Unit where T <: B {} // OK，same constraint
}

main() {}

/* SCAN
error: the constraint of type parameter is not looser than parent's constraint
  ==> generic_constraint_inheritance_01.cj:22:46:
   | 
22 |     static redef func f<T>(a: T): Unit where T <: C {} // Error，stricter constraint
   |                                              ^^^^^^ 
   | 
   # note: parent constraint is 'Class-B'

error: the constraint of type parameter is not looser than parent's constraint
  ==> generic_constraint_inheritance_01.cj:23:42:
   | 
23 |     static redef func g<T>(): Unit where T <: C {} // Error，stricter constraint
   |                                          ^^^^^^ 
   | 
   # note: parent constraint is 'Class-B'

error: the constraint of type parameter is not looser than parent's constraint
  ==> generic_constraint_inheritance_01.cj:24:42:
   | 
24 |     static redef func p<T>(): Unit where T <: C {} // Error，stricter constraint
   |                                          ^^^^^^ 
   | 
   # note: parent constraint is empty

3 errors generated, 3 errors printed.
*/
