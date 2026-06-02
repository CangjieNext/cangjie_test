// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %verbose_opt %f -o %output 2>&1 | compare %f

interface X {}

class Box<T> where T <: X {
    var ptr: CPointer<T> = CPointer<T>()
}

class A <: X {}

main() {
    var box = Box<A>()
    0
}

/* SCAN-IN
error: generics type arguments do not match the constraint of 'CPointer<Generics-T>'
 ==> generic_type_0.cj:6:23:
  | 
6 |     var ptr: CPointer<T> = CPointer<T>()
  |                       ^ 
  | 
  # note: 'Generics-T' is not a subtype of 'Interface-CType'

error: generics type arguments do not match the constraint of 'CPointer<Generics-T>'
 ==> generic_type_0.cj:6:37:
  | 
6 |     var ptr: CPointer<T> = CPointer<T>()
  |                                     ^ 
  | 
  # note: 'Generics-T' is not a subtype of 'Interface-CType'

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
