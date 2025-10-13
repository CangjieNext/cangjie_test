// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import define.*

@M1
@C
func foo0(ptr: CPointer<CType>) {}

@M1
func foo1(ptr: CPointer<CType>) {}

unsafe main() {
    0
}

/* SCAN
error: generics type arguments do not match the constraint of 'CPointer<Generics-T>'
 ==> generic_type_of_cpointer.cj:9:25:
  | 
9 | func foo0(ptr: CPointer<CType>) {}
  |                         ^ 
  | 
  # note: 'Interface-CType' is not a subtype of 'Interface-CType'
note: the error occurs after the macro is expanded
 ==> generic_type_of_cpointer.cj:7:1:
  | 
7 |   @M1
  |  _^
8 | | @C
9 | | func foo0(ptr: CPointer<CType>) {}
  | |__________________________________^
  | 
note: the code after the macro is expanded as follows
   | 
   |   /* 7.1 */@C
   |  _^
   | | /* 7.2 */func foo0(ptr: CPointer < CType >) {
   | | /* 7.3 */}
   | | /* 7.4 */
   | |_________^
   | 
note: which is expanded as follows
  | 
  | /* 7.2 */func foo0(ptr: CPointer < CType >) {
  |                                    ^^^^^ 
  | 

error: generics type arguments do not match the constraint of 'CPointer<Generics-T>'
  ==> generic_type_of_cpointer.cj:12:25:
   | 
12 | func foo1(ptr: CPointer<CType>) {}
   |                         ^ 
   | 
   # note: 'Interface-CType' is not a subtype of 'Interface-CType'
note: the error occurs after the macro is expanded
  ==> generic_type_of_cpointer.cj:11:1:
   | 
11 |   @M1
   |  _^
12 | | func foo1(ptr: CPointer<CType>) {}
   | |__________________________________^
   | 
note: the code after the macro is expanded as follows
   | 
   |   /* 11.1 */func foo1(ptr: CPointer < CType >) {
   |  _^
   | | /* 11.2 */}
   | | /* 11.3 */
   | |__________^
   | 
note: which is expanded as follows
   | 
   | /* 11.1 */func foo1(ptr: CPointer < CType >) {
   |                                     ^^^^^ 
   | 

2 errors generated, 2 errors printed.
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.