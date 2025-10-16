// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import define.*

class A {}

func foo<T>() where T <: A {
    return 0
}

main(): Int64 {
    @M0(foo<Bool>())
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

/* SCAN
error: generics type arguments do not match the constraint of '() -> Int64'
  ==> generics_type_arguments.cj:14:13:
   | 
14 |     @M0(foo<Bool>())
   |             ^ 
   | 
note: which is expanded as follows
   | 
   |     /* 14.1 */foo < Bool >()
   |                     ^^^^^ 
   | 
note: the error occurs after the macro is expanded
  ==> generics_type_arguments.cj:14:5:
   | 
14 |     @M0(foo<Bool>())
   |     ^^^^^^^^^^^^^^^^ 
   | 
note: the code after the macro is expanded as follows
   | 
   |     /* 14.1 */foo < Bool >()
   |     ^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 
note: 'Bool' is not a subtype of 'Class-A'
 ==> generics_type_arguments.cj:9:15:
  | 
9 | func foo<T>() where T <: A {
  |               ^ 
  | 

1 error generated, 1 error printed.
*/
