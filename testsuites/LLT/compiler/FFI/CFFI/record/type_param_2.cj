// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f




@C
struct Data<T> {
    var a: Int64 = 0
    var b: T

    init(x: T) {
        this.b = x
    }
}

main() {
    var d0 = Data<Int64>(0)
    var d1 = Data<String>("")

    0
}

/* SCAN
error: struct with @C cannot have type parameters
 ==> type_param_2.cj:7:12:
  | 
7 | struct Data<T> {
  |            ^ 
  | 

error: member variable 'b' of struct 'Data' with @C must be instantiated with CType
 ==> type_param_2.cj:9:9:
  | 
9 |     var b: T
  |         ^^^^ 
  | 

error: struct with @C cannot have type parameters
  ==> type_param_2.cj:17:18:
   | 
17 |     var d0 = Data<Int64>(0)
   |                  ^ 
   | 

error: struct with @C cannot have type parameters
  ==> type_param_2.cj:18:18:
   | 
18 |     var d1 = Data<String>("")
   |                  ^ 
   | 

4 errors generated, 4 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
