// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: visible_children.cj
// EXEC-PIPE-0: %frontendCompiler %cmp_opt %diag_json %typecheck %f visible_children.cj 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "sema_unreachable_pattern"

sealed interface VisibleRoot {}

func classifyVisible(value: VisibleRoot): Int64 {
    match (value) {
        case _: VisibleLeft => 0
        case _: VisibleRight => 1
        case _ => 2
    }
}
