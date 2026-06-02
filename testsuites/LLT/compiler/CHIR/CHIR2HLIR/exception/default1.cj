// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %enableCompileDebug %f %diag_json -o %n.%suffix 2>&1 | compare %f

main() {
    let a: Int64 = 0x7FFFFFFFFFFFFFFF // max Int64
    let b: Int64 = a + 1 // exception thrown here
    return 0
}
// ASSERT: scan chir_dce_unused_variable
// ASSERT: scan chir_arithmetic_operator_overflow
