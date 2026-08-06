// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Constructors with the same name but different arity are tracked separately.
// EXEC-PIPE-0: %frontendCompiler %cmp_opt %typecheck %f 2>&1 | compare %f


enum Overloaded {
    | Value(Int64)
    | Value(Int64, Int64)
}

func overloadedExhaustive(value: Overloaded) {
    match (value) {
        case Value(_) => 0
        case Value(_, _) => 1
        case _ => 2
    }
}

/* SCAN
warning: unreachable pattern
  ==> overloaded_constructor_exhaustive_wildcard.cj:20:14:
   | 
20 |         case _ => 2
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
