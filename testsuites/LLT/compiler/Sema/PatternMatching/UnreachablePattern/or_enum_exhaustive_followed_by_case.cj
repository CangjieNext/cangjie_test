// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// An or-pattern covering every enum constructor makes a later case unreachable.
// EXEC-PIPE-0: %frontendCompiler %cmp_opt %diag_json %typecheck %f 2>&1 | compare %f


// ASSERT: scan-1 "DiagKind": "sema_unreachable_pattern"

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
