// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f
// (CJNATIVE) RUN-EXEC-0: %run %run_opt %output %run_args

// ASSERT: scan-5 "DiagKind": "chir_dce_unreachable_expression_hint"
// ASSERT: scan-2 "DiagKind": "chir_dce_unused_expression"
// ASSERT: scan-1 "DiagKind": "chir_dce_unused_function"

private func foo(a: Int64, b: Int64, c: Int64) {
    return a + b + c
}

private func a() {
    foo(return 1, 3, 2)
    0
}

private func b() {
    foo(return 1, 3, return 2)
    0
}

private func c() {
    foo(1, 3, return 2)
    0
}

main() {
    a()
    b()
    c()
    return 0
}
