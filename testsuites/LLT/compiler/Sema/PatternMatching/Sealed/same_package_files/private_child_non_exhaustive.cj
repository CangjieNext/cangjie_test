// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: missing_private_child.cj
// ERRCHECK: %frontendCompiler %cmp_opt %diag_json %typecheck %f missing_private_child.cj

// ASSERT: scan-1 "DiagKind": "sema_nonexhuastive_patterns"

sealed interface MissingRoot {}

class MissingVisible <: MissingRoot {}

func classifyMissing(value: MissingRoot): Int64 {
    match (value) {
        case _: MissingVisible => 0
    }
}
