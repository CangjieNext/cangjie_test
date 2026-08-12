// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %noColor %f -o %output 2>&1 | compare %f
// ASSERT: scan-not Internal Compiler Error

class H {
    func f(...x: Int64): Unit
}
main() { H().f(1) }

/* SCAN
error: variable length parameter can only show in the foreign function
 ==> vararg_4.cj:5:5:
  | 
5 |     func f(...x: Int64): Unit
  |     ^^^^^^ 
  | 

error: unclosed delimiter: '('
 ==> vararg_4.cj:5:15:
  | 
5 |     func f(...x: Int64): Unit
  |           ~   ^ expected ')' here
  |           |
  |           to match this opening '('
  | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
