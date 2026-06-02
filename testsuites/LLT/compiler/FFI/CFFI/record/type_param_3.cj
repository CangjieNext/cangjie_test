// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f






@C
struct Data<T> {}

foreign func foo(a: Data<Int64>): Data<Int64>

foreign {
    func bar(a: Data<String>): Data<String>
}

/* SCAN
error: struct with @C cannot have type parameters
 ==> type_param_3.cj:9:12:
  | 
9 | struct Data<T> {}
  |            ^ 
  | 

error: struct with @C cannot have type parameters
  ==> type_param_3.cj:11:25:
   | 
11 | foreign func foo(a: Data<Int64>): Data<Int64>
   |                         ^ 
   | 

error: struct with @C cannot have type parameters
  ==> type_param_3.cj:11:39:
   | 
11 | foreign func foo(a: Data<Int64>): Data<Int64>
   |                                       ^ 
   | 

error: struct with @C cannot have type parameters
  ==> type_param_3.cj:14:21:
   | 
14 |     func bar(a: Data<String>): Data<String>
   |                     ^ 
   | 

error: struct with @C cannot have type parameters
  ==> type_param_3.cj:14:36:
   | 
14 |     func bar(a: Data<String>): Data<String>
   |                                    ^ 
   | 

error: 'main' is missing
 ==> type_param_3.cj:1:1:
  | 
1 | // EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
  | ^ 
  | 

6 errors generated, 6 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
