// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output

interface I {
    static func f<T1, T2, T3, T4>(): Unit where T1 <: T2, T3 <: T4 {}
}

class A <: I {
    public static func f<T1, T2, T3, T4>(): Unit where T1 <: T4 {}
}

main() {}

/* SCAN
error: the upper bound 'Generics-T2' of generic parameter 'Generics-T1' must be class or interface
  ==> generic_upper_constraint_inheritance_03.cj:10:19:
   | 
10 |     static func f<T1, T2, T3, T4>(): Unit where T1 <: T2, T3 <: T4 {}
   |                   ^^ 
   | 

error: the upper bound 'Generics-T4' of generic parameter 'Generics-T3' must be class or interface
  ==> generic_upper_constraint_inheritance_03.cj:10:27:
   | 
10 |     static func f<T1, T2, T3, T4>(): Unit where T1 <: T2, T3 <: T4 {}
   |                           ^^ 
   | 

error: the upper bound 'Generics-T4' of generic parameter 'Generics-T1' must be class or interface
  ==> generic_upper_constraint_inheritance_03.cj:14:26:
   | 
14 |     public static func f<T1, T2, T3, T4>(): Unit where T1 <: T4 {}
   |                          ^^ 
   | 

error: the constraint of type parameter is not looser than parent's constraint
  ==> generic_upper_constraint_inheritance_03.cj:14:56:
   | 
14 |     public static func f<T1, T2, T3, T4>(): Unit where T1 <: T4 {}
   |                                                        ^^^^^^^^ 
   | 
   # note: parent constraint is 'Generics-T2'

4 errors generated, 4 errors printed.
*/
