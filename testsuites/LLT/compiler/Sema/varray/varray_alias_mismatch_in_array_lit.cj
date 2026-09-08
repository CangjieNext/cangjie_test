// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// A VArray constructor call through a type alias is desugared into an
// ArrayExpr whose sourceExpr points back to the original CallExpr. The
// array literal below is not required to trigger the bug: any mismatched
// context (plain let with type annotation, an argument position, ...) hits
// the same !typeManager.IsSubtype branch in ChkVArrayExpr. DiagMismatched
// TypesWithFoundTy calls ShouldDiagnose, which returns false when source
// Expr is set, so the mismatch diagnostic used to be silently swallowed
// and the Invalid type reached ASTTypeValidator and crashed. Must report
// the mismatch diagnostic on the original CallExpr instead.
// 'g' keeps the original issue #884 repro shape (array literal), 'x' is
// the most direct minimal form.

type Outer = VArray<Int64, $1>

main() {
    let g: Outer = [Outer({i => 0})]
    let x: Int64 = Outer({i => 0})
    0
}

/* SCAN
error: mismatched types
  ==> varray_alias_mismatch_in_array_lit.cj:24:21:
   | 
24 |     let g: Outer = [Outer({i => 0})]
   |                     ^^^^^^^^^^^^^^^ expected 'Int64', found 'VArray<Int64, $1>'
   | 

error: mismatched types
  ==> varray_alias_mismatch_in_array_lit.cj:25:20:
   | 
25 |     let x: Int64 = Outer({i => 0})
   |                    ^^^^^^^^^^^^^^^ expected 'Int64', found 'VArray<Int64, $1>'
   | 

2 errors generated, 2 errors printed.
*/
