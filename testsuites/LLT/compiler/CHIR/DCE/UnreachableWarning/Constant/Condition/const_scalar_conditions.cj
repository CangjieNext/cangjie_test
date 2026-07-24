// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify scalar and Option constant values propagate into conditions.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


main() {
    const negative = -1
    if (negative >= 0) { println("unreachable const unary negative") }

    const letter = r'a'
    if (letter != r'a') { println("unreachable const rune") }

    const ratio: Float64 = 1.0
    if (ratio > 2.0) { println("unreachable const float") }

    const optional = Option<Int64>.None
    if (let Some(value) <- optional) { println(value) }
}

/* SCAN
warning: unreachable block in 'if' expression
  ==> const_scalar_conditions.cj:13:24:
   | 
13 |     if (negative >= 0) { println("unreachable const unary negative") }
   |                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> const_scalar_conditions.cj:16:25:
   | 
16 |     if (letter != r'a') { println("unreachable const rune") }
   |                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> const_scalar_conditions.cj:19:22:
   | 
19 |     if (ratio > 2.0) { println("unreachable const float") }
   |                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> const_scalar_conditions.cj:22:38:
   | 
22 |     if (let Some(value) <- optional) { println(value) }
   |                                      ^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

4 warnings generated, 4 warnings printed.
*/
