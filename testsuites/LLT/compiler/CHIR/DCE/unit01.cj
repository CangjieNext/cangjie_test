// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %f --diagnostic-format json 2>&1 | compare %f
// EXEC: %compiler %f --diagnostic-format json -g 2>&1 | compare %f
// EXEC: %compiler %f --diagnostic-format json -O2 2>&1 | compare %f

// The right value of the subscript assignment is evaluated before the base and the index
// expression, so the index expression is unreachable. It is reported as an unreachable expression
// (chir_dce_unreachable_expression_hint) instead of an unused expression
// (chir_dce_unused_expression), which was reported while the index expression was still evaluated
// before the right value. A debug build keeps the temporary variable of the assignment, so there
// the first of the two unreachable warnings is anchored at the assignment instead of the index.
main(): Int64 {
    let a = Array<Unit>(3) {_ =>}
    a[0] = return 0
    1
}
// ASSERT: scan chir_dce_unused_variable
// ASSERT: scan-2 chir_dce_unreachable_expression_hint
