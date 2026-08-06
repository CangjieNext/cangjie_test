// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// All Boolean tuple combinations make the following wildcard unreachable.
// EXEC-PIPE-0: %frontendCompiler %cmp_opt %typecheck %f 2>&1 | compare %f


func tupleExhaustive(value: (Bool, Bool)) {
    match (value) {
        case (true, true) => 0
        case (true, false) => 1
        case (false, true) => 2
        case (false, false) => 3
        case _ => 4
    }
}

/* SCAN
warning: unreachable pattern
  ==> tuple_bool_exhaustive_wildcard.cj:17:14:
   | 
17 |         case _ => 4
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
