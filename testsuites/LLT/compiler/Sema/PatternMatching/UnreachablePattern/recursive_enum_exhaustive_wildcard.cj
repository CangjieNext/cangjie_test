// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Covering both recursive enum constructors makes the wildcard unreachable.
// EXEC-PIPE-0: %frontendCompiler %cmp_opt %diag_json %typecheck %f 2>&1 | compare %f


// ASSERT: scan-1 "DiagKind": "sema_unreachable_pattern"

enum Node {
    | Link(Int64, Node)
    | End
}

func recursiveExhaustive(value: Node) {
    match (value) {
        case Link(_, _) => 0
        case End => 1
        case _ => 2
    }
}
