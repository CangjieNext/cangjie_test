// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify the successor of an exhaustive all-throw match is unreachable.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func matchThrows(value: Bool) {
    match (value) { case true => throw Exception(); case false => throw Exception() }
    println("unreachable after all-throw match")
    println("also unreachable after all-throw match")
}

main() {
    matchThrows(true)
}

/* SCAN
warning: unreachable expression
  ==> match_all_throw.cj:12:5:
   | 
11 |     match (value) { case true => throw Exception(); case false => throw Exception() }
   |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
12 |     println("unreachable after all-throw match")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
