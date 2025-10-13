// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class A {}

class B<T> where T <: ToString {
    public static func test<T>(data: Array<T>): Unit where T <: Comparable<T> {}
    public static func foo(a: T) {}
}

main(): Int64 {
    var arr: Array<A> = [A()]
    B.test(arr)
    B.foo(arr[0])
    return 0
}

/* SCAN
error: unable to infer generic argument of this function
  ==> call_inference_01.cj:18:5:
   | 
18 |     B.test(arr)
   |     ^^^^^^ 
   | 
note: following constraints for type variable 'Generics-T' cannot be solved:
      'Class-A <: Generics-T'
      'Generics-T <: Interface-Comparable<Generics-T>'
  ==> call_inference_01.cj:12:29:
   | 
12 |     public static func test<T>(data: Array<T>): Unit where T <: Comparable<T> {}
   |                             ^ 
   | 
note: constraint 'Class-A <: Generics-T' may come from:
  ==> call_inference_01.cj:18:12:
   | 
18 |     B.test(arr)
   |            ^^^ of type 'Struct-Array<Class-A>', should match parameter type 'Struct-Array<Generics-T>'
   | 
note: constraint 'Generics-T <: Interface-Comparable<Generics-T>' may come from:
  ==> call_inference_01.cj:12:60:
   | 
12 |     public static func test<T>(data: Array<T>): Unit where T <: Comparable<T> {}
   |                                                            ^^^^^^^^^^^^^^^^^^ 
   | 

error: unable to infer generic argument of this function
  ==> call_inference_01.cj:19:5:
   | 
19 |     B.foo(arr[0])
   |     ^^^^^ 
   | 
note: following constraints for type variable 'Generics-T' cannot be solved:
      'Class-A <: Generics-T'
      'Generics-T <: Interface-ToString'
  ==> call_inference_01.cj:11:9:
   | 
11 | class B<T> where T <: ToString {
   |         ^ 
   | 
note: constraint 'Class-A <: Generics-T' may come from:
  ==> call_inference_01.cj:19:11:
   | 
19 |     B.foo(arr[0])
   |           ^^^^^^ of type 'Class-A', should match parameter type 'Generics-T'
   | 
note: constraint 'Generics-T <: Interface-ToString' may come from:
  ==> call_inference_01.cj:11:18:
   | 
11 | class B<T> where T <: ToString {
   |                  ^^^^^^^^^^^^^ 
   | 

2 errors generated, 2 errors printed.
*/
