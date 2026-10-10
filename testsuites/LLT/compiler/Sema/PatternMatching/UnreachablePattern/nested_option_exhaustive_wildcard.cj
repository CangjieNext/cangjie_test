// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Nested Option cases cover every value before the wildcard.
// EXEC-PIPE-0: %frontendCompiler %cmp_opt %diag_json %typecheck %f 2>&1 | compare %f


// ASSERT: scan-1 "DiagKind": "sema_unreachable_pattern"

func nestedOptionExhaustive(value: Option<Option<Int64>>) {
    match (value) {
        case Some(Some(_)) => 0
        case Some(None) => 1
        case None => 2
        case _ => 3
    }
}
