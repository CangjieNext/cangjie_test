// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f




@C
struct Data <T> {
    var a: T

    init(a: T) {
        this.a = a
    }
}

main() {
    var d0 = Data <Int64>(0)
    var d1 = Data <String>("")

    0
}

/* SCAN
error: struct with @C cannot have type parameters
 ==> type_param_1.cj:7:13:
  | 
7 | struct Data <T> {
  |             ^ 
  | 

error: member variable 'a' of struct 'Data' with @C must be instantiated with CType
 ==> type_param_1.cj:8:9:
  | 
8 |     var a: T
  |         ^^^^ 
  | 

error: struct with @C cannot have type parameters
  ==> type_param_1.cj:16:19:
   | 
16 |     var d0 = Data <Int64>(0)
   |                   ^ 
   | 

error: struct with @C cannot have type parameters
  ==> type_param_1.cj:17:19:
   | 
17 |     var d1 = Data <String>("")
   |                   ^ 
   | 

4 errors generated, 4 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
