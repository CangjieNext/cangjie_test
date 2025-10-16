// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import define.*

class A {
    @M1
    public static var a = A.b
    public static var b = 1
}

main() {}

/* SCAN
error: variable 'b' is used before initialization
 ==> use_before_initialization.cj:9:27:
  | 
9 |     public static var a = A.b
  |                           ^ 
  | 
note: which is expanded as follows
  | 
  |     /* 8.1 */public static var a = A.b
  |                                    ^^^ 
  | 
note: the error occurs after the macro is expanded
 ==> use_before_initialization.cj:8:5:
  | 
8 |       @M1
  |  _____^
9 | |     public static var a = A.b
  | |_____________________________^
  | 
note: the code after the macro is expanded as follows
  | 
  |       /* 8.1 */public static var a = A.b
  |  _____^
  | | /* 8.2 */
  | |_________^
  | 

error: global/static variable 'b' is used before initialization during initializing 'a'
 ==> use_before_initialization.cj:9:29:
  | 
9 |     public static var a = A.b
  |                             ^ 
  | 
note: which is expanded as follows
  | 
  |     /* 8.1 */public static var a = A.b
  |                                      ^ 
  | 
note: the error occurs after the macro is expanded
 ==> use_before_initialization.cj:8:5:
  | 
8 |       @M1
  |  _____^
9 | |     public static var a = A.b
  | |_____________________________^
  | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

