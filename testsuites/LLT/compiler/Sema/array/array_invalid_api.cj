// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE)EXEC-PIPE-1: %frontendCompiler %diag_json %f 2>&1 | compare %f


main(): Int64 {
    var a: Array<String> = ["aa"]
    var z = a.clone
    a.size = 1
    var x = a.clone(2)
    return 0
}

// ASSERT: scan-1 "DiagKind": "sema_cannot_convert_literal",
// ASSERT: scan-1 "DiagKind": "sema_cannot_assign_to_immutable",
// ASSERT: scan-1 "DiagKind": "sema_ambiguous_use",
// ASSERT: scan "Errors": 3,
