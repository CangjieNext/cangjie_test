// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output

open class A {}

open class B <: A {}

class C <: B {}

interface I1 {
    static func test<T>(): Unit where T <: A {}
}

interface I2 {
    static func test<T>(): Unit where T <: B {}
}

class D <: I1 & I2 {
    public static func test<T>(): Unit where T <: C {}
}

class E <: I1 & I2 {
    public static func test<T>(): Unit where T <: B {}
}

class F <: I1 & I2 {
    public static func test<T>(): Unit where T <: A {}
}

main() {}

/* SCAN
error: the constraint of type parameter is not looser than parent's constraint
  ==> generic_constraint_inheritance_02.cj:24:46:
   | 
24 |     public static func test<T>(): Unit where T <: C {}
   |                                              ^^^^^^ 
   | 
   # note: parent constraint is 'Class-A', 'Class-B'

error: the constraint of type parameter is not looser than parent's constraint
  ==> generic_constraint_inheritance_02.cj:28:46:
   | 
28 |     public static func test<T>(): Unit where T <: B {}
   |                                              ^^^^^^ 
   | 
   # note: parent constraint is 'Class-A', 'Class-B'

2 errors generated, 2 errors printed.
*/
