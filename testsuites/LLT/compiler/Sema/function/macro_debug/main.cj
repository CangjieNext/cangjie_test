// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./m1 ./m2 define.cj
// EXEC: %compiler %cmp_opt --compile-macro define.cj
// EXEC: %compiler %cmp_opt --module-name m1 m1/p1.cj --output-type=staticlib -o m1.a
// EXEC: %compiler %cmp_opt --module-name m2 m2/p1.cj --output-type=staticlib -o m2.a
// EXEC-PIPE-1: %compiler %cmp_opt %f m1.a m2.a --debug-macro 2>&1 | compare %f

import repro_macro.*
import m1.p1
import m2.p1

@identity
main() {
    // Ambiguous call on imported package aliases -> DiagnoseForCall ->
    // AddDiagNotesForImportedDecls -> GetImportsOfDecl (dangling ImportSpec* before fix).
    p1.f()
}

/* SCAN-IN
error: ambiguous use of 'p1'
  ==> main.cj.macrocall:21:5:
   | 
21 |     p1.f()
   |     ^^ 
   | 
note: found imported candidate
  ==> main.cj.macrocall:14:1:
   | 
14 | import m1.p1
   | ^^^^^^^^^^^^ 
   | 
note: found imported candidate
  ==> main.cj.macrocall:15:1:
   | 
15 | import m2.p1
   | ^^^^^^^^^^^^ 
   | 
*/