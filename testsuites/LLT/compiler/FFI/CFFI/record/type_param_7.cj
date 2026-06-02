// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f

@C
struct Data<T> {}

class A<T> {
    init() {}
    init(t: T) {}
}

main() {
    var a: A<(Data<Int32>) -> Data<Int32>> = A<(Data<Int32>) -> Data<Int32>>()
    var f = { d: Data<Int32> => d}
    var a1 = A(f)

    0
}

/* SCAN
error: struct with @C cannot have type parameters
 ==> type_param_7.cj:4:12:
  | 
4 | struct Data<T> {}
  |            ^ 
  | 

error: struct with @C cannot have type parameters
  ==> type_param_7.cj:12:19:
   | 
12 |     var a: A<(Data<Int32>) -> Data<Int32>> = A<(Data<Int32>) -> Data<Int32>>()
   |                   ^ 
   | 

error: struct with @C cannot have type parameters
  ==> type_param_7.cj:12:35:
   | 
12 |     var a: A<(Data<Int32>) -> Data<Int32>> = A<(Data<Int32>) -> Data<Int32>>()
   |                                   ^ 
   | 

error: struct with @C cannot have type parameters
  ==> type_param_7.cj:12:53:
   | 
12 |     var a: A<(Data<Int32>) -> Data<Int32>> = A<(Data<Int32>) -> Data<Int32>>()
   |                                                     ^ 
   | 

error: struct with @C cannot have type parameters
  ==> type_param_7.cj:12:69:
   | 
12 |     var a: A<(Data<Int32>) -> Data<Int32>> = A<(Data<Int32>) -> Data<Int32>>()
   |                                                                     ^ 
   | 

error: struct with @C cannot have type parameters
  ==> type_param_7.cj:13:22:
   | 
13 |     var f = { d: Data<Int32> => d}
   |                      ^ 
   | 

6 errors generated, 6 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
