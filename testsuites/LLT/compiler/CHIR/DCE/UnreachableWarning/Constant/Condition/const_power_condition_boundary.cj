// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify a const Float64 power expression propagates into a condition.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    const power: Float64 = 2.0 ** 3.0
    if (power < 0.0) { println("unreachable const power") }
}

/* SCAN
warning: unreachable block in 'if' expression
  ==> const_power_condition_boundary.cj:12:22:
   | 
12 |     if (power < 0.0) { println("unreachable const power") }
   |                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
