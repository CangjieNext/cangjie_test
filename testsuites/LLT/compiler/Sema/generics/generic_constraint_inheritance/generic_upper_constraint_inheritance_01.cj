// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output

interface I {
    static func f<T1, T2>(): Unit where T1 <: Any {}
}

class A <: I {
    public static func f<T1, T2>() where T1 <: T2 {}
}

main() {}

/* SCAN
error: the upper bound 'Generics-T2' of generic parameter 'Generics-T1' must be class or interface
  ==> generic_upper_constraint_inheritance_01.cj:14:26:
   | 
14 |     public static func f<T1, T2>() where T1 <: T2 {}
   |                          ^^ 
   | 

error: the constraint of type parameter is not looser than parent's constraint
  ==> generic_upper_constraint_inheritance_01.cj:14:42:
   | 
14 |     public static func f<T1, T2>() where T1 <: T2 {}
   |                                          ^^^^^^^^ 
   | 
   # note: parent constraint is 'Interface-Any'

2 errors generated, 2 errors printed.
*/
