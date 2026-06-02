// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %noColor %f -o %output 2>&1 | compare %f

foreign func NonExist(ptr: CPointer<Empty>): Int32

struct Empty {}

main() {
    var a = Empty()
    unsafe {
        NonExist(inout a)
    }
}

/* SCAN
error: generics type arguments do not match the constraint of 'CPointer<Generics-T>'
 ==> inout_e20.cj:3:37:
  | 
3 | foreign func NonExist(ptr: CPointer<Empty>): Int32
  |                                     ^ 
  | 
  # note: 'Struct-Empty' is not a subtype of 'Interface-CType'

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
