// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_expression_hint"
// ASSERT: scan-1 "DiagKind": "chir_dce_unused_function"
// ASSERT: scan-1 "DiagKind": "chir_dce_unused_variable"

class X <: Exception {}

class A {
    func a(b: Int64): Int64 {
        return 1
    }

    func b() {
        a(throw X())
        return 2
    }
}

main() {
    A().b()
    0
}
