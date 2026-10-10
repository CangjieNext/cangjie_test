// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Binding patterns cover every remaining sibling case, regardless of identifier spelling.
// EXEC-PIPE-0: %frontendCompiler %cmp_opt %diag_json %typecheck %f 2>&1 | compare %f

// ASSERT: scan-7 "DiagKind": "sema_unreachable_pattern"

const MatchValue = 1
const CalculatedValue = 2 + 3

func bindingThenConstant(value: Int64) {
    match (value) {
        case captured => 0
        case 1 => 1
        case 2 => 2
        case _ => 3
    }
}

func capitalizedBindingThenConstant(value: Int64): Int64 {
    return match (value) {
        case MatchValue => 0
        case 1 => 1
        case _ => 2
    }
}

func calculatedBindingThenConstant(value: Int64): Int64 {
    return match (value) {
        case CalculatedValue => 0
        case 5 => 1
        case _ => 2
    }
}
