// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %f --diagnostic-format json 2>&1 | compare %f
// EXEC: %compiler %f --diagnostic-format json -g 2>&1 | compare %f
// EXEC: %compiler %f --diagnostic-format json -O2 2>&1 | compare %f

main(): Int64 {
    let a = Array<Unit>(3) {_ =>}
    a[0] = return 0
    1
}
// ASSERT: scan chir_dce_unused_variable
// ASSERT: scan chir_dce_unreachable
// ASSERT: scan chir_dce_unused_expression
