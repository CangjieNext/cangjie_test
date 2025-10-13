// LEVEL: 0
// (DEBUG_OPTION) EXEC-PIPE-1: %compiler %disableSemaConstCheck %cmp_opt %f -o %output 2>&1 | compare %f

public func divByZero01() {
   var a = 1
   var b = a
   b = 2
   var c = 2 / (a - 1)
   println(c)
}

public func divByZero02() {
   let a = 1
   var b = a
   b = 2
   var c = 2 / (a - 1)
   println(c)
}

main() {}

/* SCAN
error: divide by zero
 ==> divByZero02.cj:8:12:
  | 
8 |    var c = 2 / (a - 1)
  |            ^^^^^^^^^^^ attempt to divide by zero
  | 

error: divide by zero
  ==> divByZero02.cj:16:12:
   | 
16 |    var c = 2 / (a - 1)
   |            ^^^^^^^^^^^ attempt to divide by zero
   | 

2 errors generated, 2 errors printed.
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
