// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A constructor already included in an or-pattern is unreachable when repeated.
// EXEC-PIPE-0: %frontendCompiler %cmp_opt %typecheck %f 2>&1 | compare %f


enum Colour {
    | Red
    | Green
    | Blue
}

func orPatternDuplicate(value: Colour) {
    match (value) {
        case Red | Green => 0
        case Green => 1
        case Blue => 2
    }
}

/* SCAN
warning: unreachable pattern
  ==> or_pattern_followed_by_duplicate.cj:20:14:
   | 
20 |         case Green => 1
   |              ^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
