// EXEC-PIPE-1: %compiler %noColor %n.cj -o %output 2>&1 | compare %f

@C
func foo0(ptr: CPointer<CPointer<CType>>) {}

func foo1(ptr: CPointer<CPointer<CPointer<CType>>>) {}

unsafe main() {
    0
}

/* SCAN
error: generics type arguments do not match the constraint of 'CPointer<Generics-T>'
 ==> ctype_8.cj:4:34:
  | 
4 | func foo0(ptr: CPointer<CPointer<CType>>) {}
  |                                  ^ 
  | 
  # note: 'Interface-CType' is not a subtype of 'Interface-CType'

error: generics type arguments do not match the constraint of 'CPointer<Generics-T>'
 ==> ctype_8.cj:6:43:
  | 
6 | func foo1(ptr: CPointer<CPointer<CPointer<CType>>>) {}
  |                                           ^ 
  | 
  # note: 'Interface-CType' is not a subtype of 'Interface-CType'

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
