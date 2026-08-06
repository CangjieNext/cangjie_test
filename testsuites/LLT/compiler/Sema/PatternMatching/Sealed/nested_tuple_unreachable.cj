// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A local sealed hierarchy remains closed when exposed through tuple columns.
// EXEC-PIPE-0: %frontendCompiler %cmp_opt %typecheck %f 2>&1 | compare %f

abstract sealed class Root {}

class Left <: Root {}

class Right <: Root {}

func nestedTupleExhaustive(value: (Root, Root)) {
    match (value) {
        case (_: Left, _: Left) => 0
        case (_: Left, _: Right) => 1
        case (_: Right, _: Left) => 2
        case (_: Right, _: Right) => 3
        case _ => 4
    }
}

/* SCAN
warning: unreachable pattern
  ==> nested_tuple_unreachable.cj:22:14:
   | 
22 |         case _ => 4
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
