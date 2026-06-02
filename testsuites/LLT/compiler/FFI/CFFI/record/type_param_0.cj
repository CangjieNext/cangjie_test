// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f




@C
struct Data<T> {
    var a: Int64 = 0
}

main() {
    var d0 = Data<Int64>()
    var d1 = Data<String>()

    0
}

/* SCAN
error: struct with @C cannot have type parameters
 ==> type_param_0.cj:7:12:
  | 
7 | struct Data<T> {
  |            ^ 
  | 

error: struct with @C cannot have type parameters
  ==> type_param_0.cj:12:18:
   | 
12 |     var d0 = Data<Int64>()
   |                  ^ 
   | 

error: struct with @C cannot have type parameters
  ==> type_param_0.cj:13:18:
   | 
13 |     var d1 = Data<String>()
   |                  ^ 
   | 

3 errors generated, 3 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
