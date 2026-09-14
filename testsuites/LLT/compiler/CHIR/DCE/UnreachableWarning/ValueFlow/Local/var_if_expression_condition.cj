// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify propagation from an if-expression assignment after its direct branch warning.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f


// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_block_in_expression"

main() {
    var selected = if (true) { 1 } else { 2 }
    if (selected != 1) { println("unreachable if assignment") }
}
