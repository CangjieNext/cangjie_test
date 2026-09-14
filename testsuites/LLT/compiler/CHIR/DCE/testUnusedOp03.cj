// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable"
// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_expression_hint"
// ASSERT: scan-1 "DiagKind": "chir_dce_unused_expression"
// ASSERT: scan-1 "DiagKind": "chir_dce_unused_function"
// ASSERT: scan-1 "DiagKind": "chir_dce_unused_operator"

private func foo() {
    (return 99) + 1
}

private func bar() {
    1 + (return 99)
}

private func test(a: Int64, b: Int64) {
    a + b
}

@OverflowWrapping
private func hoo() {
    foo() + bar()
    0
}

main() {
    hoo()
    test(return 0, foo() + 1)

    return 0
}
