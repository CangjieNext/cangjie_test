// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args

// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_expression_hint"
// ASSERT: scan-4 "DiagKind": "chir_dce_unused_expression"

func test1() {
    // EXPECT: chir_dce_unreachable_expression_hint
    1..2 : (return 0)
    return 1
}

func test2() {
    // EXPECT: chir_dce_unreachable_expression_hint
    1..=2 : (return 0)
    return 1
}

main() {
    return test1() + test2()
}
