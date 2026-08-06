// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A local sealed hierarchy remains closed when exposed through an enum payload.
// EXEC-PIPE-0: %frontendCompiler %cmp_opt %typecheck %f 2>&1 | compare %f

abstract sealed class Root {}

class Left <: Root {}

class Right <: Root {}

enum Box {
    | Empty
    | Wrap(Root)
}

func nestedPayloadExhaustive(value: Box) {
    match (value) {
        case Empty => 0
        case Wrap(_: Left) => 1
        case Wrap(_: Right) => 2
        case Wrap(_) => 3
    }
}

/* SCAN
warning: unreachable pattern
  ==> nested_enum_payload_unreachable.cj:26:14:
   | 
26 |         case Wrap(_) => 3
   |              ^^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
