// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// The only constructor makes a following wildcard unreachable.
// EXEC-PIPE-0: %frontendCompiler %cmp_opt %typecheck %f 2>&1 | compare %f


enum Single {
    | Only(Int64)
}

func singleExhaustive(value: Single) {
    match (value) {
        case Only(_) => 0
        case _ => 1
    }
}

/* SCAN
warning: unreachable pattern
  ==> single_constructor_exhaustive_wildcard.cj:18:14:
   | 
18 |         case _ => 1
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
