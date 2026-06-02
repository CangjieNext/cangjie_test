// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f %diag_json -o %output 2>&1 | compare %f

class A <: Exception {}

main() {
    var (a, b) = (throw A(), throw A())
    a
    b
    return 0
}
// ASSERT: scan chir_dce_unreachable_expression_hint
