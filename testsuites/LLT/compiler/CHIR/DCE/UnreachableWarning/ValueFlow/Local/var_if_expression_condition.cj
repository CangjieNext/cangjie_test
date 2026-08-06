// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify propagation from an if-expression assignment after its direct branch warning.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


main() {
    var selected = if (true) { 1 } else { 2 }
    if (selected != 1) { println("unreachable if assignment") }
}

/* SCAN
warning: unreachable block in 'if' expression
  ==> var_if_expression_condition.cj:12:41:
   | 
12 |     var selected = if (true) { 1 } else { 2 }
   |                                         ^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> var_if_expression_condition.cj:13:24:
   | 
13 |     if (selected != 1) { println("unreachable if assignment") }
   |                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
