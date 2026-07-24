// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Repeating a Float64 constant pattern is unreachable.
// EXEC-PIPE-0: %frontendCompiler %cmp_opt %typecheck %f 2>&1 | compare %f


func floatDuplicate(value: Float64) {
    match (value) {
        case 3.14 => 0
        case 3.14 => 1
        case _ => 2
    }
}

/* SCAN
warning: unreachable pattern
  ==> float_pattern_duplicate.cj:14:14:
   | 
14 |         case 3.14 => 1
   |              ^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
