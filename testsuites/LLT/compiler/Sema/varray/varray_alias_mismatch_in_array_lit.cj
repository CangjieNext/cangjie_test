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
// the same !typeManager.IsSubtype branch in ChkVArrayExpr.
// DiagMismatchedTypesWithFoundTy calls ShouldDiagnose, which returns false
// when sourceExpr is set, so the mismatch diagnostic used to be silently
// swallowed and the Invalid type reached ASTTypeValidator and crashed.
// Must report the mismatch diagnostic on the original CallExpr instead.

type Outer = VArray<Int64, $1>

main() {
    let g: Outer = [Outer({i => 0})]
    let x: Int64 = Outer({i => 0})
    0
}

/* SCAN
error: mismatched types
  ==> varray_alias_mismatch_in_array_lit.cj:22:21:
   | 
22 |     let g: Outer = [Outer({i => 0})]
   |                     ^^^^^^^^^^^^^^^ expected 'Int64', found 'VArray<Int64, $1>'
   | 

error: mismatched types
  ==> varray_alias_mismatch_in_array_lit.cj:23:20:
   | 
23 |     let x: Int64 = Outer({i => 0})
   |                    ^^^^^^^^^^^^^^^ expected 'Int64', found 'VArray<Int64, $1>'
   | 

2 errors generated, 2 errors printed.
*/
