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
// caret spans the call parentheses, and covers a trailing lambda placed
// after ')' as well.

type Box = VArray<Int64, $8>

main() {
    let a = Box() // error: zero argument
    let b: Box = Box(1, 2) // error: more than one argument
    let c = Box(1) { i => i } // error: trailing lambda after parens
    0
}

/* SCAN
error: 'VArray' constructor accepts only one argument
  ==> varray_alias_args_mismatch.cj:19:16:
   | 
19 |     let a = Box() // error: zero argument
   |                ^^ 
   | 

error: 'VArray' constructor accepts only one argument
  ==> varray_alias_args_mismatch.cj:20:21:
   | 
20 |     let b: Box = Box(1, 2) // error: more than one argument
   |                     ^^^^^^ 
   | 

error: 'VArray' constructor accepts only one argument
  ==> varray_alias_args_mismatch.cj:21:16:
   | 
21 |     let c = Box(1) { i => i } // error: trailing lambda after parens
   |                ^^^^^^^^^^^^^^ 
   | 

3 errors generated, 3 errors printed.
*/
