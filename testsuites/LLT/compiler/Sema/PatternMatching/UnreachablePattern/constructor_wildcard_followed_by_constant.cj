// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A wildcard constructor argument covers a later constant constructor argument.
// EXEC-PIPE-0: %frontendCompiler %cmp_opt %typecheck %f 2>&1 | compare %f


enum Shape {
    | Box(Int64)
    | Empty
}

func constructorWildcard(value: Shape) {
    match (value) {
        case Box(_) => 0
        case Box(1) => 1
        case Empty => 2
    }
}

/* SCAN
warning: unreachable pattern
  ==> constructor_wildcard_followed_by_constant.cj:19:14:
   | 
19 |         case Box(1) => 1
   |              ^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
