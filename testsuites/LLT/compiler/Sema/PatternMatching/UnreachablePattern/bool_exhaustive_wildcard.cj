// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// True and false patterns make the following wildcard unreachable.
// EXEC-PIPE-0: %frontendCompiler %cmp_opt %typecheck %f 2>&1 | compare %f


func boolExhaustive(value: Bool) {
    match (value) {
        case true => 0
        case false => 1
        case _ => 2
    }
}

/* SCAN
warning: unreachable pattern
  ==> bool_exhaustive_wildcard.cj:15:14:
   | 
15 |         case _ => 2
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
