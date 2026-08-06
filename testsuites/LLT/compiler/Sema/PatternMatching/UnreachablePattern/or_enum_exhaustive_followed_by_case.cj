// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// An or-pattern covering every enum constructor makes a later case unreachable.
// EXEC-PIPE-0: %frontendCompiler %cmp_opt %typecheck %f 2>&1 | compare %f


enum Colour {
    | Red
    | Green
    | Blue
}

func orEnumExhaustive(value: Colour) {
    match (value) {
        case Red | Green | Blue => 0
        case Red => 1
    }
}

/* SCAN
warning: unreachable pattern
  ==> or_enum_exhaustive_followed_by_case.cj:20:14:
   | 
20 |         case Red => 1
   |              ^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
