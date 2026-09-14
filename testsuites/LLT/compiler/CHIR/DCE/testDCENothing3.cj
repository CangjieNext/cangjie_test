// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt %diag_json  %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args

// ASSERT: scan-4 "DiagKind": "chir_dce_unreachable_expression_hint"
// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_function"

var num = 0

func test(a: Int64, b: Nothing, c: Int64) {
    num = 1
}

func foo() {
    test(1, return num, 2)
    // EXPECT: chir_dce_unreachable_expression_hint
    return 1
}

func goo() {
    try {
        test(1, throw Exception(), 2)
    } catch (_) {
        // EXPECT: chir_dce_unreachable_expression_hint
        return num
    }
    return 1
}

main() {
    foo() + goo()
}
