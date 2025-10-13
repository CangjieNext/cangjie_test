// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

class C<T> {}

open class A {
    public static func foo<T>(a: C<T>) where T <: Int32 {
        return 1
    }
}

public open class B <: A {
    public static redef func foo<T>(a: C<T>) where T <: Int64 {
        return 1
    }
}

main() {
    return 0
}

/* SCAN
error: the upper bound 'Int32' of generic parameter 'Generics-T' must be class or interface
  ==> class_redef_19.cj:12:28:
   | 
12 |     public static func foo<T>(a: C<T>) where T <: Int32 {
   |                            ^ 
   | 

error: the upper bound 'Int64' of generic parameter 'Generics-T' must be class or interface
  ==> class_redef_19.cj:18:34:
   | 
18 |     public static redef func foo<T>(a: C<T>) where T <: Int64 {
   |                                  ^ 
   | 

error: the constraint of type parameter is not looser than parent's constraint
  ==> class_redef_19.cj:18:52:
   | 
18 |     public static redef func foo<T>(a: C<T>) where T <: Int64 {
   |                                                    ^^^^^^^^^^ 
   | 
   # note: parent constraint is 'Int32'

error: 'public' declaration uses 'internal' types
  ==> class_redef_19.cj:18:30:
   | 
18 |     public static redef func foo<T>(a: C<T>) where T <: Int64 {
   |                              ^^^ 
   | 
note: type 'Class-C<Generics-T>' contains 'internal' type
  ==> class_redef_19.cj:18:40:
   | 
18 |     public static redef func foo<T>(a: C<T>) where T <: Int64 {
   |                                        ^^^^ 
   | 
note: the 'internal' type is 'Class-C<Generics-T>'
 ==> class_redef_19.cj:9:7:
  | 
9 | class C<T> {}
  |       ^ 
  | 

4 errors generated, 4 errors printed.
*/
