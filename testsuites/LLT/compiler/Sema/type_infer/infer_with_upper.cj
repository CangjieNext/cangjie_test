// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC:%frontendCompiler %typecheck %cmp_opt %f 2>&1 | compare %f

interface I<T> {}

class A<T> where T <: I<T> {
    init() {}
}

struct B<T> where T <: I<T> {
    init() {}
}

func test<T>() where T <: I<T> {
    // test for error report for this 'A()'
    return A()
}

func test2<T>() where T <: I<T> {
    // test for error report for join of return type
    if (true) {
        return B<Int64>()
    } else {
        return ()
    }
}

extend Int64 <: I<Int64> {}

main() {
    test<Int64>()
    return 0
}

/* SCAN
error: unable to infer generic argument of this function
  ==> infer_with_upper.cj:21:12:
   | 
21 |     return A()
   |            ^ 
   | 
note: following constraints for type variable 'Generics-T' cannot be solved:
      'Generics-T <: Interface-I<Generics-T>'
  ==> infer_with_upper.cj:11:9:
   | 
11 | class A<T> where T <: I<T> {
   |         ^ 
   | 
note: constraint 'Generics-T <: Interface-I<Generics-T>' may come from:
  ==> infer_with_upper.cj:11:18:
   | 
11 | class A<T> where T <: I<T> {
   |                  ^^^^^^^^^ 
   | 

1 error generated, 1 error printed.
*/
