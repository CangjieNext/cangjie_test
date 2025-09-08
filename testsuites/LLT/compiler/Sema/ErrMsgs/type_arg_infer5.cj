// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output
class A {}
// test tracking nested constraints
func f<T>() where T <: A {
    func g<R>(): R where R <: T & A {
        let v: Int64 = g()
        return g<R>()
    }
}

main() {
}

/* SCAN
error: the upper bound 'Generics-T' of generic parameter 'Generics-R' must be class or interface
  ==> type_arg_infer5.cj:11:12:
   | 
11 |     func g<R>(): R where R <: T & A {
   |            ^ 
   | 

error: unable to infer generic argument of this function
  ==> type_arg_infer5.cj:12:24:
   | 
12 |         let v: Int64 = g()
   |                        ^ 
   | 
note: following constraints for type variable 'Generics-R' cannot be solved:
      'Generics-R <: Class-A'
      'Generics-R <: Generics-T'
      'Generics-R <: Int64'
  ==> type_arg_infer5.cj:11:12:
   | 
11 |     func g<R>(): R where R <: T & A {
   |            ^ 
   | 
note: constraint 'Generics-R <: Class-A' may come from:
  ==> type_arg_infer5.cj:10:19:
   | 
10 | func f<T>() where T <: A {
   |                   ^^^^^^ 
   | 
note: constraint 'Generics-R <: Class-A' may come from:
  ==> type_arg_infer5.cj:11:26:
   | 
11 |     func g<R>(): R where R <: T & A {
   |                          ^^^^^^^^^^ 
   | 
note: constraint 'Generics-R <: Generics-T' may come from:
  ==> type_arg_infer5.cj:11:26:
   | 
11 |     func g<R>(): R where R <: T & A {
   |                          ^^^^^^^^^^ 
   | 
note: constraint 'Generics-R <: Int64' may come from:
  ==> type_arg_infer5.cj:12:24:
   | 
12 |         let v: Int64 = g()
   |                        ^^^ of return type 'Generics-R', should match expected type 'Int64'
   | 

2 errors generated, 2 errors printed.
*/
