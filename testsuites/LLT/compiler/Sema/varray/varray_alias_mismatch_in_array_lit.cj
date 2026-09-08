// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// A VArray constructor call through a type alias inside an array literal is
// desugared into an ArrayExpr whose sourceExpr points back to the original
// CallExpr. DiagMismatchedTypesWithFoundTy calls ShouldDiagnose, which returns
// false when sourceExpr is set, so the mismatch diagnostic used to be silently
// swallowed and the Invalid type reached ASTTypeValidator and crashed. Must
// report the mismatch diagnostic on the original CallExpr instead.

type Outer = VArray<Int64, $1>

main() {
    let g: Outer = [Outer({i => 0})]
    0
}

/* SCAN
error: mismatched types
  ==> varray_alias_mismatch_in_array_lit.cj:19:21:
   | 
19 |     let g: Outer = [Outer({i => 0})]
   |                     ^^^^^^^^^^^^^^^ expected 'Int64', found 'VArray<Int64, $1>'
   | 

1 error generated, 1 error printed.
*/
