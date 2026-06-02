// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f




@C
struct Data<T, K> {
    var a: Int64 = 0
    var b: T
    var c: K

    init(x: T, y: K) {
        this.b = x
        this.c = y
    }
}

main() {
    var d0 = Data<Int64, String>(0, "")
    var d1 = Data<String, Int64>("", 0)

    0
}

/* SCAN
error: struct with @C cannot have type parameters
 ==> type_param_4.cj:7:12:
  | 
7 | struct Data<T, K> {
  |            ^ 
  | 

error: member variable 'b' of struct 'Data' with @C must be instantiated with CType
 ==> type_param_4.cj:9:9:
  | 
9 |     var b: T
  |         ^^^^ 
  | 

error: member variable 'c' of struct 'Data' with @C must be instantiated with CType
  ==> type_param_4.cj:10:9:
   | 
10 |     var c: K
   |         ^^^^ 
   | 

error: struct with @C cannot have type parameters
  ==> type_param_4.cj:19:18:
   | 
19 |     var d0 = Data<Int64, String>(0, "")
   |                  ^ 
   | 

error: struct with @C cannot have type parameters
  ==> type_param_4.cj:20:18:
   | 
20 |     var d1 = Data<String, Int64>("", 0)
   |                  ^ 
   | 

5 errors generated, 5 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
