// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Exhausting all same-package subclasses of a sealed hierarchy makes a wildcard unreachable.
// EXEC-PIPE-0: %frontendCompiler %cmp_opt %typecheck %f 2>&1 | compare %f


abstract sealed class Result {}

class Success <: Result {}

class Failure <: Result {}

func exhaustiveSealedHierarchy(value: Result) {
    match (value) {
        case _: Success => 0
        case _: Failure => 1
        case _ => 2
    }
}

/* SCAN
warning: unreachable pattern
  ==> sealed_hierarchy_exhaustive_wildcard.cj:21:14:
   | 
21 |         case _ => 2
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
