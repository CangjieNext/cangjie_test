// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_dce_unused_expression"
// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_expression_hint"

class A {
    public operator func [](index: Int64) {
        return index;
    }
}

main() {
    var a = A();
    a[0]
    a[return 1]
    0
}
