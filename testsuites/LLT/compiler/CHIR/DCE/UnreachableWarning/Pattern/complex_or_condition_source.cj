// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify the final branch of a complex or-pattern keeps the enclosing if/while source.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    let ifValue = (3, 6)
    if (let (1, 2) | (3, 4) <- ifValue) {
        println("unreachable if-let body")
    }

    let whileValue = (3, 6)
    while (let (1, 2) | (3, 4) <- whileValue) {
        println("unreachable while-let body")
        break
    }
}

/* SCAN-IN
warning: unreachable pattern
  ==> complex_or_condition_source.cj:12:13:
   | 
12 |     if (let (1, 2) | (3, 4) <- ifValue) {
   |             ^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> complex_or_condition_source.cj:12:22:
   | 
12 |     if (let (1, 2) | (3, 4) <- ifValue) {
   |                      ^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable pattern
  ==> complex_or_condition_source.cj:17:16:
   | 
17 |     while (let (1, 2) | (3, 4) <- whileValue) {
   |                ^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'while' expression
  ==> complex_or_condition_source.cj:17:25:
   | 
17 |     while (let (1, 2) | (3, 4) <- whileValue) {
   |                         ^^^^^^ unreachable block in 'while' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
