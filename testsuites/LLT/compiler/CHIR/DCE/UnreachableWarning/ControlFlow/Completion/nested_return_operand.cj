// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify explicit returns whose operands already return or throw.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func nested(): Int64 {
    return return 1
}

func triple(): Int64 {
    return return return 2
}

func returnThrow(): Int64 {
    return throw Exception()
}

main() {
    println(nested() + triple() + returnThrow())
}

// ASSERT: scan-4 warning: unreachable expression

/* SCAN-IN
warning: unreachable expression
  ==> nested_return_operand.cj:11:5:
   | 
11 |     return return 1
   |     ^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> nested_return_operand.cj:15:5:
   | 
15 |     return return return 2
   |     ^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> nested_return_operand.cj:15:12:
   | 
15 |     return return return 2
   |            ^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> nested_return_operand.cj:19:5:
   | 
19 |     return throw Exception()
   |     ^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
