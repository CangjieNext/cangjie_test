// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

// Negative control for issue #1182: parentheses must not make an arbitrary expression
// assignable. `(1 + 2).x = 3` still has to be rejected, so the fix only unwraps
// PAREN_EXPR instead of bypassing the left-value check.
main(): Int64 {
    (1 + 2).x = 3
    return 0
}

/* SCAN
error: invalid left-hand expression of assignment '='
 ==> paren_non_left_value.cj:7:15:
  | 
7 |     (1 + 2).x = 3
  |     ~~~~~~~~~ ^ 
  |     |
  |     cannot assign to this expression
  | 

1 error generated, 1 error printed.
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
