// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output

interface A {}

interface B <: A {}

interface C <: B {}

interface I1 {
    static func test<T>(): Unit where T <: A & B {}
}

class D <: I1 {
    public static func test<T>(): Unit where T <: C {}
}

class E <: I1 {
    public static func test<T>(): Unit where T <: B {}
}

class F <: I1 {
    public static func test<T>(): Unit where T <: A {}
}

main() {}

/* SCAN
error: the constraint of type parameter is not looser than parent's constraint
  ==> generic_constraint_inheritance_07.cj:20:46:
   | 
20 |     public static func test<T>(): Unit where T <: C {}
   |                                              ^^^^^^ 
   | 
   # note: parent constraint is 'Interface-A & Interface-B'

1 error generated, 1 error printed.
*/
