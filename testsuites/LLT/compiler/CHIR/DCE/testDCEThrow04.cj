// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC-PIPE-0: %run %run_opt %output %run_args

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_expression_hint"

class A <: Exception {}

main() {
    try {
        throw A();
        // EXPECT: chir_dce_unreachable_expression_hint
        1 + 1
    } catch (_) {
        2 + 2
    } finally {
    }
    print("success.")
    return 0
}
