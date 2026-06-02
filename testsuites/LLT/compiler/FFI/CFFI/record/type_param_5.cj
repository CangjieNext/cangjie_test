// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f

@C
struct Data<T> {
    var a: T

    init(a: T) {
        this.a = a
    }
}

class X<T> {
    var a: Data<T>

    init(a: T) {
        this.a = Data<T>(a)
    }
}

main() {
    var d0 = X<Int64>(0)
    var d1 = X<String>("")

    0
}

/* SCAN
error: struct with @C cannot have type parameters
 ==> type_param_5.cj:4:12:
  | 
4 | struct Data<T> {
  |            ^ 
  | 

error: member variable 'a' of struct 'Data' with @C must be instantiated with CType
 ==> type_param_5.cj:5:9:
  | 
5 |     var a: T
  |         ^^^^ 
  | 

error: struct with @C cannot have type parameters
  ==> type_param_5.cj:13:16:
   | 
13 |     var a: Data<T>
   |                ^ 
   | 

error: struct with @C cannot have type parameters
  ==> type_param_5.cj:16:22:
   | 
16 |         this.a = Data<T>(a)
   |                      ^ 
   | 

4 errors generated, 4 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
