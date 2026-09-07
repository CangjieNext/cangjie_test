// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// VArray constructor called through a type alias with zero or more than one
// argument. Was ICE ("begin of range is zero"): the desugared ArrayExpr from
// DesugarArrayCall had no paren positions, so the arg-number-mismatch
// diagnostic carried a zero range. Must report a normal diagnostic whose
// caret spans the call parentheses.

type Box = VArray<Int64, $8>

main() {
    let a = Box() // error: zero argument
    let b: Box = Box(1, 2) // error: more than one argument
    0
}

/* SCAN
error: 'VArray' constructor accepts only one argument
  ==> varray_alias_args_mismatch.cj:18:16:
   | 
18 |     let a = Box() // error: zero argument
   |                ^^ 
   | 

error: 'VArray' constructor accepts only one argument
  ==> varray_alias_args_mismatch.cj:19:21:
   | 
19 |     let b: Box = Box(1, 2) // error: more than one argument
   |                     ^^^^^^ 
   | 

2 errors generated, 2 errors printed.
*/
